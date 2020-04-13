import os
from jinja2 import Template

class Generic(object):
  """generic ETL class
     The getters and setters for the ETL classes and child classes live here
     as well.
  """

  def __init__(self, config):
    """Init class for Generic ETL

    Args:
      config: the serialized config.yml data

    Returns:
      None

    Raises:
      None
    """
    self.config = config
    self.template_path = self.config['cwd'] + '/' + \
                         self.config['defaults']['templates']['cypher']['path']

  def extract(self, regime, parsable_document):
    """extract method

    Args:
      regime: the regime dict from config
      parsable_document: path relative to build.py to the regime source doc

    Returns:
      regime_list: a list of lines from the parsable_document

    Returns:
      None
    """
    with open(parsable_document, 'r') as f:
      rows = f.readlines()

    regime_list = self.parse_baseline(rows)

    return regime_list

  def transform(self, regime, regime_list):
    """transform method

    Args:
      regime: the regime dict from config
      regime_list: the list of rows from the parsable_document

    Returns:
      list: a list of cypher statements to build this regime

    Raises:
      Exception: if no baseline is specified for the regime in config
    """
    stmts = []

    if regime.get('baseline'):
      baseline = regime['baseline']
      return self.create_generic_baseline(baseline['regime_name'],
                                          self.get_control_regime_name(regime),
                                          baseline['baseline_name'],
                                          baseline['uid_key'],
                                          regime_list)
    else:
      raise Exception('no baseline for regime "{}" in config.yml. \n'
                      'generic transform currently only supports '
                      'baselines'.format(regime['name']))

  def load(self, regime, neo4j, stmts):
    """load method

    Args:
      regime: the regime dict from config
      neo4j: the neo4j object that contains the active server connection
      stmts: list of the cypher statements to be executed

    Returns:
      None

    Raises:
      None
    """
    neo4j.load_baseline(stmts)

  def flatten_dict(self, d: dict):
    """flattens a dict into a string in the form of k=v[, k=v]

    Args:
      d: the dict to be flattened

    Returns:
      string: a string representative of the flattened dict in the form of
              key=value, comma delimited

    Raises:
      None
    """
    return ', '.join("{!s}={!r}".format(key, val) for (key, val) in d.items())

  def get_dir_files(self, d):
    """recursively finds files in a directory

    Args:
      d: the directory to be searched

    Returns:
      f: a list of file names

    Raises:
      None
    """
    f = []
    for dir_name, subdir_list, file_list in os.walk(d):
      if len(subdir_list) > 0:
        for subdirectory in subdir_list:
          f = f + self.get_dir_files(d + '/' + subdirectory)
      f = f + list(map(lambda x: d + '/' + x, file_list))
      return f

  def get_regime_description(self, name):
    """returns the description of a given regime
       Because we're representing our build-order in the config file with a
       list we can't just reference regime descriptions by a dict key because
       if the regimes object was of type dict then we couldn't guarantee in
       order execution. So we have this helper function to iterate over the
       regime list, find the desired regime, and return the description. It's
       kind of suboptimal, but is a suitable trade-off.

    Args:
      name: the name of the regime in config

    Returns:
      string: the regime description from config

    Raises:
      None
    """
    for r in self.config['regimes']:
      if r['name'] == name:
        return r['description']
    return None

  def get_control_regime_name(self, regime):
    """getter for a regime's baseline's control regime
       In our graph schema a baseline's controls reference another regime. This
       getter finds the regime's baseline's control regime description then
       returns it

      Args:
        regime: the regime dict from config

      Returns:
        string: the description of the regime's baseline's control regime

      Raises:
        None
    """
    control_regime = regime['baseline']['control_regime']
    for r in self.config['regimes']:
      if r['name'] == control_regime:
        return r['description']
    return None

  def get_field_names(self, first_row: str):
    """getter for a parsable_document's first row field names

    Args:
      first_row: a string containing the first row of a parsable_document

    Returns:
      fields: a list of sanitized field names

    Raises:
      None
    """
    # function for generating clean field names
    fields = []
    for field in first_row.rstrip().split('\t'):
      fields.append(field.lower().replace(' ', '_').replace('-', '_'))
    return fields

  def parse_baseline(self, rows):
    """method to parse a generic tab-delimited tsv file

    Args:
      rows: a list of rows from the parsable_document

    Returns:
      baseline_list: a list of dicts where the keys are the column titles

    Raises:
      None
    """
    first_row = rows[0]
    fields = self.get_field_names(first_row)

    baseline_list = []
    for row in rows[1:]:
      # skip the first row since it has our column titles
      row_dict = {}
      cols = row.rstrip().split('\t')
      for i in range(len(cols)):
        if cols[i] == '' or cols[i] == ' ':
          # skip blank fields
          continue
        row_dict[fields[i]] = cols[i]

      baseline_list.append(row_dict)

    return baseline_list

  def render_template(self, template, *args, **kwargs):
    """method to render a statement's jinja2 template

    Args:
      template: the template's name
      args: positional arguments that will be rendered in the template
      kwargs: keyword arguments that will be rendered in the template

    Returns:
      string: a rendered statement in string format

    Raises:
      None
    """
    with open(self.template_path + template, 'r') as file:
      j2t = file.read()

    p = []
    if kwargs.get('properties'):
      # if we've provided a properties dict, use that
      for key in kwargs['properties']:
        p.append((key, kwargs['properties'][key]))
    else:
      # otherwise build one from the provided kwargs
      for key in kwargs.keys():
        p.append((key, kwargs[key]))

    return Template(j2t.rstrip()).render(args=args,
                                         names=kwargs.get('names', {}),
                                         properties=p)

  def clean_dict(self, d: dict):
    """method for removing bad characters from a dict's values
       Dict values can be strings, lists, or dicts. Lists of lists are not
       supported.

    Args:
      d: the dict to be cleaned

    Returns:
      d: the dict with cleaned values

    Raises:
      None
    """

    def clean(s):
      """removes backslashes, single quotes, and new lines

      Args:
        s: string to be cleaned

      Returns:
        string: cleaned string

      Raises:
        None
      """
      return s.replace('\\', '\\\\').replace("'", "\\'").replace('\n', ' ')

    for key in d.keys():
      if isinstance(d[key], dict):
        # nested dict, recurse
        d[key] = self.clean_dict(d[key])
      if isinstance(d[key], str):
        d[key] = clean(d[key])
      if isinstance(d[key], list):
        if all(isinstance(x, str) for x in d[key]):
          # it's a list of strings, flatten it
          d[key] = clean(str(d[key]))
        else:
          # it's a complex list, deal with each element
          for i in range(len(d[key])):
            if isinstance(d[key][i], dict):
              # nested dict, recurse
              d[key][i] = self.clean_dict(d[key][i])
            else:
              d[key][i] = clean(d[key][i])
    return d

  # todo: generalize the templates so that these setters can also be generalized
  # no point in commenting functions that are about to be replaced...

  def create_regime(self, regime):
    stmt = self.render_template('regime.j2',
                                name=regime)
    return stmt

  def create_regime_family(self, regime, properties):
    stmt = self.render_template('regime_family.j2', regime,
                                properties=properties)
    return stmt

  def create_baseline_baseline(self, regime, parent_baseline, properties):
    stmt = self.render_template('baseline_baseline.j2',
                                regime,
                                parent_baseline,
                                properties=properties)
    return stmt

  def create_regime_baseline(self, regime, properties):
    stmt = self.render_template('regime_baseline.j2',
                                regime,
                                properties=properties)
    return stmt

  def create_generic_baseline(self, regime, control_regime, baseline, uid_key,
      regime_list):
    stmts = []
    stmts.append(self.create_regime(regime))
    stmts.append(
        self.create_regime_baseline(regime, properties={'name': baseline}))
    for control_dict in regime_list:
      c = control_dict.copy()
      c = self.clean_dict(c)

      del c[uid_key]

      stmt = self.render_template('baseline_control.j2',
                                  regime, baseline,
                                  control_regime, control_dict[uid_key],
                                  properties=c)
      stmts.append(stmt)
    return stmts

  def create_geneirc_control(self, regime, parent, parent_name, properties):
    properties = self.clean_dict(properties)
    stmt = self.render_template('control.j2',
                                regime, parent, parent_name,
                                properties=properties)
    return stmt

  def create_baseline_control(self, regime, baseline, control_regime, control,
      properties):
    stmt = self.render_template('baseline_control.j2',
                                regime, baseline,
                                control_regime, control,
                                properties=properties)
    return stmt

  def create_baseline_wildcard(self, regime, baseline, control_regime, control,
      properties):
    stmt = self.render_template('baseline_wildcard.j2',
                                regime, baseline,
                                control_regime, control,
                                properties=properties)
    return stmt

  def create_baseline_newcontrol(self, regime, regime_section, control_regime,
      control, parent_name, **kwargs):
    properties = kwargs.get('properties', {})
    stmt = self.render_template('baseline_newcontrol.j2',
                                regime, regime_section, control_regime,
                                control, parent_name,
                                properties=properties)
    return stmt

  def create_baseline_has_control(self, regime, baseline, **kwargs):
    properties = kwargs.get('properties', {})
    stmt = self.render_template('baseline_has_control.j2',
                                regime, baseline,
                                properties=properties)
    return stmt

  def create_baseline_dummy_control(self,
      control_regime,
      control_regime_has_baseline,
      control_baseline,
      control,
      regime,
      regime_baseline,
      **kwargs):
    properties = kwargs.get('properties', None)
    stmt = self.render_template('baseline_dummy_control.j2',
                                control_regime,
                                control_regime_has_baseline,
                                control_baseline,
                                control,
                                regime,
                                regime_baseline,
                                properties=properties)
    return stmt

  def create_control_control_map(self, **kwargs):
    stmt = self.render_template('control_control_map.j2',
                                names=kwargs['names'],
                                properties=kwargs['properties'])
    return stmt
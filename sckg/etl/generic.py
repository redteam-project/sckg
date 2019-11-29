
from jinja2 import Template

class Generic(object):

  def __init__(self, config):
    self.config = config
    self.template_path = self.config['cwd'] + '/' + \
                         self.config['defaults']['templates']['cypher']['path']

  def extract(self, regime, parsable_document):
    with open(parsable_document, 'r') as f:
      rows = f.readlines()

    regime_list = self.parse_baseline(rows)

    return regime_list

  def transform(self, regime, regime_list):
    stmts = []

    if regime.get('baseline'):
      baseline = regime['baseline']

      stmts.append(self.create_regime(baseline['regime_name']))
      stmts.append(self.create_generic_baseline(baseline['regime_name'],
                                                self.get_control_regime_name(regime),
                                                baseline['baseline_name'],
                                                baseline['uid_key'],
                                                regime_list))
    else:
      raise Exception('no baseline for regime "{}" in config.yml'.format(regime['name']))

  def load(self, regime, neo4j, stmts):
    neo4j.load_baseline(stmts)

  def get_control_regime_name(self, regime):
    control_regime = regime['baseline']['control_regime']
    for r in self.config['regimes']:
      if r['name'] == control_regime:
        return r['description']
    return None

  def get_field_names(self, first_row: str):
    # function for generating clean field names
    fields = []
    for field in first_row.rstrip().split('\t'):
      fields.append(field.lower().replace(' ', '_').replace('-', '_'))
    return fields

  def parse_baseline(self, rows):
    # function to parse a generic regime baseline
    first_row = rows[0]
    fields = self.get_field_names(first_row)

    baseline_list = []
    for row in rows[1:]:
      row_dict = {}
      cols = row.rstrip().split('\t')
      for i in range(len(cols)):
        if cols[i] == '' or cols[i] == ' ':
          continue
        row_dict[fields[i]] = cols[i]

      baseline_list.append(row_dict)

    return baseline_list

  def render_template(self, template, *args, **kwargs):
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
    # function for cleaning up bad characters that make cypher barf
    def clean(s):
      return s.replace('\\', '\\\\').replace("'", "\\'")

    for key in d.keys():
      if isinstance(d[key], str):
        d[key] = clean(d[key])
      if isinstance(d[key], list):
        for i in range(len(d[key])):
          d[key][i] = clean(d[key][i])
    return d

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
                                control,
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
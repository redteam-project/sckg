import re
from sckg.etl.generic import Generic

class NIST80053(Generic):

  def __init__(self, config):
    super().__init__(config)

  def extract(self, regime, parsable_document):
    with open(parsable_document, 'r') as f:
      rows = f.readlines()

    # call parent's generic baseline function
    baseline_80053_list = []
    baseline_list = self.parse_baseline(rows)

    # set up regex
    control_pattern = '\w{2}-\d{1,2}'
    control_regex = re.compile(control_pattern)
    family_pattern = '^\w{2}'
    family_regex = re.compile(family_pattern)

    first_row = rows[0]
    fields = self.get_field_names(first_row)

    for control_dict in baseline_list:
      # do 800-53 specific stuff

      # explode baseline_impact and related attributes
      for key in ['baseline_impact', 'related']:
        if control_dict.get(key):
          temp_dict = control_dict[key].split(',')
          control_dict[key] = temp_dict

      # determine parent and family names
      name = control_dict['name']
      m = re.match(control_regex, name)
      control = m.string[m.start(0):m.end(0)]
      mf = re.match(family_regex, name)
      family = m.string[mf.start(0):mf.end(0)]
      control_dict['family'] = family

      if '(' in name:
        # it's an enhancement
        name_parts = list(filter(None, name.replace(control, '')
                                 .replace(' ', '')
                                 .replace(')', '')
                                 .split('(')))
        # len 0 means family
        if len(name_parts) > 0:
          last_part = name_parts[-1]
          del name_parts[-1]

          enhancement = ' '
          for part in name_parts:
            enhancement = enhancement + '(' + part + ')'
          parent = control + enhancement
          if parent.endswith(' '):
            parent = parent.replace(' ', '')
          control_dict['parent'] = parent
      else:
        # it's a multi-part control
        part_name = name.replace(control, '')
        name_parts = list(filter(None, part_name.split('.')))
        parent = None

        # len 0 means family
        if len(name_parts) == 0:
          pass
        elif len(name_parts) == 1:
          parent = control
          control_dict['parent'] = parent
        elif len(name_parts) > 1:
          last_part = name_parts[-1]
          del name_parts[-1]

          multipart = ''
          for part in name_parts:
            multipart = part + '.'
          parent = control + multipart
          control_dict['parent'] = parent

      baseline_80053_list.append(control_dict)

    return baseline_80053_list

  def transform(self, regime, regime_list):
    # todo: parameterize this
    render_related = False

    stmts = {}
    # create regime node
    regime_name = regime['description']
    stmt = self.create_regime(regime_name)
    stmts['regime'] = stmt

    # create families
    families = regime['meta']['families']
    family_stmts = []
    for family in families.keys():
      description = families[family]
      stmt = self.render_template('regime_family.j2', regime_name,
                                  name=family,
                                  description=description)
      family_stmts.append(stmt)
    stmts['families'] = family_stmts

    # make the controls
    control_stmts = []
    for control_dict in regime_list:
      c = control_dict.copy()
      c = self.clean_dict(c)
      properties = {}

      derived_family = control_dict['name'][:2]
      if not control_dict.get('parent'):
        # its parent is a family
        del c['family']
        if c.get('baseline_impact'):
          del c['baseline_impact']
        if c.get('related'):
          del c['related']
        stmt = self.render_template('control.j2',
                                    'NIST 800-53',
                                    'family',
                                    derived_family,
                                    properties=c)
        control_stmts.append(stmt)
      else:
        # its parent is a control
        del c['family']
        del c['parent']
        if c.get('related'):
          del c['related']
        if c.get('baseline_impact'):
          del c['baseline_impact']
        stmt = self.render_template('control.j2',
                                    'NIST 800-53',
                                    'control',
                                    control_dict['parent'],
                                    properties=c)
      control_stmts.append(stmt)
    stmts['controls'] = control_stmts

    # add related mappings
    if render_related:
      related_stmts = []
      for control_dict in regime_list:
        for related in control_dict.get('related', []):
          stmt = self.render_template('mapping.j2',
                                      regime_name, control_dict['name'],
                                      regime_name, related,
                                      'RELATED')
          related_stmts.append(stmt)
      stmts['related'] = stmt

    # add baseline impacts
    baseline_stmts = {
      'low': self.create_regime_baseline(regime_name, properties={'name': 'LOW'}),
      'moderate': self.create_regime_baseline(regime_name, properties={
        'name': 'MODERATE'}),
      'high': self.create_regime_baseline(regime_name, properties={'name': 'HIGH'})
    }
    stmts['baselines'] = baseline_stmts

    impact_stmts = []
    for control_dict in regime_list:
      for impact in control_dict.get('baseline_impact', []):
        stmt = self.render_template('baseline_control.j2', regime_name, impact,
                                    control_dict['name'])
        impact_stmts.append(stmt)
    stmts['impact'] = impact_stmts

    return stmts

  def load(self, regime, neo4j, stmts):
    neo4j.execute_cypher(stmts['regime'])
    for key in ['families', 'controls']:
      for stmt in stmts[key]:
        neo4j.execute_cypher(stmt)
    for key in ['low', 'moderate', 'high']:
      neo4j.execute_cypher(stmts['baselines'][key])
    for stmt in stmts['impact']:
      neo4j.execute_cypher(stmt)
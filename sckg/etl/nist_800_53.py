"""National Institute of Standards and TechnologySpecial Publication 800-53
(NIST 800-53) custom ETL
"""

import re
from sckg.etl.generic import Generic

class NIST80053(Generic):
  """NIST 800-53 custom ETL"""

  def __init__(self, config):
    super().__init__(config)

  def extract(self, regime, parsable_document):
    """NIST 800-53 extract method
       This is one of the most complicated extraction methods. NIST publishes
       a parsable version of their regime, which is great. But in order to
       properly extract all the info we need for our schema we have to use some
       regex and a bunch of conditional formatting. See inline comments for
       more details.

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

    # call parent's generic baseline function to get our list of dicts where
    # the keys are the column titles and values are the row elements
    baseline_80053_list = []
    baseline_list = self.parse_baseline(rows)

    # set up regex control and family pattern matching
    control_pattern = r'\w{2}-\d{1,2}'
    control_regex = re.compile(control_pattern)
    family_pattern = r'^\w{2}'
    family_regex = re.compile(family_pattern)

    first_row = rows[0]
    # fields = self.get_field_names(first_row)

    for control_dict in baseline_list:
      # explode baseline_impact and related attributes
      for key in ['baseline_impact', 'related']:
        if control_dict.get(key):
          temp_dict = control_dict[key].split(',')
          control_dict[key] = temp_dict

      # determine parent and family names
      name = control_dict['name']
      m = re.match(control_regex, name)
      control = m.string[m.start(0):m.end(0)]
      m_family = re.match(family_regex, name)
      family = m.string[m_family.start(0):m_family.end(0)]
      control_dict['family'] = family

      if '(' in name:
        # it's an enhancement
        name_parts = list(filter(None, name.replace(control, '')
                                 .replace(' ', '')
                                 .replace(')', '')
                                 .split('(')))
        # len 0 means family
        if len(name_parts) > 0:
          # last_part = name_parts[-1]
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
    """NIST 800-53 custom transform method
       this method breaks convention by returning a dict of stmts instead of a
       list. this should be changed in the future.

        Args:
          regime: the regime dict from config
          regime_list: the list of rows from the parsable_document

        Returns:
          stmts: a dcit of cypher statements to build this regime

        Raises:
          Exception: if no baseline is specified for the regime in config
        """

    # 800-53 includes per-control metadata on so-called 'related controls'
    # inclusion of related controls is off by default because it drastically
    # increases the number of relationships for this regime.
    render_related = regime['meta']['render_related']

    # this currently breaks our convention of returning lists
    # todo: change this logic and load method to use lists so we match the
    #  other claseses
    stmts = {}

    # create regime node
    regime_name = regime['description']
    stmt = self.create_regime(regime_name)
    stmts['regime'] = stmt

    # create families. we're using the config metadata for this regime.
    # currently 800-53 is the only regime that has this config attribute due
    # to the fact that the family names are impossible to infer from the
    # control names themselves.
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
        'low': self.create_regime_baseline(regime_name, properties={
            'name': 'LOW'
        }),
        'moderate': self.create_regime_baseline(regime_name, properties={
            'name': 'MODERATE'
        }),
        'high': self.create_regime_baseline(regime_name, properties={
            'name': 'HIGH'
        })
    }
    stmts['baselines'] = baseline_stmts

    impact_stmts = []
    for control_dict in regime_list:
      for impact in control_dict.get('baseline_impact', []):
        stmt = self.render_template('baseline_control.j2', regime_name, impact,
                                    regime_name, control_dict['name'])
        impact_stmts.append(stmt)
    stmts['impact'] = impact_stmts

    return stmts

  def load(self, regime, neo4j, stmts):
    """NIST 800-53 custom load method
       this method currently breaks our convention by processing a stmt dict
       instead of a list. in the future this should be changed

        Args:
          regime: the regime dict from config
          neo4j: the neo4j object that contains the active server connection
          stmts: dict of the cypher statements to be executed

        Returns:
          None

        Raises:
          None
        """
    neo4j.execute_cypher(stmts['regime'])
    for key in ['families', 'controls']:
      for stmt in stmts[key]:
        neo4j.execute_cypher(stmt)
    for key in ['low', 'moderate', 'high']:
      neo4j.execute_cypher(stmts['baselines'][key])
    for stmt in stmts['impact']:
      neo4j.execute_cypher(stmt)

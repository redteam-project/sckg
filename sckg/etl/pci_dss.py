
from sckg.etl.generic import Generic

class PCIDSS(Generic):

  def __init__(self, config):
    super().__init__(config)

  def extract(self, regime, parsable_document):
    with open(parsable_document, 'r') as f:
      rows = f.readlines()

    # call parent's generic baseline function
    baseline_pcidss_list = []
    baseline_list = self.parse_baseline(rows)

    # determine parent and family names
    first_row = rows[0]
    fields = self.get_field_names(first_row)

    for control_dict in baseline_list:
      if not control_dict.get('family'):
        name = control_dict['control']
        name_parts = name.split('.')

        parent_name_parts = name_parts
        del parent_name_parts[-1]
        parent_name = '.'.join(parent_name_parts)

        control_dict['parent'] = parent_name
      baseline_pcidss_list.append(control_dict)

    return baseline_pcidss_list

  def transform(self, regime, regime_list):
    stmts = []
    regime_name = regime['description']

    stmts.append(self.create_regime(regime_name))

    for control_dict in regime_list:
      c = control_dict.copy()
      c = self.clean_dict(c)
      if c.get('family'):
        c['name'] = c['family']
        del c['family']
        stmts.append(self.create_regime_family(regime_name, properties=c))
      else:
        c['name'] = c['control']
        del c['control']
        parent = c['parent']
        del c['parent']

        if not len(c['name'].split('.')) > 2:
          parent_type = 'family'
        else:
          parent_type = 'control'

        stmts.append(self.create_geneirc_control(regime_name,
                                                 parent_type,
                                                 parent,
                                                 properties=c))
    return stmts


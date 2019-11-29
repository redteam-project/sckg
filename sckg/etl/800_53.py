import re
from sckg.etl.generic import Generic

class NIST80053(Generic):

  def __init__(self, config):
    super().__init__(config)

  def extract(self, regime):
    parsable_document = self.config['cwd'] + '/' + \
                        regime['document']['parsable']
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
    pass

  def load(self, regime, stmts):
    pass
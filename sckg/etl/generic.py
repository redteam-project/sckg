
class Generic(object):

  def __init__(self, config):
    self.config = config

  def extract(self):
    pass

  def transform(self):
    pass

  def load(self):
    pass

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
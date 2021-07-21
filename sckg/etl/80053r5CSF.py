
from sckg.etl.generic import Generic

class R5CSF(Generic):

  def __init__(self, config):
    super().__init__(config)

  def extract(self, regime, parsable_document):
    with open(parsable_document, 'r') as f:
      rows = f.readlines()

    regime_list = self.parse_baseline(rows[1:])

    return regime_list

  def transform(self, regime, regime_list):
    stmts = []
    regime_name = regime['description']

    # create the controls and families
    for control_dict in regime_list:
      c = control_dict.copy()
      c = self.clean_dict(c)
      csf_control = c['subcategory'].split(':')[0]
      r5_controls = c['nist_sp_800_53,_revision_5_control'].split(', ')
      for r5_control in r5_controls:
        stmts.append(
            self.create_control_control_map(
                names={'baseline_without_control_to_regime': True,
                       'mapping_regime': 'NIST CSF',
                       'mapping_baseline': csf_control,
                       'mapped_regime': 'NIST 800-53r5',
                       'mapped_control': r5_control,
                       'relationship': 'REQUIRES'},
                properties={'type': 'mapping'})
        )

    return stmts


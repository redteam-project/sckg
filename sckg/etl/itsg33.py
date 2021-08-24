import re
from sckg.etl.generic import Generic

class ITSG33(Generic):
  """ITSG-33 Custom ETL"""

  def __init__(self, config):
    super().__init__(config)

  def extract(self, regime, parsable_document):
    with open(parsable_document, 'r') as f:
      rows = f.readlines()

    itsg33_list = []
    itsg33_list = self.parse_baseline(rows)

    itsg33_list_final = []
    for control in itsg33_list:
      control['human_name'] = control['name']
      if control.get('enhancement'):
        space = ' '
      else:
        space = ''
      control_name = '{}-{}{}{}'.format(
        control['family'],
        control['control_id'],
        space,
        control.get('enhancement', '')
      )
      control['name'] = control_name.rstrip()
      itsg33_list_final.append(control)

    return itsg33_list_final

  def transform(self, regime, regime_list):
    regime_name = 'ITSG-33'
    baseline_name = 'PBMM'
    description = regime['description']
    stmts = []
    stmts.append(self.create_regime(regime_name))
    stmts.append(
        self.create_regime_baseline(regime_name,
                                    properties={
                                        'name': baseline_name
                                    })
    )
    for control in regime_list:
      control = self.clean_dict(control)
      if control.get('enhancement'):
        parent = control['name'].split()[0]
        stmts.append(
            self.create_geneirc_control(
                regime_name,
                'control',
                parent,
                properties=control
            )
        )
      else:
        stmts.append(
            self.create_geneirc_control(
                regime_name,
                'baseline',
                baseline_name,
                properties=control
            )
        )
      stmts.append(
          self.create_control_control_map(
            names={
                'by_regime': True,
                'mapping_regime': regime_name,
                'mapping_control': control['name'],
                'mapped_regime': 'NIST 800-53r5',
                'mapped_control': control['name'],
                'relationship': 'REFERENCES'
            },
            properties={'mapped': 'True'}
          )
      )
    return stmts
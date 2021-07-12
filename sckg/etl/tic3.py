from sckg.etl.generic import Generic

class TIC3(Generic):

  def __init__(self, config):
    super().__init__(config)

  def transform(self, regime, regime_list):
    regime_name = 'TIC3'
    stig_name = regime['description']

    stmts = []
    stmts.append(self.create_regime(regime_name))
    stmts.append(
        self.create_regime_baseline(regime_name,
                                    properties={
                                      'name': stig_name
                                    })
    )
    for controls in regime_list:
      for control in controls.split(', '):
        control = self.clean_dict(control)
        stmts.append(
            self.create_baseline_has_control(regime_name,
                                             stig_name,
                                             properties=control)
        )
        stmts.append(
            self.create_control_control_map(
              names={
                  'by_baseline': True,
                  'mapping_regime': regime_name,
                  'mapping_baseline': stig_name,
                  'mapping_control': control['name'],
                  'mapped_regime': regime['baseline']['control_regime'],
                  'mapped_baseline': regime['baseline']['control_baseline'],
                  'mapped_control': control['ident'],
                  'relationship': 'REFERENCES'
              },
              properties={}
            )
        )

    return stmts
from sckg.etl.generic import Generic

class TIC3(Generic):

  def __init__(self, config):
    super().__init__(config)

  def transform(self, regime, regime_list):
    regime_name = 'TIC'
    description = regime['description']

    stmts = []
    stmts.append(self.create_regime(regime_name))
    stmts.append(
        self.create_regime_baseline(regime_name,
                                    properties={
                                      'name': description
                                    })
    )
    for control in regime_list:
      control = self.clean_dict(control)
      stmts.append(
          self.create_baseline_baseline(
              regime_name,
              description,
              properties=control
          )
      )
      for csf_control in control['controls'].split(', '):
        mapped_baseline = regime['meta']['csf_abbreviations'][csf_control]
        stmts.append(
            self.create_baseline_baseline_map(
              names={
                  'mapping_regime': regime_name,
                  'mapping_baseline': regime['description'],
                  'mapping_baseline_control': control['name'],
                  'mapped_regime': regime['baseline']['control_regime'],
                  'mapped_baseline': mapped_baseline,
                  'relationship': 'REFERENCES'
              },
              properties={}
            )
        )

    return stmts
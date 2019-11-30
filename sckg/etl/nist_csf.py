
from sckg.etl.generic import Generic

class NISTCSF(Generic):

  def __init__(self, config):
    super().__init__(config)

  def get_references(self, regime_string, ref_string):
    return ref_string.replace(regime_string + ' ', '').split(', ')

  def transform(self, regime, regime_list):
    stmts = []

    regime_name = regime['description']
    stmts.append(self.create_regime(regime_name))

    for control_dict in regime_list:
      c = control_dict.copy()
      stmts.append(
          self.create_regime_baseline(regime_name,
                                      properties={
                                        'name': c['function']
                                      })
      )
      stmts.append(
          self.create_baseline_baseline(regime_name,
                                        c['function'],
                                        properties={
                                          'name': c['category']
                                        })
      )
      stmts.append(
          self.create_baseline_baseline(regime_name,
                                        c['category'],
                                        properties={
                                          'name': c['subcategory']
                                        })
      )
      for ref_regime in ['CIS CSC',
                         'COBIT 5',
                         'ISA 62443-2-1:2009',
                         'ISA 62443-3-3:2013',
                         'ISO/IEC 27001:2013',
                         'NIST SP 800-53 Rev. 4',
                         'PCI DSS v3.2']:
        if ref_regime in c['informative_references']:
          references = self.get_references(
              ref_regime,
              c['informative_references']
          )
          for reference in references:
            ref = ref_regime
            if ref in ['CIS CSC',
                       'NIST SP 800-53 Rev. 4',
                       'PCI DSS v3.2']:
              if ref == 'NIST SP 800-53 Rev. 4':
                ref = 'NIST 800-53'
              elif ref == 'PCI DSS v3.2':
                ref = 'PCI DSS'
              stmts.append(
                  self.create_regime(ref)
              )
              stmts.append(
                  self.create_baseline_wildcard(regime_name,
                                                c['subcategory'],
                                                ref,
                                                reference,
                                                properties={})
              )
            else:
              stmts.append(
                  self.create_regime(ref)
              )
              stmts.append(
                  self.create_baseline_dummy_control(
                      ref,
                      False,
                      False,
                      reference,
                      regime_name,
                      c['subcategory'])
              )

    return stmts


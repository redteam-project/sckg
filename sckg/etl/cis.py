
from sckg.etl.generic import Generic

class CIS(Generic):

  def __init__(self, config):
    super().__init__(config)

  def transform(self, regime, regime_list):
    stmts = []
    regime_name = regime['description']
    stmts.append(self.create_regime(regime_name))

    # create the controls and families
    for control_dict in regime_list:
      c = control_dict.copy()
      c = self.clean_dict(c)
      if not c.get('cis_sub_control'):
        properties = {'name': c['cis_control'],
                      'title': c['title']}
        stmts.append(
            self.create_regime_family(regime_name,
                                      properties=properties)
        )
      else:
        properties = {'name': c['cis_sub_control'],
                      'title': c['title'],
                      'description': c.get('description', '')}
        stmts.append(
            self.create_geneirc_control(regime_name,
                                        'family',
                                        c['cis_control'],
                                        properties=properties)
        )

    # create the baselines
    for control_dict in regime_list:
      c = control_dict.copy()
      c = self.clean_dict(c)
      baselines = {'implementation_group_1': 'Implementation Group 1',
                   'implementation_group_2': 'Implementation Group 2',
                   'implementation_group_3': 'Implementation Group 3'}
      for key in baselines.keys():
        if c.get(key):
          stmts.append(
              self.create_regime_baseline(regime_name,
                                          properties={
                                            'name': baselines[key]
                                          })
          )
          stmts.append(
              self.create_baseline_control(regime_name,
                                           baselines[key],
                                           regime_name,
                                           c['cis_sub_control'],
                                           properties={})
          )

      baselines = {'asset_type': 'Asset Type',
                   'security_function': 'Security Function'}

      for key in baselines.keys():
        if c.get(key):
          stmts.append(
              self.create_regime_baseline(regime_name,
                                          properties={
                                            'name': baselines[key]
                                          })
          )

          baseline_baseline_properties = {'name': c[key]}
          stmts.append(
              self.create_baseline_baseline(regime_name,
                                            baselines[key],
                                            properties=baseline_baseline_properties)
          )
          stmts.append(
              self.create_baseline_control(regime_name,
                                           c[key],
                                           regime_name,
                                           c['cis_sub_control'],
                                           properties={
                                               'type': 'mapped'
                                           })
          )

    return stmts



from sckg.etl.generic import Generic

class DoDSRG(Generic):

  def __init__(self, config):
    super().__init__(config)

  def parameter_search(self, r, c):
    for x in r:
      if x.get('parameters'):
        if x['control'] == c:
          x = self.clean_dict(x)
          return x.get('parameters')
    return ''

  def transform(self, regime, regime_list):
    stmts = []
    regime_name = regime['description']
    control_regime = self.get_control_regime_name(regime)
    
    stmts.append(
        self.create_regime(regime_name)
    )
    stmts.append(
        self.create_regime_baseline(regime_name,
                                    properties={'name': 'Impact Level 4'})
    )
    stmts.append(
        self.create_regime_baseline(regime_name,
                                    properties={'name': 'Impact Level 5'})
    )
    stmts.append(
        self.create_regime_baseline(regime_name,
                                    properties={'name': 'Impact Level 6'})
    )
    stmts.append(
        self.create_regime_baseline(regime_name,
                                    properties={'name': 'Sections'})
    )
    stmts.append(
        self.create_baseline_baseline(regime_name,
                                      'Sections',
                                      properties={'name': '5'})
    )
    stmts.append(
        self.create_baseline_baseline(regime_name,
                                      'Sections',
                                      properties={'name': '6'})
    )

    for control_dict in regime_list:
      c = self.clean_dict(control_dict.copy())
      if c.get('section'):
        if not 'DoD-SRG' in c['control']:
          # it's a NIST 800-53 reference
          if c.get('level_4'):
            stmts.append(
                self.create_baseline_control(regime_name,
                                             'Impact Level 4',
                                             control_regime,
                                             c['control'],
                                             properties={
                                               'section': c['section'],
                                               'parameters': self.parameter_search(
                                                   regime_list,
                                                   c['control'])
                                             })
            )
          if c.get('level_5'):
            stmts.append(
                self.create_baseline_control(regime_name,
                                             'Impact Level 5',
                                             control_regime,
                                             c['control'],
                                             properties={
                                               'section': c['section'],
                                               'parameters': self.parameter_search(
                                                   regime_list,
                                                   c['control'])
                                             })
            )
          if c.get('level_6'):
            stmts.append(
                self.create_baseline_control(regime_name,
                                             'Impact Level 6',
                                             control_regime,
                                             c['control'],
                                             properties={
                                               'section': c['section'],
                                               'parameters': self.parameter_search(
                                                   regime_list,
                                                   c['control'])
                                             })
            )
        else:
          # it's an SRG narrative control
          section_parts = c['section'].split('.')
          handled_parts = []
          for part in section_parts:
            if len(handled_parts) > 0:
              stmts.append(
                  self.create_baseline_baseline(regime_name,
                                                '.'.join(handled_parts),
                                                properties={
                                                  'name': '.'.join(
                                                      handled_parts) + '.' + part
                                                })
              )
            handled_parts.append(part)
          parent_parts = section_parts[:-1]
          parent_name = '.'.join(parent_parts)
          stmts.append(
              self.create_baseline_has_control(regime_name,
                                               c['section'],
                                               properties={
                                                 'name': c['control'],
                                                 'requirement': c[
                                                   'requirement']
                                               })
          )
          # add relationship back to impact level baseline
          if c.get('level_4'):
            stmts.append(
                self.create_baseline_control(regime_name,
                                             'Impact Level 4',
                                             regime_name,
                                             c['control'],
                                             properties={})
            )
          if c.get('level_5'):
            stmts.append(
                self.create_baseline_control(regime_name,
                                             'Impact Level 5',
                                             regime_name,
                                             c['control'],
                                             properties={})
            )
          if c.get('level_6'):
            stmts.append(
                self.create_baseline_control(regime_name,
                                             'Impact Level 6',
                                             regime_name,
                                             c['control'],
                                             properties={})
            )
      elif c.get('parameters'):
        pass

    return stmts


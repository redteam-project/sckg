
from sckg.etl.generic import Generic

class Bash(Generic):

  def __init__(self, config):
    super().__init__(config)

  def extract(self, regime, parsable_document):
    with open(parsable_document, 'r') as file:
      lines = file.readlines()

    code = ''
    step = ''
    steps = []
    previous = ''
    for line in lines:
      if line.startswith('# BEGIN'):
        # new code block
        code = '\n'
        # for a line like
        # # BEGIN fix (1 / 211) for 'chronyd_or_ntpd_set_maxpoll'
        # we just want the step name in between the single quotes
        step = line.split("'")[1]
      elif line.startswith('#') and previous.startswith('# BEGIN'):
        # skip comments and and the all-# lines after BEGIN
        continue
      elif line.startswith('# END'):
        # done parsing a block, append our step list
        steps.append({step: code})
      else:
        # append this line to our block
        code = code + line

      # buffer the previous line
      previous = line

    return steps

  def transform(self, regime, regime_list):
    regime_name = regime['description']
    stmts = []

    stmts.append(
        self.create_regime('ComplianceAsCode')
    )
    stmts.append(
        self.create_regime_baseline('ComplianceAsCode',
                                    properties={
                                      'name': regime_name
                                    })
    )

    for step_dict in regime_list:
      step = list(step_dict.keys())[0]
      code = step_dict[step]

      stmts.append(
          self.create_geneirc_control('ComplianceAsCode',
                                      'baseline',
                                      regime_name,
                                      properties={
                                        'name': step,
                                        'bash': code
                                      })
      )
      stmts.append(
          self.create_control_control_map(
              names={
                'by_baseline': True,
                'mapping_regime': 'ComplianceAsCode',
                'mapping_baseline': regime_name,
                'mapping_control': step,
                'mapped_regime': 'ComplianceAsCode',
                'mapped_baseline': 'Rules',
                'mapped_control': step,
                'relationship': 'IMPLEMENTS'
              },
              properties={}
          )
      )

    return stmts


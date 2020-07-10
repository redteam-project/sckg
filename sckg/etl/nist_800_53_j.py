"""National Institute of Standards and TechnologySpecial Publication 800-53
(NIST 800-53) Appendix J custom ETL
"""

import re
from sckg.etl.nist_800_53 import NIST80053

class NIST80053J(NIST80053):
  """NIST 800-53 custom ETL"""

  def __init__(self, config):
    super().__init__(config)

  def transform(self, regime, regime_list):
    """NIST 800-53 J custom transform method
       this method breaks convention by returning a dict of stmts instead of a
       list. this should be changed in the future.

        Args:
          regime: the regime dict from config
          regime_list: the list of rows from the parsable_document

        Returns:
          stmts: a dcit of cypher statements to build this regime

        Raises:
          Exception: if no baseline is specified for the regime in config
        """

    # Everything is exactly the same with the exception of
    stmts = super().transform(regime, regime_list)

    # Create the Appendix J baseline
    stmts['appendix'] = []
    stmts['appendix'].append(self.render_template('regime_baseline.j2',
                                                  'NIST 800-53',
                                                  properties={'name': 'Appendix J'}))

    for control_dict in regime_list:
      stmts['appendix'].append(self.render_template('baseline_defines_control.j2',
                                                    'NIST 800-53',
                                                    'Appendix J',
                                                    control_dict['name']))

    return stmts

  def load(self, regime, neo4j, stmts):
    """NIST 800-53 J custom load method
       this method currently breaks our convention by processing a stmt dict
       instead of a list. in the future this should be changed

        Args:
          regime: the regime dict from config
          neo4j: the neo4j object that contains the active server connection
          stmts: dict of the cypher statements to be executed

        Returns:
          None

        Raises:
          None
        """
    neo4j.execute_cypher(stmts['regime'])
    for key in ['families', 'controls', 'appendix']:
      for stmt in stmts[key]:
        neo4j.execute_cypher(stmt)
    # for key in ['low', 'moderate', 'high']:
    #   neo4j.execute_cypher(stmts['baselines'][key])
    # for stmt in stmts['impact']:
    #   neo4j.execute_cypher(stmt)

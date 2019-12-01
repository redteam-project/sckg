import importlib
import os
import yaml

from sckg.neo4j import Neo4j

class Build(object):
  """Class for building the Neo4j sckg"""

  def __init__(self):
    """Init build class

    This class will grab config data from config.yml and private.yml, then
    iterate over the regimes from both files to build the graph.
    """
    with open('config.yml', 'r') as f:
      self.config = yaml.safe_load(f.read())

    try:
      with open('private.yml', 'r') as f:
        private_regimes = yaml.safe_load(f.read())
        self.config['regimes'] += private_regimes['regimes']
    except FileNotFoundError as e:
      # It's ok if there's no private config
      pass

    self.config['cwd'] = os.getcwd()

    self.neo4j = Neo4j(self.config)

    for regime in self.config['regimes']:
      # iterate over the regimes, buliding each one
      # it's important to keep in mind that the order of the regimes in
      # config.yml matters because of how the regimes refer to one another,
      # which is why we do this as a list and not a dict (which would be easier
      # elsewhere in the program)
      self.regime_etl(regime)

    self.neo4j.close_driver()

  def regime_etl(self, regime):
    """Extract / transform / load function for a regime

    Args:
      regime: the dict regime list element from the configs

    Returns:
       None
    """

    # first we have to figure out which module and class we're going to use
    # for this regime. if the regime dict doesn't specify, we'll use the
    # generic class
    etl_config = regime.get('etl', 'generic')
    if etl_config == 'generic':
      module_name = self.config['defaults']['generic']['module']
      class_name = self.config['defaults']['generic']['class']
    else:
      module_name = regime['etl']['module']
      class_name = regime['etl']['class']

    parsable_document = self.config['cwd'] + '/' + \
                        regime['document']['parsable']

    # this part's a little tricky. we're dynamically instantiating the class
    # associated with this regime. this way we can have a nicely generic etl
    # function without a bunch of repeated code.
    etl_class = getattr(importlib.import_module(module_name),
                        class_name)
    etl_instance = etl_class(self.config)

    # the next three lines are for the extract, transform, and load methods.
    # extract takes the parsable document and returns a list of dicts
    regime_list = etl_instance.extract(regime, parsable_document)
    # transform takes the list of dicts and converts them into cypher statements
    stmts = etl_instance.transform(regime, regime_list)
    # load takes the cypher statements and sends them to the neo4j server
    etl_instance.load(regime, self.neo4j, stmts)

def main():
  build = Build()

if __name__ == '__main__':
  main()
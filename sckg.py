import importlib
import os
import yaml

from sckg.neo4j import Neo4j

class SCKG(object):

  def __init__(self):
    with open('config.yml', 'r') as f:
      self.config = yaml.safe_load(f.read())

    self.config['cwd'] = os.getcwd()

    self.neo4j = Neo4j(self.config)

    for regime in self.config['regimes']:
      self.regime_etl(regime)

    self.neo4j.close_driver()

  def regime_etl(self, regime):
    etl_config = regime.get('etl', 'generic')
    if etl_config == 'generic':
      module_name = self.config['defaults']['generic']['module']
      class_name = self.config['defaults']['generic']['class']
    else:
      module_name = regime['etl']['module']
      class_name = regime['etl']['class']
    etl_class = getattr(importlib.import_module(module_name),
                        class_name)
    etl_instance = etl_class(self.config)

    regime_list = etl_instance.extract(regime)
    # todo: remove breakpoints
    pause = True
    stmts = etl_instance.transform(regime, regime_list)
    pause = True
    etl_instance.load(regime, self.neo4j, stmts)
    pause = True

def main():
  sckg = SCKG()

if __name__ == '__main__':
  main()
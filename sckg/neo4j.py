import yaml
from neo4j import GraphDatabase

class Neo4j(object):

  def __init__(self, config):
    self.config = config
    neo4j_config = self.config['cwd'] + '/secrets/neo4j.yml'
    with open(neo4j_config, 'r') as f:
      self.neo4j_config = yaml.safe_load(f.read())

    self.debug = True

    self.driver = GraphDatabase.driver(
        self.neo4j_config['url'],
        auth=(self.neo4j_config['username'],
              self.neo4j_config['password'])
    )

  def execute_cypher(self, stmt):
    with self.driver.session() as session:
      if self.debug:
        print(stmt)
      result = session.run(stmt)
    return result

  def load_baseline(self, stmts):
    if stmts is None or len(stmts) == 0:
      return
    for stmt in stmts:
      self.execute_cypher(stmt)

  def close_driver(self):
    self.driver.close()
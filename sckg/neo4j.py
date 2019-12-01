import yaml
from neo4j import GraphDatabase

class Neo4j(object):

  def __init__(self, config):
    """Init function for Neo4j class, which initializes a connection to the
       Neo4j server. This class will be reused by the other classes to prevent
       multiple connections from being opened.

    Args:
      config: the serialized config.yml data

    Returns:
      None

    Raises:
      None
    """
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
    """executes a cypher statement

    Args:
      stmt: a string of cypher

    Returns:
      result: result from the cypher statement's execution

    Raises:
      None
    """
    with self.driver.session() as session:
      if self.debug:
        print(stmt)
      result = session.run(stmt)
    return result

  def load_baseline(self, stmts):
    """bulk loads a list of cypher statements

    Args:
      stmts: a list of strings of cypher statements

    Returns:
      None

    Raises:
      None
    """
    if stmts is None or len(stmts) == 0:
      return
    for stmt in stmts:
      self.execute_cypher(stmt)

  def close_driver(self):
    """closes connection to Neo4j server"""
    self.driver.close()
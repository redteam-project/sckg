"""Neo4j graph database class"""

import yaml
from neo4j import GraphDatabase

class Neo4j(object):

  def __init__(self, config, debug=True):
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

    self.debug = debug

    self.driver = GraphDatabase.driver(
        self.neo4j_config['url'],
        encrypted=False,
        auth=(self.neo4j_config['username'],
              self.neo4j_config['password'])
    )

    # used for query debugging
    self.node_count = 0
    self.edge_count = 0
    if self.debug:
      with self.driver.session() as session:
        count_query = 'MATCH (n) WITH n MATCH (n)-[r]-() RETURN COUNT(n), COUNT(r)'
        count_result = session.run(count_query)
        for r in count_result:
          self.node_count = r[0]
          self.edge_count = r[1]

  def execute_cypher(self, stmt, count=True):
    """executes a cypher statement

    Args:
      stmt: a string of cypher
      count: if true, counts nodes created with each statement, decreases
             performance

    Returns:
      result: result from the cypher statement's execution

    Raises:
      None
    """
    with self.driver.session() as session:
      if self.debug:
        print(stmt + ';')
      result = session.run(stmt)

      if count:
        # do 1 of 2 debug queries
        count_query = 'MATCH (n) WITH n MATCH (n)-[r]-() RETURN COUNT(n), COUNT(r)'
        count_result = session.run(count_query)
        nodes_created = 0
        for r in count_result:
          nodes_created = r[0]
          edges_created = r[1]
        if self.debug:
          print('// nodes created: ' + str(max(0, nodes_created - self.node_count)))
        if max(0, nodes_created - self.node_count) > 0:
          self.node_count = nodes_created
        if self.debug:
          print('// edges created: ' + str(max(0, edges_created - self.edge_count)))
        if max(0, edges_created - self.edge_count) > 0:
          self.edge_count = edges_created

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
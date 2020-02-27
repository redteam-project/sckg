import importlib
import magic
import os
import unittest
import yaml

from sckg.neo4j import Neo4j

class TestConfigYaml(unittest.TestCase):

  def setUp(self) -> None:
    self.config = {}
    with open('config.yml', 'r') as f:
      self.config = yaml.safe_load(f.read())

    try:
      with open('private.yml', 'r') as f:
        private_regimes = yaml.safe_load(f.read())
        if self.config.get('regimes'):
          self.config['regimes'] += private_regimes['regimes']
        else:
          self.config['regimes'] = private_regimes['regimes']
    except FileNotFoundError as e:
      # It's ok if there's no private config
      pass

    self.config['cwd'] = os.getcwd()
    self.neo4j = Neo4j(self.config, debug=False)
    self.debug = False

  def get_controls(self, query):
    result = self.neo4j.execute_cypher(query)
    controls = []
    for r in result:
      for n in r:
        controls.append(n.get('name'))
    return controls

  def get_regime(self, name):
    for regime in self.config['regimes']:
      if regime.get('description') == name:
        return regime

  def get_regime_lens(self, name, query):
    this_regime = self.get_regime(name)
    parsable_doc = this_regime.get('document').get('parsable')
    with open(parsable_doc, 'r') as f:
      lines = f.readlines()

    controls = self.get_controls(query)
    pause = True
    return len(lines) - 1, len(controls)

  def test_regime_80053(self):
    name = 'NIST 800-53'
    query = 'MATCH (r:regime {name: "' + name + '"})-[:HAS*]->(c:control) RETURN c'
    r = self.get_regime_lens(name, query)
    self.assertEquals(r[0], r[1])

  def test_regime_fedramp_high(self):
    name = 'FedRAMP High'
    query = 'MATCH (r:regime {name: "FedRAMP"})-[:HAS*]->(b:baseline {name: "High"}) WITH b MATCH (b)-[:REQUIRES]->(c:control) RETURN c'
    r = self.get_regime_lens(name, query)
    self.assertEquals(r[0], r[1])



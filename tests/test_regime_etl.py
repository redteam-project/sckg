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
    return len(lines) - 1, len(controls)

  def test_control_count_80053(self):
    name = 'NIST 800-53'
    query = 'MATCH (r:regime {name: "' + name + '"})-[:HAS*]->(c:control) RETURN c'
    r = self.get_regime_lens(name, query)
    self.assertEquals(r[0], r[1])

  def test_control_count_fedramp_high(self):
    name = 'FedRAMP High'
    query = 'MATCH (r:regime {name: "FedRAMP"})-[:HAS*]->(b:baseline {name: "High"}) WITH b MATCH (b)-[:REQUIRES]->(c:control) RETURN c'
    r = self.get_regime_lens(name, query)
    self.assertEquals(r[0], r[1])

  def test_control_count_fedramp_moderate(self):
    name = 'FedRAMP Moderate'
    query = 'MATCH (r:regime {name: "FedRAMP"})-[:HAS*]->(b:baseline {name: "Moderate"}) WITH b MATCH (b)-[:REQUIRES]->(c:control) RETURN c'
    r = self.get_regime_lens(name, query)
    self.assertEquals(r[0], r[1])

  def test_control_count_cnssi_ci(self):
    name = 'CNSSI 1253 Classified Information Overlay'
    query = 'MATCH (r:regime {name: "CNSSI 1253"})-[:HAS*]->(b:baseline {name: "Classified Information"}) WITH b MATCH (b)-[:REQUIRES]->(c:control) RETURN c'
    r = self.get_regime_lens(name, query)
    self.assertEquals(r[0], r[1])

  # todo: this currently fails, see issue #16
  # def test_control_count_cnssi_pii(self):
  #   name = 'CNSSI 1253 Privacy Overlay'
  #   query = 'MATCH (r:regime {name: "CNSSI 1253"})-[:HAS*]->(b:baseline {name: "Privacy"}) WITH b MATCH (b)-[:REQUIRES]->(c:control) RETURN c'
  #   r = self.get_regime_lens(name, query)
  #   self.assertEquals(r[0], r[1])

  # todo: add dod srg test case once issue #14 is resolved

  # todo: this currently fails, see issue #17
  # def test_control_count_cis_csc(self):
  #   name = 'CIS CSC'
  #   query = 'MATCH (r:regime {name: "CIS CSC"})-[:HAS*]->(c:control) RETURN c'
  #   r = self.get_regime_lens(name, query)
  #   self.assertEquals(r[0], r[1])

  # todo: this currently fails, see issue #18
  # def test_control_count_pci_dss(self):
  #   name = 'PCI DSS'
  #   query = 'MATCH (r:regime {name: "PCI DSS"})-[:HAS*]->(c:control) RETURN c'
  #   r = self.get_regime_lens(name, query)
  #   self.assertEquals(r[0], r[1])

  # todo: write test for nist csf

  # todo: write test for cac

  # todo: write test for bash implementations
import importlib
import magic
import os
import unittest
import yaml

from sckg.neo4j import Neo4j
from sckg.etl.generic import Generic

class TestConfigETL(unittest.TestCase):

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

    # r[0] has the length of just the 80053 parsable, minus appendix j, so we
    # have to add that back in now. this is a one-off
    with open('data/regimes/nist_800-53r4_appendix_j.tsv', 'r') as f:
      lines = f.readlines()
    both_lens = r[0] + len(lines) - 1
    self.assertEquals(both_lens, r[1])

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

  def test_control_count_cnssi_pii(self):
    name = 'CNSSI 1253 Privacy Overlay'
    query = 'MATCH (r:regime {name: "CNSSI 1253"})-[:HAS*]->(b:baseline {name: "Privacy"}) WITH b MATCH (b)-[:REQUIRES]->(c:control) RETURN c'
    r = self.get_regime_lens(name, query)
    self.assertEquals(r[0], r[1])

  # todo: add dod srg test case once issue #14 is resolved
  def test_control_count_dod_srg(self):
    name = 'DoD SRG'
    regime = self.get_regime(name)
    with open(regime['document']['parsable'], 'r') as f:
      rows = f.readlines()
    etl = Generic(self.config)
    regime_dict = etl.parse_baseline(rows)

    # generate control dicts. it's necessary to do it this way because there's
    # duplication in control IDs between tables 2 and 3 in the SRG
    nist_80053_controls = {}
    srg_controls = {}
    parameters = {}
    for control in regime_dict:
      if control.get('parameters'):
        parameters[control['control']] = 1
      if control.get('requirement'):
        srg_controls[control['control']] = 1
      if not control.get('requirement') and not control.get('parameters'):
        nist_80053_controls[control['control']] = 1

    query_80053 = 'MATCH (:regime {name: "NIST 800-53"})-[:HAS*]->(nist:control) WITH nist MATCH (:regime {name: "DoD SRG"})-[:HAS]->(b:baseline) WHERE b.name IN ["Impact Level 4", "Impact Level 5", "Impact Level 6"] WITH nist, b MATCH (b)-[:REQUIRES]->(nist:control) RETURN DISTINCT nist'
    r = self.get_regime_lens(name, query_80053)
    self.assertEquals(len(nist_80053_controls.keys()), r[1])

    query_srg = 'MATCH (:regime {name: "DoD SRG"})-[:HAS]->(b:baseline {name: "Sections"}) WITH b MATCH (b)-[:HAS*]->(c:control) RETURN c'
    r = self.get_regime_lens(name, query_srg)
    self.assertEquals(len(srg_controls.keys()), r[1])

    # todo: verify control parameters, see issue #22

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
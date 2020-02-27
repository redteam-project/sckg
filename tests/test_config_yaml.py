import importlib
import magic
import os
import unittest
import yaml

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

  def test_defaults(self):
    self.assertTrue(self.config.get('defaults'))

    self.assertTrue(self.config.get('defaults').get('generic').get('module'))
    self.assertTrue(self.config.get('defaults').get('generic').get('class'))

    module_name = self.config['defaults']['generic']['module']
    class_name = self.config['defaults']['generic']['class']
    try:
      test_class = getattr(importlib.import_module(module_name), class_name)
    except ModuleNotFoundError:
      self.fail('could not instanciate the generic module class')

    self.assertTrue(self.config.get('defaults').get('templates').get('cypher').get('path'))
    self.assertTrue(os.path.exists(self.config['defaults']['templates']['cypher']['path']))

  def test_regimes(self):
    self.assertTrue(self.config.get('regimes'))

    for regime in self.config['regimes']:
      self.assertTrue(regime.get('document').get('parsable'))
      parsable_document = regime['document']['parsable']
      self.assertTrue(
          os.path.isfile(parsable_document) or
          os.path.isdir((parsable_document))
      )

      if os.path.isfile(parsable_document) and regime.get('baseline') and \
          not 'XML' in magic.from_file(parsable_document):
        with open(parsable_document, 'r') as f:
          lines = f.readlines()
        uid_key = regime.get('baseline').get('uid_key')
        field_names = lines[0].rstrip().lower().split('\t')
        self.assertTrue(uid_key in field_names)

      if regime.get('etl'):
        try:
          module_name = regime['etl']['module']
          class_name = regime['etl']['class']
          test_class = getattr(importlib.import_module(module_name), class_name)
        except ModuleNotFoundError:
          self.fail('could not instanciate the generic module class')


if __name__ == '__main__':
  unittest.main()
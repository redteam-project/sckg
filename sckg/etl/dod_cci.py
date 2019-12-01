import json

from lxml import objectify

from sckg.etl.generic import Generic

class DoDCCI(Generic):

  def __init__(self, config):
    super().__init__(config)

  def extract(self, regime, parsable_document):
    # with open(parsable_document, 'r') as f:
    #   xml = f.read()
    #
    # root = objectify.fromstring(xml)
    #
    # j = []
    # for item in root.cci_items.cci_item:
    #   id = item.attrib.get('id', '')
    #   control_list = []
    #   for reference in item.references.reference:
    #     control_list.append(reference.attrib.get('index'))
    #   j.append({
    #     'id': id,
    #     'controls': control_list
    #   })
    #
    # return j
    return []

  def transform(self, regime, regime_list):
    # regime_name = regime['description']
    #
    # stmts = []
    # stmts.append(self.create_regime(regime_name))
    # stmts.append(
    #     self.create_regime_baseline(regime_name,
    #                                 properties={
    #                                   'name': 'CCI'
    #                                 })
    # )
    # for cci in regime_list:
    #   cci_name = list(cci.keys())[0]
    #   cci_controls = cci[cci_name].split(',')
    #   stmts.append(
    #       self.create_baseline_control(regime_name,
    #                                    'baseline',
    #                                    'CCI',
    #                                    regime_name,
    #                                    cci_name)
    #   )
    #
    return []



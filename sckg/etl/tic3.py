from lxml import objectify

from sckg.etl.generic import Generic

class STIG(Generic):

  def __init__(self, config):
    super().__init__(config)

  def extract(self, regime, parsable_document):
    with open(parsable_document, 'rb') as f:
      xml = f.read()

    root = objectify.fromstring(xml)

    rules = []
    for r in root.iter():
      if 'Benchmark' in r.tag:
        for group in r.Group:
          for rule in group.Rule:
            d = {
              'name': rule.attrib.get('id', None),
              'severity': rule.attrib.get('severity', None),
              'weight': rule.attrib.get('weight', None),
              'check': rule.check.attrib.get('system', None),
              'description': rule.description.text,
              'fix': rule.fix.attrib.get('id', None),
              'ident': rule.ident.text,
              'title': rule.title.text,
              'version': rule.version.text
            }
            rules.append(d)

    return rules

  def transform(self, regime, regime_list):
    regime_name = 'STIG'
    stig_name = regime['description']

    stmts = []
    stmts.append(self.create_regime(regime_name))
    stmts.append(
        self.create_regime_baseline(regime_name,
                                    properties={
                                      'name': stig_name
                                    })
    )
    for control in regime_list:
      control = self.clean_dict(control)
      stmts.append(
          self.create_baseline_has_control(regime_name,
                                           stig_name,
                                           properties=control)
      )
      stmts.append(
          self.create_control_control_map(
            names={
                'by_baseline': True,
                'mapping_regime': regime_name,
                'mapping_baseline': stig_name,
                'mapping_control': control['name'],
                'mapped_regime': regime['baseline']['control_regime'],
                'mapped_baseline': regime['baseline']['control_baseline'],
                'mapped_control': control['ident'],
                'relationship': 'REFERENCES'
            },
            properties={}
          )
      )

    return stmts
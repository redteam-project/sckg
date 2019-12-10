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
      for group in r.Group:
        for rule in group.Rule:
          d = {}
          d['id'] = rule.attrib.get('id', None)
          d['severity'] = rule.attrib.get('severity', None)
          d['weight'] = rule.attrib.get('weight', None)
          d['check'] = rule.check.attrib.get('system', None)
          d['description'] = rule.description.text
          d['fix'] = rule.fix.attrib.get('id', None)
          d['ident'] = rule.ident.text
          d['title'] = rule.title.text
          d['version'] = rule.version.text
          rules.append(d)

      pause = True

    return rules
import re
import yaml
from sckg.etl.generic import Generic

class Rules(Generic):

  def __init__(self, config):
    super().__init__(config)

  def extract(self, regime, path):
    files = self.get_dir_files(path)

    # rules = {}
    rules = []
    for file in files:
      if file.endswith('rule.yml'):
        # get the path components
        dirs = file.split('/')
        # reassembel the rule's path (klunky, I know)
        rule_name = dirs[-2]
        with open(file, 'r') as raw_file:
          raw = raw_file.read()

        # ComplianceAsCode uses jinja2-like template logic. it's too
        # hard to recreate here, and we don't really care about what
        # it says anyway, go we'll just ditch those substrings.
        raw = re.sub('{{.*}}', 'DISCARDED_LOGIC', raw)

        # but now we have to figure out how to properly indent
        # each line
        processed = ''
        previous = ''
        for line in raw.split('\n'):
          if line == '':
            # don't process blank lines
            processed = processed + line + '\n'
            continue
          elif line == 'medium' or line == 'high':
            # these are artifacts of tossing the template logic
            continue
          elif line.lstrip().startswith('DISCARDED_LOGIC'):
            if not line.endswith('DISCARDED_LOGIC'):
              # if the line starts with and ends with
              # DISCARDED_LOGIC we can skip it entirely

              # calculate leading whitespace on previous line
              leading_whitespace = len(previous) - len(
                  previous.lstrip())
              if leading_whitespace == 0 and not line.startswith(
                  '#'):
                # if it's not a comment and has 0 leading
                # whitespace we can assume we want 4 spaces
                leading_whitespace = 4

              # append the processed line to our buffer
              processed = processed + (' ' * leading_whitespace) \
                          + line.lstrip() + '\n'
          else:
            # don't process
            processed = processed + line + '\n'

          # buffer previous line
          previous = line

        # parse the yaml
        data = yaml.safe_load(processed)

        # append the rule to our list
        # rules[rule_name] = data
        rules.append({rule_name: data})

    return rules

  def transform(self, regime, regime_list):
    stmts = []
    for regime_dict in regime_list:
      for key in regime_dict.keys():
        properties = self.clean_dict(regime_dict[key].copy())
        properties['name'] = key

        # move references into its own dict
        # this looks clunky, but we don't want to try to del a key that
        # doesn't exist
        if properties.get('references'):
          references = properties['references']
          del properties['references']
        else:
          references = {}

        # flatten warnings into string
        if properties.get('warnings'):
          warnings = []
          for warning in properties['warnings']:
            warnings.append(self.flatten_dict(warning))
          properties['warnings'] = '; '.join(warnings)

        # flatten CCE identifiers into a string
        if properties.get('identifiers'):
          properties['identifiers'] = self.flatten_dict(
              properties['identifiers']
          )

        # flatten template into a string
        if properties.get('template'):
          properties['template'] = self.flatten_dict(
              properties['template']
          )

        # statement to create this control
        stmts.append(
            self.create_regime('ComplianceAsCode')
        )
        stmts.append(
            self.create_regime_baseline('ComplianceAsCode',
                                        properties={
                                          'name': 'Rules'
                                        })
        )
        stmts.append(
            self.create_geneirc_control('ComplianceAsCode',
                                        'baseline',
                                        'Rules',
                                        properties=properties)
        )

        # statement to create the referenced regimes
        extant_regimes = {
          'cis-csc': self.get_regime_description('cis'),
          'cis': self.get_regime_description('cis'),
          'cobit5': 'COBIT 5',
          'nist': self.get_regime_description('800_53'),
          'nist-csf': self.get_regime_description('nist_csf'),
          'isa-62443-2009': 'ISA 62443-2-1:2009',
          'isa-62443-2013': 'ISA 62443-3-3:2013',
          'iso27001-2013': 'ISO/IEC 27001:2013',
          'srg': self.get_regime_description('dod_srg'),
          'pcidss': self.get_regime_description('pci_dss')
        }
        for regime_name in references.keys():
          referenced_regime = extant_regimes.get(regime_name,
                                                 regime_name.upper())

          # create the regime_name and control we don't yet have mapped
          if not extant_regimes.get(regime_name):
            stmts.append(
                self.create_regime(referenced_regime)
            )
            stmts.append(
                self.create_regime_baseline(referenced_regime,
                                            properties={
                                              'name': 'derived'
                                            })
            )
            for control in references[regime_name].split(','):
              stmts.append(
                  self.create_geneirc_control(referenced_regime,
                                              'baseline',
                                              'derived',
                                              properties={
                                                'name': control
                                              })
              )

          # map the references
          for control in references[regime_name].split(','):
            stmts.append(
                self.create_control_control_map(
                    names={
                      'by_regime': True,
                      'mapping_regime': 'ComplianceAsCode',
                      'mapping_control': properties['name'],
                      'mapped_regime': referenced_regime,
                      'mapped_control': control,
                      'relationship': 'REFERENCES'
                    },
                    properties={}
                )
            )

    return stmts


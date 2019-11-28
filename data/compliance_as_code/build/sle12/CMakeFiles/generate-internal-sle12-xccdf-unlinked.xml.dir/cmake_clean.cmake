FILE(REMOVE_RECURSE
  "CMakeFiles/generate-internal-sle12-xccdf-unlinked.xml"
  "xccdf-unlinked.xml"
  "xccdf-unlinked-ocilrefs.xml"
  "bash-fixes.xml"
  "ansible-fixes.xml"
  "puppet-fixes.xml"
  "anaconda-fixes.xml"
  "xccdf-unlinked-resolved.xml"
  "ocil-unlinked.xml"
  "shorthand.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-internal-sle12-xccdf-unlinked.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

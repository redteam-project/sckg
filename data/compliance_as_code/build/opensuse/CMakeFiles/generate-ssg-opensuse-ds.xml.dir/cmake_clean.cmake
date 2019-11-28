FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-opensuse-ds.xml"
  "../ssg-opensuse-ds.xml"
  "../ssg-opensuse-ds-1.2.xml"
  "../ssg-opensuse-xccdf-1.2.xml"
  "../ssg-opensuse-oval.xml"
  "../ssg-opensuse-ocil.xml"
  "../ssg-opensuse-cpe-dictionary.xml"
  "../ssg-opensuse-cpe-oval.xml"
  "../ssg-opensuse-xccdf.xml"
  "xccdf-linked.xml"
  "oval-linked.xml"
  "ocil-linked.xml"
  "oval-unlinked.xml"
  "xccdf-unlinked.xml"
  "ocil-unlinked.xml"
  "xccdf-unlinked-ocilrefs.xml"
  "bash-fixes.xml"
  "ansible-fixes.xml"
  "puppet-fixes.xml"
  "anaconda-fixes.xml"
  "xccdf-unlinked-resolved.xml"
  "shorthand.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-ssg-opensuse-ds.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

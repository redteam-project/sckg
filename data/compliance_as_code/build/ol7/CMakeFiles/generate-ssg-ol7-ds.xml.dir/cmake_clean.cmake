FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-ol7-ds.xml"
  "../ssg-ol7-ds.xml"
  "../ssg-ol7-ds-1.2.xml"
  "../ssg-ol7-xccdf-1.2.xml"
  "../ssg-ol7-oval.xml"
  "../ssg-ol7-ocil.xml"
  "../ssg-ol7-cpe-dictionary.xml"
  "../ssg-ol7-cpe-oval.xml"
  "../ssg-ol7-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-ol7-ds.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-sle11-ds.xml"
  "../ssg-sle11-ds.xml"
  "../ssg-sle11-ds-1.2.xml"
  "../ssg-sle11-xccdf-1.2.xml"
  "../ssg-sle11-oval.xml"
  "../ssg-sle11-ocil.xml"
  "../ssg-sle11-cpe-dictionary.xml"
  "../ssg-sle11-cpe-oval.xml"
  "../ssg-sle11-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-sle11-ds.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

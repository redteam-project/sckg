FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-sle12-guide-index.html"
  "../guides/ssg-sle12-guide-index.html"
  "../ssg-sle12-ds.xml"
  "../ssg-sle12-ds-1.2.xml"
  "../ssg-sle12-xccdf-1.2.xml"
  "../ssg-sle12-oval.xml"
  "../ssg-sle12-ocil.xml"
  "../ssg-sle12-cpe-dictionary.xml"
  "../ssg-sle12-cpe-oval.xml"
  "../ssg-sle12-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-sle12-guide-index.html.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

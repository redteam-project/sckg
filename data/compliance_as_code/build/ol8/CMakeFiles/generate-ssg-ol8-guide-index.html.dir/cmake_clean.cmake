FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-ol8-guide-index.html"
  "../guides/ssg-ol8-guide-index.html"
  "../ssg-ol8-ds.xml"
  "../ssg-ol8-ds-1.2.xml"
  "../ssg-ol8-xccdf-1.2.xml"
  "../ssg-ol8-oval.xml"
  "../ssg-ol8-ocil.xml"
  "../ssg-ol8-cpe-dictionary.xml"
  "../ssg-ol8-cpe-oval.xml"
  "../ssg-ol8-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-ol8-guide-index.html.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

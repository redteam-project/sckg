FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-debian9-guide-index.html"
  "../guides/ssg-debian9-guide-index.html"
  "../ssg-debian9-ds.xml"
  "../ssg-debian9-ds-1.2.xml"
  "../ssg-debian9-xccdf-1.2.xml"
  "../ssg-debian9-oval.xml"
  "../ssg-debian9-ocil.xml"
  "../ssg-debian9-cpe-dictionary.xml"
  "../ssg-debian9-cpe-oval.xml"
  "../ssg-debian9-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-debian9-guide-index.html.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

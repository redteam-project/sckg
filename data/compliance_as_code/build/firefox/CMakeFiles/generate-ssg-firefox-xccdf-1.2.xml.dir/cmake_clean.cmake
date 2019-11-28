FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-firefox-xccdf-1.2.xml"
  "../ssg-firefox-xccdf-1.2.xml"
  "../ssg-firefox-xccdf.xml"
  "xccdf-linked.xml"
  "oval-linked.xml"
  "ocil-linked.xml"
  "xccdf-unlinked.xml"
  "oval-unlinked.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-firefox-xccdf-1.2.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

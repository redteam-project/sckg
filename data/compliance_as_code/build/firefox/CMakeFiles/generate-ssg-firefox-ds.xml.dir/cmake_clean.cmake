FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-firefox-ds.xml"
  "../ssg-firefox-ds.xml"
  "../ssg-firefox-ds-1.2.xml"
  "../ssg-firefox-xccdf-1.2.xml"
  "../ssg-firefox-oval.xml"
  "../ssg-firefox-ocil.xml"
  "../ssg-firefox-cpe-dictionary.xml"
  "../ssg-firefox-cpe-oval.xml"
  "../ssg-firefox-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-firefox-ds.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

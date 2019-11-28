FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-ubuntu1404-ds.xml"
  "../ssg-ubuntu1404-ds.xml"
  "../ssg-ubuntu1404-ds-1.2.xml"
  "../ssg-ubuntu1404-xccdf-1.2.xml"
  "../ssg-ubuntu1404-oval.xml"
  "../ssg-ubuntu1404-ocil.xml"
  "../ssg-ubuntu1404-cpe-dictionary.xml"
  "../ssg-ubuntu1404-cpe-oval.xml"
  "../ssg-ubuntu1404-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-ubuntu1404-ds.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

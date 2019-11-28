FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-ocp4-ds.xml"
  "../ssg-ocp4-ds.xml"
  "../ssg-ocp4-ds-1.2.xml"
  "../ssg-ocp4-xccdf-1.2.xml"
  "../ssg-ocp4-oval.xml"
  "../ssg-ocp4-ocil.xml"
  "../ssg-ocp4-cpe-dictionary.xml"
  "../ssg-ocp4-cpe-oval.xml"
  "../ssg-ocp4-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-ocp4-ds.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

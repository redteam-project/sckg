FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-ocp3-guide-index.html"
  "../guides/ssg-ocp3-guide-index.html"
  "../ssg-ocp3-ds.xml"
  "../ssg-ocp3-ds-1.2.xml"
  "../ssg-ocp3-xccdf-1.2.xml"
  "../ssg-ocp3-oval.xml"
  "../ssg-ocp3-ocil.xml"
  "../ssg-ocp3-cpe-dictionary.xml"
  "../ssg-ocp3-cpe-oval.xml"
  "../ssg-ocp3-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-ocp3-guide-index.html.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

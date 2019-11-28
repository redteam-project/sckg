FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-wrlinux1019-guide-index.html"
  "../guides/ssg-wrlinux1019-guide-index.html"
  "../ssg-wrlinux1019-ds.xml"
  "../ssg-wrlinux1019-ds-1.2.xml"
  "../ssg-wrlinux1019-xccdf-1.2.xml"
  "../ssg-wrlinux1019-oval.xml"
  "../ssg-wrlinux1019-ocil.xml"
  "../ssg-wrlinux1019-cpe-dictionary.xml"
  "../ssg-wrlinux1019-cpe-oval.xml"
  "../ssg-wrlinux1019-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-wrlinux1019-guide-index.html.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

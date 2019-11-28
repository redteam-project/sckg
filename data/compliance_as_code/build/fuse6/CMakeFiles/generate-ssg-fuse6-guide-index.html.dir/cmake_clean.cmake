FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-fuse6-guide-index.html"
  "../guides/ssg-fuse6-guide-index.html"
  "../ssg-fuse6-ds.xml"
  "../ssg-fuse6-ds-1.2.xml"
  "../ssg-fuse6-xccdf-1.2.xml"
  "../ssg-fuse6-oval.xml"
  "../ssg-fuse6-ocil.xml"
  "../ssg-fuse6-cpe-dictionary.xml"
  "../ssg-fuse6-cpe-oval.xml"
  "../ssg-fuse6-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-fuse6-guide-index.html.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

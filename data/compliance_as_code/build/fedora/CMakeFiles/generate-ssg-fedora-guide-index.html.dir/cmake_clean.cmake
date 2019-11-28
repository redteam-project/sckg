FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-fedora-guide-index.html"
  "../guides/ssg-fedora-guide-index.html"
  "../ssg-fedora-ds.xml"
  "../ssg-fedora-ds-1.2.xml"
  "../ssg-fedora-xccdf-1.2.xml"
  "../ssg-fedora-oval.xml"
  "../ssg-fedora-ocil.xml"
  "../ssg-fedora-cpe-dictionary.xml"
  "../ssg-fedora-cpe-oval.xml"
  "../ssg-fedora-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-fedora-guide-index.html.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

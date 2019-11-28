FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-jre-guide-index.html"
  "../guides/ssg-jre-guide-index.html"
  "../ssg-jre-ds.xml"
  "../ssg-jre-ds-1.2.xml"
  "../ssg-jre-xccdf-1.2.xml"
  "../ssg-jre-oval.xml"
  "../ssg-jre-ocil.xml"
  "../ssg-jre-cpe-dictionary.xml"
  "../ssg-jre-cpe-oval.xml"
  "../ssg-jre-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-jre-guide-index.html.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

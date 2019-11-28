FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-chromium-ds.xml"
  "../ssg-chromium-ds.xml"
  "../ssg-chromium-ds-1.2.xml"
  "../ssg-chromium-xccdf-1.2.xml"
  "../ssg-chromium-oval.xml"
  "../ssg-chromium-ocil.xml"
  "../ssg-chromium-cpe-dictionary.xml"
  "../ssg-chromium-cpe-oval.xml"
  "../ssg-chromium-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-chromium-ds.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

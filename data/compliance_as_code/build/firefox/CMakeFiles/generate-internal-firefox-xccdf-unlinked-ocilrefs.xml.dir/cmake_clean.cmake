FILE(REMOVE_RECURSE
  "CMakeFiles/generate-internal-firefox-xccdf-unlinked-ocilrefs.xml"
  "xccdf-unlinked-ocilrefs.xml"
  "xccdf-unlinked-resolved.xml"
  "ocil-unlinked.xml"
  "shorthand.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-internal-firefox-xccdf-unlinked-ocilrefs.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

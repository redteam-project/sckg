FILE(REMOVE_RECURSE
  "CMakeFiles/generate-internal-firefox-oval-unlinked.xml"
  "oval-unlinked.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-internal-firefox-oval-unlinked.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

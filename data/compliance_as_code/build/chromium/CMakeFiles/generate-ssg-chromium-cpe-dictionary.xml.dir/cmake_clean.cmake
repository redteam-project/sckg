FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-chromium-cpe-dictionary.xml"
  "../ssg-chromium-cpe-dictionary.xml"
  "../ssg-chromium-cpe-oval.xml"
  "oval-unlinked.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-ssg-chromium-cpe-dictionary.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

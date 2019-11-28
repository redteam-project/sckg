FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-ol7-cpe-dictionary.xml"
  "../ssg-ol7-cpe-dictionary.xml"
  "../ssg-ol7-cpe-oval.xml"
  "oval-unlinked.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-ssg-ol7-cpe-dictionary.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

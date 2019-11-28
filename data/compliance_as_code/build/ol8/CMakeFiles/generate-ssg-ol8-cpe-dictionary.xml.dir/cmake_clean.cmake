FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-ol8-cpe-dictionary.xml"
  "../ssg-ol8-cpe-dictionary.xml"
  "../ssg-ol8-cpe-oval.xml"
  "oval-unlinked.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-ssg-ol8-cpe-dictionary.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

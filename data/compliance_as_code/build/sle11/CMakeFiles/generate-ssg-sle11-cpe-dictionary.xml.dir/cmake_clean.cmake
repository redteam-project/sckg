FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-sle11-cpe-dictionary.xml"
  "../ssg-sle11-cpe-dictionary.xml"
  "../ssg-sle11-cpe-oval.xml"
  "oval-unlinked.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-ssg-sle11-cpe-dictionary.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

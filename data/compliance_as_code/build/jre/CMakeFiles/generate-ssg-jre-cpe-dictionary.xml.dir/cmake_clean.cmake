FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-jre-cpe-dictionary.xml"
  "../ssg-jre-cpe-dictionary.xml"
  "../ssg-jre-cpe-oval.xml"
  "oval-unlinked.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-ssg-jre-cpe-dictionary.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

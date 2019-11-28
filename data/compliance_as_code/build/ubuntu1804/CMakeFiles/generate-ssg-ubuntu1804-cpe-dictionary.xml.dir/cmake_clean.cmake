FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-ubuntu1804-cpe-dictionary.xml"
  "../ssg-ubuntu1804-cpe-dictionary.xml"
  "../ssg-ubuntu1804-cpe-oval.xml"
  "oval-unlinked.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-ssg-ubuntu1804-cpe-dictionary.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

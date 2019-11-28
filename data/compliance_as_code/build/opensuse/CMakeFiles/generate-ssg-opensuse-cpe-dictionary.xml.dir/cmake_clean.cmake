FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-opensuse-cpe-dictionary.xml"
  "../ssg-opensuse-cpe-dictionary.xml"
  "../ssg-opensuse-cpe-oval.xml"
  "oval-unlinked.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-ssg-opensuse-cpe-dictionary.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

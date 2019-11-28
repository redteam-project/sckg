FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-fedora-cpe-dictionary.xml"
  "../ssg-fedora-cpe-dictionary.xml"
  "../ssg-fedora-cpe-oval.xml"
  "oval-unlinked.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-ssg-fedora-cpe-dictionary.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

FILE(REMOVE_RECURSE
  "CMakeFiles/firefox-content"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/firefox-content.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

FILE(REMOVE_RECURSE
  "CMakeFiles/generate-internal-firefox-bash-fixes.xml"
  "bash-fixes.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-internal-firefox-bash-fixes.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

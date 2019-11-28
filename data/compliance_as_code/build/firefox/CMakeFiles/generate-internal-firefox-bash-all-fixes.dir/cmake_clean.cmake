FILE(REMOVE_RECURSE
  "CMakeFiles/generate-internal-firefox-bash-all-fixes"
  "fixes/bash"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-internal-firefox-bash-all-fixes.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

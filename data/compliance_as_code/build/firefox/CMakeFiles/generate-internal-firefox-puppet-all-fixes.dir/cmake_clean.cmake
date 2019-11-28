FILE(REMOVE_RECURSE
  "CMakeFiles/generate-internal-firefox-puppet-all-fixes"
  "fixes/puppet"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-internal-firefox-puppet-all-fixes.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

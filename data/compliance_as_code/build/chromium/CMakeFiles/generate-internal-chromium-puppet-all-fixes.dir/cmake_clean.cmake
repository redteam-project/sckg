FILE(REMOVE_RECURSE
  "CMakeFiles/generate-internal-chromium-puppet-all-fixes"
  "fixes/puppet"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-internal-chromium-puppet-all-fixes.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

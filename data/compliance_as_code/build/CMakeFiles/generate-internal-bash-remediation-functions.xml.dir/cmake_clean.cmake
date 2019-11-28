FILE(REMOVE_RECURSE
  "CMakeFiles/generate-internal-bash-remediation-functions.xml"
  "bash-remediation-functions.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-internal-bash-remediation-functions.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

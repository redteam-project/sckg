FILE(REMOVE_RECURSE
  "CMakeFiles/man_page"
  "scap-security-guide.8"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/man_page.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

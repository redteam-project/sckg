FILE(REMOVE_RECURSE
  "CMakeFiles/generate-firefox-ansible-playbooks"
  "playbooks"
  "fixes/ansible"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-firefox-ansible-playbooks.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

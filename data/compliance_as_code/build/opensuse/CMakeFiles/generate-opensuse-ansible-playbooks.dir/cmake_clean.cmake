FILE(REMOVE_RECURSE
  "CMakeFiles/generate-opensuse-ansible-playbooks"
  "playbooks"
  "fixes/ansible"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-opensuse-ansible-playbooks.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

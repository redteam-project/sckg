FILE(REMOVE_RECURSE
  "CMakeFiles/generate-all-profile-bash-scripts-rhv4"
  "../bash/all-profile-bash-scripts-rhv4"
  "../ssg-rhv4-xccdf.xml"
  "xccdf-linked.xml"
  "oval-linked.xml"
  "ocil-linked.xml"
  "xccdf-unlinked.xml"
  "oval-unlinked.xml"
  "ocil-unlinked.xml"
  "xccdf-unlinked-ocilrefs.xml"
  "bash-fixes.xml"
  "ansible-fixes.xml"
  "puppet-fixes.xml"
  "anaconda-fixes.xml"
  "xccdf-unlinked-resolved.xml"
  "shorthand.xml"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/generate-all-profile-bash-scripts-rhv4.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

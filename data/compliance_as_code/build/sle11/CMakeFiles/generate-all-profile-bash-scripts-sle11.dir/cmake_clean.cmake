FILE(REMOVE_RECURSE
  "CMakeFiles/generate-all-profile-bash-scripts-sle11"
  "../bash/all-profile-bash-scripts-sle11"
  "../ssg-sle11-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-all-profile-bash-scripts-sle11.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

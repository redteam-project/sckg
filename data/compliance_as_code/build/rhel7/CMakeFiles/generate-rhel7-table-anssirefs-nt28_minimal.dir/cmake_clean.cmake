FILE(REMOVE_RECURSE
  "CMakeFiles/generate-rhel7-table-anssirefs-nt28_minimal"
  "../tables/table-rhel7-anssirefs-nt28_minimal.html"
  "../ssg-rhel7-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-rhel7-table-anssirefs-nt28_minimal.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

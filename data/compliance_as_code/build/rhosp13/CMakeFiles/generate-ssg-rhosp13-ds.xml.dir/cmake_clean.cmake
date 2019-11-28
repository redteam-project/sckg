FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-rhosp13-ds.xml"
  "../ssg-rhosp13-ds.xml"
  "../ssg-rhosp13-ds-1.2.xml"
  "../ssg-rhosp13-xccdf-1.2.xml"
  "../ssg-rhosp13-oval.xml"
  "../ssg-rhosp13-ocil.xml"
  "../ssg-rhosp13-cpe-dictionary.xml"
  "../ssg-rhosp13-cpe-oval.xml"
  "../ssg-rhosp13-xccdf.xml"
  "xccdf-linked.xml"
  "oval-linked.xml"
  "ocil-linked.xml"
  "oval-unlinked.xml"
  "xccdf-unlinked.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-rhosp13-ds.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

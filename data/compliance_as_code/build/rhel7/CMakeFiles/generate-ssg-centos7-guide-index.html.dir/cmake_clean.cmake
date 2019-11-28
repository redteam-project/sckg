FILE(REMOVE_RECURSE
  "CMakeFiles/generate-ssg-centos7-guide-index.html"
  "../guides/ssg-centos7-guide-index.html"
  "../ssg-centos7-ds.xml"
  "../ssg-centos7-ds-1.2.xml"
  "../ssg-rhel7-ds.xml"
  "../ssg-rhel7-ds-1.2.xml"
  "../ssg-rhel7-xccdf-1.2.xml"
  "../ssg-rhel7-oval.xml"
  "../ssg-rhel7-ocil.xml"
  "../ssg-rhel7-cpe-dictionary.xml"
  "../ssg-rhel7-cpe-oval.xml"
  "../ssg-rhel7-pcidss-xccdf-1.2.xml"
  "../ssg-rhel7-xccdf.xml"
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
  INCLUDE(CMakeFiles/generate-ssg-centos7-guide-index.html.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)

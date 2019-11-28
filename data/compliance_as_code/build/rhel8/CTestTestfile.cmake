# CMake generated Testfile for 
# Source directory: /root/content-0.1.47/rhel8
# Build directory: /root/content-0.1.47/build/rhel8
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(ansible-playbook-syntax-check-rhel8 "/root/content-0.1.47/tests/ansible_playbook_check.sh" "/bin/ansible-playbook" "/root/content-0.1.47/build/ansible" "rhel8")
ADD_TEST(rhel8-ansible-playbooks-generated-for-all-rules "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/tests/ansible_playbooks_generated_for_all_rules.py" "--build-dir" "/root/content-0.1.47/build" "--product" "rhel8")
ADD_TEST(rhel8-ansible-assert-playbooks-schema "sh" "-c" "/bin/python \$@" "_" "/root/content-0.1.47/tests/assert_ansible_schema.py" "/root/content-0.1.47/build/rhel8/playbooks/all/*")
ADD_TEST(validate-ssg-rhel8-cpe-dictionary.xml "/bin/oscap" "cpe" "validate" "/root/content-0.1.47/build/ssg-rhel8-cpe-dictionary.xml")
ADD_TEST(validate-ssg-rhel8-cpe-oval.xml "/bin/oscap" "oval" "validate" "--schematron" "/root/content-0.1.47/build/ssg-rhel8-cpe-oval.xml")
ADD_TEST(validate-ssg-rhel8-xccdf.xml "/bin/oscap" "xccdf" "validate" "/root/content-0.1.47/build/ssg-rhel8-xccdf.xml")
ADD_TEST(verify-references-ssg-rhel8-xccdf.xml "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/build-scripts/verify_references.py" "--rules-with-invalid-checks" "--ovaldefs-unused" "/root/content-0.1.47/build/ssg-rhel8-xccdf.xml")
ADD_TEST(verify-ssg-rhel8-xccdf.xml-override-true-all-profile-titles "/bin/xmllint" "--xpath" "//*[local-name()=\"Profile\"]/*[local-name()=\"title\"][not(@override=\"true\")]" "/root/content-0.1.47/build/ssg-rhel8-xccdf.xml")
SET_TESTS_PROPERTIES(verify-ssg-rhel8-xccdf.xml-override-true-all-profile-titles PROPERTIES  WILL_FAIL "true")
ADD_TEST(verify-ssg-rhel8-xccdf.xml-override-true-all-profile-descriptions "/bin/xmllint" "--xpath" "//*[local-name()=\"Profile\"]/*[local-name()=\"description\"][not(@override=\"true\")]" "/root/content-0.1.47/build/ssg-rhel8-xccdf.xml")
SET_TESTS_PROPERTIES(verify-ssg-rhel8-xccdf.xml-override-true-all-profile-descriptions PROPERTIES  WILL_FAIL "true")
ADD_TEST(validate-ssg-rhel8-oval.xml "/bin/oscap" "oval" "validate" "--schematron" "/root/content-0.1.47/build/ssg-rhel8-oval.xml")
ADD_TEST(validate-ssg-rhel8-ds.xml "/bin/oscap" "ds" "sds-validate" "/root/content-0.1.47/build/ssg-rhel8-ds.xml")
ADD_TEST(validate-ssg-rhel8-ds-1.2.xml "/bin/oscap" "ds" "sds-validate" "/root/content-0.1.47/build/ssg-rhel8-ds-1.2.xml")
ADD_TEST(validate-ssg-centos8-xccdf.xml "/usr/bin/cmake" "-E" "touch" "/root/content-0.1.47/build/rhel8/validation-ssg-centos8-xccdf.xml")
ADD_TEST(validate-ssg-centos8-ds.xml "/bin/oscap" "ds" "sds-validate" "/root/content-0.1.47/build/ssg-centos8-ds.xml")
ADD_TEST(validate-ssg-centos8-ds-1.2.xml "/bin/oscap" "ds" "sds-validate" "/root/content-0.1.47/build/ssg-centos8-ds-1.2.xml")

# CMake generated Testfile for 
# Source directory: /root/content-0.1.47/opensuse
# Build directory: /root/content-0.1.47/build/opensuse
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(ansible-playbook-syntax-check-opensuse "/root/content-0.1.47/tests/ansible_playbook_check.sh" "/bin/ansible-playbook" "/root/content-0.1.47/build/ansible" "opensuse")
ADD_TEST(opensuse-ansible-playbooks-generated-for-all-rules "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/tests/ansible_playbooks_generated_for_all_rules.py" "--build-dir" "/root/content-0.1.47/build" "--product" "opensuse")
ADD_TEST(validate-ssg-opensuse-cpe-dictionary.xml "/bin/oscap" "cpe" "validate" "/root/content-0.1.47/build/ssg-opensuse-cpe-dictionary.xml")
ADD_TEST(validate-ssg-opensuse-cpe-oval.xml "/bin/oscap" "oval" "validate" "--schematron" "/root/content-0.1.47/build/ssg-opensuse-cpe-oval.xml")
ADD_TEST(validate-ssg-opensuse-xccdf.xml "/bin/oscap" "xccdf" "validate" "/root/content-0.1.47/build/ssg-opensuse-xccdf.xml")
ADD_TEST(verify-references-ssg-opensuse-xccdf.xml "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/build-scripts/verify_references.py" "--rules-with-invalid-checks" "--ovaldefs-unused" "/root/content-0.1.47/build/ssg-opensuse-xccdf.xml")
ADD_TEST(verify-ssg-opensuse-xccdf.xml-override-true-all-profile-titles "/bin/xmllint" "--xpath" "//*[local-name()=\"Profile\"]/*[local-name()=\"title\"][not(@override=\"true\")]" "/root/content-0.1.47/build/ssg-opensuse-xccdf.xml")
SET_TESTS_PROPERTIES(verify-ssg-opensuse-xccdf.xml-override-true-all-profile-titles PROPERTIES  WILL_FAIL "true")
ADD_TEST(verify-ssg-opensuse-xccdf.xml-override-true-all-profile-descriptions "/bin/xmllint" "--xpath" "//*[local-name()=\"Profile\"]/*[local-name()=\"description\"][not(@override=\"true\")]" "/root/content-0.1.47/build/ssg-opensuse-xccdf.xml")
SET_TESTS_PROPERTIES(verify-ssg-opensuse-xccdf.xml-override-true-all-profile-descriptions PROPERTIES  WILL_FAIL "true")
ADD_TEST(validate-ssg-opensuse-oval.xml "/bin/oscap" "oval" "validate" "--schematron" "/root/content-0.1.47/build/ssg-opensuse-oval.xml")
ADD_TEST(validate-ssg-opensuse-ds.xml "/bin/oscap" "ds" "sds-validate" "/root/content-0.1.47/build/ssg-opensuse-ds.xml")
ADD_TEST(validate-ssg-opensuse-ds-1.2.xml "/bin/oscap" "ds" "sds-validate" "/root/content-0.1.47/build/ssg-opensuse-ds-1.2.xml")

# CMake generated Testfile for 
# Source directory: /root/content-0.1.47/fedora
# Build directory: /root/content-0.1.47/build/fedora
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(ansible-playbook-syntax-check-fedora "/root/content-0.1.47/tests/ansible_playbook_check.sh" "/bin/ansible-playbook" "/root/content-0.1.47/build/ansible" "fedora")
ADD_TEST(fedora-ansible-playbooks-generated-for-all-rules "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/tests/ansible_playbooks_generated_for_all_rules.py" "--build-dir" "/root/content-0.1.47/build" "--product" "fedora")
ADD_TEST(validate-ssg-fedora-cpe-dictionary.xml "/bin/oscap" "cpe" "validate" "/root/content-0.1.47/build/ssg-fedora-cpe-dictionary.xml")
ADD_TEST(validate-ssg-fedora-cpe-oval.xml "/bin/oscap" "oval" "validate" "--schematron" "/root/content-0.1.47/build/ssg-fedora-cpe-oval.xml")
ADD_TEST(validate-ssg-fedora-xccdf.xml "/bin/oscap" "xccdf" "validate" "/root/content-0.1.47/build/ssg-fedora-xccdf.xml")
ADD_TEST(verify-references-ssg-fedora-xccdf.xml "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/build-scripts/verify_references.py" "--rules-with-invalid-checks" "--ovaldefs-unused" "/root/content-0.1.47/build/ssg-fedora-xccdf.xml")
ADD_TEST(verify-ssg-fedora-xccdf.xml-override-true-all-profile-titles "/bin/xmllint" "--xpath" "//*[local-name()=\"Profile\"]/*[local-name()=\"title\"][not(@override=\"true\")]" "/root/content-0.1.47/build/ssg-fedora-xccdf.xml")
SET_TESTS_PROPERTIES(verify-ssg-fedora-xccdf.xml-override-true-all-profile-titles PROPERTIES  WILL_FAIL "true")
ADD_TEST(verify-ssg-fedora-xccdf.xml-override-true-all-profile-descriptions "/bin/xmllint" "--xpath" "//*[local-name()=\"Profile\"]/*[local-name()=\"description\"][not(@override=\"true\")]" "/root/content-0.1.47/build/ssg-fedora-xccdf.xml")
SET_TESTS_PROPERTIES(verify-ssg-fedora-xccdf.xml-override-true-all-profile-descriptions PROPERTIES  WILL_FAIL "true")
ADD_TEST(validate-ssg-fedora-oval.xml "/bin/oscap" "oval" "validate" "--schematron" "/root/content-0.1.47/build/ssg-fedora-oval.xml")
ADD_TEST(validate-ssg-fedora-ds.xml "/bin/oscap" "ds" "sds-validate" "/root/content-0.1.47/build/ssg-fedora-ds.xml")
ADD_TEST(validate-ssg-fedora-ds-1.2.xml "/bin/oscap" "ds" "sds-validate" "/root/content-0.1.47/build/ssg-fedora-ds-1.2.xml")

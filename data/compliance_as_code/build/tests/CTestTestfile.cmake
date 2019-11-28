# CMake generated Testfile for 
# Source directory: /root/content-0.1.47/tests
# Build directory: /root/content-0.1.47/build/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(max-path-len "/bin/python" "/root/content-0.1.47/tests/ensure_paths_are_short.py")
ADD_TEST(test-rule-dir-json "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/utils/rule_dir_json.py")
ADD_TEST(validate-parse-affected "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/tests/test_parse_affected.py" "/root/content-0.1.47" "/root/content-0.1.47/build/build_config.yml")
ADD_TEST(validate-parse-platform "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/tests/test_parse_platform.py" "/root/content-0.1.47")
ADD_TEST(stable-profile-ids "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/tests/stable_profile_ids.py" "/root/content-0.1.47/build")
ADD_TEST(machine-only-rules "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/tests/test_machine_only_rules.py" "--source_dir" "/root/content-0.1.47" "--build_dir" "/root/content-0.1.47/build")
ADD_TEST(macros-oval "env" "PYTHONPATH=/root/content-0.1.47" "/bin/python" "/root/content-0.1.47/tests/test_macros_oval.py" "--verbose")

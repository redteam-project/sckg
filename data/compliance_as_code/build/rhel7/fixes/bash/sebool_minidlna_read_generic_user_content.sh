# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
# Include source function library.
. /usr/share/scap-security-guide/remediation_functions


populate var_minidlna_read_generic_user_content

setsebool -P minidlna_read_generic_user_content $var_minidlna_read_generic_user_content
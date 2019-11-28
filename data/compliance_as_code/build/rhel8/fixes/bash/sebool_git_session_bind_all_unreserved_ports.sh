# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
# Include source function library.
. /usr/share/scap-security-guide/remediation_functions


populate var_git_session_bind_all_unreserved_ports

setsebool -P git_session_bind_all_unreserved_ports $var_git_session_bind_all_unreserved_ports
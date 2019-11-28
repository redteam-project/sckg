# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
# Include source function library.
. /usr/share/scap-security-guide/remediation_functions


populate var_ftpd_connect_all_unreserved

setsebool -P ftpd_connect_all_unreserved $var_ftpd_connect_all_unreserved
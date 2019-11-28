# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
# Include source function library.
. /usr/share/scap-security-guide/remediation_functions


populate var_httpd_can_network_connect_db

setsebool -P httpd_can_network_connect_db $var_httpd_can_network_connect_db
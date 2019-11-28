# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
# Include source function library.
. /usr/share/scap-security-guide/remediation_functions


populate var_xserver_clients_write_xshm

setsebool -P xserver_clients_write_xshm $var_xserver_clients_write_xshm
# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
# Include source function library.
. /usr/share/scap-security-guide/remediation_functions


populate var_logging_syslogd_run_nagios_plugins

setsebool -P logging_syslogd_run_nagios_plugins $var_logging_syslogd_run_nagios_plugins
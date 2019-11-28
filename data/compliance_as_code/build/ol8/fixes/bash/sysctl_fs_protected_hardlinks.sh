# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = true
# disruption = medium
# strategy = disable
. /usr/share/scap-security-guide/remediation_functions

#
# Set runtime for fs.protected_hardlinks
#
/sbin/sysctl -q -n -w fs.protected_hardlinks="1"

#
# If fs.protected_hardlinks present in /etc/sysctl.conf, change value to "1"
#	else, add "fs.protected_hardlinks = 1" to /etc/sysctl.conf
#
replace_or_append '/etc/sysctl.conf' '^fs.protected_hardlinks' "1" '@CCENUM@'
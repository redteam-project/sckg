# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = true
# disruption = medium
# strategy = disable
. /usr/share/scap-security-guide/remediation_functions

#
# Set runtime for kernel.unprivileged_bpf_disabled
#
/sbin/sysctl -q -n -w kernel.unprivileged_bpf_disabled="1"

#
# If kernel.unprivileged_bpf_disabled present in /etc/sysctl.conf, change value to "1"
#	else, add "kernel.unprivileged_bpf_disabled = 1" to /etc/sysctl.conf
#
replace_or_append '/etc/sysctl.conf' '^kernel.unprivileged_bpf_disabled' "1" '@CCENUM@'
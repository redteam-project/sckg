# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove vsftpd
#	   from the system, and may remove any packages
#	   that depend on vsftpd. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "vsftpd" ; then
    dnf remove -y "vsftpd"
fi
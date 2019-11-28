# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove tftp
#	   from the system, and may remove any packages
#	   that depend on tftp. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "tftp" ; then
    yum remove -y "tftp"
fi
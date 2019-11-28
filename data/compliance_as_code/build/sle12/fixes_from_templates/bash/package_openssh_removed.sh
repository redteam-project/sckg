# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove openssh
#	   from the system, and may remove any packages
#	   that depend on openssh. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "openssh" ; then
    yum remove -y "openssh"
fi
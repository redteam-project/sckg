# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove ypserv
#	   from the system, and may remove any packages
#	   that depend on ypserv. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "ypserv" ; then
    yum remove -y "ypserv"
fi
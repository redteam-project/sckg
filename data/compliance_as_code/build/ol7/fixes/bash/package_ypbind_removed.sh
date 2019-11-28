# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove ypbind
#	   from the system, and may remove any packages
#	   that depend on ypbind. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "ypbind" ; then
    yum remove -y "ypbind"
fi
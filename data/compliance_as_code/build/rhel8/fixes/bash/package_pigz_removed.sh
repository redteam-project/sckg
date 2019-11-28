# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove pigz
#	   from the system, and may remove any packages
#	   that depend on pigz. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "pigz" ; then
    yum remove -y "pigz"
fi
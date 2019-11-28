# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove abrt-addon-kerneloops
#	   from the system, and may remove any packages
#	   that depend on abrt-addon-kerneloops. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "abrt-addon-kerneloops" ; then
    dnf remove -y "abrt-addon-kerneloops"
fi
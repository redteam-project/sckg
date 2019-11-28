# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove xorg-x11-server-common
#	   from the system, and may remove any packages
#	   that depend on xorg-x11-server-common. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "xorg-x11-server-common" ; then
    yum remove -y "xorg-x11-server-common"
fi
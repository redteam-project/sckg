# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove setroubleshoot
#	   from the system, and may remove any packages
#	   that depend on setroubleshoot. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "setroubleshoot" ; then
    dnf remove -y "setroubleshoot"
fi
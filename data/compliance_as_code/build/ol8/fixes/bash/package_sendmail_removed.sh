# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove sendmail
#	   from the system, and may remove any packages
#	   that depend on sendmail. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "sendmail" ; then
    yum remove -y "sendmail"
fi
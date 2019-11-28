# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove httpd
#	   from the system, and may remove any packages
#	   that depend on httpd. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

if rpm -q --quiet "httpd" ; then
    yum remove -y "httpd"
fi
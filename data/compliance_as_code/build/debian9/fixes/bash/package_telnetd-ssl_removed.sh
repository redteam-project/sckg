# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove telnetd-ssl
#	   from the system, and may remove any packages
#	   that depend on telnetd-ssl. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

apt-get remove -y "telnetd-ssl"
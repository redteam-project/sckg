# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

# CAUTION: This remediation script will remove openssh-server
#	   from the system, and may remove any packages
#	   that depend on openssh-server. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

apt-get remove -y "openssh-server"
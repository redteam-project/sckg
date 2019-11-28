# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

# CAUTION: This remediation script will remove snmp
#	   from the system, and may remove any packages
#	   that depend on snmp. Execute this
#	   remediation AFTER testing on a non-production
#	   system!

apt-get remove -y "snmp"
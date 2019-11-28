# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_snmp

class remove_snmp {
  package { 'snmp':
    ensure => 'purged',
  }
}
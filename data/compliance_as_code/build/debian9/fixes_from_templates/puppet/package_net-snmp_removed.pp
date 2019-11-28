# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
include remove_snmp

class remove_snmp {
  package { 'snmp':
    ensure => 'purged',
  }
}
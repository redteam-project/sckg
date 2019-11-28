# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_net-snmp

class remove_net-snmp {
  package { 'net-snmp':
    ensure => 'purged',
  }
}
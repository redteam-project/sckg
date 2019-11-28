# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_snmpd

class disable_snmpd {
  service {'snmpd':
    enable => false,
    ensure => 'stopped',
  }
}
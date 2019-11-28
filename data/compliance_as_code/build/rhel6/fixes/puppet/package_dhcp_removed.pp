# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_dhcp

class remove_dhcp {
  package { 'dhcp':
    ensure => 'purged',
  }
}
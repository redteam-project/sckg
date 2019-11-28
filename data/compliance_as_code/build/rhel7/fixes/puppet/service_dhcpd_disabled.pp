# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_dhcpd

class disable_dhcpd {
  service {'dhcpd':
    enable => false,
    ensure => 'stopped',
  }
}
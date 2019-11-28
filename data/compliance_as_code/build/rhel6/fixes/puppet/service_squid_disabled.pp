# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_squid

class disable_squid {
  service {'squid':
    enable => false,
    ensure => 'stopped',
  }
}
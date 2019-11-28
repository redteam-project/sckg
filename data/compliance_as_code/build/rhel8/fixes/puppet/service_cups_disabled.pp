# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_cups

class disable_cups {
  service {'cups':
    enable => false,
    ensure => 'stopped',
  }
}
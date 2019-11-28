# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_bluetooth

class disable_bluetooth {
  service {'bluetooth':
    enable => false,
    ensure => 'stopped',
  }
}
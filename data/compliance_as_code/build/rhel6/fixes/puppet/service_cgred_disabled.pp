# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_cgred

class disable_cgred {
  service {'cgred':
    enable => false,
    ensure => 'stopped',
  }
}
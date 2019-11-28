# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_cgconfig

class disable_cgconfig {
  service {'cgconfig':
    enable => false,
    ensure => 'stopped',
  }
}
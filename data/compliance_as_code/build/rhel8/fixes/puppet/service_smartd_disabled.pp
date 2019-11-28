# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_smartd

class disable_smartd {
  service {'smartd':
    enable => false,
    ensure => 'stopped',
  }
}
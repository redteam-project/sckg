# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_atd

class disable_atd {
  service {'atd':
    enable => false,
    ensure => 'stopped',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_abrtd

class disable_abrtd {
  service {'abrtd':
    enable => false,
    ensure => 'stopped',
  }
}
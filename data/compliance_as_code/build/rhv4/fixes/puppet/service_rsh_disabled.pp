# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_rsh

class disable_rsh {
  service {'rsh':
    enable => false,
    ensure => 'stopped',
  }
}
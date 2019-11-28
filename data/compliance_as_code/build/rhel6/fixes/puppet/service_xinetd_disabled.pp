# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_xinetd

class disable_xinetd {
  service {'xinetd':
    enable => false,
    ensure => 'stopped',
  }
}
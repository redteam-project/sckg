# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_haldaemon

class disable_haldaemon {
  service {'haldaemon':
    enable => false,
    ensure => 'stopped',
  }
}
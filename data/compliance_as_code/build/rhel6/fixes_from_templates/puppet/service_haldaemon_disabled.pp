# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include disable_haldaemon

class disable_haldaemon {
  service {'haldaemon':
    enable => false,
    ensure => 'stopped',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_cockpit

class disable_cockpit {
  service {'cockpit':
    enable => false,
    ensure => 'stopped',
  }
}
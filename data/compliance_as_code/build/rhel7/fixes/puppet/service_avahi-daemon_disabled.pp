# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_avahi-daemon

class disable_avahi-daemon {
  service {'avahi-daemon':
    enable => false,
    ensure => 'stopped',
  }
}
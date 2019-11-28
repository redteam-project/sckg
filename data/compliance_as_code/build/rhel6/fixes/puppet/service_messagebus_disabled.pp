# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_messagebus

class disable_messagebus {
  service {'messagebus':
    enable => false,
    ensure => 'stopped',
  }
}
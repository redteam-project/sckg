# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_certmonger

class disable_certmonger {
  service {'certmonger':
    enable => false,
    ensure => 'stopped',
  }
}
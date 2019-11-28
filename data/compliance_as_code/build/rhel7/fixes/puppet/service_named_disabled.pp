# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_named

class disable_named {
  service {'named':
    enable => false,
    ensure => 'stopped',
  }
}
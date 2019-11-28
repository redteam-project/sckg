# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_rpcsvcgssd

class disable_rpcsvcgssd {
  service {'rpcsvcgssd':
    enable => false,
    ensure => 'stopped',
  }
}
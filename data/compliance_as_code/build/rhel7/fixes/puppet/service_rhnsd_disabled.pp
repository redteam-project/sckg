# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_rhnsd

class disable_rhnsd {
  service {'rhnsd':
    enable => false,
    ensure => 'stopped',
  }
}
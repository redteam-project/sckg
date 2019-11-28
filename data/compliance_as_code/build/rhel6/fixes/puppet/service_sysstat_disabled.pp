# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_sysstat

class disable_sysstat {
  service {'sysstat':
    enable => false,
    ensure => 'stopped',
  }
}
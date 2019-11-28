# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_ntpdate

class disable_ntpdate {
  service {'ntpdate':
    enable => false,
    ensure => 'stopped',
  }
}
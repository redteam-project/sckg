# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_ntpd

class enable_ntpd {
  service {'ntpd':
    enable => true,
    ensure => 'running',
  }
}
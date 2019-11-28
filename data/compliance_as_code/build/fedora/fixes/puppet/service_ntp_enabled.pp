# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_ntp

class enable_ntp {
  service {'ntp':
    enable => true,
    ensure => 'running',
  }
}
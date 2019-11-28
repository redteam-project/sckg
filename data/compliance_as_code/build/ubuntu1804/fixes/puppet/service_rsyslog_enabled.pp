# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_rsyslog

class enable_rsyslog {
  service {'rsyslog':
    enable => true,
    ensure => 'running',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_syslogng

class enable_syslogng {
  service {'syslogng':
    enable => true,
    ensure => 'running',
  }
}
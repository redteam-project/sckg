# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_rsyslog

class install_rsyslog {
  package { 'rsyslog':
    ensure => 'installed',
  }
}
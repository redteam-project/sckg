# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_syslogng

class install_syslogng {
  package { 'syslogng':
    ensure => 'installed',
  }
}
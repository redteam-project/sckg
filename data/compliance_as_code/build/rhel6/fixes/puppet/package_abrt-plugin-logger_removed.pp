# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_abrt-plugin-logger

class remove_abrt-plugin-logger {
  package { 'abrt-plugin-logger':
    ensure => 'purged',
  }
}
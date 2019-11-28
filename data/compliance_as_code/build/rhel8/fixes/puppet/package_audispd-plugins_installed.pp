# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_audispd-plugins

class install_audispd-plugins {
  package { 'audispd-plugins':
    ensure => 'installed',
  }
}
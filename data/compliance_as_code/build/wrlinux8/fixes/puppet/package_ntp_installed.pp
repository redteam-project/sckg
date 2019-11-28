# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_ntp

class install_ntp {
  package { 'ntp':
    ensure => 'installed',
  }
}
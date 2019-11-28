# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_uuidd

class install_uuidd {
  package { 'uuidd':
    ensure => 'installed',
  }
}
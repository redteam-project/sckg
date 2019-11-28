# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include install_uuidd

class install_uuidd {
  package { 'uuidd':
    ensure => 'installed',
  }
}
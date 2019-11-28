# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_fapolicyd

class install_fapolicyd {
  package { 'fapolicyd':
    ensure => 'installed',
  }
}
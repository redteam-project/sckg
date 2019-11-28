# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_opensc

class install_opensc {
  package { 'opensc':
    ensure => 'installed',
  }
}
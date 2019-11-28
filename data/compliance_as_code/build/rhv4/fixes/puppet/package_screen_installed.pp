# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_screen

class install_screen {
  package { 'screen':
    ensure => 'installed',
  }
}
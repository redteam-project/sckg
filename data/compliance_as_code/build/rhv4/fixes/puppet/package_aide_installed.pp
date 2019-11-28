# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_aide

class install_aide {
  package { 'aide':
    ensure => 'installed',
  }
}
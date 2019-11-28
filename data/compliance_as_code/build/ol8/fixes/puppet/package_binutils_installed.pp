# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_binutils

class install_binutils {
  package { 'binutils':
    ensure => 'installed',
  }
}
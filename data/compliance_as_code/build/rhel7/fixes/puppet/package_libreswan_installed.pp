# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_libreswan

class install_libreswan {
  package { 'libreswan':
    ensure => 'installed',
  }
}
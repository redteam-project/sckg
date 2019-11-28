# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_glibc

class install_glibc {
  package { 'glibc':
    ensure => 'installed',
  }
}
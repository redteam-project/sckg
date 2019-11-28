# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include install_glibc

class install_glibc {
  package { 'glibc':
    ensure => 'installed',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_gnutls-utils

class install_gnutls-utils {
  package { 'gnutls-utils':
    ensure => 'installed',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_nss-tools

class install_nss-tools {
  package { 'nss-tools':
    ensure => 'installed',
  }
}
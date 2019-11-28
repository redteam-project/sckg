# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_dnf-plugin-subscription-manager

class install_dnf-plugin-subscription-manager {
  package { 'dnf-plugin-subscription-manager':
    ensure => 'installed',
  }
}
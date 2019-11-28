# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_subscription-manager

class install_subscription-manager {
  package { 'subscription-manager':
    ensure => 'installed',
  }
}
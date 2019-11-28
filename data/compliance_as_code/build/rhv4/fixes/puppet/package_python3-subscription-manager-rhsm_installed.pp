# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_python3-subscription-manager-rhsm

class install_python3-subscription-manager-rhsm {
  package { 'python3-subscription-manager-rhsm':
    ensure => 'installed',
  }
}
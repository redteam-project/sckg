# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_iptables

class install_iptables {
  package { 'iptables':
    ensure => 'installed',
  }
}
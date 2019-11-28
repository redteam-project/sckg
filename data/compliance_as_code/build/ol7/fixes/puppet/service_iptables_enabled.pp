# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_iptables

class enable_iptables {
  service {'iptables':
    enable => true,
    ensure => 'running',
  }
}
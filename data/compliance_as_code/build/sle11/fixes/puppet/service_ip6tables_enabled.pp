# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_ip6tables

class enable_ip6tables {
  service {'ip6tables':
    enable => true,
    ensure => 'running',
  }
}
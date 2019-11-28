# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_firewalld

class enable_firewalld {
  service {'firewalld':
    enable => true,
    ensure => 'running',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_postfix

class enable_postfix {
  service {'postfix':
    enable => true,
    ensure => 'running',
  }
}
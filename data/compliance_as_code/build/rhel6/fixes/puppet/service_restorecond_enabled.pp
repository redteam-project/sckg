# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_restorecond

class enable_restorecond {
  service {'restorecond':
    enable => true,
    ensure => 'running',
  }
}
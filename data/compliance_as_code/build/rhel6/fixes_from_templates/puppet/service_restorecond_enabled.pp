# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include enable_restorecond

class enable_restorecond {
  service {'restorecond':
    enable => true,
    ensure => 'running',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_crond

class enable_crond {
  service {'crond':
    enable => true,
    ensure => 'running',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_rngd

class enable_rngd {
  service {'rngd':
    enable => true,
    ensure => 'running',
  }
}
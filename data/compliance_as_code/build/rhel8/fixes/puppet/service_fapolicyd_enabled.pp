# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_fapolicyd

class enable_fapolicyd {
  service {'fapolicyd':
    enable => true,
    ensure => 'running',
  }
}
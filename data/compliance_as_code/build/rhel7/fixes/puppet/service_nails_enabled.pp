# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_nails

class enable_nails {
  service {'nails':
    enable => true,
    ensure => 'running',
  }
}
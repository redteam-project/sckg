# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_usbguard

class enable_usbguard {
  service {'usbguard':
    enable => true,
    ensure => 'running',
  }
}
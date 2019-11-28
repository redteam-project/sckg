# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_usbguard

class install_usbguard {
  package { 'usbguard':
    ensure => 'installed',
  }
}
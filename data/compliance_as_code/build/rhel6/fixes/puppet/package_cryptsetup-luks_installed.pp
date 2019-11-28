# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_cryptsetup-luks

class install_cryptsetup-luks {
  package { 'cryptsetup-luks':
    ensure => 'installed',
  }
}
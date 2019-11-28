# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include install_cryptsetup-luks

class install_cryptsetup-luks {
  package { 'cryptsetup-luks':
    ensure => 'installed',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_sssd-ipa

class install_sssd-ipa {
  package { 'sssd-ipa':
    ensure => 'installed',
  }
}
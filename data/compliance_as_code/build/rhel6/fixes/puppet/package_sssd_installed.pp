# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_sssd

class install_sssd {
  package { 'sssd':
    ensure => 'installed',
  }
}
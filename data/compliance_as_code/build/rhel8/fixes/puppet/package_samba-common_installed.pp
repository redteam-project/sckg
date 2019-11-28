# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_samba-common

class install_samba-common {
  package { 'samba-common':
    ensure => 'installed',
  }
}
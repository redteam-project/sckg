# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_samba

class remove_samba {
  package { 'samba':
    ensure => 'purged',
  }
}
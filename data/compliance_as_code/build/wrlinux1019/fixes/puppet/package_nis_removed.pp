# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_nis

class remove_nis {
  package { 'nis':
    ensure => 'purged',
  }
}
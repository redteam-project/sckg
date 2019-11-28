# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_nfs-utils

class remove_nfs-utils {
  package { 'nfs-utils':
    ensure => 'purged',
  }
}
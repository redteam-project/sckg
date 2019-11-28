# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_abrt

class remove_abrt {
  package { 'abrt':
    ensure => 'purged',
  }
}
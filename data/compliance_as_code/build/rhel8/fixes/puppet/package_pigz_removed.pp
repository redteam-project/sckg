# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_pigz

class remove_pigz {
  package { 'pigz':
    ensure => 'purged',
  }
}
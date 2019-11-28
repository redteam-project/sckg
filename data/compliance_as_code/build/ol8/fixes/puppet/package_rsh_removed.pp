# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_rsh

class remove_rsh {
  package { 'rsh':
    ensure => 'purged',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_ypbind

class remove_ypbind {
  package { 'ypbind':
    ensure => 'purged',
  }
}
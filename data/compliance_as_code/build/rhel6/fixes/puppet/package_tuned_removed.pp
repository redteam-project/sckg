# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_tuned

class remove_tuned {
  package { 'tuned':
    ensure => 'purged',
  }
}
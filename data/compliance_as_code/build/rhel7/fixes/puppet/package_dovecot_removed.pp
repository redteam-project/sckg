# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_dovecot

class remove_dovecot {
  package { 'dovecot':
    ensure => 'purged',
  }
}
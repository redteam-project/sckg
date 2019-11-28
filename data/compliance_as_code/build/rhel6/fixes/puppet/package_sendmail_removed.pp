# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_sendmail

class remove_sendmail {
  package { 'sendmail':
    ensure => 'purged',
  }
}
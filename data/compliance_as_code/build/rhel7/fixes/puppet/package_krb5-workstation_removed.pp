# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_krb5-workstation

class remove_krb5-workstation {
  package { 'krb5-workstation':
    ensure => 'purged',
  }
}
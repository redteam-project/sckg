# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_openldap-servers

class remove_openldap-servers {
  package { 'openldap-servers':
    ensure => 'purged',
  }
}
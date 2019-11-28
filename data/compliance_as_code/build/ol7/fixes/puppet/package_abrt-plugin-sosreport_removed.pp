# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_abrt-plugin-sosreport

class remove_abrt-plugin-sosreport {
  package { 'abrt-plugin-sosreport':
    ensure => 'purged',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_abrt-plugin-rhtsupport

class remove_abrt-plugin-rhtsupport {
  package { 'abrt-plugin-rhtsupport':
    ensure => 'purged',
  }
}
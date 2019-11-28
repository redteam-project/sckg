# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_abrt-addon-ccpp

class remove_abrt-addon-ccpp {
  package { 'abrt-addon-ccpp':
    ensure => 'purged',
  }
}
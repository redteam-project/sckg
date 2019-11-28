# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_ntpdate

class remove_ntpdate {
  package { 'ntpdate':
    ensure => 'purged',
  }
}
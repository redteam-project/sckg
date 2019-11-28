# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_iprutils

class remove_iprutils {
  package { 'iprutils':
    ensure => 'purged',
  }
}
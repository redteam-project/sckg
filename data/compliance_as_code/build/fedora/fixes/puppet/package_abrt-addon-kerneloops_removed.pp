# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_abrt-addon-kerneloops

class remove_abrt-addon-kerneloops {
  package { 'abrt-addon-kerneloops':
    ensure => 'purged',
  }
}
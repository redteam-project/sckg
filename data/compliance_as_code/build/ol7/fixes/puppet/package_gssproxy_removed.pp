# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_gssproxy

class remove_gssproxy {
  package { 'gssproxy':
    ensure => 'purged',
  }
}
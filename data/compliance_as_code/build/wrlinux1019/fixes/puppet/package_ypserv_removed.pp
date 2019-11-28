# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_ypserv

class remove_ypserv {
  package { 'ypserv':
    ensure => 'purged',
  }
}
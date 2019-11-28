# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_xinetd

class remove_xinetd {
  package { 'xinetd':
    ensure => 'purged',
  }
}
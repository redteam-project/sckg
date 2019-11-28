# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_telnetd

class remove_telnetd {
  package { 'telnetd':
    ensure => 'purged',
  }
}
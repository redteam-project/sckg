# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_telnetd-ssl

class remove_telnetd-ssl {
  package { 'telnetd-ssl':
    ensure => 'purged',
  }
}
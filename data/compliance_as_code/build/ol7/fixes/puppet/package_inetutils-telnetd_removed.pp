# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_inetutils-telnetd

class remove_inetutils-telnetd {
  package { 'inetutils-telnetd':
    ensure => 'purged',
  }
}
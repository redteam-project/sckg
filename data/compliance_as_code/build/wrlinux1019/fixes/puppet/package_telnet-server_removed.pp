# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_telnet-server

class remove_telnet-server {
  package { 'telnet-server':
    ensure => 'purged',
  }
}
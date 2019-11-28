# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_rsh-server

class remove_rsh-server {
  package { 'rsh-server':
    ensure => 'purged',
  }
}
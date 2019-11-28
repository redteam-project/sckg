# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_openssh-server

class remove_openssh-server {
  package { 'openssh-server':
    ensure => 'purged',
  }
}
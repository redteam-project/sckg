# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_talk-server

class remove_talk-server {
  package { 'talk-server':
    ensure => 'purged',
  }
}
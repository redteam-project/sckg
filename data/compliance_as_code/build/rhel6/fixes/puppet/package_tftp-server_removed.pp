# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_tftp-server

class remove_tftp-server {
  package { 'tftp-server':
    ensure => 'purged',
  }
}
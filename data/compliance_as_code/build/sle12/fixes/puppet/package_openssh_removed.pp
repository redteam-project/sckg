# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_openssh

class remove_openssh {
  package { 'openssh':
    ensure => 'purged',
  }
}
# platform = multi_platform_all
# reboot = false
# strategy = disable
# complexity = low
# disruption = low
include remove_openssh

class remove_openssh {
  package { 'openssh':
    ensure => 'purged',
  }
}
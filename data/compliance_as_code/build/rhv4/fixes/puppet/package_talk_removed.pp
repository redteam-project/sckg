# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_talk

class remove_talk {
  package { 'talk':
    ensure => 'purged',
  }
}
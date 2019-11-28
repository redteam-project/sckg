# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_bind

class remove_bind {
  package { 'bind':
    ensure => 'purged',
  }
}
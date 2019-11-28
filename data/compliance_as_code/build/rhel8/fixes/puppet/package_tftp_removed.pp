# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_tftp

class remove_tftp {
  package { 'tftp':
    ensure => 'purged',
  }
}
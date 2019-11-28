# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_squid

class remove_squid {
  package { 'squid':
    ensure => 'purged',
  }
}
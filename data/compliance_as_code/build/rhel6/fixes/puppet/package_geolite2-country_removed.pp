# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_geolite2-country

class remove_geolite2-country {
  package { 'geolite2-country':
    ensure => 'purged',
  }
}
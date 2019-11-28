# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_geolite2-city

class remove_geolite2-city {
  package { 'geolite2-city':
    ensure => 'purged',
  }
}
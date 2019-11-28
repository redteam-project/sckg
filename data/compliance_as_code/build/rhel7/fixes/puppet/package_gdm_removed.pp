# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_gdm

class remove_gdm {
  package { 'gdm':
    ensure => 'purged',
  }
}
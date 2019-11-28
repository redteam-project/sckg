# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_mcstrans

class remove_mcstrans {
  package { 'mcstrans':
    ensure => 'purged',
  }
}
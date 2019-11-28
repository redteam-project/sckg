# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_abrt-cli

class remove_abrt-cli {
  package { 'abrt-cli':
    ensure => 'purged',
  }
}
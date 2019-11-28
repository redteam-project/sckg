# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_abrt-addon-python

class remove_abrt-addon-python {
  package { 'abrt-addon-python':
    ensure => 'purged',
  }
}
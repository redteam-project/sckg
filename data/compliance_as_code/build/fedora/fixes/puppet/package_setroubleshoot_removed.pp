# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_setroubleshoot

class remove_setroubleshoot {
  package { 'setroubleshoot':
    ensure => 'purged',
  }
}
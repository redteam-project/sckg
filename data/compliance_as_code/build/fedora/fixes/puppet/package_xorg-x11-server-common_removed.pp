# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_xorg-x11-server-common

class remove_xorg-x11-server-common {
  package { 'xorg-x11-server-common':
    ensure => 'purged',
  }
}
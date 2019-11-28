# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_autofs

class disable_autofs {
  service {'autofs':
    enable => false,
    ensure => 'stopped',
  }
}
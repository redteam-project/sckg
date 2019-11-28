# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_rhsmcertd

class disable_rhsmcertd {
  service {'rhsmcertd':
    enable => false,
    ensure => 'stopped',
  }
}
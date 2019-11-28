# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_saslauthd

class disable_saslauthd {
  service {'saslauthd':
    enable => false,
    ensure => 'stopped',
  }
}
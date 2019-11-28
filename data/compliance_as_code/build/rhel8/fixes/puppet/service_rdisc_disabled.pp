# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_rdisc

class disable_rdisc {
  service {'rdisc':
    enable => false,
    ensure => 'stopped',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_cpuspeed

class disable_cpuspeed {
  service {'cpuspeed':
    enable => false,
    ensure => 'stopped',
  }
}
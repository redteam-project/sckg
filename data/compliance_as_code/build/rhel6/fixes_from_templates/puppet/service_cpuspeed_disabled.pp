# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include disable_cpuspeed

class disable_cpuspeed {
  service {'cpuspeed':
    enable => false,
    ensure => 'stopped',
  }
}
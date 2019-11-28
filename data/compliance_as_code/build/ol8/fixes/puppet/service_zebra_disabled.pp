# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_zebra

class disable_zebra {
  service {'zebra':
    enable => false,
    ensure => 'stopped',
  }
}
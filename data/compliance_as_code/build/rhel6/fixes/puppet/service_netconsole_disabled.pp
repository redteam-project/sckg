# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_netconsole

class disable_netconsole {
  service {'netconsole':
    enable => false,
    ensure => 'stopped',
  }
}
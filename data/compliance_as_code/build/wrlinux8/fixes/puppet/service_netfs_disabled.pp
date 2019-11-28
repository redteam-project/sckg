# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_netfs

class disable_netfs {
  service {'netfs':
    enable => false,
    ensure => 'stopped',
  }
}
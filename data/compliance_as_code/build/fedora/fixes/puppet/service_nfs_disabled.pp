# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_nfs

class disable_nfs {
  service {'nfs':
    enable => false,
    ensure => 'stopped',
  }
}
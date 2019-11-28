# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_nfslock

class disable_nfslock {
  service {'nfslock':
    enable => false,
    ensure => 'stopped',
  }
}
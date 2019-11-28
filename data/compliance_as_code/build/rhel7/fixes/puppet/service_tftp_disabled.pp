# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_tftp

class disable_tftp {
  service {'tftp':
    enable => false,
    ensure => 'stopped',
  }
}
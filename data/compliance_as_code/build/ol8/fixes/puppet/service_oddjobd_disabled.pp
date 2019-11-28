# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_oddjobd

class disable_oddjobd {
  service {'oddjobd':
    enable => false,
    ensure => 'stopped',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_rlogin

class disable_rlogin {
  service {'rlogin':
    enable => false,
    ensure => 'stopped',
  }
}
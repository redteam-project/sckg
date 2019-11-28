# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_rexec

class disable_rexec {
  service {'rexec':
    enable => false,
    ensure => 'stopped',
  }
}
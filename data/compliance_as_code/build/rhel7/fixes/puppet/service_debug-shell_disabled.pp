# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_debug-shell

class disable_debug-shell {
  service {'debug-shell':
    enable => false,
    ensure => 'stopped',
  }
}
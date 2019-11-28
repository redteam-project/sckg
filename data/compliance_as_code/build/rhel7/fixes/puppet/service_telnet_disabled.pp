# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_telnet

class disable_telnet {
  service {'telnet':
    enable => false,
    ensure => 'stopped',
  }
}
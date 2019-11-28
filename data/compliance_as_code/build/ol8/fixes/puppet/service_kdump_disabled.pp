# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_kdump

class disable_kdump {
  service {'kdump':
    enable => false,
    ensure => 'stopped',
  }
}
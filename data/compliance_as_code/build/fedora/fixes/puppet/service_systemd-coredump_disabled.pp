# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_systemd-coredump

class disable_systemd-coredump {
  service {'systemd-coredump':
    enable => false,
    ensure => 'stopped',
  }
}
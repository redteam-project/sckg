# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include enable_systemd-timesyncd

class enable_systemd-timesyncd {
  service {'systemd-timesyncd':
    enable => true,
    ensure => 'running',
  }
}
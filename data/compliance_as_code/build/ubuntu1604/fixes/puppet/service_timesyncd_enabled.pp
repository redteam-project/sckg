# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_systemd-timesyncd

class enable_systemd-timesyncd {
  service {'systemd-timesyncd':
    enable => true,
    ensure => 'running',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_mdmonitor

class disable_mdmonitor {
  service {'mdmonitor':
    enable => false,
    ensure => 'stopped',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_qpidd

class disable_qpidd {
  service {'qpidd':
    enable => false,
    ensure => 'stopped',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_quota_nld

class disable_quota_nld {
  service {'quota_nld':
    enable => false,
    ensure => 'stopped',
  }
}
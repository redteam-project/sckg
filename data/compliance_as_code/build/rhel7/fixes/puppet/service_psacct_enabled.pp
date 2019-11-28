# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_psacct

class enable_psacct {
  service {'psacct':
    enable => true,
    ensure => 'running',
  }
}
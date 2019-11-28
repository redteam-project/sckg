# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_cron

class enable_cron {
  service {'cron':
    enable => true,
    ensure => 'running',
  }
}
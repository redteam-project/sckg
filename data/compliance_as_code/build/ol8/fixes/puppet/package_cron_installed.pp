# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_cron

class install_cron {
  package { 'cron':
    ensure => 'installed',
  }
}
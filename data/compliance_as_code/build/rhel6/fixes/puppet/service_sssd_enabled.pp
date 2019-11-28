# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_sssd

class enable_sssd {
  service {'sssd':
    enable => true,
    ensure => 'running',
  }
}
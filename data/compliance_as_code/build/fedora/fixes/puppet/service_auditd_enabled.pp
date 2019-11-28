# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_auditd

class enable_auditd {
  service {'auditd':
    enable => true,
    ensure => 'running',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_sshd

class enable_sshd {
  service {'sshd':
    enable => true,
    ensure => 'running',
  }
}
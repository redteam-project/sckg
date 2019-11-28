# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_sshd

class disable_sshd {
  service {'ssh':
    enable => false,
    ensure => 'stopped',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_pcscd

class enable_pcscd {
  service {'pcscd':
    enable => true,
    ensure => 'running',
  }
}
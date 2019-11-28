# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_acpid

class disable_acpid {
  service {'acpid':
    enable => false,
    ensure => 'stopped',
  }
}
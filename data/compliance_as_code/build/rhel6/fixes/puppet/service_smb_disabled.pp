# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_smb

class disable_smb {
  service {'smb':
    enable => false,
    ensure => 'stopped',
  }
}
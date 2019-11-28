# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_vsftpd

class disable_vsftpd {
  service {'vsftpd':
    enable => false,
    ensure => 'stopped',
  }
}
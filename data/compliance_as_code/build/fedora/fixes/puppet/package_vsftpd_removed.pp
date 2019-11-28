# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_vsftpd

class remove_vsftpd {
  package { 'vsftpd':
    ensure => 'purged',
  }
}
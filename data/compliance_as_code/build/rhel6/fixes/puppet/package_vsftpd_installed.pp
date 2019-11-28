# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_vsftpd

class install_vsftpd {
  package { 'vsftpd':
    ensure => 'installed',
  }
}
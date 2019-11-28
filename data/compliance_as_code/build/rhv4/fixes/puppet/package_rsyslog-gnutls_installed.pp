# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_rsyslog-gnutls

class install_rsyslog-gnutls {
  package { 'rsyslog-gnutls':
    ensure => 'installed',
  }
}
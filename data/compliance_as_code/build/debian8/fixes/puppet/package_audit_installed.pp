# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_audit

class install_audit {
  package { 'audit':
    ensure => 'installed',
  }
}
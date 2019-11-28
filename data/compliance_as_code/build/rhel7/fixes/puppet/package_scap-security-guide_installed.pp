# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_scap-security-guide

class install_scap-security-guide {
  package { 'scap-security-guide':
    ensure => 'installed',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_psacct

class install_psacct {
  package { 'psacct':
    ensure => 'installed',
  }
}
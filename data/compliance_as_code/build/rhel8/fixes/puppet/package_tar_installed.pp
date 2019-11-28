# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_tar

class install_tar {
  package { 'tar':
    ensure => 'installed',
  }
}
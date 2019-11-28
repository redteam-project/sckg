# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_sudo

class install_sudo {
  package { 'sudo':
    ensure => 'installed',
  }
}
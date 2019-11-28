# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_openssh

class install_openssh {
  package { 'openssh':
    ensure => 'installed',
  }
}
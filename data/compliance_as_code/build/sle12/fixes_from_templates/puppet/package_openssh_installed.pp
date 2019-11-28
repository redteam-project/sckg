# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include install_openssh

class install_openssh {
  package { 'openssh':
    ensure => 'installed',
  }
}
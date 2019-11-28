# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_openssh-server

class install_openssh-server {
  package { 'openssh-server':
    ensure => 'installed',
  }
}
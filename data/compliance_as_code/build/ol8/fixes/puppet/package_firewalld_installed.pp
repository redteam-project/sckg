# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_firewalld

class install_firewalld {
  package { 'firewalld':
    ensure => 'installed',
  }
}
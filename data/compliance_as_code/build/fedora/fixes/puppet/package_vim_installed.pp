# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_vim

class install_vim {
  package { 'vim':
    ensure => 'installed',
  }
}
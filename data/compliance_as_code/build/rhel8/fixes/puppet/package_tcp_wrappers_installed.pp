# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_tcp_wrappers

class install_tcp_wrappers {
  package { 'tcp_wrappers':
    ensure => 'installed',
  }
}
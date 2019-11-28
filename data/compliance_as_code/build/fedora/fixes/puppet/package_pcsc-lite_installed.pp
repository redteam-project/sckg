# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_pcsc-lite

class install_pcsc-lite {
  package { 'pcsc-lite':
    ensure => 'installed',
  }
}
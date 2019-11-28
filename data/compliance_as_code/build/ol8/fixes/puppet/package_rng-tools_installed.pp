# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_rng-tools

class install_rng-tools {
  package { 'rng-tools':
    ensure => 'installed',
  }
}
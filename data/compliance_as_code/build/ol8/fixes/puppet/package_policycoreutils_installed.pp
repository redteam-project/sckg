# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_policycoreutils

class install_policycoreutils {
  package { 'policycoreutils':
    ensure => 'installed',
  }
}
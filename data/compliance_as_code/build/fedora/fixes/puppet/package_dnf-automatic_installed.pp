# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_dnf-automatic

class install_dnf-automatic {
  package { 'dnf-automatic':
    ensure => 'installed',
  }
}
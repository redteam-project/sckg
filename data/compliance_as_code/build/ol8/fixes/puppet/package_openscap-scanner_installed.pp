# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_openscap-scanner

class install_openscap-scanner {
  package { 'openscap-scanner':
    ensure => 'installed',
  }
}
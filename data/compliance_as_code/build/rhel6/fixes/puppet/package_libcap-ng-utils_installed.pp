# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_libcap-ng-utils

class install_libcap-ng-utils {
  package { 'libcap-ng-utils':
    ensure => 'installed',
  }
}
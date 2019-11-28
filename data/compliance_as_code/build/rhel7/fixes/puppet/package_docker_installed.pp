# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_docker

class install_docker {
  package { 'docker':
    ensure => 'installed',
  }
}
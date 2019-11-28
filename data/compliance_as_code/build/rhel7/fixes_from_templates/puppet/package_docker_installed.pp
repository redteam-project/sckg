# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include install_docker

class install_docker {
  package { 'docker':
    ensure => 'installed',
  }
}
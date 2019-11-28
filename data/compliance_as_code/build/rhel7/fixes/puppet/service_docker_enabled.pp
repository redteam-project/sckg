# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_docker

class enable_docker {
  service {'docker':
    enable => true,
    ensure => 'running',
  }
}
# platform = multi_platform_all
# reboot = false
# strategy = enable
# complexity = low
# disruption = low
include enable_docker

class enable_docker {
  service {'docker':
    enable => true,
    ensure => 'running',
  }
}
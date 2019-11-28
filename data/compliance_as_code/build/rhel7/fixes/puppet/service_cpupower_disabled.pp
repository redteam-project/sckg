# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_cpupower

class disable_cpupower {
  service {'cpupower':
    enable => false,
    ensure => 'stopped',
  }
}
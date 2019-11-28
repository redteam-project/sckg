# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include enable_irqbalance

class enable_irqbalance {
  service {'irqbalance':
    enable => true,
    ensure => 'running',
  }
}
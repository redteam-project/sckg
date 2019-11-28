# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_rpcgssd

class disable_rpcgssd {
  service {'rpcgssd':
    enable => false,
    ensure => 'stopped',
  }
}
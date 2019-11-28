# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_rpcbind

class disable_rpcbind {
  service {'rpcbind':
    enable => false,
    ensure => 'stopped',
  }
}
# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_rpcidmapd

class disable_rpcidmapd {
  service {'rpcidmapd':
    enable => false,
    ensure => 'stopped',
  }
}
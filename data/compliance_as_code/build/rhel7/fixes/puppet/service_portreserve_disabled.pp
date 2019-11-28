# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_portreserve

class disable_portreserve {
  service {'portreserve':
    enable => false,
    ensure => 'stopped',
  }
}
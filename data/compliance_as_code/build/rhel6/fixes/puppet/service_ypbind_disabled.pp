# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_ypbind

class disable_ypbind {
  service {'ypbind':
    enable => false,
    ensure => 'stopped',
  }
}
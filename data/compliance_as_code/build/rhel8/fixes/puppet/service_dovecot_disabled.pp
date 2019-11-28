# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_dovecot

class disable_dovecot {
  service {'dovecot':
    enable => false,
    ensure => 'stopped',
  }
}
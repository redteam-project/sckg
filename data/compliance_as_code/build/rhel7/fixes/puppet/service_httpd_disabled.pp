# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include disable_httpd

class disable_httpd {
  service {'httpd':
    enable => false,
    ensure => 'stopped',
  }
}
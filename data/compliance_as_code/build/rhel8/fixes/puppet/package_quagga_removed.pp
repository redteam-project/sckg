# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = disable
include remove_quagga

class remove_quagga {
  package { 'quagga':
    ensure => 'purged',
  }
}
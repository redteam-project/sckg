# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable
include install_tmux

class install_tmux {
  package { 'tmux':
    ensure => 'installed',
  }
}
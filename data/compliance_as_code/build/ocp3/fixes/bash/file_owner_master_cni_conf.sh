# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = configure


find /etc/cni/net.d/ -regex '^.*$' -exec chown 0 {} \;
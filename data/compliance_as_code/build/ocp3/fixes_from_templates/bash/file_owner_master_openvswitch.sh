# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low


find /etc/origin/openvswitch/ -regex '^.*$' -exec chown 0 {} \;

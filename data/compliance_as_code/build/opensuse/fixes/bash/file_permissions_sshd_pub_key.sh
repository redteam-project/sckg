# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = configure

find /etc/ssh/ -regex '^.*.pub$' -exec chmod 0644 {} \;
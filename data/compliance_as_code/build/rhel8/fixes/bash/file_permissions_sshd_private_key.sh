# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = configure

find /etc/ssh/ -regex '^.*_key$' -exec chmod 0640 {} \;
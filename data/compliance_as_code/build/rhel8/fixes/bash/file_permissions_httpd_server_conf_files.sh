# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = configure

find /etc/httpd/conf/ -regex '^.*$' -exec chmod 0640 {} \;
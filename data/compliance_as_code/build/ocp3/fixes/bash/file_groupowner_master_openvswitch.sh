# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = configure


find /etc/origin/openvswitch/ -regex '^.*$' -exec chgrp 0 {} \;
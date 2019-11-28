# platform = multi_platform_all
# reboot = false
# strategy = configure
# complexity = low
# disruption = low


find /etc/cni/net.d/ -regex '^.*$' -exec chgrp 0 {} \;

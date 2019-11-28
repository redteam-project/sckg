# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = enable

SYSTEMCTL_EXEC='/usr/bin/systemctl'
"$SYSTEMCTL_EXEC" start 'dnf-automatic.timer'
"$SYSTEMCTL_EXEC" enable 'dnf-automatic.timer'
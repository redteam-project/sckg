# platform = multi_platform_all
# complexity = low
# reboot = false
# disruption = low
# strategy = restrict
if [ -e "/etc/usbguard/usbguard-daemon.conf" ] ; then
    LC_ALL=C sed -i "/^\s*AuditBackend=/d" "/etc/usbguard/usbguard-daemon.conf"
else
    touch "/etc/usbguard/usbguard-daemon.conf"
fi
cp "/etc/usbguard/usbguard-daemon.conf" "/etc/usbguard/usbguard-daemon.conf.bak"
# Insert at the end of the file
printf '%s\n' "AuditBackend=LinuxAudit" >> "/etc/usbguard/usbguard-daemon.conf"
# Clean up after ourselves.
rm "/etc/usbguard/usbguard-daemon.conf.bak"
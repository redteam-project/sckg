# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = true
# disruption = medium
# strategy = disable
if LC_ALL=C grep -q -m 1 "^install squashfs" /etc/modprobe.d/squashfs.conf ; then
	sed -i 's/^install squashfs.*/install squashfs /bin/true/g' /etc/modprobe.d/squashfs.conf
else
	echo -e "\n# Disable per security requirements" >> /etc/modprobe.d/squashfs.conf
	echo "install squashfs /bin/true" >> /etc/modprobe.d/squashfs.conf
fi
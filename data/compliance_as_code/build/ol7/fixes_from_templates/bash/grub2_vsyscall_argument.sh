# platform = Red Hat Enterprise Linux 7,Red Hat Enterprise Linux 8,multi_platform_fedora,multi_platform_ol,multi_platform_rhv


# Correct the form of default kernel command line in GRUB
if grep -q '^GRUB_CMDLINE_LINUX=.*vsyscall=.*"'  '/etc/default/grub' ; then
	# modify the GRUB command-line if an vsyscall= arg already exists
	sed -i 's/\(^GRUB_CMDLINE_LINUX=".*\)vsyscall=[^[:space:]]*\(.*"\)/\1 vsyscall=none \2/'  '/etc/default/grub'
else
	# no vsyscall=arg is present, append it
	sed -i 's/\(^GRUB_CMDLINE_LINUX=".*\)"/\1 vsyscall=none"/'  '/etc/default/grub'
fi

# Correct the form of kernel command line for each installed kernel in the bootloader
grubby --update-kernel=ALL --args="vsyscall=none"

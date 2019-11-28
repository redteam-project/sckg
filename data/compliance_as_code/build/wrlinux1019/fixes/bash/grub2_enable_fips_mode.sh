# platform = multi_platform_wrlinux,Red Hat Enterprise Linux 7,Oracle Linux 7,multi_platform_rhv

# include remediation functions library
. /usr/share/scap-security-guide/remediation_functions

# prelink not installed
if test ! -e /etc/sysconfig/prelink -a ! -e /usr/sbin/prelink; then
    return 0
fi

if grep -q ^PRELINKING /etc/sysconfig/prelink
then
    sed -i 's/^PRELINKING[:blank:]*=[:blank:]*[:alpha:]*/PRELINKING=no/' /etc/sysconfig/prelink
else
    printf '\n' >> /etc/sysconfig/prelink
    printf '%s\n' '# Set PRELINKING=no per security requirements' 'PRELINKING=no' >> /etc/sysconfig/prelink
fi

# Undo previous prelink changes to binaries if prelink is available.
if test -x /usr/sbin/prelink; then
    /usr/sbin/prelink -ua
fi

if grep -q -m1 -o aes /proc/cpuinfo; then
	if ! rpm -q --quiet "dracut-fips-aesni" ; then
    yum install -y "dracut-fips-aesni"
fi
fi
if ! rpm -q --quiet "dracut-fips" ; then
    yum install -y "dracut-fips"
fi

dracut -f

# Correct the form of default kernel command line in  grub
if grep -q '^GRUB_CMDLINE_LINUX=.*fips=.*"'  /etc/default/grub; then
	# modify the GRUB command-line if a fips= arg already exists
	sed -i 's/\(^GRUB_CMDLINE_LINUX=".*\)fips=[^[:space:]]*\(.*"\)/\1 fips=1 \2/'  /etc/default/grub
else
	# no existing fips=arg is present, append it
	sed -i 's/\(^GRUB_CMDLINE_LINUX=".*\)"/\1 fips=1"/'  /etc/default/grub
fi

# Get the UUID of the device mounted at /boot.
BOOT_UUID=$(findmnt --noheadings --output uuid --target /boot)

if grep -q '^GRUB_CMDLINE_LINUX=".*boot=.*"'  /etc/default/grub; then
	# modify the GRUB command-line if a boot= arg already exists
	sed -i 's/\(^GRUB_CMDLINE_LINUX=".*\)boot=[^[:space:]]*\(.*"\)/\1 boot=UUID='"${BOOT_UUID} \2/" /etc/default/ grub
else
	# no existing boot=arg is present, append it
	sed -i 's/\(^GRUB_CMDLINE_LINUX=".*\)"/\1 boot=UUID='${BOOT_UUID}'"/'  /etc/default/grub
fi

# Correct the form of kernel command line for each installed kernel in the bootloader
/sbin/grubby --update-kernel=ALL --args="fips=1 boot=UUID=${BOOT_UUID}"
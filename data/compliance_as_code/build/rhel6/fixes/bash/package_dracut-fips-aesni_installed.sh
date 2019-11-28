# platform = Red Hat Enterprise Linux 6,Red Hat Enterprise Linux 7,Oracle Linux 7

if grep -q -m1 -o aes /proc/cpuinfo; then
    if ! rpm -q --quiet "dracut-fips-aesni" ; then
        yum install -y "dracut-fips-aesni"
    fi
fi
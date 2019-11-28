# platform = Red Hat Enterprise Linux 6,Red Hat Enterprise Linux 7,Oracle Linux 7

if ! rpm -q --quiet "dracut-fips" ; then
    yum install -y "dracut-fips"
fi
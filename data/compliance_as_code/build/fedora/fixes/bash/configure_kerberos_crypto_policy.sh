# platform = multi_platform_fedora,Red Hat Enterprise Linux 8,Oracle Linux 8
# complexity = low
# reboot = true
# disruption = low
# strategy = configure

rm -f /etc/krb5.conf.d/crypto-policies
ln -s /etc/crypto-policies/back-ends/krb5.config /etc/krb5.conf.d/crypto-policies
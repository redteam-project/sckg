# platform = Red Hat Enterprise Linux 7

if ! rpm -q --quiet "esc" ; then
    yum install -y "esc"
fi
if ! rpm -q --quiet "pam_pkcs11" ; then
    yum install -y "pam_pkcs11"
fi
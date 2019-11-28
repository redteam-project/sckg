# platform = Red Hat Enterprise Linux 7,multi_platform_fedora,multi_platform_rhv,Oracle Linux 7
# complexity = low
# reboot = false
# disruption = low
# strategy = configure

PKCSSW=$(/usr/bin/pkcs11-switch)

if [ ${PKCSSW} != "opensc" ] ; then
    ${PKCSSW} opensc
fi
# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = false
# disruption = low
# strategy = enable

if ! rpm -q --quiet "rsyslog-gnutls" ; then
    yum install -y "rsyslog-gnutls"
fi
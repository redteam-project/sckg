# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_sle
# reboot = false
# strategy = disable
# complexity = low
# disruption = low

/sbin/service 'bluetooth' stop
/sbin/chkconfig --level 0123456 'bluetooth' off
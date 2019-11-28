# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv,multi_platform_sle
# complexity = low
# reboot = false
# disruption = low
# strategy = disable

/sbin/service 'smartd' stop
/sbin/chkconfig --level 0123456 'smartd' off
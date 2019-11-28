# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = false
# disruption = low
# strategy = enable

/sbin/service 'cron' start
/sbin/chkconfig --level 0123456 'cron' on
# platform = multi_platform_rhel,multi_platform_fedora,multi_platform_ol,multi_platform_rhv
# complexity = low
# reboot = false
# disruption = low
# strategy = enable

/sbin/service 'syslogng' start
/sbin/chkconfig --level 0123456 'syslogng' on
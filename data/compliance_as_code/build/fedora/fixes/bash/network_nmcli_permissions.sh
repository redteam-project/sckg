# platform = Red Hat Enterprise Linux 7,Red Hat Enterprise Linux 8,multi_platform_rhv,multi_platform_fedora
# complexity = low
# reboot = false
# disruption = low
# strategy = restrict

printf "[Disable General User Access to NetworkManager]\nIdentity=default\nAction=org.freedesktop.NetworkManager.*\nResultAny=no\nResultInactive=no\nResultActive=auth_admin\n" > /etc/polkit-1/localauthority/20-org.d/10-nm-harden-access.pkla
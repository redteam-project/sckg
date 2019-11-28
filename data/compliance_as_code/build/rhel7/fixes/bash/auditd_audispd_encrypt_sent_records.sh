# platform = multi_platform_wrlinux,multi_platform_all
. /usr/share/scap-security-guide/remediation_functions


AUDISP_REMOTE_CONFIG="/etc/audisp/audisp-remote.conf"
option="^enable_krb5"
value="yes"


replace_or_append $AUDISP_REMOTE_CONFIG "$option" "$value" "@CCENUM@"
# platform = Mozilla Firefox

firefox_cfg="stig.cfg"
  key="security.enable_tls"
  value="true"
  firefox_dirs="/usr/lib/firefox /usr/lib64/firefox /usr/local/lib/firefox /usr/local/lib64/firefox"

  # Check the possible Firefox install directories
  for firefox_dir in ${firefox_dirs}; do
    # If the Firefox directory exists, then Firefox is installed
    if [ -d "${firefox_dir}" ]; then
      # Make sure the Firefox .cfg file exists and has the appropriate permissions
      if ! [ -f "${firefox_dir}/${firefox_cfg}" ] ; then
        touch "${firefox_dir}/${firefox_cfg}"
        chmod 644 "${firefox_dir}/${firefox_cfg}"
      fi

      # If the key exists, change it. Otherwise, add it to the config_file.
      if LC_ALL=C grep -m 1 -q "^lockPref(\"${key}\", " "${firefox_dir}/${firefox_cfg}"; then
        sed -i "s/lockPref(\"${key}\".*/lockPref(\"${key}\", ${value});/g" "${firefox_dir}/${firefox_cfg}"
      else
        echo "lockPref(\"${key}\", ${value});" >> "${firefox_dir}/${firefox_cfg}"
      fi
    fi
  done
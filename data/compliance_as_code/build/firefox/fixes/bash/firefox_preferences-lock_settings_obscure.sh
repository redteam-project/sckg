# platform = Mozilla Firefox

firefox_js="stig_settings.js"
  key="general.config.obscure_value"
  value="0"
  firefox_dirs="/usr/lib/firefox /usr/lib64/firefox /usr/local/lib/firefox /usr/local/lib64/firefox"
  firefox_pref="/defaults/pref"
  firefox_preferences="/defaults/preferences"

  # Check the possible Firefox install directories
  for firefox_dir in ${firefox_dirs}; do
    # If the Firefox directory exists, then Firefox is installed
    if [ -d "${firefox_dir}" ]; then
      # Different versions of Firefox have different preferences directories, check for them and set the right one
      if [ -d "${firefox_dir}/${firefox_pref}" ] ; then
        firefox_pref_dir="${firefox_dir}/${firefox_pref}"
      elif [ -d "${firefox_dir}/${firefox_preferences}" ] ; then
        firefox_pref_dir="${firefox_dir}/${firefox_preferences}"
      else
        mkdir -m 755 -p "${firefox_dir}/${firefox_preferences}"
        firefox_pref_dir="${firefox_dir}/${firefox_preferences}"
      fi

      # Make sure the Firefox .js file exists and has the appropriate permissions
      if ! [ -f "${firefox_pref_dir}/${firefox_js}" ] ; then
        touch "${firefox_pref_dir}/${firefox_js}"
        chmod 644 "${firefox_pref_dir}/${firefox_js}"
      fi

      # If the key exists, change it. Otherwise, add it to the config_file.
      if LC_ALL=C grep -m 1 -q "^pref(\"${key}\", " "${firefox_pref_dir}/${firefox_js}"; then
        sed -i "s/pref(\"${key}\".*/pref(\"${key}\", ${value});/g" "${firefox_pref_dir}/${firefox_js}"
      else
        echo "pref(\"${key}\", ${value});" >> "${firefox_pref_dir}/${firefox_js}"
      fi
    fi
  done
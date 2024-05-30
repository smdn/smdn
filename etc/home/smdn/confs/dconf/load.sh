#!/bin/bash
dconf_dump_file='dump.dconf'
basedir=$(cd $(dirname $0) && pwd)

for file in `find ${basedir} -name "${dconf_dump_file}"` ; do
  dconf_dir_path=${file#"${basedir}"} # remove basedir prefix
  dconf_dir_path=${dconf_dir_path%"${dconf_dump_file}"} # remove trailing filename

  echo "loading dconf '${dconf_dir_path}' from the file '$file'"

  dconf load ${dconf_dir_path} < "$file"
done

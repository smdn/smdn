#!/bin/bash
dconf_dump_file='dump.dconf'
basedir=$(cd $(dirname $0) && pwd)

for file in `find ${basedir} -name "${dconf_dump_file}"` ; do
  dconf_dir_path=${file#"${basedir}"} # remove basedir prefix
  dconf_dir_path=${dconf_dir_path%"${dconf_dump_file}"} # remove trailing filename

  dconf dump ${dconf_dir_path} > "$file"

  echo "dumped dconf '${dconf_dir_path}' to the file '$file'"
done

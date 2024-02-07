#!/bin/bash

if [ $# -ne 2 ]; then
	/usr/bin/echo -e "\n[-] Usage: $args[0] <directory to back up> <destination dir>"
	exit 1
fi
data=`date +"%Y-%m-%d"`
dir=$1
dest=$2
dirname=$(basename "$dir")
dest="$2/backup_""${dirname}""_$data.tar.gz"
/usr/bin/echo -e "\n[*]\tStarting backup... $data...\n"

/usr/bin/echo -e "\tDirectory: $dir\n\tDestination: $dest"

#Test if directory to zip and destination exists
if [ ! -e $dir ]; then
	/usr/bin/echo -e "\n[-]\tDirectory does not exist: $dir."
	exit 1
elif [ -e $dest ]; then
	/usr/bin/echo -e "\n[-]\tDestination file already exists: $dest"
	exit 2
else
	/usr/bin/tar -zcvf "$dest" -C "$dir" . > /dev/null
	#Control d'errors
	if [ $? == 0 ]; then
		/usr/bin/echo -e "\n[+]\tZipped $dir into $dest"
	else
		/usr/bin/echo -e "\n[-]\tFailed to zip $dir into $dest"
	fi
fi

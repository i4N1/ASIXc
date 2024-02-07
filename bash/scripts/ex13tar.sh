#!/bin/bash

if [ $# -ne 2 ]; then
	/usr/bin/echo -e "\n[-] Usage: $args[0] <directory to back up> <destination zip>"
	exit 1
fi
data=`date +"%Y-%m-%d"`
dir=$1
dest=$2
/usr/bin/echo -e "\n[*]\tStarting backup... $data...\n"

#Sanitize destination file name and add date
if [[ ! $dest =~ ".tar.gz" ]]; then
	dest="$dest""_$data.tar.gz"
else
	splittd="${dest%%.*}"
	dest="$splittd""_$data.tar.gz"
fi

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
		/usr/bin/echo -e "\n[+]\tZipped $dir into $dest."
	else
		/usr/bin/echo -e "\n[-]\tFailed to zip $dir into $dest"
	fi
fi

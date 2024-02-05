#!/bin/bash

if [ -z $1 ]; then
	echo -e "[+]Usage: $0 <file-to-read>"
	exit 1
fi
if [ ! -f "csv.txt"]; then
	echo "[-]csv.txt not found"
	exit 1
fi
csvfile=$1
separator=$2
while IFS=',' read -r name ou email; do
	echo "[*]Usuari $name que pertany a la UO $ou i correu electrònic $email" | tee -a usuaris.txt
done < "$csvfile"

#!/bin/bash

file="csv.txt"

#Test if file exists
if [ ! -e $file ]; then
	echo "[-] File $file not found"
	exit 1
fi
echo -e "[*]\tReading $file...\n"

#Splitting every line in file on every ','
while IFS=',' read -r name ou email; do
	echo -e "[+]\tUsuari $name que pertany a la UO $ou i correu electrònic $email" | tee -a usuaris.txt
done < "$file"

#!/bin/bash

# Set the directory path
dir="/home/kali/Desktop/bkps/testbkps.tar.gz"

# Extract the file name from the directory path
filename=$(basename "$dir")

# Remove the extension (.tar.gz) from the file name
filename_no_extension=${filename%.tar.gz}

echo "$filename_no_extension"

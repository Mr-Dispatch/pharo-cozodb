#!/usr/bin/env bash

# If you want to update to a newer version check https://github.com/cozodb/cozo/tags

current_directory=$(pwd)
echo "Current directory: $current_directory"

# Download the gzipped library file from the Cozo GitHub releases
echo "Downloading library archive from https://github.com/cozodb/cozo"
sudo wget https://github.com/cozodb/cozo/releases/download/v0.7.2/libcozo_c-0.7.2-x86_64-unknown-linux-gnu.so.gz 

# Decompress the downloaded gzipped library file
echo "Decompress downloaded gzipped library file"
sudo gzip -d ./libcozo_c-0.7.2-x86_64-unknown-linux-gnu.so.gz

# Move the decompressed library file to /usr/lib/x86_64-linux-gnu/ and rename it to libcozo_c.so
echo "Move decompressed library to /usr/lib/x86_64-linux-gnu/libcozo_c.so"
sudo mv ./libcozo_c-0.7.2-x86_64-unknown-linux-gnu.so /usr/lib/x86_64-linux-gnu/libcozo_c.so

# Create a symbolic link named libcozo_c.so that points to the library file in /usr/lib/x86_64-linux-gnu/
echo "Create symbolic link"
ln -s /usr/lib/x86_64-linux-gnu/libcozo_c.so libcozo_c.so
 
echo "Done!"
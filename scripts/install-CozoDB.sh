#!/usr/bin/env bash

# If you want to update to a newer version check https://github.com/cozodb/cozo/tags

# download, extract and rename into "libcozo_c.so"
sudo wget https://github.com/cozodb/cozo/releases/download/v0.7.2/libcozo_c-0.7.2-x86_64-unknown-linux-gnu.so.gz 
sudo gzip -d libcozo_c-0.7.2-x86_64-unknown-linux-gnu.so.gz
sudo mv libcozo_c-0.7.2-x86_64-unknown-linux-gnu.so libcozo_c.so
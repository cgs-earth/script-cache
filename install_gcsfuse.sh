#!/bin/bash

# Update and upgrade system packages
sudo apt-get update

# Set up key
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc

# Install fuse
sudo apt-get install gcsfuse

# Log success message
echo "gcsfuse installation complete" >> /var/log/startup.log

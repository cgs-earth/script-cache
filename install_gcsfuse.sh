#!/bin/bash

# Update and upgrade system packages
sudo apt update

# Set up key
echo "deb http://packages.cloud.google.com/apt gcsfuse-bullseye main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Install fuse
sudo apt install gcsfuse

# Log success message
echo "gcsfuse installation complete" >> /var/log/startup.log

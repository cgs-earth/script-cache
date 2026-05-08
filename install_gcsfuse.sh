#!/bin/bash

export GCSFUSE_REPO=gcsfuse-$(lsb_release -c -s)
echo "deb https://packages.cloud.google.com/apt $GCSFUSE_REPO main" \
    | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | sudo apt-key add -

# Update and install gcsfuse
sudo apt update
sudo apt install gcsfuse

#!/bin/bash

# Update and upgrade system packages
apt-get update
apt-get install -y wget gnupg ca-certificates curl python3

# Add QLever repository
wget -qO - https://packages.qlever.dev/pub.asc | gpg --dearmor > /usr/share/keyrings/qlever.gpg && \
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/qlever.gpg] https://packages.qlever.dev/ $(. /etc/os-release && echo ${VERSION_CODENAME}) main" > /etc/apt/sources.list.d/qlever.list

# Install QLever and clean up
apt-get update && \
apt-get install -y qlever 

# Cleanup
apt-get clean && \
rm -rf /var/lib/apt/lists/

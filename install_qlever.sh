#!/bin/bash

# Update and upgrade system packages
apt-get update
apt-get install -y wget gnupg ca-certificates curl python3

# Install qlever-control
python3 -m venv --system-site-packages /venv
git clone https://github.com/ad-freiburg/qlever-control
cd qlever-control
/venv/bin/python3 -m pip install -e ".[dev]"

# Add QLever repository
wget -qO - https://packages.qlever.dev/pub.asc | gpg --dearmor > /usr/share/keyrings/qlever.gpg && \
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/qlever.gpg] https://packages.qlever.dev/ $(. /etc/os-release && echo ${VERSION_CODENAME}) main" > /etc/apt/sources.list.d/qlever.list

# Install QLever and clean up
apt-get update && \
apt-get install -y qlever 

# Cleanup
apt-get clean && \
rm -rf /var/lib/apt/lists/

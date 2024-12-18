#!/bin/bash

# Update and upgrade system packages
apt update -y && apt upgrade -y
apt install -y software-properties-common curl git build-essential

# Add the Deadsnakes PPA for Python 3.12
add-apt-repository ppa:deadsnakes/ppa -y
apt update -y

# Install Python 3.12 and related tools
apt install -y python3.12 python3.12-venv python3.12-dev python3-pip

# Log Python version for verification
python3.12 --version >> /var/log/startup.log

# Upgrade pip to the latest version
python3.12 -m pip install --upgrade pip

# Log success message
echo "Python 3.12 installation complete" >> /var/log/startup.log

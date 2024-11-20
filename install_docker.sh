#!/bin/bash
echo "Start Docker install!" >> /var/log/startup.log
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
systemctl enable docker
systemctl start docker
echo "Docker started!" >> /var/log/startup.log

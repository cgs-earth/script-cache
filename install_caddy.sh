#!/bin/bash
echo "Start Caddy install!" >> /var/log/startup.log
apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
apt update
apt install -y caddy
sudo chmod 755 /usr/bin/caddy
sudo setcap CAP_NET_BIND_SERVICE=+eip /usr/bin/caddy
systemctl enable caddy
systemctl start caddy
echo "Caddy started!" >> /var/log/startup.log

#!/bin/bash

# Installation 02_Proxy_local
docker network create proxy
docker-compose -f /bdcloud/02_Proxy_local/docker-compose.yml up --no-start
cp -f /bdcloud/02_Proxy_local/default /bdcloud/conf_02_Proxy/nginx/site-confs/default
cp -f /bdcloud/02_Proxy_local/proxy.conf /bdcloud/conf_02_Proxy/nginx/proxy.conf
mkdir /bdcloud/conf_02_Proxy/nginx/proxy-confs
cp -f /bdcloud/02_Proxy_local/heimdall.subfolder.conf /bdcloud/conf_02_Proxy/nginx/proxy-confs/heimdall.subfolder.conf

# Installation 03_Pihole
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
sudo cp /bdcloud/03_Pihole/resolv.conf /etc/resolv.conf
docker-compose -f /bdcloud/03_Pihole/docker-compose.yml up --no-start
cp -f /bdcloud/03_Pihole/pihole.subfolder.conf /bdcloud/conf_02_Proxy/nginx/proxy-confs/heimdall.subfolder.conf

# Installation 04_Samba
mkdir /bdcloud/vol_smb_video
mkdir /bdcloud/vol_smb_audio
mkdir /bdcloud/vol_smb_pictures
mkdir /bdcloud/vol_smb_fakturama
mkdir /bdcloud/vol_smb_home_mark

#!/bin/bash

# Installation 02_Proxy_local
docker network create proxy
docker volume create --name=conf_01_proxy
docker volume create --name=conf_01_heimdall

docker-compose -f /bdcloud/02_Proxy_local/docker-compose.yml up -d
docker-compose -f /bdcloud/02_Proxy_local/docker-compose.yml down

cp -f /bdcloud/02_Proxy_local/default /bdcloud/_volumes/conf_01_proxy/_data/nginx/site-confs/default
cp -f /bdcloud/02_Proxy_local/proxy.conf /bdcloud/_volumes/conf_01_proxy/_data/nginx/proxy.conf
mkdir /bdcloud/_volumes/conf_01_proxy/_data/nginx/proxy-confs
cp -f /bdcloud/02_Proxy_local/heimdall.subfolder.conf /bdcloud/_volumes/conf_01_proxy/_data/nginx/proxy-confs/heimdall.subfolder.conf

# Installation 03_Pihole
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
sudo cp /bdcloud/03_Pihole/resolv.conf /etc/resolv.conf
docker-compose -f /bdcloud/03_Pihole/docker-compose.yml up -d
docker-compose -f /bdcloud/03_Pihole/docker-compose.yml down
cp -f /bdcloud/03_Pihole/pihole.subfolder.conf /bdcloud/conf_02_Proxy/nginx/proxy-confs/heimdall.subfolder.conf

# Installation 04_Samba
mkdir /bdcloud/vol_smb_video
mkdir /bdcloud/vol_smb_audio
mkdir /bdcloud/vol_smb_pictures
mkdir /bdcloud/vol_smb_fakturama
mkdir /bdcloud/vol_smb_home_mark
mkdir /bdcloud/vol_smb_tv
docker-compose -f /bdcloud/04_Samba/docker-compose.yml up -d
docker-compose -f /bdcloud/04_Samba/docker-compose.yml down

# Installation 05_DLNA
docker-compose -f /bdcloud/04_Samba/docker-compose.yml up -d
docker-compose -f /bdcloud/04_Samba/docker-compose.yml down
cp -f /bdcloud/05_DLNA/emby.subfolder.conf /bdcloud/conf_02_Proxy/nginx/proxy-confs/heimdall.subfolder.conf



# Dienste starten
docker-compose -f /bdcloud/03_Pihole/docker-compose.yml up -d
docker-compose -f /bdcloud/04_Samba/docker-compose.yml up -d
docker-compose -f /bdcloud/05_DLNA/docker-compose.yml up -d
# Proxy als letztes starten
docker-compose -f /bdcloud/02_Proxy_local/docker-compose.yml up -d

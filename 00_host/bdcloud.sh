#!/bin/bash

docker-compose -f /bdcloud/01_proxy/docker-compose.yml pull
docker-compose -f /bdcloud/02_pihole/docker-compose.yml pull
docker-compose -f /bdcloud/03_samba/docker-compose.yml pull


# Installation 01_proxy
docker network create proxy
docker volume create --name=conf_01_proxy
docker volume create --name=conf_01_heimdall
docker-compose -f /bdcloud/01_proxy/docker-compose.yml up -d
docker-compose -f /bdcloud/01_proxy/docker-compose.yml down
cp -f /bdcloud/01_proxy/default /bdcloud/_volumes/conf_01_proxy/_data/nginx/site-confs/default
cp -f /bdcloud/01_proxy/proxy.conf /bdcloud/_volumes/conf_01_proxy/_data/nginx/proxy.conf
mkdir /bdcloud/_volumes/conf_01_proxy/_data/nginx/proxy-confs
cp -f /bdcloud/01_proxy/heimdall.subfolder.conf /bdcloud/_volumes/conf_01_proxy/_data/nginx/proxy-confs/heimdall.subfolder.conf


# Installation 02_pihole
docker volume create --name=conf_02_pihole
docker volume create --name=conf_02_pihole_dns
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
sudo cp /bdcloud/02_pihole/resolv.conf /etc/resolv.conf
docker-compose -f /bdcloud/02_pihole/docker-compose.yml up -d
docker-compose -f /bdcloud/02_pihole/docker-compose.yml down
cp -f /bdcloud/02_pihole/pihole.subfolder.conf /bdcloud/_volumes/conf_01_proxy/_data/nginx/proxy-confs/pihole.subfolder.conf


# Installation 04_Samba
docker volume create --name=smb_video
docker volume create --name=smb_audio
docker volume create --name=smb_pictures
docker volume create --name=smb_fakturama
docker volume create --name=smb_home_mark
docker volume create --name=smb_tv
docker-compose -f /bdcloud/03_samba/docker-compose.yml up -d
docker-compose -f /bdcloud/03_samba/docker-compose.yml down

# Installation 05_DLNA
#docker-compose -f /bdcloud/04_Samba/docker-compose.yml up -d
#docker-compose -f /bdcloud/04_Samba/docker-compose.yml down
#cp -f /bdcloud/05_DLNA/emby.subfolder.conf /bdcloud/conf_02_Proxy/nginx/proxy-confs/heimdall.subfolder.conf



# Dienste starten
docker-compose -f /bdcloud/02_pihole/docker-compose.yml up -d
docker-compose -f /bdcloud/03_samba/docker-compose.yml up -d
#docker-compose -f /bdcloud/05_dlna/docker-compose.yml up -d
# Proxy als letztes starten
docker-compose -f /bdcloud/01_proxy/docker-compose.yml up -d

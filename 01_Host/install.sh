#!/bin/bash

# Systemupdate und Hostnamen
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

# Basisprogramme installieren
git, docker, docker-compose, openssl, open ssh

# Userberechtigungen
"Root" User der Dockergruppen hinzufügen

# Git Repo klonen und Verzeichnisstruktur erstellen
cd ~
git clone https://github.com/buerodigital/bdcloud.git
docker system prune -a --volumes
docker network create proxy
docker-compose -f ~/bdcloud/02_Proxy_local/docker-compose.yml up --no-start


# Bash Menü für User, etc


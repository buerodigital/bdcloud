#!/bin/bash

# Installation 02_Proxy_local
docker network create proxy
docker-compose -f /bdcloud/02_Proxy_local/docker-compose.yml up --no-start
cp -f /bdcloud/02_Proxy_local/default /bdcloud/conf_02_Proxy/nginx/site-confs/default
cp -f /bdcloud/02_Proxy_local/proxy.conf /bdcloud/conf_02_Proxy/nginx/proxy.conf
mkdir /bdcloud/conf_02_Proxy/nginx/proxy-confs
cp -f /bdcloud/02_Proxy_local/heimdall.subfolder.conf /bdcloud/conf_02_Proxy/nginx/proxy-confs/heimdall.subfolder.conf

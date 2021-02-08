00	host	00_host	git openssh openssl docker docker-compose	install_00.sh		static IP from DHCP  	
  
01	proxy	01_proxy	linuxserver/nginx:amd64-version-8349a582 linuxserver/heimdall:version-2.2.2	docker-compose.yml heimdall.subfolder.conf default (nginx) install_01.sh	80/tcp - Redirect 443/tcp - Subfolder	network_proxy Bridge	conf_01_proxy conf_01_heimdall	https://hub.docker.com/r/linuxserver/nginx https://hub.docker.com/r/linuxserver/heimdall	https://nginx.org/ https://heimdall.site/	  
  
02	pihole	02_pihole	pihole/pihole:v5.6	docker-compose.yml pihole.subfolder.conf resolv.conf install_04.sh	53/tcp - DNS 53/udp - DNS 80/tcp - Redirect 443/tcp - Subfolder (+ Redirect / admin!)	network_proxy Bridge	conf_02_pihole conf_02_pihole_dns	https://hub.docker.com/r/pihole/pihole	https://pi-hole.net	  
  
03	samba	03_samba	dperson/samba:latest	docker-compose.yml install_02.sh	137/udp - required to advertise shares (NMBD) 138/udp - required to advertise shares (NMBD) 139/tcp  - default smb port 445/tcp  - default smb port	Bridge	Conf_03_samba smb_video smb_audio smb_pictures smb_books smb_home_$user	 https://hub.docker.com/r/dperson/samba	https://www.samba.org/	 
  
04	backup	04_backup			bash	Bridge	* smb_backup	https://hub.docker.com/r/linuxserver/rsnapshot	https://rsnapshot.org/	 
  
05	mail	05_mail					conf_05_mail			
  
06	kodi	06_kodi	linuxserver/kodi-headless:190 Iinuxserver/mariadb:version-110.4.17mariabionic	docker-compose.yml install_06.sh 	80/tcp - Redirect 443/tcp – Subfolder 9090/??? - Websocket 9777/UDP – Esall Interface Port	network_proxy Bridge	conf_06_kodi	https://hub.docker.com/r/linuxserver/kodi-headless https://hub.docker.com/r/linuxserver/mariadb/	https://kodi.tv/ https://mariadb.org/	https://github.com/mrskug/docker-headless-kodi-video-server/blob/master/docker-compose.yml  
  
07	tv	07_tv	linuxserver/tvheadend:version-aaca05cc	docker-compose.yml Install_07.sh 	80/tcp - Redirect 443/tcp – Subfolder 9982/??? - HTSP Server	network_proxy Bridge	conf_07_tv	https://hub.docker.com/r/linuxserver/tvheadend	https://www.tvheadend.org/	
08	bitwarden	08_bitwarden				network_proxy	conf_08_bitwarden			
09	dms	09_dms	linuxserver/papermerge:version-v1.5.5	docker-compose.yml Install_09.sh 	80/tcp - Redirect 443/tcp - Subfolder	network_proxy	conf_09_dms smb_dms	https://hub.docker.com/r/linuxserver/papermerge	https://www.papermerge.com/	
10	dlna	10_dlna	linuxserver/emby:version-4.5.4.0	docker-compose.yml Install_10.sh 	80/tcp - Redirect 443/tcp - Subfolder		conf_10_dlna conf_10_db?	https://hub.docker.com/r/linuxserver/emby	https://emby.media/	
11	fakturama	11_fakturama	---	Install_11.sh	137/udp - required to advertise shares (NMBD) 138/udp - required to advertise shares (NMBD) 139/tcp  - default smb port 445/tcp  - default smb port	network_proxy	conf_11_fakturama smb_fakturama	---	https://www.fakturama.info/	
12	nextcloud	12_nextcloud			80/tcp - Redirect 443/tcp - Subfolder	network_proxy	conf_12_nextcloud			
13	modified	13_modified			80/tcp - Redirect 443/tcp - Subfolder	network_proxy	conf_13_modified conf_13_db			
14	wordpress	14_wordpress			80/tcp - Redirect 443/tcp - Subfolder	network_proxy	conf_14_wordpress			
15	calibre	15_calibre	linuxserver/calibre:version-v5.10.1 linuxserver/calibre-web:version-0.6.10	docker-compose.yml calibre-web.subfolder.conf calibre.subfolder.conf?? install_15.sh	80/tcp - Redirect 443/tcp - Subfolder	network_proxy	conf_15_calibre smb_books ??? Oder sind die in der DB?	https://hub.docker.com/r/linuxserver/calibre https://hub.docker.com/r/linuxserver/calibre-web	https://calibre-ebook.com/  https://github.com/janeczku/calibre-web	Calibre als DB und Calibre-Web als Frontend DB wird über lokale Installation bearbeitet, gepflegt und synchronisiert
16	portainer-ce	16_portainer-ce					conf_16_portainer			
17	youtube_dl	17_youtube_dl					conf_17_youtube_dl			

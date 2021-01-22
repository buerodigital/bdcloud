
# 02_Proxy_local

Es wird ein Nginx-Container als Reverse Proxy installiert. Zusätzlich wird Heimdall als Startseite installiert.  
Weitere Webanwendungen werden über zusätzliche Conf-Dateien (werden im Verzeichnis des Proxys abgelegt) installiert.  
Vergleich:  
<https://github.com/linuxserver/reverse-proxy-confs/blob/master/pihole.subfolder.conf.sample>  
  
Alle Container werden über Subfolder angesprochen!!!  

Die Container werden NICHT über externe Ports freigegeben und sind nur über den Reverse Proxy angesprochen!!!
  
  

## Einleitung

Was macht der Proxy bzw. Heimdall

Unbedingt mal hier gucken!!!  
<https://docs.linuxserver.io/general/swag#using-heimdall-as-the-home-page-at-domain-root>


## ToDo

* Welcher Proxy wird es und wie wird er eingerichtet?  
  NGINX
* Einrichtung sollte sowohl mit Lets Encrypt als auch mit selbst signierten Zertifikaten funktionieren  
  Wird es nicht - es wird 2 Versionen geben!! Diese und SWAG?
* Heimdall als Startseite (immer)
* Heimdall wird in der compose Datei mit installiert (02_Heimdall entfällt)
* Alle vorbereitungen werden in ../install.sh berücksichtig
* Einleitung schreiben (was passiert in dieser compose Datei?
* Beschreibunf NGINX und Heimdall schreiben
* Testen, testen, testen
  
  
## Installation  

* "docker-compose.yml" erstellen und "docker-compose build" ausführen 
* Die Datei ./conf_01_Proxy/nginx/site-confs/default durch default ersetzen
* Die Datei proxy.conf nach ./conf_01_Proxy/nginx/ kopieren
* Die Datei heimdall.subfolder.conf nach ./conf_01_Proxy/nginx/proxy-confs/ kopieren (Ordner erstellen)


## Links und Hinweise

Quelle No1 -> <https://linuxserver.io>




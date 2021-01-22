
# 08_PiHole

Welches Programm?


## Einleitung

Was macht der Container
Welches Image wird verwendet?


## ToDo

* In Heimdall einfügen! - SQLite
* Alle vorbereitungen werden in ../install.sh berücksichtig
* Einleitung schreiben (was passiert in dieser compose Datei?
* Beschreibung des verwendeten Programms schreiben
* Beschreibung, wie der Server ins NEtz eingebunden wird!
* Testen, testen, testen
* Nur DNS kein DHCP!!

sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
sudo nano /etc/resolv.conf:

  #nameserver 127.0.0.53
  #options edns0
  #search local.mm

  nameserver 127.0.0.1
  nameserver 192.168.178.1




## Links und Hinweise

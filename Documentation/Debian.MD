### E403SA (WIFI)




-------------------------------------------------------------------------------------------------------------------------------------
**Dépôts**
```
echo "deb http://security.debian.org/debian-security bullseye-security main
deb http://ftp.fr.debian.org/debian bullseye main non-free
deb-src http://security.debian.org/debian-security bullseye-security main " > /etc/apt/sources.list
```

-------------------------------------------------------------------------------------------------------------------------------------
**Connexion à un Réseau WIFI :** ([Guide](https://www.linuxbabe.com/command-line/ubuntu-server-16-04-wifi-wpa-supplicant))
```
ip link;

#Mise en Ligne:
ip link set wlp2s0 up;

#Scan réseau
iwlist wlp2s0 scan | less;

#Connexion SSID:
iwconfig wlp2s0 essid "ASUS_A8_5G"
wpa_passphrase ASUS_A8_5G Azerty74@123 | tee /etc/wpa_supplicant.conf

#Ponctuellement: wpa_supplicant -B -c /etc/wpa_supplicant.conf -i wlp2s0; dhclient wlp2s0
```

-------------------------------------------------------------------------------------------------------------------------------------
**Connexion Automatique**
```
echo "[Unit]
Description=WPA supplicant
Before=network.target
After=dbus.service
Wants=network.target
IgnoreOnIsolate=true

[Service]
Type=dbus
BusName=fi.w1.wpa_supplicant1
ExecStart=/sbin/wpa_supplicant -u -s -c /etc/wpa_supplicant.conf -i wlp2s0
Restart=always

[Install]
WantedBy=multi-user.target
#Alias=dbus-fi.w1.wpa_supplicant1.service" /etc/systemd/system/wpa_supplicant.service; systemctl enable wpa_supplicant.service
```

-------------------------------------------------------------------------------------------------------------------------------------
**Auto-DHCP**
```
echo "[Unit]
Description= DHCP Client
Before=network.target

[Service]
Type=forking
ExecStart=/sbin/dhclient wlp2s0 -v
ExecStop=/sbin/dhclient wlp2s0 -r
Restart=always

[Install] 
WantedBy=multi-user.target" > /etc/systemd/system/dhclient.service; systemctl enable dhclient.service
```


-------------------------------------------------------------------------------------------------------------------------------------

**Définir une IP préférer**
```bash
nano /etc/dhcp/dhclient.conf

interface "wlp2s0" {
     send dhcp-requested-address 192.168.1.9;
}

systemctl restart dhclient
```


-------------------------------------------------------------------------------------------------------------------------------------
**Service Networking**
```bash
systemctl disable networking;
```

-------------------------------------------------------------------------------------------------------------------------------------
**Cacher Message Erreur**
```bash
echo "options iwlwifi enable_ini=N" > /etc/modprobe.d/iwlwifi.conf
```

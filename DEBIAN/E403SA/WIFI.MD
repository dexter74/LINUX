### E403SA (WIFI)

inxi -i

-------------------------------------------------------------------------------------------------------------------------------------
**Service Networking**
```bash
systemctl disable networking; # Erreur: Raising network
```

-------------------------------------------------------------------------------------------------------------------------------------
**Connexion à un Réseau WIFI :** ([Guide](https://www.linuxbabe.com/command-line/ubuntu-server-16-04-wifi-wpa-supplicant))
```
iwconfig wlp2s0 essid "ASUS_A8_5G";
wpa_passphrase ASUS_A8_5G Azerty74@123 | tee /etc/wpa_supplicant.conf
Ponctuellement: wpa_supplicant -B -c /etc/wpa_supplicant.conf -i wlp2s0;
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
ExecStart=/sbin/wpa_supplicant -u -s -c /etc/wpa_supplicant.conf
RESTART=always

[Install]
WantedBy=multi-user.target
#Alias=dbus-fi.w1.wpa_supplicant1.service" /etc/systemd/system/wpa_supplicant.service; systemctl enable wpa_supplicant.service
```

-------------------------------------------------------------------------------------------------------------------------------------
**Cacher Message Erreur**
```bash
/sbin/modinfo iwlwifi | grep debug
# enable_ini: Enable debug INI TLV FW debug infrastructure (default: true (bool))
#echo "options iwlwifi enable_ini=N" > /etc/modprobe.d/iwlwifi.conf
```

-------------------------------------------------------------------------------------------------------------------------------------
**Dépôts**
```
echo "
deb http://ftp.fr.debian.org/debian bullseye main non-free
deb http://security.debian.org/debian-security bullseye-security main
deb-src http://security.debian.org/debian-security bullseye-security main " > /etc/apt/sources.list
```
-------------------------------------------------------------------------------------------------------------------------------------

**NetworkManager**

```
apt install -y network-manager iwd;
echo "[device]
    wifi.backend=iwd" > /etc/NetworkManager/conf.d/wifi_backend.conf;
systemctl enable --now NetworkManager
nmcli device wifi connect ASUS_A8_5G --ask
```

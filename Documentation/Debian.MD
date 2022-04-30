**Connexion à un Réseau WIFI :** ([Guide](https://www.linuxbabe.com/command-line/ubuntu-server-16-04-wifi-wpa-supplicant))
```
ip link;
ip link set wlp2s0 up;
iwlist wlp2s0 scan | less;
iwconfig wlp2s0 essid "ASUS_A8_5G"
wpa_passphrase ASUS_A8_5G Azerty74@123 | tee /etc/wpa_supplicant.conf
sudo wpa_supplicant -B  -c /etc/wpa_supplicant.conf -i wlp2s0
dhclient wlp2s0
```


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

```bash
nano /etc/dhcp/dhclient.conf

interface "wlp2s0" {
     send dhcp-requested-address 192.168.1.9;
}

systemctl restart dhclient
```

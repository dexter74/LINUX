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

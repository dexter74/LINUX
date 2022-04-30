**Connexion à un Réseau WIFI :**

```
ip link;
ip link set wlp2s0 up;
iwlist wlp2s0 scan | less;
iwconfig wlp2s0 essid "ASUS_A8_5G"
wpa_passphrase ASUS_A8_5G Azerty74@123 | tee /etc/wpa_supplicant.conf

```

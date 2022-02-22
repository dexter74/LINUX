############################################################################################
# ./WireGuard.SH <PURGE> <INSTALL> <KEYS> <CONFIG> <EDIT > <PERMISSIONS> <SERVICE> <CHECK> #
############################################################################################

# ------------------------------------------------------------------------------------------
clear;
# ------------------------------------------------------------------------------------------
if [ -z $1 ]
 then
  echo 'Merci de preciser un parametre:
  - sh WireGuard.SH PURGE
  - sh WireGuard.SH INSTALL
  - sh WireGuard.SH KEYS <PRIVATE KEY> <PUBLIC KEY>
  - sh WireGuard.SH CONFIG
  - sh WireGuard.SH EDIT
  - sh WireGuard.SH PERMISSIONS
  - sh WireGuard.SH SERVICE <start|stop|status|enable --now |disable --now>
  - CHECK'

# ------------------------------------------------------------------------------------------
 elif [ "$1" = "PURGE" ]
  then
   clear;
   systemctl disable --now wg-quick@.service;
   systemctl disable --now wg-quick@.target;
   apt autoremove --purge -y wireguard;
   rm -r /etc/wireguard;
   rm /lib/systemd/system/wg-quick@.service;
   rm /lib/systemd/system/wg-quick.target;
   systemctl daemon-reload;
# > /dev/null;

# ------------------------------------------------------------------------------------------
 elif [ "$1" = "INSTALL" ]
  then
   clear;
   echo "deb http://deb.debian.org/debian $RELEASE-backports main" > /etc/apt/sources.list.d/$RELEASE-backports.list;
   apt update > /dev/null;
   apt install -y wireguard > /dev/null;
   sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf;
   /sbin/sysctl -w net.ipv4.ip_forward=1;

# ------------------------------------------------------------------------------------------
 elif [ "$1" = "KEYS" ]
  then
   clear;
   echo "$2" > /etc/wireguard/privatekey;
   echo "$3" > /etc/wireguard/publickey;
   cat /etc/wireguard/privatekey;
   cat /etc/wireguard/publickey;

# ------------------------------------------------------------------------------------------
 elif [ "$1" = "CONFIG" ]
  then
   clear;
   echo "" > /etc/wireguard/wg0.conf;
   nano /etc/wireguard/wg0.conf;
   cat /etc/wireguard/wg0.conf;

# ------------------------------------------------------------------------------------------
 elif [ "$1" = "EDIT" ]
  then
   clear;
   nano /etc/wireguard/wg0.conf;
   cat /etc/wireguard/wg0.conf;

# ------------------------------------------------------------------------------------------
 elif [ "$1" = "PERMISSIONS" ]
  then
   clear;
   chmod 600 -R /etc/wireguard/;

# ------------------------------------------------------------------------------------------
 elif [ "$1" = "SERVICE" ]
  then
   clear;
   systemctl $2 wg-quick@wg0.service;
   
# ------------------------------------------------------------------------------------------
 elif [ "$1" = "CHECK" ]
  then
   clear;
   wg;

# ------------------------------------------------------------------------------------------
 else
  echo "Le parametre '$1' est inconnu"
fi
# ------------------------------------------------------------------------------------------

####################################################################################
# ./ADGuardHome.sh <PURGE> <DL> <INSTALL> <ENABLE> <DISABLE> <START> <STOP> STATUS #
####################################################################################

# --------------------------------------------------------------------------------------------------------------------------------
clear;

# --------------------------------------------------------------------------------------------------------------------------------
if [ -z $1 ]
 then
  echo 'Merci de preciser un parametre :
   - PERMANENT (Install iptables Persistent)
   - DEFAUT (REmise à Zéro de IPTABLE)
   '

# --------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "PERMANENT" ]
  then
   clear;
   apt-get -qq install -y iptables-persistent;

# --------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "DEFAUT" ]
  then
   clear;
  # Reset les regles
  iptables -t filter -F;
  iptables -t filter -X;
  
  # Bloque tout le trafic
  iptables -t filter -P INPUT DROP;
  iptables -t filter -P FORWARD DROP;
  iptables -t filter -P OUTPUT DROP;
  
  # Autorise les connexions deja etablies et localhost
  iptables -A INPUT  -m state --state RELATED,ESTABLISHED -j ACCEPT;
  iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT;
  
  # Autorise les connexions entre loopback
  iptables -t filter -A INPUT  -i lo -j ACCEPT;
  iptables -t filter -A OUTPUT -o lo -j ACCEPT;
  
  # Protocole Autoriser par défaut en INPUT
  iptables -t filter -A INPUT  -p tcp --dport 22  -j ACCEPT; # [TCP] SSH
  iptables -t filter -A INPUT  -p tcp --dport 53  -j ACCEPT; # [TCP] DNS
  iptables -t filter -A INPUT  -p udp --dport 53  -j ACCEPT; # [UDP] DNS
  iptables -t filter -A INPUT  -p tcp --dport 80  -j ACCEPT; # [TCP] HTTP
  iptables -t filter -A INPUT  -p tcp --dport 139 -j ACCEPT; # [TCP] NETBIOS
  iptables -t filter -A INPUT  -p tcp --dport 443 -j ACCEPT; # [TCP] HTTPS
  iptables -t filter -A INPUT  -p tcp --dport 445 -j ACCEPT; # [TCP] SAMBA
  # Protocole Autoriser par défaut en OUTPUT
  iptables -t filter -A OUTPUT -p tcp --dport 53  -j ACCEPT; # [TCP] DNS
  iptables -t filter -A OUTPUT -p udp --dport 53  -j ACCEPT; # [UDP] DNS
  iptables -t filter -A OUTPUT -p tcp --dport 80  -j ACCEPT; # [TCP] HTTP
  iptables -t filter -A OUTPUT -p udp --dport 123 -j ACCEPT; # [UDP] NTP
  iptables -t filter -A OUTPUT -p tcp --dport 443 -j ACCEPT; # [TCP] HTTPS

# --------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "PERSITENT-APPLY" ]
  then
   clear;
   iptables-save  >/etc/iptables/rules.v4;

# --------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "PERSITENT-SERVICE" ]
  then
   clear;
   systemctl $2 netfilter-persistent;


# --------------------------------------------------------------------------------------------------------------------------------
 else
  echo "Le parametre '$1' est inconnu"
fi
# --------------------------------------------------------------------------------------------------------------------------------

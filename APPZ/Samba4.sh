if [ -z $1 ]
 then
 clear;
 echo "
 sh Samba4.sh ./HOSTNAME 'samba' 'mydomain.lan' '192.168.1.44'
 sh Samba4.sh ./HOST
 sh Samba4.sh ./NETWORK
 sh Samba4.sh ./APT
 sh Samba4.sh ./AVAHI
 sh Samba4.sh ./INSTALL
 "
# ----------------------------------------------------------------------------------------------------
elif [ $1 = "HOSTNAME" ];then
  echo "samba.mydomain.lan" > /etc/hostname;

# ----------------------------------------------------------------------------------------------------
elif [ $1 = "HOST" ];then
  echo "127.0.0.1    localhost.localdomain localhost
  $3 $2.$3    $&" > /etc/hosts;

# ----------------------------------------------------------------------------------------------------
elif [ $1 = "NETWORK" ];then
echo "#########################
# Interface de bouclage #
#########################
auto lo
iface lo inet loopback

######################
# Interface Physique #
######################
auto ens18
allow-hotplug ens18

iface ens18 inet static
  address 192.168.1.44
  netmask 255.255.255.0
  broadcast 192.168.1.255
  gateway 192.168.1.1
  dns-nameservers 127.0.0.1" > /etc/network/interfaces; systemctl restart networking; reboot

# ----------------------------------------------------------------------------------------------------
elif [ $1 = "APT" ];then
echo "#######################################################################################
deb http://deb.debian.org/debian/                  buster         main contrib non-free
deb-src http://deb.debian.org/debian/              buster         main contrib non-free
#######################################################################################
deb http://security.debian.org/debian-security     buster/updates main contrib non-free
deb-src http://security.debian.org/debian-security buster/updates main contrib non-free
#######################################################################################" >  /etc/apt/sources.list;

apt update     1>/dev/null;
apt upgrade -y 1>/dev/null;

# ----------------------------------------------------------------------------------------------------
elif [ $1 = "AVAHI" ];then
  systemctl disable --now avahi-daemon.service avahi-daemon.socket;

# ----------------------------------------------------------------------------------------------------
elif [ $1 = "INSTALL" ];then

#Pré-Requis:
apt install -y \
apt-transport-https \
dnsutils \
gnupg \
htop \
locales-all \
lsb-release \
net-tools \
nmap \
rsync \
screen \
sudo \
tcpdump \
telnet \
wget 1>/dev/null 2>/dev/null;
localectl set-locale LANG=fr_FR.utf8 1>/dev/null 2>/dev/null;


#PGP
wget -O tissamba-pubkey.gpg  http://samba.tranquil.it/tissamba-pubkey.gpg;
apt-key add tissamba-pubkey.gpg;
echo "deb https://samba.tranquil.it/debian/samba-4.14/ $(lsb_release -c -s) main" > /etc/apt/sources.list.d/tissamba.list;

#Samba4
apt install -y samba winbind libnss-winbind krb5-user smbclient ldb-tools python3-crypto 1>/dev/null 2>/dev/null;


echo "[libdefaults]
  default_realm = MYDOMAIN.LAN
  dns_lookup_kdc = true
  dns_lookup_realm = false" > /etc/krb5.conf;

samba-tool domain provision --realm=MYDOMAIN.LAN --domain MYDOMAIN --server-role=dc --adminpass=Admindu74

sed -i -e 's/192.168.1.40/192.168.1.1/g' /etc/samba/smb.conf

echo "search mydomain.lan
nameserver 127.0.0.1" > /etc/resolv.conf


rm -f /var/lib/samba/private/krb5.conf
ln -s /etc/krb5.conf /var/lib/samba/private/krb5.conf
# https://web.mit.edu/kerberos/krb5-1.5/krb5-1.5.4/doc/krb5-admin/libdefaults.html
nano /var/lib/samba/private/krb5.conf


systemctl enable  samba-ad-dc;
systemctl disable samba winbind nmbd smbd;
systemctl mask    samba winbind nmbd smbd;



# ----------------------------------------------------------------------------------------------------
 else
  echo "Script KO"
# ----------------------------------------------------------------------------------------------------

fi


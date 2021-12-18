####################################
# Script pour les Packages de base #
####################################

# CDROM:
sed -i -- 's/deb cdrom/#deb cdrom/g' /etc/apt/sources.list;

# Mise à jour:
apt update -qq;
apt upgrade -y -qq;


# Packages:
apt install -y -qq \
  bash-completion \
  dnsutils \
  curl \
  debconf-utils \
  git \
  gnupg \
  net-tools \
  qemu-guest-agent \
  sudo \
  unzip \
  wget \
  tree;
  

# Outils pour les partages:
apt install -y -qq \
  cifs-utils \
  ntfs-3g \
  open-iscsi;


# Automatisation Samba
echo "samba-common samba-common/workgroup string WORKGROUP" | debconf-set-selections;
echo "samba-common samba-common/dhcp boolean false" | debconf-set-selections;
echo "samba-common samba-common/do_debconf boolean true" | debconf-set-selections;
apt install -y -qq samba smbclient;


# Mise à jour du Noyau (Firmware inclus)
apt install -t -y buster-backports;
apt install -t -y linux-image-amd64;
apt install -t -y firmware-linux;



# Désactivation du service:
systemctl disable smbd;                 # Désactivation du service (Activation dans un autre script)
systemctl disable iscsid.service;       # Désactivation du service (Activation dans un autre script)
systemctl disable open-iscsi.service;   # Désactivation du service (Activation dans un autre script)
systemctl stop smbd;                    # Arrêt du service
systemctl stop iscsid.service;          # Arrêt du service
systemctl stop open-iscsi.service;      # Arrêt du service



# Corrige paquet cassé en cas de problème
apt update --fix-missing -y; #
dpkg --configure -a; #


# Suppression des dépôts
#rm /etc/apt/sources.list.d/cloud_init.list ;
#rm /etc/apt/sources.list.d/$OS_RELEASE-backports.list ;
apt update  ;

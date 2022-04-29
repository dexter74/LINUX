##################################################
# Script de de déploiement de Proxmox sur Debian #
##################################################

# Nettoyage de la console
clear;

console: xtermjs
description: $1
email_from: $2
keyboard: $3
language: $4

# ---------------------------------------------- #
if [ -z $1 ]
 then
  clear;
  echo 'Merci de preciser un parametre:
  - DEPOT      : Ajout les dépôts Proxmox
  - INSTALL    : Installation de Proxmox
  - DATACENTER "<Descriptif>" <Mail> <Keyboard Langue> <language>
  '
# ---------------------------------------------- #
 elif [ "$1" = "DEPOT" ]; then
  clear;
  echo "deb [arch=amd64] http://download.proxmox.com/debian/pve $RELEASE pve-no-subscription" > /etc/apt/sources.list.d/Proxmox.list;
  wget https://enterprise.proxmox.com/debian/proxmox-release-$RELEASE.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-$RELEASE.gpg;
  apt update 1>/dev/null 2>/dev/null;
  apt full-upgrade -y 1>/dev/null 2>/dev/null;
  reboot;
# ---------------------------------------------- #
 elif [ "$1" = "INSTALL" ]; then
  clear;clear;
  apt install -y proxmox-ve postfix open-iscsi;
# ---------------------------------------------- #
 elif [ "$1" = "Ponts" ]; then
  clear;
   echo "#########################
# Interface de bouclage #
#########################
auto $NET_LOOPBACK
iface $NET_LOOPBACK inet loopback

######################
# Interface Physique #
######################
iface $NET_INTERFACE1 inet manual

#################
# Interace Pont #
#################
auto vmbr0
  address ${NET_ADDRESS}/24
  gateway $NET_GATEWAY
  bridge-ports $NET_INTERFACE1
  bridge-stp off
  bridge-fd 0" > /etc/network/interfaces;


# ---------------------------------------------- #
 elif [ "$1" = "DATACENTER" ]; then
  echo "console: xtermjs
  description: $1
  email_from: $2
  keyboard: $3
  language: $4" > /etc/pve/datacenter.cfg
  service pveproxy restart;
  
# ---------------------------------------------- #
# ---------------------------------------------- #

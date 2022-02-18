####################################
# Script pour les Packages de base #
####################################

if [ -z $1 ]
# -----------------------------------------------------------------------------------------------
 then
  clear;
  echo "Merci d'indiquer un argument:
  - 3.paquets.sh CDROM
  - 3.paquets.sh BACKPORT
  - 3.paquets.sh MAJ
  - 3.paquets.sh FIX
  - 3.paquets.sh BASE
  - 3.paquets.sh OUTIL
  - 3.paquets.sh QEMU
  - 3.paquets.sh KERNEL
  - 3.paquets.sh SERVICE_OFF
  - 3.paquets.sh SERVICE_ON
  "
# -----------------------------------------------------------------------------------------------
 elif [ $1 = "CDROM" ]
  then
   clear;
   sed -i 's/^deb cdrom/#deb cdrom/g' /etc/apt/sources.list;

# -----------------------------------------------------------------------------------------------
 elif [ $1 = "BACKPORT" ]
  then
   clear;
   echo "deb http://ftp.de.debian.org/debian buster main" > /etc/apt/sources.list.d/backport.list;
# -----------------------------------------------------------------------------------------------
 elif [ $1 = "MAJ" ]
  then
   clear;
   apt update  -qq;
   apt upgrade -qq -y;
   #1>/dev/NULL 2>/dev/NULL;

# -----------------------------------------------------------------------------------------------
 elif [ $1 = "FIX" ]
  then
   apt update --fix-missing -y;
   dpkg --configure -a;

# -----------------------------------------------------------------------------------------------
 elif [ $1 = "BASE" ]
  then
   clear;
   apt install -y -qq bash-completion curl debconf-utils \
   dnsutils git gnupg net-tools sudo unzip wget;

# -----------------------------------------------------------------------------------------------
 elif [ $1 = "OUTIL" ]
  then
   clear;
   apt install -y -qq cifs-utils ntfs-3g open-iscsi;

# -----------------------------------------------------------------------------------------------
 elif [ $1 = "QEMU" ]
  then
   clear;
   apt install -y -qq qemu-guest-agent;

# -----------------------------------------------------------------------------------------------
# elif [ $1 = "SAMBA" ]
#  then
#   clear;
#   echo "samba-common samba-common/workgroup string WORKGROUP" | debconf-set-selections;
#   echo "samba-common samba-common/dhcp boolean false" | debconf-set-selections;
#   echo "samba-common samba-common/do_debconf boolean true" | debconf-set-selections;
#   apt install -y -qq samba smbclient;

# -----------------------------------------------------------------------------------------------
 elif [ $1 = "KERNEL" ]
  then
   clear;
   apt install -qq -y buster-backports;
   apt install -qq -y linux-image-amd64;
   apt install -qq -y firmware-linux;

# -----------------------------------------------------------------------------------------------
 elif [ $1 = "SERVICE_OFF" ]
  then
   clear;
   systemctl disable --now smbd;
   systemctl disable --now iscsid.service;
   systemctl disable --now open-iscsi.service;

# -----------------------------------------------------------------------------------------------
 elif [ $1 = "SERVICE_ON" ]
  then
   clear;
   systemctl enable --now smbd;
   systemctl enable --now iscsid.service;
   systemctl enable --now open-iscsi.service;

# -----------------------------------------------------------------------------------------------
 else
  echo "Script KO"
fi

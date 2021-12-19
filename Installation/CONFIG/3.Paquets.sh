####################################
# Script pour les Packages de base #
####################################

if [ -z $1 ]
# -----------------------------------------------------------------------------------------------
 then
  clear;
  echo "Merci d'indiquer un argument"
# -----------------------------------------------------------------------------------------------
 elif [ $1 = "CDROM" ]
  then
   clear;
   sed -i 's/^deb cdrom/#deb cdrom/g' /etc/apt/sources.list;
# -----------------------------------------------------------------------------------------------
 elif [ $1 = "BACKPORT" ]
  then
   clear;
   echo "deb http://ftp.de.debian.org/debian buster main" > /etc/apt/sources.list\backport.list;
# -----------------------------------------------------------------------------------------------
 elif [ $1 = "MAJ" ]
  then
   clear;
   apt update  -qq     1>/dev/NULL 2>/dev/NULL;
   apt upgrade -qq -y  1>/dev/NULL 2>/dev/NULL;
# -----------------------------------------------------------------------------------------------
 elif [ $1 = "FIX" ]
  then
   apt update --fix-missing -y 1>/dev/NULL 2>/dev/NULL;
   dpkg --configure -a 1>/dev/NULL 2>/dev/NULL;
# -----------------------------------------------------------------------------------------------
 elif [ $1 = "BASE" ]
  then
   clear;
   apt install -y -qq bash-completion curl debconf-utils \
   dnsutils git gnupg net-tools sudo unzip wget 1>/dev/NULL 2>/dev/NULL;
# -----------------------------------------------------------------------------------------------
 elif [ $1 = "OUTIL" ]
  then
   clear;
   apt install -y -qq cifs-utils ntfs-3g open-iscsi 1>/dev/NULL 2>/dev/NULL;
# -----------------------------------------------------------------------------------------------
 elif [ $1 = "QEMU" ]
  then
   clear;
   apt install -y -qq qemu-guest-agent 1>/dev/NULL 2>/dev/NULL;

# -----------------------------------------------------------------------------------------------
 elif [ $1 = "SAMBA" ]
  then
   clear;
   echo "samba-common samba-common/workgroup string WORKGROUP" | debconf-set-selections;
   echo "samba-common samba-common/dhcp boolean false" | debconf-set-selections;
   echo "samba-common samba-common/do_debconf boolean true" | debconf-set-selections;
   apt install -y -qq samba smbclient 1>/dev/NULL 2>/dev/NULL;
# -----------------------------------------------------------------------------------------------
 elif [ $1 = "KERNEL" ]
  then
   clear;
   apt install -t -y buster-backports 1>/dev/NULL 2>/dev/NULL;;
   apt install -t -y linux-image-amd64 1>/dev/NULL 2>/dev/NULL;;
   apt install -t -y firmware-linux 1>/dev/NULL 2>/dev/NULL;;
# -----------------------------------------------------------------------------------------------
 elif [ $1 = "SERVICE_OFF" ]
  then
   clear;
   systemctl disable smbd;
   systemctl disable iscsid.service;
   systemctl disable open-iscsi.service;
   systemctl stop smbd;
   systemctl stop iscsid.service;
   systemctl stop open-iscsi.service;
# -----------------------------------------------------------------------------------------------
 else
  echo "Script KO"
fi

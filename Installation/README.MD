-----------------------------------------------------------------------------------------------------

## I. Téléchargement des scripts
````console
rm -r {config,check} 1>/dev/null 2>/dev/null;
mkdir {config,check} 1>/dev/null 2>/dev/null;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/0.environnement.sh -O ./config/0.environnement.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/1.host.sh          -O ./config/1.host.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/2.reseau.sh        -O ./config/2.reseau.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/3.Paquets.sh       -O ./config/3.Paquets.sh
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/4.users_groups.sh  -O ./config/4.users_groups.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/SSH.sh             -O ./config/5.SSH.sh;
clear;
````

````console
sh ./config/0.environnement.sh
sh ./config/1.host.sh
sh ./config/2.reseau.sh
sh ./config/3.Paquets.sh
sh ./config/4.users_groups.sh
sh ./config/5.SSH.sh
````





````console
sh ./config/0.environnement.sh \
	Debian buster \
	SLDEBIAN04 LAN \
	Europe Paris fr_FR.UTF-8 \
	192.168.1.43 192.168.1.1 192.168.1.1 192.168.1.41 \
	marc administrateur admin 1001 1001 marc Azerty74

sh ./config/1.host.sh;


sh ./config/2.reseau.sh STATIC;
sh ./config/2.reseau.sh IPV6_OFF;
sh ./config/2.reseau.sh CHECK;

sh ./config/3.Paquets.sh CDROM;
sh ./config/3.Paquets.sh BACKPORT;
sh ./config/3.Paquets.sh MAJ;
sh ./config/3.Paquets.sh FIX;
sh ./config/3.Paquets.sh BASE;
sh ./config/3.Paquets.sh OUTIL;
sh ./config/3.Paquets.sh QEMU;
sh ./config/3.Paquets.sh SAMBA;
sh ./config/3.Paquets.sh KERNEL;
sh ./config/3.Paquets.sh SERVICE_OFF;
sh ./config/3.Paquets.sh SERVICE_ON;

sh ./config/4.users_groups.sh DEL_USER       $USER
sh ./config/4.users_groups.sh DEL_USER_HOME  $USER
sh ./config/4.users_groups.sh DEL_GROUP      $GROUP

sh ./config/4.users_groups.sh ADD_GROUP      $GROUP $GROUP_UID
sh ./config/4.users_groups.sh ADD_USER       $USER  $USER_ID $GROUP users
sh ./config/4.users_groups.sh PASSWORD       $USER  $PASS
sh ./config/4.users_groups.sh ADD_USER_GROUP $USER  sudo
sh ./config/4.users_groups.sh DEL_USER_GROUP $USER  sudo
sh ./config/4.users_groups.sh CHECK          $USER

sh ./config/4.users_groups.sh ADD_SUDOER     $USER
sh ./config/4.users_groups.sh DEL_SUDOER     $USER

````




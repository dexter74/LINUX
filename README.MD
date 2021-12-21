### Guide Utilisation

``` 
git clone https://github.com/dexter74/LINUX.git
```

```console
sh LINUX/Installation/CONFIG/0.environnement.sh Debian buster SLDEBIAN04 LAN Europe Paris fr_FR.UTF-8 192.168.1.43 192.168.1.1 192.168.1.1 192.168.1.41 marc administrateur admin 1001 1001 root admin ;


sh LINUX/Installation/CONFIG/1.host.sh

sh LINUX/Installation/CONFIG/2.reseau.sh STATIC
sh LINUX/Installation/CONFIG/2.reseau.sh IPV6_OFF



sh LINUX/Installation/CONFIG/3.Paquets.sh CDROM;
sh LINUX/Installation/CONFIG/3.Paquets.sh BACKPORT;
sh LINUX/Installation/CONFIG/3.Paquets.sh MAJ;
sh LINUX/Installation/CONFIG/3.Paquets.sh FIX;
sh LINUX/Installation/CONFIG/3.Paquets.sh BASE;
sh LINUX/Installation/CONFIG/3.Paquets.sh OUTIL;
sh LINUX/Installation/CONFIG/3.Paquets.sh QEMU;
sh LINUX/Installation/CONFIG/3.Paquets.sh SAMBA; <= A supprimer (Script Samba.sh)
sh LINUX/Installation/CONFIG/3.Paquets.sh KERNEL;
sh LINUX/Installation/CONFIG/3.Paquets.sh SERVICE_ON;
sh LINUX/Installation/CONFIG/3.Paquets.sh SERVICE_OFF;

sh LINUX/Installation/CONFIG/4.users_groups.sh DEL_USER       $USER
sh LINUX/Installation/CONFIG/4.users_groups.sh DEL_USER_HOME  $USER
sh LINUX/Installation/CONFIG/4.users_groups.sh DEL_GROUP      $GROUP
sh LINUX/Installation/CONFIG/4.users_groups.sh ADD_GROUP      $GROUP $GROUP_UID
sh LINUX/Installation/CONFIG/4.users_groups.sh ADD_USER       $USER  $USER_ID $GROUP users
sh LINUX/Installation/CONFIG/4.users_groups.sh PASSWORD       $USER  $PASS
sh LINUX/Installation/CONFIG/4.users_groups.sh ADD_USER_GROUP $USER  sudo
sh LINUX/Installation/CONFIG/4.users_groups.sh DEL_USER_GROUP $USER  sudo
sh LINUX/Installation/CONFIG/4.users_groups.sh CHECK          $USER
sh LINUX/Installation/CONFIG/4.users_groups.sh ADD_SUDOER     $USER
sh LINUX/Installation/CONFIG/4.users_groups.sh DEL_SUDOER     $USER

sh LINUX/Installation/CONFIG/5.SSH.sh STEP_6;# Backup
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_1;# Dossier SSH
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_2;# Clé SSH
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_3;# Permissions
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_4;# Securisation SH
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_5;# Relance du Service
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_7;# Recovery
```



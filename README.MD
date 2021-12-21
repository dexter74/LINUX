### Guide Utilisation


**GIT Clone**
``` 
rm -r LINUX;
git clone https://github.com/dexter74/LINUX.git;
```


**Environnement** (Exemple)

```console
sh LINUX/Installation/CONFIG/0.environnement.sh <DISTRIB> <CODENAME> <HOSTNAME> <DOMAIN> <REGION> <VILLE> <LANGUE> <IP> <PASSERELLE> <DNS 1> <DNS 2> <USER> <GROUP> <PASS USER> <UID> <GID> <SAMBA USER> <SAMBA PASS>
```


```console
sh LINUX/Installation/CONFIG/0.environnement.sh Debian buster \
SLDEBIAN04 LAN \
Europe Paris fr_FR.UTF-8 \
192.168.1.43 192.168.1.1 192.168.1.1 192.168.1.41 \
marc administrateur admin 1001 1001 \
root admin ;
```

**Host & Hostname**
```console
sh LINUX/Installation/CONFIG/1.host.sh;
```



**Réseau**
```console
sh LINUX/Installation/CONFIG/2.reseau.sh STATIC;
sh LINUX/Installation/CONFIG/2.reseau.sh IPV6_OFF;
sh LINUX/Installation/CONFIG/2.reseau.sh CHECK;
```

**Paquets** (A Testé)
```console
sh LINUX/Installation/CONFIG/3.paquets.sh CDROM;
sh LINUX/Installation/CONFIG/3.paquets.sh BACKPORT;
sh LINUX/Installation/CONFIG/3.paquets.sh MAJ;
sh LINUX/Installation/CONFIG/3.paquets.sh FIX;
sh LINUX/Installation/CONFIG/3.paquets.sh BASE;
sh LINUX/Installation/CONFIG/3.paquets.sh OUTIL;
sh LINUX/Installation/CONFIG/3.paquets.sh QEMU;

sh LINUX/Installation/CONFIG/3.paquets.sh SAMBA;# <= A supprimer (Script Samba.sh)

sh LINUX/Installation/CONFIG/3.paquets.sh KERNEL;
sh LINUX/Installation/CONFIG/3.paquets.sh SERVICE_ON;
sh LINUX/Installation/CONFIG/3.paquets.sh SERVICE_OFF;
```

**User & Groups** (A Testé)
```console
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
```

**SSH** (A Testé)
```console
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_6;# Backup
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_1;# Dossier SSH
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_2;# Clé SSH
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_3;# Permissions
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_4;# Securisation SH
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_5;# Relance du Service
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_7;# Recovery
```


**ADGuardHome** (A Testé)
```console
sh LINUX/APPZ/ADGuardHome.sh PURGE
sh LINUX/APPZ/ADGuardHome.sh DL
sh LINUX/APPZ/ADGuardHome.sh INSTALL
sh LINUX/APPZ/ADGuardHome.sh ENABLE
sh LINUX/APPZ/ADGuardHome.sh DISABLE
sh LINUX/APPZ/ADGuardHome.sh START
sh LINUX/APPZ/ADGuardHome.sh STOP
sh LINUX/APPZ/ADGuardHome.sh STATUS
```

**Docker** (A Réviser)
```console
# Ordre de la liste des Arguments à modifier
sh LINUX/APPZ/Docker.sh CLEAN => ? (Supprimer Conteneurs, Images)
sh LINUX/APPZ/Docker.sh PURGE => ? (Désinstallation Docker)
sh LINUX/APPZ/Docker.sh FIX
sh LINUX/APPZ/Docker.sh HUB <USER> <PASS>
sh LINUX/APPZ/Docker.sh PREP
sh LINUX/APPZ/Docker.sh INSTALL
sh LINUX/APPZ/Docker.sh PORTAINER
sh LINUX/APPZ/Docker.sh STATS
sh LINUX/APPZ/Docker.sh TEST
sh LINUX/APPZ/Docker.sh VERSION
```
**Samba** (A testé)
```console
sh LINUX/APPZ/Samba.sh
sh LINUX/APPZ/Samba.sh INSTALL
sh LINUX/APPZ/Samba.sh PURGE
sh LINUX/APPZ/Samba.sh BACKUP
sh LINUX/APPZ/Samba.sh AUTOCFG
sh LINUX/APPZ/Samba.sh ADD  $USER $PASS
sh LINUX/APPZ/Samba.sh DEL  $USER
sh LINUX/APPZ/Samba.sh ENABLE
sh LINUX/APPZ/Samba.sh DISABLE
sh LINUX/APPZ/Samba.sh LIST
sh LINUX/APPZ/Samba.sh EDIT
sh LINUX/APPZ/Samba.sh SERVICE <start|stop|restart|status|reload|disable|enable)
sh LINUX/APPZ/Samba.sh RECOVERY
sh LINUX/APPZ/Samba.sh WSDD_INSTALL
sh LINUX/APPZ/Samba.sh WSDD_PURGE
```

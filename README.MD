### Guide Utilisation


**GIT Clone**
``` 
rm -r LINUX;
git clone https://github.com/dexter74/LINUX.git;
clear;
```

-----------------------------------------------------------------------------------------------------------------------------------------------
**Environnement** (Exemple)

```bash
sh LINUX/Installation/CONFIG/0.environnement.sh <DISTRIB> <CODENAME> <HOSTNAME> <DOMAIN> <REGION> <VILLE> <LANGUE> <IP> <PASSERELLE> <DNS 1> <DNS 2> <USER> <GROUP> <PASS USER> <UID> <GID> <SAMBA USER> <SAMBA PASS>
```

```bash
sh LINUX/Installation/CONFIG/0.environnement.sh Debian buster \
SLDEBIAN04 LAN \
Europe Paris fr_FR.UTF-8 \
192.168.1.43 192.168.1.1 192.168.1.1 192.168.1.34 \
marc administrateur admin 1001 1001 \
root admin
```

**Check**
```bash
sh LINUX/Installation/Check/environnement.sh
```


-----------------------------------------------------------------------------------------------------------------------------------------------
**Host & Hostname**
```console
sh LINUX/Installation/CONFIG/1.host.sh
```


-----------------------------------------------------------------------------------------------------------------------------------------------
**Réseau**
```console
sh LINUX/Installation/CONFIG/2.reseau.sh
sh LINUX/Installation/CONFIG/2.reseau.sh STATIC
sh LINUX/Installation/CONFIG/2.reseau.sh IPV6_OFF
sh LINUX/Installation/CONFIG/2.reseau.sh CHECK
```

**Paquets**
```console
sh LINUX/Installation/CONFIG/3.paquets.sh
sh LINUX/Installation/CONFIG/3.paquets.sh CDROM
sh LINUX/Installation/CONFIG/3.paquets.sh BACKPORT
sh LINUX/Installation/CONFIG/3.paquets.sh MAJ
sh LINUX/Installation/CONFIG/3.paquets.sh FIX
sh LINUX/Installation/CONFIG/3.paquets.sh BASE
sh LINUX/Installation/CONFIG/3.paquets.sh OUTIL
sh LINUX/Installation/CONFIG/3.paquets.sh QEMU
sh LINUX/Installation/CONFIG/3.paquets.sh KERNEL
sh LINUX/Installation/CONFIG/3.paquets.sh SERVICE_ON
sh LINUX/Installation/CONFIG/3.paquets.sh SERVICE_OFF
```

**User & Groups** (A Testé)
```console
sh LINUX/Installation/CONFIG/4.users_groups.sh
sh LINUX/Installation/CONFIG/4.users_groups.sh DEL_USER       $USER
sh LINUX/Installation/CONFIG/4.users_groups.sh DEL_USER_HOME  $USER
sh LINUX/Installation/CONFIG/4.users_groups.sh DEL_GROUP      $GROUP
sh LINUX/Installation/CONFIG/4.users_groups.sh ADD_GROUP      $GROUP $GROUP_UID
sh LINUX/Installation/CONFIG/4.users_groups.sh ADD_USER       $USER  $USER_ID $GROUP users
sh LINUX/Installation/CONFIG/4.users_groups.sh PASSWORD       $USER  $PASS
sh LINUX/Installation/CONFIG/4.users_groups.sh ADD_USER_GROUP $USER  sudo
sh LINUX/Installation/CONFIG/4.users_groups.sh DEL_USER_GROUP $USER  sudo
sh LINUX/Installation/CONFIG/4.users_groups.sh ADD_SUDOER     $USER
sh LINUX/Installation/CONFIG/4.users_groups.sh DEL_SUDOER     $USER

sh LINUX/Installation/CONFIG/4.users_groups.sh CHECK          $USER
```

-----------------------------------------------------------------------------------------------------------------------------------------------
**SSH** (A Testé)
```console
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_6
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_6 # Backup
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_1 # Dossier SSH
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_2 # Clé SSH
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_3 # Permissions
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_4 # Securisation SSH
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_5 # Relance du Service
sh LINUX/Installation/CONFIG/5.SSH.sh STEP_7 # Recovery
```

-----------------------------------------------------------------------------------------------------------------------------------------------
**ADGuardHome** (A Testé)
```console
sh LINUX/APPZ/ADGuardHome.sh
sh LINUX/APPZ/ADGuardHome.sh PURGE
sh LINUX/APPZ/ADGuardHome.sh DL
sh LINUX/APPZ/ADGuardHome.sh INSTALL
sh LINUX/APPZ/ADGuardHome.sh ENABLE
sh LINUX/APPZ/ADGuardHome.sh DISABLE
sh LINUX/APPZ/ADGuardHome.sh START
sh LINUX/APPZ/ADGuardHome.sh STOP
sh LINUX/APPZ/ADGuardHome.sh STATUS
```

-----------------------------------------------------------------------------------------------------------------------------------------------
**Docker** (A Réviser et à compléter)
```console
sh LINUX/APPZ/Docker.sh 
sh LINUX/APPZ/Docker.sh PURGE                            #Désinstalle Docker
sh LINUX/APPZ/Docker.sh PREP                             #Préparation des indispensables
sh LINUX/APPZ/Docker.sh INSTALL                          #Installe Docker
sh LINUX/APPZ/Docker.sh FIX                              #Kernel error (Reboot)
sh LINUX/APPZ/Docker.sh HUB <USER> <PASS>                #Connexion à Docker Hub
sh LINUX/APPZ/Docker.sh TEST                             #Hello-World (Conteneur)
sh LINUX/APPZ/Docker.sh KILL                             #Tue les conteneurs

sh LINUX/APPZ/Docker.sh PORTAINER 8000 19901 32m         #Installe Portainer (Volume Purgé)
sh LINUX/APPZ/Docker.sh PORTAINER_UPDATE 8000 19901 32m  #Met à jour portainer Uniquement
sh LINUX/APPZ/Docker.sh LOCK                             #Vérrouille   le volume Portainer
sh LINUX/APPZ/Docker.sh UNLOCK                           #Dévérrouille le volume Portainer

sh LINUX/APPZ/Docker.sh STATS                            #Docker Stats
sh LINUX/APPZ/Docker.sh VERSION                          #Check Version
```

-----------------------------------------------------------------------------------------------------------------------------------------------
**Samba** (A testé, A vérifier sur la désinstallation / réinstallation)
```console
sh LINUX/APPZ/Samba.sh
sh LINUX/APPZ/Samba.sh PURGE           # Nettoyage
sh LINUX/APPZ/Samba.sh INSTALL         # Installation de Samba
sh LINUX/APPZ/Samba.sh BACKUP          # Sauvegarde le fichier de configuration
sh LINUX/APPZ/Samba.sh RECOVERY        # Restaure la configuration

sh LINUX/APPZ/Samba.sh AUTOCFG         # Auto-Configuration
sh LINUX/APPZ/Samba.sh EDIT            # Edition de la configuration Samba

sh LINUX/APPZ/Samba.sh SERVICE reload  # Recharge la configuration
sh LINUX/APPZ/Samba.sh SERVICE status  #
sh LINUX/APPZ/Samba.sh SERVICE restart #
sh LINUX/APPZ/Samba.sh SERVICE stop    #
sh LINUX/APPZ/Samba.sh SERVICE start   #
sh LINUX/APPZ/Samba.sh SERVICE enable  #
sh LINUX/APPZ/Samba.sh SERVICE disable #

sh LINUX/APPZ/Samba.sh LIST
sh LINUX/APPZ/Samba.sh DEL     $SAMBA_USER
sh LINUX/APPZ/Samba.sh ADD     $SAMBA_USER $SAMBA_PASS
sh LINUX/APPZ/Samba.sh ENABLE  $SAMBA_USER
sh LINUX/APPZ/Samba.sh DISABLE $SAMBA_USER

sh LINUX/APPZ/Samba.sh WSDD_PURGE
sh LINUX/APPZ/Samba.sh WSDD_INSTALL
```
-----------------------------------------------------------------------------------------------------------------------------------------------
**Proxmox** (Expérimental)
```console
sh LINUX/DEV/APPZ/Proxmox.sh;
sh LINUX/DEV/APPZ/Proxmox.sh DEPOT;
sh LINUX/DEV/APPZ/Proxmox.sh UPGRADE;
sh LINUX/DEV/APPZ/Proxmox.sh INSTALL;
sh LINUX/DEV/APPZ/Proxmox.sh DATACENTER "Proxmox #1" teste74@hotmail.fr fr fr;
sh LINUX/DEV/APPZ/Proxmox.sh CUSTOM;
sh LINUX/DEV/APPZ/Proxmox.sh CHECK;
```

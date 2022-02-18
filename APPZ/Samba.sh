
#########################################
# Script de deploiement de Samba + WSDD #
#########################################

# ----------------------------------------------------------------------------------------------------
if [ -z $1 ]
 then
 clear;
 echo "Manque Argument:
  - Samba.sh INSTALL
  - Samba.sh PURGE
  - Samba.sh BACKUP
  - Samba.sh AUTOCFG
  - Samba.sh ADD  \SAMBA_USER \$SAMBA_PASS 
  - Samba.sh DEL  \$SAMBA_USER
  - Samba.sh ENABLE
  - Samba.sh DISABLE
  - Samba.sh LIST
  - Samba.sh EDIT
  - Samba.sh SERVICE <start|stop|restart|status|reload|disable|enable)
  - Samba.sh RECOVERY
  - Samba.sh WSDD_INSTALL
  - Samba.sh WSDD_PURGE
  "
# --------------------------------------------------------------------------------
# Déblocage de la limit
 elif [ $1 = "ULIMIT" ]
  then
   ulimit -n 16384;

# --------------------------------------------------------------------------------
#
 elif [ $1 = "INSTALL" ]
  then
   clear;
   echo "deb http://ftp.de.debian.org/debian $RELEASE main" > /etc/apt/sources.list.d/$RELEASE.list;
   apt update;
   apt install -qq -y samba;
   systemctl is-enabled smbd;

# --------------------------------------------------------------------------------
#
 elif [ $1 = "PURGE" ]
  then
   clear;
   apt autoremove     -y samba samba-common;
   apt purge          -y samba samba-common;
   apt remove --purge -y samba samba-common cifs-utils smbclient;
   rm -rf /var/cache/samba /etc/samba /run/samba /var/lib/samba /var/log/samba;

# --------------------------------------------------------------------------------
# Ajout du compte Samba (Login: $2 | PASS: $3)
 elif [ $1 = "ADD" ]
  then
   clear;
   (echo $3; echo $3) | smbpasswd -a $2;
   systemctl restart smbd;

# --------------------------------------------------------------------------------
# Suppresstion du compte Samba
 elif [ $1 = "DEL" ]
  then
   clear;
   smbpasswd -x $2;

# --------------------------------------------------------------------------------
# Désactivation du compte Samba
 elif [ $1 = "DISABLE" ]
  then
   clear;
   smbpasswd -d $2;

# --------------------------------------------------------------------------------
# Activation du compte Samba
 elif [ $1 = "ENABLE" ]
  then
   clear;
   smbpasswd -e $2;

# --------------------------------------------------------------------------------
# Liste les User de Samba
 elif [ $1 = "LIST" ]
  then
   clear;
   pdbedit -L;

# --------------------------------------------------------------------------------
# Liste les User de Samba
 elif [ $1 = "EDIT" ]
  then
   clear;
   nano /etc/samba/smb.conf;
   systemctl restart smbd;

# --------------------------------------------------------------------------------
# Relance les services
 elif [ $1 = "SERVICE" ]
  then
   clear;
   systemctl $2 smbd;
   systemctl $2 wsdd;
# --------------------------------------------------------------------------------
# Sauvegarde la configuration
 elif [ $1 = "BACKUP" ]
  then
   cp /etc/samba/smb.conf /etc/samba/smb.conf.old;
   chattr +i /etc/samba/smb.conf.old;

# --------------------------------------------------------------------------------
# Restaure la configuration
 elif [ $1 = "RECOVERY" ]
  then
   cp /etc/samba/smb.conf.old /etc/samba/smb.conf;

# --------------------------------------------------------------------------------
# Relance le service Samba
 elif [ $1 = "AUTOCFG" ]
  then
   clear;
echo "; ===================================================================================================================
[global]
   workgroup = WORKGROUP
   log file = /var/log/samba/log.%m
   max log size = 1000
   logging = file
   panic action = /usr/share/samba/panic-action %d
   server role = standalone server
   obey pam restrictions = yes
   unix password sync = yes
   passwd program = /usr/bin/passwd %u
   passwd chat = *Enter\snew\s*\spassword:* %n\n *Retype\snew\s*\spassword:* %n\n *password\supdated\ssuccessfully* .
   pam password change = yes
   map to guest = bad user
   usershare allow guests = yes

;==============================================================================================
; Explication sur les paramètres de partages                                                  ;
;==============================================================================================
;[NomdemonPartage]
   ;comment         = Mon commentaire
   ;path            = /chemin
   ;browseable      = yes | no (Partage Cacher ou Visible)
   ;writable        = yes | no (Ecriture)
   ;read only       = yes | no (Lire uniquement)
   ;valid users     = USER1, USER2, @groupe12000 %S  (Utilisateurs, Groupe ou Services autorisés)
   ;force user      = USER     (Valid Users prend les droits de Force user)
   ;create mask     = 0700     (Conseiller) | 0755 (déconseiller)
   ;directory mask  = 0700     (Conseiller) | 0755 (déconseiller)
   ;guest ok        = no | yes (Mode invité)
;==============================================================================================


;=================== Dossier Racine  ==========================================================
[sda1]
   comment         = Racine du serveur
   path            = /
   browseable      = yes
   writable        = yes
   read only       = no
   valid users     = @users,@root
   force user      = root
   create mask     = 0700
   directory mask  = 0700
   guest ok        = no


;=================== Dossier Utilisateurs =====================================================
[homes]
   comment         = Dossier Utilisateurse
   browseable      = no
   writable        = yes
   read only       = no
   create mask     = 0700
   directory mask  = 0700
   guest ok        = no

;=================== Dossier Docker Volumes ===================================================
[Volumes]
   comment         = Dossier Volumes de Docker
   path            = /var/lib/docker/volumes
   browseable      = yes
   writable        = yes
   read only       = no
   valid users     = @users,@root
   force user      = root
   create mask     = 0700
   directory mask  = 0700
   guest ok        = no
;===================================================================================================================" > /etc/samba/smb.conf; systemctl restart smbd; systemctl status smbd

# --------------------------------------------------------------------------------
# Suppresion de WSDD
 elif [ $1 = "WSDD_PURGE" ]
  then
   clear;
   rm -r /tmp/*;
   systemctl disable --now wsdd;
   rm /etc/systemd/system/wsdd.service;
   rm /usr/bin/wsdd;
   systemctl daemon-reload;

# --------------------------------------------------------------------------------
# Installation de WSDD
 elif [ $1 = "WSDD_INSTALL" ]
  then
   rm -r /tmp/*;
   wget https://github.com/christgau/wsdd/archive/master.zip -O /tmp/master.zip;
   unzip /tmp/master.zip -d /tmp;
   mv /tmp/wsdd-master/src/wsdd.py /tmp/wsdd-master/src/wsdd;
   cp /tmp/wsdd-master/src/wsdd /usr/bin;
   cp /tmp/wsdd-master/etc/systemd/wsdd.service /etc/systemd/system;
   systemctl daemon-reload;
   systemctl enable --now wsdd;
# --------------------------------------------------------------------------------
#
 else
  echo "Script KO"
# --------------------------------------------------------------------------------
fi
# ----------------------------------------------------------------------------------------------------


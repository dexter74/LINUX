##################################
# Script de deploiement de Samba #
##################################


if [ -z $1 ]
# --------------------------------------------------------------------------------
 then
  echo "Manque Argument:
  - INSTALL
  - ADD
  - DEL
  - ENABLE
  - DISABLE
  - LIST
  - EDIT
  - SERVICE <start|stop|restart|status|reload|disable|enable)
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

# --------------------------------------------------------------------------------
# Relance le service Samba
 elif [ $1 = "SERVICE" ]
  then
   clear;
   systemctl $2 smbd;

# --------------------------------------------------------------------------------
# Relance le service Samba
 elif [ $1 = "AUTOCFG" ]
  then
   clear;
   echo "#====================== Global Settings ===============================
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
   netbios aliases = $HOSTNAME $HOSTNAME.$DOMAINE
#====================== Partage home ==================================
[homes]
   comment = Dossier Utilisateurs
   browseable = no
   read only = no
   writable = yes
   create mask = 0700
   directory mask = 0700
   guest ok = no
#====================== Partage Volumes ===============================
#[Volumes]
#   comment = Utilisateur docker qui prend les droits root
#   path = /
#   browseable = yes
#   writable = yes
#   read only = no
#   valid users = docker
#   force user = root
#====================== Partage System ================================
#[SYSTEM]
#   comment = Utilisateur root qui prend les droits roots
#   path = /
#   browseable = yes
#   writable = yes
#   read only = no
#   valid users = root
#   force user = root
#======================= No Delete Line Next ==========================
;   write list = root, @lpadmin
#======================================================================" > /etc/samba/smb.conf

   
   
   # --------------------------------------------------------------------------------
#
 else
  echo "Script KO"
fi



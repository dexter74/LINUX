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
 elif [ $1 ="ULIMIT" ]
  then
   ulimit -n 16384

# --------------------------------------------------------------------------------
#
 elif [ $1 ="INSTALL" ]
  then
   clear;
   echo "deb http://ftp.de.debian.org/debian $RELEASE  main" > /etc/apt/sources.list.d/$RELEASE.list;
   apt update;
   apt install -qq -y samba;

# --------------------------------------------------------------------------------
# Ajout du compte Samba (Login: $2 | PASS: $3)
 elif [ $1 ="ADD" ]
  then
   clear;
   (echo $3; echo $3) | smbpasswd -a $2;
   smbpasswd -e $2;
   systemctl restart smbd ;

# --------------------------------------------------------------------------------
# Suppresstion du compte Samba
 elif [ $1 ="DEL" ]
  then
   clear;
   smbpasswd -x $2;# Delete

# --------------------------------------------------------------------------------
# Désactivation du compte Samba
 elif [ $1 ="DISABLE" ]
  then
   clear;
   smbpasswd -d $2;

# --------------------------------------------------------------------------------
# Activation du compte Samba
 elif [ $1 ="ENABLE" ]
  then
   clear;
   smbpasswd -E $2;

# --------------------------------------------------------------------------------
# Liste les User de Samba
 elif [ $1 ="LIST" ]
  then
   clear;
   pdbedit -L ;

# --------------------------------------------------------------------------------
# Liste les User de Samba
 elif [ $1 ="EDIT" ]
  then
   clear;
   nano /etc/samba/smb.conf;

# --------------------------------------------------------------------------------
# Relance le service Samba 
 elif [ $1 ="SERVICE" ]
  then
   clear;
   systemctl $3 smbd;

# --------------------------------------------------------------------------------
#
 else
  echo "Script KO"
fi

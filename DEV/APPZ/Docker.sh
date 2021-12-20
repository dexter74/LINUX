#################################################
# Script de de déploiement de Docker sur Debian #
#################################################

# Nettoyage de la console
clear;

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
if [ -z $1 ]
 then
  clear;
  echo 'Merci de preciser un parametre
  - PURGE
  - PREP 
  - INSTALL'
# -------------------------------------------------------------------------------------------------------------------------------------
#  1>/dev/null 2>/dev/null;
 elif [ "$1" = "PURGE" ]
  then
   clear;
   apt autoremove --purge -y docker-ce docker-ce-cli containerd.io;
   rm -rf /var/lib/docker;
   rm -rf /var/lib/containerd;
   rm -rf /etc/docker;
   rm -rf /usr/local/bin/docker-compose;
# -------------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "PREP" ]
  then
  clear;
  apt update ;
  apt install -qq -y apt-transport-https ca-certificates gnupg-agent gnupg2 software-properties-common sudo curl;
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -;
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $RELEASE stable";
# -------------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "INSTALL" ]
  then
  apt install -qq -y docker-ce docker-ce-cli containerd.io;
# -------------------------------------------------------------------------------------------------------------------------------------
 else
  echo "Le parametre '$1' est inconnu"
fi
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

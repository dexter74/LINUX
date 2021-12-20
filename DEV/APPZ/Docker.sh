###############
# ./Docker.sh #
###############
clear;

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
if [ -z $1 ]
 then
  echo 'Merci de preciser un parametre (PURGE, PREP, INSTALL' 
# -------------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "PURGE" ]
  then
   apt autoremove --purge -y docker-ce docker-ce-cli containerd.io ;
   rm -rf /var/lib/docker ;
   rm -rf /var/lib/containerd ;
   rm -rf /etc/docker ;
   rm -rf /usr/local/bin/docker-compose ;
# -------------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "PREP" ]
  then
  apt update 1>/dev/null 2>/dev/null;
  apt install -y apt-transport-https ca-certificates gnupg-agent gnupg2 software-properties-common sudo curl 1>/dev/null 2>/dev/null;
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -;
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $RELEASE stable";
# -------------------------------------------------------------------------------------------------------------------------------------
 elif [ "$1" = "INSTALL" ]
  then
  apt install -y docker-ce docker-ce-cli containerd.io 1>/dev/null 2>/dev/null;;
# -------------------------------------------------------------------------------------------------------------------------------------
 else
  echo "Le parametre '$1' est inconnu"
fi
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

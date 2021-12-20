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
  - INSTALL
  - HUB <Login> <PASS>
  - TEST (Lance le conteneur Hello-World)
  - CLEAN (Kill + Clean conteneurs / images)
  - STATS
  - VERSION (Docker, Docker-Compose)
  '

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
# Mise à jour Dépôt, Installation des pré-requis et ajout du dépôts docker.
 elif [ "$1" = "PREP" ]
  then
  clear;
  apt update ;
  apt install -qq -y apt-transport-https ca-certificates gnupg-agent gnupg2 software-properties-common sudo curl;
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -;
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $RELEASE stable";

# -------------------------------------------------------------------------------------------------------------------------------------
# Install Docker avec Docker Compose
 elif [ "$1" = "INSTALL" ]
  then
  clear;
  apt install -qq -y docker-ce docker-ce-cli containerd.io;
  curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose ;
  chmod +x /usr/local/bin/docker-compose ;
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose ;

# -------------------------------------------------------------------------------------------------------------------------------------
#  COnnexion au Docker-Hub ($2: login | $3: Password)
 elif [ "$1" = "HUB" ]
  then
  clear;
  docker login -u $2 -p $3;

# -------------------------------------------------------------------------------------------------------------------------------------
# Install Docker avec Docker Compose
 elif [ "$1" = "TEST" ]
  then
  clear;
  docker run hello-world;

# -------------------------------------------------------------------------------------------------------------------------------------
# Tue les conteneurs, purge les conteneurs leurs images. (Volumes intact)
 elif [ "$1" = "CLEAN" ]
  then
  clear;
  docker kill $(docker ps -q) ;
  docker rm $(docker ps -a -q) ;
  docker rmi $(docker images -q) ;

# -------------------------------------------------------------------------------------------------------------------------------------
# Tue les conteneurs, purge les conteneurs leurs images. (Volumes intact)
 elif [ "$1" = "STATS" ]
  then
  docker stats --format "table  {{.Name}}\t {{.CPUPerc}}\t  {{.MemPerc}}\t  {{.MemUsage}}\t {{.NetIO}}\t {{.BlockIO}}\t"

# -------------------------------------------------------------------------------------------------------------------------------------
# Install Docker avec Docker Compose
 elif [ "$1" = "VERSION" ]
  then
  clear;
  docker --version;
  docker-compose --version;

# -------------------------------------------------------------------------------------------------------------------------------------
 else
  echo "Le parametre '$1' est inconnu"
# -------------------------------------------------------------------------------------------------------------------------------------
fi
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

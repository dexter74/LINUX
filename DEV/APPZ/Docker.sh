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
  - CLEAN
  - FIX
  - HUB <Login> <PASS>
  - INSTALL
  - PORTAINER
  - PREP
  - PURGE
  - STATS
  - TEST
  - VERSION (Docker, Docker-Compose)
  '

# ---------------------------------------------------------------------------------------------------------------------------------------------
#  1>/dev/null 2>/dev/null;
 elif [ "$1" = "PURGE" ]
  then
   clear;
   apt autoremove --purge -y docker-ce docker-ce-cli containerd.io;
   rm -rf /var/lib/docker;
   rm -rf /var/lib/containerd;
   rm -rf /etc/docker;
   rm -rf /usr/local/bin/docker-compose;

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Mise à jour Dépôt, Installation des pré-requis et ajout du dépôts docker.
 elif [ "$1" = "PREP" ]
  then
  clear;
  apt update;
  apt install -qq -y apt-transport-https ca-certificates gnupg-agent gnupg2 software-properties-common sudo curl;
  curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -;
  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $RELEASE stable";

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Install Docker avec Docker Compose
 elif [ "$1" = "INSTALL" ]
  then
  clear;
  apt install -qq -y docker-ce docker-ce-cli containerd.io;
  curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose;
  chmod +x /usr/local/bin/docker-compose;
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose;
  systemctl reboot; # Requis pour eviter l'erreur "Your kernel does not support swap memory limit"


# ---------------------------------------------------------------------------------------------------------------------------------------------
# Install Docker avec Docker Compose
 elif [ "$1" = "FIX" ]
  then
  clear;
  echo deb http://deb.debian.org/debian $RELEASE-backports main contrib non-free | sudo tee /etc/apt/sources.list.d/$RELEASE-backports.list;
  apt update;
  apt install -y -t $RELEASE-backports linux-image-amd64;
  apt install -y -t $RELEASE-backports firmware-linux firmware-linux-nonfree;
  rm /etc/apt/sources.list.d/$RELEASE-backports.list;
  apt update;
  systemctl reboot;

# ---------------------------------------------------------------------------------------------------------------------------------------------
#  COnnexion au Docker-Hub ($2: login | $3: Password)
 elif [ "$1" = "HUB" ]
  then
  clear;
  docker login -u $2 -p $3;

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Install Docker avec Docker Compose
 elif [ "$1" = "TEST" ]
  then
  clear;
  docker run hello-world;

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Tue les conteneurs, purge les conteneurs leurs images. (Volumes intact)
 elif [ "$1" = "CLEAN" ]
  then
  clear;
  docker kill $(docker ps -q);
  docker rm $(docker ps -a -q);
  docker rmi $(docker images -q);

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Tue les conteneurs, purge les conteneurs leurs images. (Volumes intact)
 elif [ "$1" = "STATS" ]
  then
  clear;
  docker stats --format "table  {{.Name}}\t {{.CPUPerc}}\t  {{.MemPerc}}\t  {{.MemUsage}}\t {{.NetIO}}\t {{.BlockIO}}\t"

# ---------------------------------------------------------------------------------------------------------------------------------------------
# Déploiement de Portainer (journalctl -f | grep "cgroup\|swap\|docker")
 elif [ "$1" = "PORTAINER" ]
  then
  clear;
  #chattr -i Portainer;
  docker kill CN_Portainer;
  docker container rm CN_Portainer;
  docker image  rm portainer/portainer-ce;
  docker volume rm Portainer;
  docker run -d -p 8001:8000 -p 19901:9000 \
   --name=CN_Portainer \
   --restart=always \
   --label Portainer="hide" \
   -m 32m \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v Portainer:/data portainer/portainer-ce \
   --hide-label \
   Portainer="hide";


# ---------------------------------------------------------------------------------------------------------------------------------------------
# Install Docker avec Docker Compose
 elif [ "$1" = "VERSION" ]
  then
  clear;
  docker --version;
  docker-compose --version;

# ---------------------------------------------------------------------------------------------------------------------------------------------
 else
  echo "Le parametre '$1' est inconnu"
# ---------------------------------------------------------------------------------------------------------------------------------------------
fi
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------



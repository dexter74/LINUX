## I. Création de l'arborescence des dossiers**
````
rm -r {config,check} 1>/dev/null 2>/dev/null;
mkdir {config,check} 1>/dev/null 2>/dev/null;
clear;
````

## II. Téléchargements des Scripts
````
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/0.environnement.sh -O ./config/0.environnement.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/1.host.sh -O ./config/1.host.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/2.reseau.sh -O ./config/2.reseau.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/3.users_groups.sh -O ./config/3.users_groups.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/Check/environment.sh -O ./check/environnement.sh;
clear;
````

## Configuration de la machine

#### A. Configuration de l'environnement
````console
sh ./config/0.environnement.sh Debian buster SLDEBIAN04 LAN Europe Paris fr_FR.UTF-8 \
192.168.1.43 192.168.1.1 192.168.1.1 192.168.1.41 \
marc administrateur admin 1001 1001 marc Azert74
````

#### B. Configuration du Host / Hostname

````console
sh ./config/1.host.sh
sh ./config/2.reseau.sh
sh ./config/3.users_groups.sh
````

-----------------------------------------------------------------------------------------------------

## I. Création de l'arborescence des dossiers**
````
rm -r {config,check} 1>/dev/null 2>/dev/null;
mkdir {config,check} 1>/dev/null 2>/dev/null;
clear;
````

-----------------------------------------------------------------------------------------------------

## II. Téléchargements des Scripts
````
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/0.environnement.sh -O ./config/0.environnement.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/1.host.sh -O ./config/1.host.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/2.reseau.sh -O ./config/2.reseau.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/3.users_groups.sh -O ./config/3.users_groups.sh;
````

-----------------------------------------------------------------------------------------------------

## III. Configuration de la machine

#### A. Configuration de l'environnement
````console
sh ./config/0.environnement.sh Debian buster SLDEBIAN04 LAN Europe Paris fr_FR.UTF-8 \
192.168.1.43 192.168.1.1 192.168.1.1 192.168.1.41 \
marc administrateur admin 1001 1001 marc Azert74
````

#### B. Configuration du Host / Hostname

````console
sh ./config/1.host.sh
````

#### C. Configuration du Réseau

##### DHCP + IPV6 OFF:
````console
sh ./config/2.reseau.sh DHCP;
sh ./config/2.reseau.sh IPV6_OFF;
sh ./config/2.reseau.sh CHECK;
````

##### STATIC + IPV6 OFF:
````console
sh ./config/2.reseau.sh STATIC;
sh ./config/2.reseau.sh IPV6_OFF;
sh ./config/2.reseau.sh CHECK;
````

-----------------------------------------------------------------------------------------------------

## IV. Gestion des Groupes et Utilisateur


#### A. des Groupes et Utilisateur

Ajout:
````
sh ./config/3.users_groups.sh ADD_GROUP admin 1001;
sh ./config/3.users_groups.sh ADD_USER marc 1001 admin users;
sh ./config/3.users_groups.sh PASSWORD marc admin;
````

Suppression:
````console
sh ./config/3.users_groups.sh DEL_USER marc;
sh ./config/3.users_groups.sh DEL_USER_HOME marc;
sh ./config/3.users_groups.sh DEL_GROUP admin;
````

#### B. Permission Sudo

Ajouter User dans Sudo (2 Méthodes)
````console
sh ./config/3.users_groups.sh ADD_SUDOER marc;
````
````console
sh ./config/3.users_groups.sh ADD_USER_GROUP marc sudo;
````

Supprimer User dans Sudo (2 Méthodes)
````console
sh ./config/3.users_groups.sh DEL_SUDOER marc;
````
````console
sh ./config/3.users_groups.sh DEL_USER_GROUP marc sudo;
````


#### C. Vérification
````console
sh ./config/3.users_groups.sh CHECK marc;
````



Syntaxe:
````console
sh ./config/3.users_groups.sh DEL_USER <USER>
sh ./config/3.users_groups.sh DEL_USER_HOME <USER>
sh ./config/3.users_groups.sh DEL_GROUP <GROUP>
sh ./config/3.users_groups.sh ADD_GROUP <GROUP> <GID>
sh ./config/3.users_groups.sh ADD_USER <USER> <UID> <GROUP PRIMAIRE> <GROUP SECONDAIRE> 
sh ./config/3.users_groups.sh CHECK <USER>
sh ./config/3.users_groups.sh DEL_USER_GROUP <USER> <GROUPE SECONDAIRE>
sh ./config/3.users_groups.sh ADD_USER_GROUP <USER> <GROUPE SECONDAIRE>
sh ./config/3.users_groups.sh PASSWORD <USER> <PASS>
sh ./config/3.users_groups.sh DEL_SUDOER <USER>
sh ./config/3.users_groups.sh ADD_SUDOER <USER>
````




-----------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------


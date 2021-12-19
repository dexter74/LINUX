-----------------------------------------------------------------------------------------------------

## I. Création de l'arborescence des dossiers
````console
rm -r {config,check} 1>/dev/null 2>/dev/null;
mkdir {config,check} 1>/dev/null 2>/dev/null;
clear;
````

-----------------------------------------------------------------------------------------------------

## II. Téléchargements des Scripts
````console
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/0.environnement.sh -O ./config/0.environnement.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/1.host.sh          -O ./config/1.host.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/2.reseau.sh        -O ./config/2.reseau.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/3.Paquets.sh       -O ./config/3.Paquets.sh
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/4.users_groups.sh  -O ./config/4.users_groups.sh;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/SSH.sh             -O ./config/5.SSH.sh;
clear;
````

-----------------------------------------------------------------------------------------------------

## III. Configuration de la machine

#### A. Configuration de l'environnement
````console
sh ./config/0.environnement.sh Debian buster SLDEBIAN04 LAN Europe Paris fr_FR.UTF-8 \
192.168.1.43 192.168.1.1 192.168.1.1 192.168.1.41 \
marc administrateur admin 1001 1001 marc Azerty74;
````

#### B. Configuration du Host / Hostname
````console
sh ./config/1.host.sh;
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

Supprimer:
````console
sh ./config/4.users_groups.sh DEL_USER $USER;
sh ./config/4.users_groups.sh DEL_USER_HOME $USER;
sh ./config/4.users_groups.sh DEL_GROUP $GROUP;
````

Ajouter:
````console
sh ./config/4.users_groups.sh ADD_GROUP $GROUP $GROUP_UID;
sh ./config/4.users_groups.sh ADD_USER $USER $USER_ID $GROUP users;
sh ./config/4.users_groups.sh PASSWORD $USER $PASS;
````


-----------------------------------------------------------------------------------------------------

## V. Permission Sudo (2 Méthodes)

#### A. Méthode 1 (Groupe Sudo)

Supprimer
````console
sh ./config/4.users_groups.sh DEL_USER_GROUP $USER sudo;
````

Ajouter
````console
sh ./config/4.users_groups.sh ADD_SUDOER $USER;
````


#### B. Méthode 2 (Sudoers)

Supprimer
````console
sh ./config/4.users_groups.sh DEL_SUDOER $USER;
````

Ajouter
````console
sh ./config/4.users_groups.sh ADD_USER_GROUP $USER sudo;
````


#### C. Vérification
````console
sh ./config/4.users_groups.sh CHECK $USER;
````

-----------------------------------------------------------------------------------------------------

## VI. Sécurisation du Serveur par authentification SSH
```
sh ./config/5.SSH.sh STEP_1;# Creation dossier ssh
sh ./config/5.SSH.sh STEP_2;# Insertion CLe
sh ./config/5.SSH.sh STEP_3;# Permission
sh ./config/5.SSH.sh STEP_4;# Backup
sh ./config/5.SSH.sh STEP_6;# Secursation
sh ./config/5.SSH.sh STEP_7;# Relance Service
sh ./config/5.SSH.sh STEP_5;# Recovery
```

-----------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------


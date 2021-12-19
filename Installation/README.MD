

**Dossiers des scripts**
````
rm -r {config,check} 1>/dev/null 2>/dev/null;;
mkdir {config,check} 1>/dev/null 2>/dev/null;;
````

**Téléchargement des scripts**
````
#Config:
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/environnement.sh -O ./config/0.environnement.sh 1>/dev/null 2>/dev/null; 
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/host.sh -O ./config/1.host.sh 1>/dev/null 2>/dev/null;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/reseau.sh -O ./config/2.reseau.sh 1>/dev/null 2>/dev/null;
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/CONFIG/users_groups.sh -O ./config/3.users_groups.sh 1>/dev/null 2>/dev/null;

#Check
wget https://raw.githubusercontent.com/dexter74/LINUX/main/Installation/Check/environment_check.sh -O ./check/environment.sh 1>/dev/null 2>/dev/null;
````

**Exécution des Scripts**
````console
./config/0.environnement.sh <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> <arg> 
./config/1.host.sh
./config/2.reseau.sh
./config/3.users_groups.sh
````

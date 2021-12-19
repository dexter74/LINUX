

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

**Configuration Environnement**
````console
sh ./config/0.environnement.sh Debian buster SLDEBIAN04 LAN Europe Paris fr_FR.UTF-8 192.168.1.43 192.168.1.1 192.168.1.1 192.168.1.41 marc administrateur admin 1001 1001
sh ./check/environment.sh
````


````console
./config/1.host.sh
./config/2.reseau.sh
./config/3.users_groups.sh
````

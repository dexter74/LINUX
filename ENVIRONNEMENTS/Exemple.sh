######################################################
# Script de déclaration de variables d'environnement #
######################################################
#
# /etc/profile charge les scripts /etc/profile.d/*.sh

# Création du script "conf_env.sh"
echo "#Fichier Profil:
FILE=/etc/profile.d/ENVIRONNEMENT.sh
echo '##############################' > \$FILE
echo '# Information sur le Système #' >> \$FILE
echo '##############################' >> \$FILE
echo export DISTRIB=\'\$1\'      >> \$FILE
echo export RELEASE=\'\$2\'      >> \$FILE
echo export HOSTNAME=\'\$3\'     >> \$FILE
echo export DOMAINE=\'\$4\'      >> \$FILE
echo export REGION=\'\$5\'       >> \$FILE
echo export VILLE=\'\$6\'        >> \$FILE
echo export LANGUE=\'\$7\'       >> \$FILE
echo export SSH_KEY=\'MAKEYSSH\' >> \$FILE

echo '############################' >> \$FILE
echo '# Information sur le Rseau #' >> \$FILE
echo '############################' >> \$FILE
echo export NET_LOOPBACK=\'$(ip link | grep '^1:' | cut -c 4-20 |cut -d ':' -f 1)\'    >> \$FILE
echo export NET_INTERFACE1=\'$(ip link | grep '^2:' | cut -c 4-20 |cut -d ':' -f 1)\'  >> \$FILE
echo export NET_INTERFACE2=\'$(ip link | grep '^3:' | cut -c 4-20 |cut -d ':' -f 1)\'  >> \$FILE
echo export NET_ADDRESS=\'\$8\'  >> \$FILE
echo export NET_GATEWAY=\'\$9\'  >> \$FILE
echo export NET_DNS0=\'\$10\'    >> \$FILE
echo export NET_DNS1=\'\$11\'    >> \$FILE

echo '############################' >> \$FILE
echo '# Information sur le Rseau #' >> \$FILE
echo '############################' >> \$FILE
echo export USER=\'\$12\'        >> \$FILE
echo export GROUP=\'\$13\'       >> \$FILE
echo export PASS=\'\$14\'        >> \$FILE
echo export USER_ID=\'\$15\'         >> \$FILE
echo export GROUP_UID=\'\$16\'        >> \$FILE
echo export APPZ_SAMBA_USER=\'\$17\'  >> \$FILE
echo export APPZ_SAMBA_PASS=\'\$18\'  >> \$FILE " > conf_env.sh; clear;

# Configuration du Système
sudo sh conf_env.sh Debian buster SLDEBIAN01 LAN Europe Paris fr_FR.UTF-8 192.168.1.40 192.168.1.1 192.168.1.1 192.168.1.41 \
marc administrateur admin 1001 1001 samba admin;


# Vérification: clear; echo "$APPZ_SAMBA_USER | $APPZ_SAMBA_PASS"; 
# Check Export: clear; export | cut -c 12-50 | sort -k 1;
  

# USER=\'XXXX\' > USER='XXXX'

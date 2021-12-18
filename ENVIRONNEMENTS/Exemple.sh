######################################################
# Script de déclaration de variables d'environnement #
######################################################
#
# Le fichier /etc/environment n'affecte que les USERS. Pas le root

# Création du script
echo "FILE=/etc/environment
rm \$FILE
echo '##############################'  > \$FILE
echo '# Information sur le Système #' >> \$FILE
echo '##############################' >> \$FILE
echo DISTRIB=\'\$1\'      >> \$FILE
echo RELEASE=\'\$2\'      >> \$FILE
echo HOSTNAME=\'\$3\'     >> \$FILE
echo DOMAINE=\'\$4\'      >> \$FILE
echo REGION=\'\$5\'       >> \$FILE
echo VILLE=\'\$6\'        >> \$FILE
echo LANGUE=\'\$7\'       >> \$FILE
echo SSH_KEY=\'MAKEYSSH\' >> \$FILE

echo '############################' >> \$FILE
echo '# Information sur le Rseau #' >> \$FILE
echo '############################' >> \$FILE
echo NET_LOOPBACK=\'$(ip link | grep '^1:' | cut -c 4-20 |cut -d ':' -f 1)\'    >> \$FILE
echo NET_INTERFACE1=\'$(ip link | grep '^2:' | cut -c 4-20 |cut -d ':' -f 1)\'  >> \$FILE
echo NET_INTERFACE2=\'$(ip link | grep '^3:' | cut -c 4-20 |cut -d ':' -f 1)\'  >> \$FILE
echo NET_ADDRESS=\'\$8\'  >> \$FILE
echo NET_GATEWAY=\'\$9\'  >> \$FILE
echo NET_DNS0=\'\$10\'    >> \$FILE
echo NET_DNS1=\'\$11\'    >> \$FILE

echo '############################' >> \$FILE
echo '# Information sur le Rseau #' >> \$FILE
echo '############################' >> \$FILE
echo USER=\'\$12\'        >> \$FILE
echo GROUP=\'\$13\'       >> \$FILE
echo PASS=\'\$14\'        >> \$FILE
echo UID=\'\$15\'         >> \$FILE
echo GUID=\'\$16\'        >> \$FILE
echo APPZ_SAMBA_USER=\'\$17\'  >> \$FILE
echo APPZ_SAMBA_PASS=\'\$18\'  >> \$FILE " > environment.sh


# Remise à Blank
sudo sh environment.sh; clear; cat /etc/environment;


# Configuration du Système
sudo sh environment.sh \
Debian buster \
SLDEBIAN01 LAN \
Europe Paris fr_FR.UTF-8 \
192.168.1.40 192.168.1.1 192.168.1.1 192.168.1.1 \
marc administrateur admin 1001 1001 \
samba admin; clear; cat /etc/environment;

# Vérification
echo "$APPZ_SAMBA_USER | $APPZ_SAMBA_PASS"


# USER=\'XXXX\' > USER='XXXX'

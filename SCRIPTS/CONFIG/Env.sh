######################################################
# Script de déclaration de variables d'environnement #
######################################################
#
# /etc/profile charge les scripts /etc/profile.d/*.sh

# Env.sh <DISTRIB> <release> <hostname> <domaine> <region> <ville> <langue> <IPV4> <Passerelle> <DNS 0> <DNS 1> <USERNAME> <GROUP> <PASSWOD> <USER ID> <GROUP ID> <SAMBA USER> <SAMBA PASS>

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


# Vérification: clear; echo "$APPZ_SAMBA_USER | $APPZ_SAMBA_PASS"; 
# Check Export: clear; export | cut -c 12-50 | sort -k 1;
  

# USER=\'XXXX\' > USER='XXXX'

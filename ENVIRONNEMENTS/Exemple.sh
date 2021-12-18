######################################################
# Script de déclaration de variables d'environnement #
######################################################
#
# echo "echo \$1" > test.sh; sh test.sh A
#
#
# Vider les variables Environnements
echo '' > ./environment ;



echo "##############################
# Information sur le Système #
##############################
DISTRIB='$(lsb_release -a | grep '^Codename' | cut -c 11-20)'
RELEASE='$(lsb_release -a | grep '^Distributor' | cut -d ':' -f 2 | cut -c 2-10)'

#############################
# Information de la Machine #
#############################
HOSTNAME='\$1'
DOMAINE='\$2'
REGION='Europe'
VILLE='Paris'
LANGUE='fr_FR.UTF-8'

#########################
# Information le Réseau #
#########################

# Récupérer Nom Interface:
NET_LOOPBACK='$(ip link | grep '^1:' | cut -c 4-20 |cut -d ':' -f 1)'
NET_INTERFACE1='$(ip link | grep '^2:' | cut -c 4-20 |cut -d ':' -f 1)'
NET_INTERFACE2='$(ip link | grep '^3:' | cut -c 4-20 |cut -d ':' -f 1)'
NET_ADDRESS=''
NET_GATEWAY=''
NET_DNS0=''
NET_DNS1=''


###########
# Clé SSH #
###########
SSH_KEY=''

##################
# User & Groupes #
##################
USER=''
GROUP=''

################
# Mot de passe #
################
PASS=''

##################
# ID USER, Group #
##################
UID=''
GUID=''

###############
# APPZ: SAMBA #
###############
APPZ_SAMBA_USER=''
APPZ_SAMBA_PASS=''" > environment; clear; cat environment

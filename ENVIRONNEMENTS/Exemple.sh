######################################################
# Script de déclaration de variables d'environnement #
######################################################
#
# echo "echo \$1" > test.sh; sh test.sh A
#
#
# Vider les variables Environnements
echo '' > ./environment.sh ;



echo "##############################
# Information sur le Système #
##############################
echo DISTRIB=\$1
echo RELEASE=\$2
#############################
# Information de la Machine #
#############################
echo HOSTNAME=\$3
echo DOMAINE=\$4
echo REGION=\$5
echo VILLE=\$6
echo LANGUE=\$7

#########################
# Information le Réseau #
#########################

# Récupérer Nom Interface:
echo NET_LOOPBACK=$(ip link | grep '^1:' | cut -c 4-20 |cut -d ':' -f 1)
echo NET_INTERFACE1=$(ip link | grep '^2:' | cut -c 4-20 |cut -d ':' -f 1)
echo NET_INTERFACE2=$(ip link | grep '^3:' | cut -c 4-20 |cut -d ':' -f 1)
echo NET_ADDRESS=\$8
echo NET_GATEWAY=\$9
echo NET_DNS0=\$10
echo NET_DNS1=\$11


###########
# Clé SSH #
###########
echo SSH_KEY=\$12

##################
# User & Groupes #
##################
echo USER=\$13
echo GROUP=\$14

################
# Mot de passe #
################
echo PASS=\$15

##################
# ID USER, Group #
##################
echo UID=\$16
echo GUID=\$17

###############
# APPZ: SAMBA #
###############
echo APPZ_SAMBA_USER=\$18
echo APPZ_SAMBA_PASS=\$19
" > environment.sh ; clear; cat environment.sh ;

sh environment.sh <DISTRIB> <RELEASE> <HOSTNAME> <DOMAINE> <REGION> <VILLE> <LANGUE>    <NET_IP>    <NET_GW>    <NET_DNS0> <NET_DNS1>   <KEY>    <USER> <GROUP>        <PASS> <UID> <GID> <SAMBA_USER> <SAMBA_PASS>
sh environment.sh Debian    buster    SLDEBIAN01 LAN       Europe   Paris   fr_FR.UTF-8 192.168.1.X 192.168.1.1 192.168.1.1 192.168.1.1 MAKEYSSH marc   administrateur admin  1001  10001 samba        admin





# $(lsb_release -a | grep '^Codename' | cut -c 11-20)
# $(lsb_release -a | grep '^Distributor' | cut -d ':' -f 2 | cut -c 2-10)

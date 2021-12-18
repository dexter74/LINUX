######################################################
# Script de déclaration de variables d'environnement #
######################################################
#
# echo "echo \$1" > test.sh; sh test.sh A
#
#
# Vider les variables Environnements
echo '' > ./environment.sh ;



echo "
##############################
# Information sur le Système #
##############################
FILE=/etc/environnement_test
rm \$FILE
echo DISTRIB=\$1             > \$FILE
echo RELEASE=\$2            >> \$FILE
echo HOSTNAME=\$3           >> \$FILE
echo DOMAINE=\$4            >> \$FILE
echo REGION=\$5             >> \$FILE
echo VILLE=\$6              >> \$FILE
echo LANGUE=\$7             >> \$FILE
echo NET_ADDRESS=\$8        >> \$FILE
echo NET_GATEWAY=\$9        >> \$FILE
echo NET_DNS0=\$10          >> \$FILE
echo NET_DNS1=\$11          >> \$FILE
echo SSH_KEY=\$12           >> \$FILE
echo USER=\$13              >> \$FILE
echo GROUP=\$14             >> \$FILE
echo PASS=\$15              >> \$FILE
echo UID=\$16               >> \$FILE
echo GUID=\$17              >> \$FILE
echo APPZ_SAMBA_USER=\$18   >> \$FILE
echo APPZ_SAMBA_PASS=\$19   >> \$FILE

echo NET_LOOPBACK=$(ip link | grep '^1:' | cut -c 4-20 |cut -d ':' -f 1)   >> \$FILE
echo NET_INTERFACE1=$(ip link | grep '^2:' | cut -c 4-20 |cut -d ':' -f 1) >> \$FILE
echo NET_INTERFACE2=$(ip link | grep '^3:' | cut -c 4-20 |cut -d ':' -f 1) >> \$FILE
" > environment.sh ; clear; cat environment.sh ;


# sh environment.sh <DISTRIB> <RELEASE> <HOSTNAME> <DOMAINE> <REGION> <VILLE> <LANGUE>    <NET_IP>    <NET_GW>    <NET_DNS0> <NET_DNS1>   <KEY>    <USER> <GROUP>        <PASS> <UID> <GID> <SAMBA_USER> <SAMBA_PASS>


# Création du fichier /etc/environnement_test
sh environment.sh Debian buster SLDEBIAN01 LAN Europe Paris fr_FR.UTF-8 192.168.1.40 192.168.1.1 192.168.1.1 192.168.1.1 MAKEYSSH marc administrateur admin 1001 10001 samba admin ; clear ; cat /etc/environnement_test







# $(lsb_release -a | grep '^Codename' | cut -c 11-20)
# $(lsb_release -a | grep '^Distributor' | cut -d ':' -f 2 | cut -c 2-10)

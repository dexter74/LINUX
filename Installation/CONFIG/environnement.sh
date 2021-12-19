######################################################
# Script de déclaration de variables d'environnement #
######################################################
#
######################################################################################################################################################################################################
# /etc/profile charge les scripts /etc/profile.d/*.sh
# test.sh <DISTRIB> <release> <hostname> <domaine> <region> <ville> <langue> <IPV4> <Passerelle> <DNS 0> <DNS 1> <USERNAME> <GROUP> <PASSWOD> <USER ID> <GROUP ID> <SAMBA USER> <SAMBA PASS>
######################################################################################################################################################################################################

# rm test.sh; nano test.sh; sh test.sh;

echo VALEUR=\'$1\' > RESULT


clear;
#Fichier Profil: /etc/profile.d/ENVIRONNEMENT.sh
SYSOUT=out
echo "" > $SYSOUT
echo ############################## >> out
echo # Information sur le Système # >> out
echo ############################## >> out
echo export DISTRIB=\'$1\' >> out
echo export RELEASE=\'$2\' >> out
echo export HOSTNAME=\'$3\' >> out
echo export DOMAINE=\'$4\' >> out
echo export REGION=\'$5\' >> out
echo export VILLE=\'$6\' >> out
echo export LANGUE=\'$7\' >> out
echo export SSH_KEY=\'MAKEY\' >> out
echo ############################ >> out
echo # Information sur le Rseau # >> out
echo ############################ >> out
echo export NET_LOOPBACK=\'$(ip link   | grep '^1:' | cut -c 4-20 |cut -d ':' -f 1)\' >> out
echo export NET_INTERFACE1=\'$(ip link | grep '^2:' | cut -c 4-20 |cut -d ':' -f 1)\' >> out
echo export NET_INTERFACE2=\'$(ip link | grep '^3:' | cut -c 4-20 |cut -d ':' -f 1)\' >> out
echo export NET_ADDRESS=\'$8\' >> out
echo export NET_GATEWAY=\'$9\' >> out
echo export NET_DNS0=\'$10\' >> out
echo export NET_DNS1=\'$11\' >> out
echo ############################ >> out
echo # Information sur le Rseau # >> out
echo ############################ >> out
echo export USER=\'$12\' >> out
echo export GROUP=\'$13\' >> out
echo export PASS=\'$14\' >> out
echo export USER_ID=\'$15\' >> out
echo export GROUP_UID=\'$16\' >> out
echo export APPZ_SAMBA_USER=\'$17\' >> out
echo export APPZ_SAMBA_PASS=\'$18\' >> out


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
#Fichier Profil:
SYSOUT=/etc/profile.d/ENVIRONNEMENT.sh

echo '##############################  '
echo '# Information sur le Système #  '
echo '##############################  '
echo 'export DISTRIB='$1'             '
echo 'export RELEASE='$2'             '
echo 'export HOSTNAME='$3'            '
echo 'export DOMAINE='$4'             '
echo 'export REGION='$5'              '
echo 'export VILLE='$6'               '
echo 'export LANGUE='$7'              '
echo 'export SSH_KEY='XXX'            '
echo '############################    '
echo '# Information sur le Rseau #    '
echo '############################    '
echo 'export NET_ADDRESS='$8'         '
echo 'export NET_GATEWAY='$9'         '
echo 'export NET_DNS0='$10'           '
echo 'export NET_DNS1='$11'           '
echo '############################    '
echo '# Information sur le Rseau #    '
echo '############################    '
echo 'export USER='$12'               '
echo 'export GROUP='$13'              '
echo 'export PASS='$14'               '
echo 'export USER_ID='$15'            '
echo 'export GROUP_UID='$16'          '
echo 'export APPZ_SAMBA_USER='$17'    '
echo 'export APPZ_SAMBA_PASS='$18'    '


#echo 'export NET_LOOPBACK=$(ip link   | grep "^1:" | cut -c 4-20 |cut -d ":" -f 1)
#echo 'export NET_INTERFACE1=$(ip link | grep "^2:" | cut -c 4-20 |cut -d ":" -f 1)
#echo 'export NET_INTERFACE2=$(ip link | grep "^3:" | cut -c 4-20 |cut -d ":" -f 1)

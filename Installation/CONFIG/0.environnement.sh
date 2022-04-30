######################################################
# Script de déclaration de variables d'environnement #
######################################################
#
######################################################################################################################################################################################################
# /etc/profile charge les scripts /etc/profile.d/*.sh
# test.sh <DISTRIB> <release> <hostname> <domaine> <region> <ville> <langue> <IPV4> <Passerelle> <DNS 0> <DNS 1> <USERNAME> <GROUP> <PASSWOD> <USER ID> <GROUP ID> <SAMBA USER> <SAMBA PASS>
######################################################################################################################################################################################################

#Fichier Profil:
SYSOUT=/etc/profile.d/ENVIRONNEMENT.sh



echo '##############################'  > $SYSOUT
echo '# Information sur le Système #' >> $SYSOUT
echo '##############################' >> $SYSOUT
echo export SYSOUT=\'/etc/profile.d/ENVIRONNEMENT.sh\' >> $SYSOUT
echo export DISTRIB=\'$1\' >> $SYSOUT
echo export RELEASE=\'$2\' >> $SYSOUT
echo export HOSTNAME=\'$3\' >> $SYSOUT
echo export DOMAINE=\'$4\' >> $SYSOUT
echo export REGION=\'$5\' >> $SYSOUT
echo export VILLE=\'$6\' >> $SYSOUT
echo export LANGUE=\'$7\' >> $SYSOUT
echo export SSH_KEY=\'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAs+2hvOiFJvMh7Tdmle+bAYLwEyErLFYE74ljUny/2D2zl6XTZmBw7JEdD3H9mXqeJTk/BGEa2Sn4G0OkwrYH6xnXlwsLRB1Wosa2Q2vX1vG1MxU6e/t7ngsQ74wHGj6Nq5hNZP7EfTfTA6Jo26k9BU5+qj1C4Oq9uvurZuwVl9MYVX59CQb5jKIqgB/obllICqNaGk+msxDSEKh2gFzcEHLa0Kf8R6t+z1m79M+X5I0SLosQluc4edfj77Y3OqPNBooDt5i3MqAJWvzagGStQN2RSs3LUPaMSMleew2qKZEHRzl9u75MaAtKIpH7qe4xHPprDXAF1bKIa2PTNRv9HQ== teste74@hotmail.fr\' >> $SYSOUT
echo '#' >> $SYSOUT
echo '#############################' >> $SYSOUT
echo '# Information sur le Reseau #' >> $SYSOUT
echo '#############################' >> $SYSOUT
echo export NET_LOOPBACK=\'$(ip link   | grep '^1:' | cut -c 4-20 |cut -d ':' -f 1)\' >> $SYSOUT
echo export NET_INTERFACE1=\'$(ip link | grep '^2:' | cut -c 4-20 |cut -d ':' -f 1)\' >> $SYSOUT
echo export NET_INTERFACE2=\'$(ip link | grep '^3:' | cut -c 4-20 |cut -d ':' -f 1)\' >> $SYSOUT
echo export NET_ADDRESS=\'$8\' >> $SYSOUT
echo export NET_GATEWAY=\'$9\' >> $SYSOUT
echo export NET_DNS0=\'${10}\' >> $SYSOUT
echo export NET_DNS1=\'${11}\' >> $SYSOUT
echo '#' >> $SYSOUT
echo '############################' >> $SYSOUT
echo '# Information sur les USER #' >> $SYSOUT
echo '############################' >> $SYSOUT
echo export USER=\'$12\' >> $SYSOUT
echo export PASS=\'$13\' >> $SYSOUT
echo export GROUP=\'$14\' >> $SYSOUT
echo export USER_ID=\'$15\' >> $SYSOUT
echo export GROUP_UID=\'$16\' >> $SYSOUT
echo '#' >> $SYSOUT
echo '##########################' >> $SYSOUT
echo '# Configuration des APPZ #' >> $SYSOUT
echo '##########################' >> $SYSOUT
echo export SAMBA_USER=\'$17\' >> $SYSOUT
echo export SAMBA_PASS=\'$18\' >> $SYSOUT

########################
# Afficher le Résultat #
########################
clear ;
cat $SYSOUT;

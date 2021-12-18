######################################################
# Script de déclaration de variables d'environnement #
######################################################

# Vider les variables Environnements
echo '' > /etc/environment ;

#############################
# Information de la Machine #
#############################
export HOSTNAME=
export DOMAINE=
export TIMEZONE=
export REGION=Europe
export VILLE=Paris
export LANGUE=fr_FR.UTF-8

#########################
# Information le Réseau #
#########################

export NET_LOOPBACK=$(ip link | grep "^1:" | cut -c 4-20 |cut -d ":" -f 1)
export NET_INTERFACE1=$(ip link | grep "^2:" | cut -c 4-20 |cut -d ":" -f 1)
export NET_INTERFACE2=$(ip link | grep "^3:" | cut -c 4-20 |cut -d ":" -f 1)
export NET_ADDRESS=$(ip add | cut -c 10-30 | grep "192" | cut -d " " -f 1)
export NET_GATEWAY=$(ip add | cut -c 10-18 | grep "192").1
export NET_DNS0=$(ip add | cut -c 10-18 | grep "192").1
export NET_DNS1=$(ip add | cut -c 10-18 | grep "192").40

###########
# Clé SSH #
###########
export SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAs+2hvOiFJvMh7Tdmle+bAYLwEyErLFYE74ljUny/2D2zl6XTZmBw7JEdD3H9mXqeJTk/BGEa2Sn4G0OkwrYH6xnXlwsLRB1Wosa2Q2vX1vG1MxU6e/t7ngsQ74wHGj6Nq5hNZP7EfTfTA6Jo26k9BU5+qj1C4Oq9uvurZuwVl9MYVX59CQb5jKIqgB/obllICqNaGk+msxDSEKh2gFzcEHLa0Kf8R6t+z1m79M+X5I0SLosQluc4edfj77Y3OqPNBooDt5i3MqAJWvzagGStQN2RSs3LUPaMSMleew2qKZEHRzl9u75MaAtKIpH7qe4xHPprDXAF1bKIa2PTNRv9HQ== teste74@hotmail.fr"

##################
# User & Groupes #
##################
export USER=
export GROUP=

################
# Mot de passe #
################
export PASS=

##################
# ID USER, Group #
##################
export UID=
export GUID=


###############
# APPZ: SAMBA #
###############
export APPZ_SAMBA_USER=
export APPZ_SAMBA_PASS=




echo "####### Interface $NET_INTERFACE1 #######
 - CIDR     : $NET_ADDRESS 
 - GateWay  : $NET_GATEWAY
 - DNS0     : $NET_DNS0
 - DNS1     : $NET_DNS1
 - Domaine  : $DOMAINE
###############################"

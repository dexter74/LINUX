##################################################
# Script de Configuration des Interfaces Réseaux #
##################################################

################################
# Desactiver le protocole IPV6 #
################################

if [ -z $1 ]
# ----------------------------
 then
 echo "Argument valide: DHCP, STATIC"
# ----------------------------
 elif [ $1 = "DHCP" ]
  then
clear;
echo "#########################
# Interface de bouclage #
#########################
auto $NET_LOOPBACK
iface $NET_LOOPBACK inet loopback
#
######################
# Interface Physique #
######################
auto $NET_INTERFACE1
allow-hotplug $NET_INTERFACE1
iface $NET_INTERFACE1 inet dhcp" > /etc/network/interfaces;
cat  /etc/network/interfaces ;
# ----------------------------
 elif [ $1 = "STATIC" ]
  then
clear;
echo "#########################
# Interface de bouclage #
#########################
auto $NET_LOOPBACK
iface $NET_LOOPBACK inet loopback

######################
# Interface Physique #
######################
auto $NET_INTERFACE1
allow-hotplug $NET_INTERFACE1

iface $NET_INTERFACE1 inet static
  address $NET_ADDRESS
  netmask 255.255.255.0
  broadcast 192.168.1.255
  gateway $NET_GATEWAY
  dns-nameservers $DOMAINE" > /etc/network/interfaces;
cat  /etc/network/interfaces ;


# ----------------------------
 elif [ $1 = "IV6_OFF" ]
  then
   echo "net.ipv6.conf.all.disable_ipv6 = 1" > /etc/sysctl.d/70-disable-ipv6.conf ;
# ----------------------------
 else
 echo "Script en Erreur"
# ----------------------------
fi



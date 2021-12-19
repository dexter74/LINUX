##################################################
# Script de Configuration des Interfaces Réseaux #
##################################################


################################
# Desactiver le protocole IPV6 #
################################
echo "net.ipv6.conf.all.disable_ipv6 = 1" > /etc/sysctl.d/70-disable-ipv6.conf ;

#####################################################
# Configuration des Interfaces Réseaux en mode DHCP #
#####################################################
if [ "$1" = "DHCP" ]
 then
  clear;
  echo "# Interface de bouclage
auto $NET_LOOPBACK
iface $NET_LOOPBACK inet loopback
#
# Interface Physique
auto $NET_INTERFACE1
allow-hotplug $NET_INTERFACE1
iface $NET_INTERFACE1 inet dhcp" > /etc/network/interfaces;
cat  /etc/network/interfaces ;
 else
  echo "Merci d'indiquer un parametre: DHCP, STATIC"
fi

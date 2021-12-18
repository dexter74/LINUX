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
echo "# Interface de bouclage
auto $NET_LOOPBACK
iface $NET_LOOPBACK inet loopback
#
# Interface Lan
auto $NET_INTERFACE1
allow-hotplug $NET_INTERFACE1
iface $NET_INTERFACE1 inet dhcp" > /etc/network/interfaces ;



####################################################
# Configuration des Interfaces Réseaux en Statique #
####################################################
#echo "# Interface de bouclage
#auto lo
#iface lo inet loopback
#
# Interface Lan (iface $INTERFACE_NAME inet dhcp)
#auto $INTERFACE_NAME
#allow-hotplug $INTERFACE_NAME
#iface $INTERFACE_NAME inet static
#address $INTERFACE_ADDRESS
#netmask $INTERFACE_MASK
#broadcast $INTERFACE_BROADCAST
#gateway $INTERFACE_GATEWAY
#dns-nameservers $INTERFACE_DNS0 $INTERFACE_DNS1" > /etc/network/interfaces ;
#echo "dns-search $INTERFACE_DOMAINE" >> /etc/network/interfaces ;


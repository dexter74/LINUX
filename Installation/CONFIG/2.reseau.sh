##################################################
# Script de Configuration des Interfaces Réseaux #
##################################################

# ./2.reseau.sh <Argument>

# ------------------------------------------------------------------------------------
if [ -z $1 ]
 then
  clear;
  echo "Argument valide: DHCP, STATIC, IPV6, CHECK"
# ------------------------------------------------------------------------------------
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


# ------------------------------------------------------------------------------------
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


# ------------------------------------------------------------------------------------
 elif [ $1 = "IPV6" ]
  then
   echo "net.ipv6.conf.all.disable_ipv6 = 1" > /etc/sysctl.d/70-disable-ipv6.conf ;
  

# ------------------------------------------------------------------------------------
 elif [ $1 = "CHECK" ]
  then
   clear;
   cat /etc/network/interfaces ;
   echo "---------------------";
   cat /etc/sysctl.d/70-disable-ipv6.conf | grep "^net.ipv6.conf.all.disable_ipv6";


# ------------------------------------------------------------------------------------
 else
 echo "Script en Erreur"
# ----------------------------
fi

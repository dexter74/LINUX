###################################
# Script de Configuration du Host #
###################################

hostnamectl set-hostname $HOSTNAME ;


#######################################
# Script de Configuration du Hostname #
#######################################
echo "#IPV4
127.0.0.1       localhost
127.0.1.1       $HOSTNAME        $HOSTNAME
#127.0.1.1      $HOSTNAME.$DOMAINE    $HOSTNAME
$NET_ADDRESS    $HOSTNAME.$DOMAINE    $HOSTNAME

#IPV6 (OFF)
::1     localhost ip6-localhost ip6-loopback
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters" > /etc/hosts;

clear; cat /etc/hosts; cat /etc/hostname;

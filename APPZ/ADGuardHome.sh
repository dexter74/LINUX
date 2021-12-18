###########################
# Déploiement ADGuardHOme #
###########################

# sh ./ADGuardHome.sh <CLEAN> <DOWNLOAD> <ACTION>



CLEAN=$1
DOWNLOAD=$2
ACTION=$3


# Etat du service:
# - install
# - status
# - start
# - stop
# - uninstall


################################################################################################################################
CLEAN()
 {
 clear;
 /opt/AdGuardHome/AdGuardHome -s uninstall;
 rm -r $DOSSIER/AdGuardHome;
 }

################################################################################################################################
DOWNLOAD()
 {
 wget https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz -O /tmp/AdGuardHome_linux_amd64.tar.gz ;
 tar -xf '/tmp/AdGuardHome_linux_amd64.tar.gz' -C /opt;
 }
################################################################################################################################
SERVICE()
 {
 /opt/AdGuardHome/AdGuardHome -s $3;
 }

################################################################################################################################


if [ "$CLEAN" == "1" ]
 then
  echo "Condition CLEAN OK"
 else
  echo "Condition CLEAN KO"
fi


if [ "$DOWNLOAD" == "1" ]
 then
  echo "Condition Download OK"
 else
  echo "Condition Download KO"
fi

if [ "$ACTION" == "1" ]
 then
echo "Condition Action $3"
 else
  echo "Condition Action KO"
fi

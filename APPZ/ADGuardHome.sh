################################################
# ./ADGuardHome.sh <CLEAN> <DOWNLOAD> <ACTION> #
################################################
clear;

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
 /opt/AdGuardHome/AdGuardHome -s ??;
 }
################################################################################################################################



###########################
# Déclaration de Variable #
###########################
# Etat du service:
# - install
# - status
# - start
# - stop
# - uninstall



if [ -z $1 ]
 then
  echo 'Paramètre: DL, INSTALL, UNINSTALL, START, STOP'

 elif [ "$1" = "DL" ]
  then
   echo "Lancement: Téléchargement"

 elif [ "$1" = "INSTALL" ]
  then
   echo "Lancement: INSTALL"

 elif [ "$1" = "UNINSTALL" ]
  then
   echo "Lancement: UNINSTALL"
   
 elif [ "$1" = "START" ]
  then
   echo "Lancement: START"


 elif [ "$1" = "STOP" ]
  then
   echo "Lancement: STOP"

 else
  echo 'KO'
fi



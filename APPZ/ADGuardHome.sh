################################################
# ./ADGuardHome.sh <CLEAN> <DOWNLOAD> <ACTION> #
################################################
clear;

################################################################################################################################
CLEAN()
 {
 clear;
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


# ------------------------------------------------------------------------------------------------------------------------------------
if [ -z $1 ]
 then
  echo 'Merci de préciser un paramètre (PURGE, DL, ENABLE, DISABLE, START, STOP)'
# --------------------------------------------

 elif [ "$1" = "PURGE" ]
  then
   /opt/AdGuardHome/AdGuardHome -s uninstall;
   rm -r /opt/AdGuardHome;
# --------------------------------------------

elif [ "$1" = "DL" ]
  then
   wget https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz -O /tmp/AdGuardHome_linux_amd64.tar.gz ;
   tar -xf /tmp/AdGuardHome_linux_amd64.tar.gz -C /opt;
# --------------------------------------------

 elif [ "$1" = "ENABLE" ]
  then
   /opt/AdGuardHome/AdGuardHome -s install
# --------------------------------------------
 elif [ "$1" = "DISABLE" ]
  then
   /opt/AdGuardHome/AdGuardHome -s uninstall
# ----------------------------
 elif [ "$1" = "START" ]
  then
   /opt/AdGuardHome/AdGuardHome -s start
# --------------------------------------------
 elif [ "$1" = "STOP" ]
  then
   /opt/AdGuardHome/AdGuardHome -s stop
 else
  echo 'Le paramètre $1 est inconnu'
fi
# ------------------------------------------------------------------------------------------------------------------------------------

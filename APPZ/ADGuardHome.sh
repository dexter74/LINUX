################################################
# ./ADGuardHome.sh <CLEAN> <DOWNLOAD> <ACTION> #
################################################
clear;
# --------------------------------------------------------------------------------------------------------------------------------
if [ -z $1 ]
 then
  echo 'Merci de preciser un parametre (PURGE, DL, INSTALL, ENABLE, DISABLE, START, STOP, STATUS)'
# --------------------------------------------
 elif [ "$1" = "PURGE" ]
  then
   clear;
   /opt/AdGuardHome/AdGuardHome -s uninstall
   rm -r /opt/AdGuardHome
# -------------------------------------------
 elif [ "$1" = "DL" ] || [ "$1" = "DOWNLOAD" ]
  then
   clear;
   wget https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz -O /tmp/AdGuardHome_linux_amd64.tar.gz
   tar -xf /tmp/AdGuardHome_linux_amd64.tar.gz -C /opt
# --------------------------------------------
# || Signifie OR
 elif [ "$1" = "INSTALL" ] || [ "$1" = "ENABLE" ]
  then
   clear;
   /opt/AdGuardHome/AdGuardHome -s install
# --------------------------------------------
 elif [ "$1" = "DISABLE" ]
  then
   /opt/AdGuardHome/AdGuardHome -s uninstall
# ----------------------------
 elif [ "$1" = "START" ]
  then
   clear;
   /opt/AdGuardHome/AdGuardHome -s start
# --------------------------------------------
 elif [ "$1" = "STOP" ]
  then
   clear;
   /opt/AdGuardHome/AdGuardHome -s stop
# --------------------------------------------
 elif [ "$1" = "STATUS" ]
  then
   clear;
   /opt/AdGuardHome/AdGuardHome -s status
# --------------------------------------------
 else
  echo "Le parametre '$1' est inconnu"
fi
# --------------------------------------------------------------------------------------------------------------------------------


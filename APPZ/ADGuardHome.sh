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

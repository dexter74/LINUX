########################################################
# Installation de CubeCoders pour les serveurs de Jeux #
########################################################
#
# ./CubeCoders.sh <parametre>
# 1>/dev/null 2>/dev/null
#
# ---------------------------------------------------------------------------------------------------
clear;
# ---------------------------------------------------------------------------------------------------
if [ -z $1 ]
 then
  echo "Merci de preciser un parametre (PAQUETS,......."
# ---------------------------------------------------------------------------------------------------
 elif [ "$1" = "PAQUETS" ]
  then
   apt update 1>/dev/null 2>/dev/null;
   apt install -y apt-transport-https dirmngr software-properties-common sudo 1>/dev/null 2>/dev/null;
   apt-key adv --fetch-keys http://repo.cubecoders.com/archive.key 1>/dev/null 2>/dev/null;
   apt-add-repository "deb http://repo.cubecoders.com/ debian/" 1>/dev/null 2>/dev/null;
   apt update 1>/dev/null 2>/dev/null;
# ---------------------------------------------------------------------------------------------------
 elif [ "$1" = "AMP" ]
  then
   apt install -qq -y ampinstmgr 1>/dev/null 2>/dev/null;
# ---------------------------------------------------------------------------------------------------
 elif [ "$1" = "USER" ]
  then
   clear;
   rm -r /home/amp;
   delgroup supervision;
   deluser amp;
   clear;
   addgroup supervision --gid 74240;
   useradd amp --uid 1074 --home /home/amp/ --create-home --groups supervision --shell /bin/bash; 
   echo "amp:admin" | chpasswd
# ---------------------------------------------------------------------------------------------------
 elif [ "$1" = "DELETE" ]
  then
# ---------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------
else
 echo "Script KO"
fi

















#ampinstmgr stop marc;
#echo marc | ampinstmgr --DeleteInstance marc;
#ampinstmgr --ShowInstancesList;
#ampinstmgr --CreateInstance ADS marc 192.168.1.40 5000 f8e10a81-1d3d-44d2-b178-57c3aeb0a47e Drthrax74 Azerty74 1> /dev/null 2> /dev/null;
#ampinstmgr start marc;
#ampinstmgr --ShowModuleList; # McMyAdmin, Minecraft, Rust, srcds, StarBound, JC2MP, ADS, Arma3, ARK, Factorio SevenDays, Generic, FiveM
#ampinstmgr --ShowInstancesList;
#ampinstmgr View marc;

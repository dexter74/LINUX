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
# ---------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------
else
 echo "Script KO"
fi

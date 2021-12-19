########################################################
# Installation de CubeCoders pour les serveurs de Jeux #
########################################################
#
# ./CubeCoders.sh <parametre>
# 1>NULL 2>NULL
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
   apt update 1>NULL 2>NULL;
   apt install -y apt-transport-https dirmngr software-properties-common sudo;
   apt-key adv --fetch-keys http://repo.cubecoders.com/archive.key;
   apt-add-repository "deb http://repo.cubecoders.com/ debian/"
   apt update 1>NULL 2>NULL;
# ---------------------------------------------------------------------------------------------------
 elif [ "$1" = "AMP" ]
  then
   apt install -qq -y ampinstmgr;
# ---------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------
else
 echo "Script KO"
fi

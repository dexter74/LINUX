########################################################
# Installation de CubeCoders pour les serveurs de Jeux #
########################################################

# ./CubeCoders.sh <parametre>

if [ -z $1 ]
 then
  echo "Merci de preciser un parametre (PAQUETS,......."

 elif [ "$1" = "PAQUETS" ]
  then
   apt update 1>NULL 2>NULL;
   apt upgrade -qq -y 1>NULL 2>NULL;
   apt install -qq -y apt-transport-https dirmngr software-properties-common sudo 1>NULL 2>NULL;
fi

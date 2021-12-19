#######################################################
# Script pour ajouter des Utilisateurs et des Groupes #
#######################################################
if [ -z $1 ]
# ------------------------------------------------------------
 then
  clear;
  echo "Argument Manquant"

# ------------------------------------------------------------
 elif [ $1 = "DELETE" ]
  then
   clear;
   deluser  $2;
   delgroup $3;
   rm -r    /home/$2;

# ------------------------------------------------------------
# $2: Group | $3: Group_ID
 elif [ $1 = "ADD_GROUP" ]
  then
   clear;
   addgroup $2 --gid $3;

# ------------------------------------------------------------
# $2 = USER | $3 USER_ID | $4 GROUP_ID
 elif [ $1 = "ADD_USER" ]
  then
   clear;
   useradd --home-dir /home/$2 \
   --base-dir /home/$2 \
   --uid $3 \
   --gid $4 \
   --groups sudo \
   --no-user-group \
   --shell /bin/bash \
   --create-home /home/$2;

# ------------------------------------------------------------
# $2: USER | $3: PASS
 elif [ $1 = "PASS" ]
  then
   clear
   echo "$2:$3" | chpasswd $2;
   
# ------------------------------------------------------------
# $2: USER
 elif [ $1 = "ROOT" ]
  then
   clear
    echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$2;
# ------------------------------------------------------------
 else
  echo "Argument non reconnu"
# ------------------------------------------------------------
fi

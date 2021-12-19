
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
   echo "Compte supprimé: $2"
   echo "Groupe supprimé: $3"
# ------------------------------------------------------------
 elif [ $1 = "ADD_USER" ]
  then
   clear;
   echo "User: $2 ($4)"
   echo "Pass: $3"
   echo "Groupe: $5 ($6)"

# ------------------------------------------------------------
 else
  echo "Argument non reconnu"
# ------------------------------------------------------------
fi










#############################################
# Suppression: Users & Groups (Home inclus) #
#############################################
deluser  $USER;
delgroup $GROUP;
rm -r    /home/$USER;

##########################################
# Création du Groupe et de l'utilisateur #
##########################################
#########################
addgroup $GROUP --gid $GROUP_UID;
useradd --home-dir /home/$USER --base-dir /home/$USER --uid $UID --gid $GROUP_UID --groups sudo --no-user-group --shell /bin/bash --create-home /home/$USER;

##############################
# Définir les mots de passes #
##############################
echo "$USER:$PASS" | chpasswd $USER;

##############################################
# Ajout du compte utilisateur au groupe Sudo #
##############################################
echo "$USER ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers;

#######################################################
# Script pour ajouter des Utilisateurs et des Groupes #
#######################################################


#############################################
# Suppression: Users & Groups (Home inclus) #
#############################################
deluser  $USER;
delgroup $GROUP;
rm -r    /home/$USER;

#########################
# Ajout: Groups & Users #
#########################
addgroup $GROUP --gid $GUID;

useradd --home-dir /home/$USER --base-dir /home/$USER --uid $UID --gid $GUID --groups sudo --no-user-group --shell /bin/bash --create-home /home/$USER ;

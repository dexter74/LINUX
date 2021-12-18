#######################################################
# Script pour ajouter des Utilisateurs et des Groupes #
#######################################################

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

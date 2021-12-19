####################################################
# Script pour la configuration de la connexion SSH # 
####################################################


if [ -z $1 ]
# ----------------------------------------------------------
 then
  echo "
  - Step 1: Création des dossiers SSH
  - Step 2: Insertion de la Clé SSH sur le serveur
  - Step 3: Modification des permissions
  - Step 4: Configuration de SSHD_config
  - Step 5: Relance du service
  "

# ----------------------------------------------------------
 elif [ $1 = "STEP_1" ]
  then
   echo ""
# ----------------------------------------------------------
 elif [ $1 = "STEP_2" ]
  then
   echo ""
# ----------------------------------------------------------
 elif [ $1 = "STEP_3" ]
  then
   echo ""
# ----------------------------------------------------------
 elif [ $1 = "STEP_4" ]
  then
   echo ""
# ----------------------------------------------------------
 elif [ $1 = "STEP_5" ]
  then
   echo ""
# ----------------------------------------------------------

 else
  echo "Script KO"
fi

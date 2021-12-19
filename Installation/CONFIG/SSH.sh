####################################################
# Script pour la configuration de la connexion SSH #
####################################################


if [ -z $1 ]
# ----------------------------------------------------------
 then
  clear;
  echo "Argument de commande manquant.
  - Step 1: Création des dossiers SSH
  - Step 2: Insertion de la Clé SSH sur le serveur
  - Step 3: Modification des permissions
  - Step 4: Configuration de SSHD_config
  - Step 5: Relance du service
  "

# ----------------------------------------------------------
 elif [ $1 = "STEP_1" ]
  then
   clear;
   echo ""
# ----------------------------------------------------------
 elif [ $1 = "STEP_2" ]
  then
   clear;
   echo ""
# ----------------------------------------------------------
 elif [ $1 = "STEP_3" ]
  then
   clear;
   echo ""
# ----------------------------------------------------------
 elif [ $1 = "STEP_4" ]
  then
   clear;
   echo ""
# ----------------------------------------------------------
 elif [ $1 = "STEP_5" ]
  then
   clear;
   echo ""
# ----------------------------------------------------------
 else
  echo "Script KO"
fi

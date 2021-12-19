####################################################
# Script pour la configuration de la connexion SSH #
####################################################


if [ -z $1 ]
# ----------------------------------------------------------
 then
  clear;
  echo "Argument de commande manquant.
  - STEP_1: Création des dossiers SSH
  - STEP_2: Insertion de la Clé SSH sur le serveur
  - STEP_3: Modification des permissions
  - STEP_4: Backup
  - STEP_5: Recovery
  - STEP_6: Sécurisation du SSH
  - STEP_7: Relance du service
  "

# -------------------------------------------------------------------------------------------
# Création des dossiers SSH
 elif [ $1 = "STEP_1" ]
  then
   clear;
   /sbin/runuser -l root  -c 'mkdir -p /root/.ssh'
   /sbin/runuser -l $USER -c 'mkdir /home/$USER/.ssh' ;
# -------------------------------------------------------------------------------------------
# Insertion de la Clé SSH sur le serveur
 elif [ $1 = "STEP_2" ] 
  then
   clear;
   /sbin/runuser -l root  -c "echo '$SSH_KEY' > /root/.ssh/authorized_keys" ;
   /sbin/runuser -l $USER -c "echo '$SSH_KEY' > /home/$USER/.ssh/authorized_keys" ;

# -------------------------------------------------------------------------------------------
# Modification des permissions
 elif [ $1 = "STEP_3" ]
  then
   clear;
   #Root:
   chmod 700 /root/.ssh ;
   chmod 600 /root/.ssh/authorized_keys ;
   #User:
   chmod 700 /home/$USER/.ssh ;
   chmod 600 /home/$USER/.ssh/authorized_keys ;
# -------------------------------------------------------------------------------------------
# Backup
 elif [ $1 = "STEP_4" ]
  then
   clear;
   cp /etc/ssh/sshd_config /etc/ssh/sshd_config.old;

# -------------------------------------------------------------------------------------------
# Recovery
 elif [ $1 = "STEP_5" ]
  then
   clear;
   cp /etc/ssh/sshd_config.old /etc/ssh/sshd_config;
# -------------------------------------------------------------------------------------------
# Sécurisation du SSH
 elif [ $1 = "STEP_6" ]
  then
   clear;
   # Limiter l'accès SSH au Groupe / USER suivant:
   echo "AllowUsers $USER root" >>                                     /etc/ssh/sshd_config;
   echo "AllowGroups $GROUP root" >>                                   /etc/ssh/sshd_config;

   # Fichier contenant les Clés SSH
   sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/g'                 /etc/ssh/sshd_config;

   # Fermer les connexions Zombie
   echo "KeepAlive no"            >>                                   /etc/ssh/sshd_config;

   # Ecouter une interface réseau
   sed -i 's/#ListenAddress ::/ListenAddress '$NET_ADDRESS'/g'         /etc/ssh/sshd_config;

   # Le serveur se déconnect si la connexion après X secondes
   sed -i 's/#LoginGraceTime 2m/LoginGraceTime 2m/g'                   /etc/ssh/sshd_config;

   # Authentification par Mot de passe (Yes à NO)
   sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g'  /etc/ssh/sshd_config;

   # Autoriser Connexion sans Mot de passe
   sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/g'       /etc/ssh/sshd_config;

   # Authentification du Root
   sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config;

   # Définir emplacement PID
   sed -i 's/#PidFile/PidFile/g'                                       /etc/ssh/sshd_config;

   # Changer le port d'écouter SSH
   sed -i 's/#Port 22/Port 22/g'                                       /etc/ssh/sshd_config;

   # Afficher la Dernière Connexion
   sed -i 's/#PrintLastLog yes/PrintLastLog yes/g'                     /etc/ssh/sshd_config;

   # Authentication par clé SSH
   sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g'     /etc/ssh/sshd_config;

   # Vérifier Permissions Home à la connexion
   sed -i 's/#StrictModes yes/StrictModes yes/g'                       /etc/ssh/sshd_config;

   echo "Sécurisation Terminé";
# -------------------------------------------------------------------------------------------
# Relance du service
 elif [ $1 = "STEP_7" ]
  then
   clear;
   systemctl restart ssh;
# -------------------------------------------------------------------------------------------
 else
  echo "Script KO"
fi


# ChallengeResponseAuthentication
# Ciphers
# ClientAliveInterval
# ClientAliveCountMax
# GatewayPorts


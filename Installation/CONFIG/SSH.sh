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
  - STEP_4: Configuration de SSHD_config
  - STEP_5: Relance du service
  - STEP_6: Backup
  - STEP_7: Recovery
  "

# ----------------------------------------------------------
 elif [ $1 = "STEP_1" ]
  then
   clear;
   /sbin/runuser -l root  -c 'mkdir -p /root/.ssh'
   /sbin/runuser -l $USER -c 'mkdir /home/$USER/.ssh' ;
# ----------------------------------------------------------
 elif [ $1 = "STEP_2" ]
  then
   clear;
   /sbin/runuser -l root  -c "echo '$SSH_KEY' > /root/.ssh/authorized_keys" ;
   /sbin/runuser -l $USER -c "echo '$SSH_KEY' > /home/$USER/.ssh/authorized_keys" ;

# ----------------------------------------------------------
 elif [ $1 = "STEP_3" ]
  then
   clear;
   #Root:
   chmod 700 /root/.ssh ;
   chmod 600 /root/.ssh/authorized_keys ;
   #User:
   chmod 700 /home/$USER/.ssh ;
   chmod 600 /home/$USER/.ssh/authorized_keys ;
# ----------------------------------------------------------
 elif [ $1 = "STEP_4" ]
  then
   clear;
   sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config ;
   sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile /g' /etc/ssh/sshd_config ;
   sed -i 's/#PidFile/PidFile /g' /etc/ssh/sshd_config ;
   sed -i 's/#PrintLastLog/PrintLastLog /g' /etc/ssh/sshd_config ;
   sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config ;
   sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config ;
   sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config ;
   #sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config ;

# ----------------------------------------------------------
 elif [ $1 = "STEP_5" ]
  then
   clear;
   systemctl restart ssh ;
   systemctl restart sshd ;

# ----------------------------------------------------------
 elif [ $1 = "STEP_6" ]
  then
   clear;
   cp /etc/ssh/sshd_config /etc/ssh/sshd_config.old;

# ----------------------------------------------------------
 elif [ $1 = "STEP_7" ]
  then
   clear;
    cp /etc/ssh/sshd_config.old /etc/ssh/sshd_config;


# ----------------------------------------------------------
 elif [ $1 = "RESET" ]
  then
   clear;
   sed -i 's/PubkeyAuthentication yes/#PubkeyAuthentication yes/g'    /etc/ssh/sshd_config ;
   sed -i 's/AuthorizedKeysFile/#AuthorizedKeysFile/g'                /etc/ssh/sshd_config ;
   sed -i 's/PidFile/#PidFile/g'                                      /etc/ssh/sshd_config ;
   sed -i 's/PrintLastLog/#PrintLastLog/g'                            /etc/ssh/sshd_config ;
   sed -i 's/PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config ;
   sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config ;
   sed -i 's/PermitRootLogin yes/PermitRootLogin yes/g'               /etc/ssh/sshd_config ;
   #sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config ;
   
   

# ----------------------------------------------------------
 else
  echo "Script KO"
fi

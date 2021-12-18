####################################################
# Script pour la configuration de la connexion SSH # 
####################################################3

# Creation du dossier ssh
runuser -l root  -c 'mkdir -p /root/.ssh';
runuser -l $USER -c 'mkdir -p '/home/$USER'/.ssh';
#
#Insertion des cles SSH
runuser -l root -c "echo '$SSH_KEY' > /root/.ssh/authorized_keys";
runuser -l $USER -c "echo '$SSH_KEY' > /home/$USER/.ssh/authorized_keys";
#
# Permission sur le dossier SSH
chmod 700 /root/.ssh ;
chmod 600 /root/.ssh/authorized_keys;
#
chmod 700 /home/$USER/.ssh;
chmod 600 /home/$USER/.ssh/authorized_keys;
#
#
################################################################
# Configuration du service SSH pour l'authentification par cle #
################################################################
#
# Authentification par cle autoriser
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config;
#
# SSH par le fichier AuthorizedKeysFile ...
sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile /g' /etc/ssh/sshd_config;
#
# Spécifie l'emplacement du fichier contenant l'identifiant du processus du démon sshd (Par défaut /var/run/sshd.pid)
sed -i 's/#PidFile/PidFile /g' /etc/ssh/sshd_config;
#
# Afficher la date et l'heure de la dernière connexion de l'utilisateur. 
sed -i 's/#PrintLastLog/PrintLastLog /g' /etc/ssh/sshd_config;
#
# Refuser l'Authentification par mot de passe
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config;
#
# Refuser l'accès au root par mot de passe
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config;
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config ;
#
# Hors-Prod: sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config;
#
#
# Relance du SSH : 
systemctl restart ssh ; systemctl restart sshd;
#
####################################
# Configurer le fichier SSH_config #
####################################
#
# Autoriser les ajouts des clés automatiquement (https://unix.stackexchange.com/questions/33271/how-to-avoid-ssh-asking-permission)
sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking accept-new/g' /etc/ssh/ssh_config ;
#
# N'autoriser que le protocole 2:
sed -i 's/#   Protocol 2/Protocol 2/g' /etc/ssh/ssh_config;
#
grep "PermitRootLogin yes\|PermitRootLogin no\|PubkeyAuthentication\|AuthorizedKeysFile\|PidFile" /etc/ssh/sshd_config ;





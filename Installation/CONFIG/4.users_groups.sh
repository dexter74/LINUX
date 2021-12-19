#######################################################
# Script pour ajouter des Utilisateurs et des Groupes #
#######################################################
if [ -z $1 ]
# ------------------------------------------------------------
 then
  clear;
	echo "Argument Disponible:
	- DEL_USER       \$USER
	- DEL_USER_HOME  \$USER
	- DEL_GROUP      \$GROUP
	- ADD_GROUP      \$GROUP \$GROUP_UID
	- ADD_USER       \$USER  \$GROUP_UID user sudo
	- DEL_USER_GROUP \$USER  \$GROUP
	- ADD_USER_GROUP \$USER  \$GROUP
	- PASSWORD       \$USER  \$PASS
	- CHECK          \$USER
	- ADD_SUDOER	 \$USER
	- DEL_SUDOER	 \$USER
	"


# ------------------------------------------------------------
 elif [ $1 = "DEL_USER" ]
  then
   clear;
	deluser $2;


# ------------------------------------------------------------
 elif [ $1 = "DEL_USER_HOME" ]
  then
   clear;
	rm -r /home/$2;


# ------------------------------------------------------------
 elif [ $1 = "DEL_GROUP" ]
  then
   clear;
    delgroup $2;


# ------------------------------------------------------------
 elif [ $1 = "ADD_GROUP" ]
  then
   clear;
    addgroup $2 --gid $3 ;


# ------------------------------------------------------------
 elif [ $1 = "ADD_USER" ]
  then
   clear;
    useradd \
      --home-dir /home/$2 \
      --base-dir /home/$2 \
      --uid $3 \
      --gid $4 \
      --groups $5 \
      --no-user-group \
      --shell /bin/bash \
      --create-home $2;

# ------------------------------------------------------------
 elif [ $1 = "DEL_USER_GROUP" ]
  then
   clear;
    deluser $2 $3;

# ------------------------------------------------------------
 elif [ $1 = "ADD_USER_GROUP" ]
  then
   clear;
    adduser $2 $3;

# ------------------------------------------------------------
 elif [ $1 = "PASSWORD" ]
  then
   clear;
    echo "$2:$3" | chpasswd ;

# ------------------------------------------------------------
 elif [ $1 = "DEL_SUDOER" ]
  then
   clear;
	rm /etc/sudoers.d/$2;

# ------------------------------------------------------------
 elif [ $1 = "ADD_SUDOER" ]
  then
   clear;
    echo "$2 ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$2;

# ------------------------------------------------------------
 elif [ $1 = "CHECK" ]
  then
   clear;
    id $2; groups $2;
	cat /etc/sudoers.d/$2;


# ------------------------------------------------------------
 else
  echo "Argument non reconnu";
# ------------------------------------------------------------
fi




# Syntaxe:
# console
# sh ./config/3.users_groups.sh DEL_USER <USER>;
# sh ./config/3.users_groups.sh DEL_USER_HOME <USER>;
# sh ./config/3.users_groups.sh DEL_GROUP <GROUP>;
# sh ./config/3.users_groups.sh ADD_GROUP <GROUP> <GID>;
# sh ./config/3.users_groups.sh ADD_USER <USER> <UID> <GROUP PRIMAIRE> <GROUP SECONDAIRE>;
# sh ./config/3.users_groups.sh CHECK <USER>;
# sh ./config/3.users_groups.sh DEL_USER_GROUP <USER> <GROUPE SECONDAIRE>;
# sh ./config/3.users_groups.sh ADD_USER_GROUP <USER> <GROUPE SECONDAIRE>;
# sh ./config/3.users_groups.sh PASSWORD <USER> <PASS>;;=
# sh ./config/3.users_groups.sh DEL_SUDOER <USER>;
# sh ./config/3.users_groups.sh ADD_SUDOER <USER>;


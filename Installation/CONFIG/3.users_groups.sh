#######################################################
# Script pour ajouter des Utilisateurs et des Groupes #
#######################################################
if [ -z $1 ]
# ------------------------------------------------------------
 then
  clear;
  echo "Argument Manquant:
  - DELETE    <USER> <GROUP>
  - ADD_GROUP <GID>  <GROUP>
  - ADD_USER  <USER> <UID> <GID>
  - PASS      <USER> <NEw_PASS>
  - ROOT      <USER> (Expérimental)
  - CHECK     <USER> <GROUP>
  "


# ------------------------------------------------------------
 elif [ $1 = "DELETE" ]
  then
   clear;
   deluser  $2;
   delgroup $3;
   rm -r    /home/$2;


# ------------------------------------------------------------
# $2: Group_ID | $3: Group
 elif [ $1 = "ADD_GROUP" ]
  then
   clear;
   groupadd -g $2 $3;


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
   clear;
   echo "$2:$3" | chpasswd $2;

# ------------------------------------------------------------
# $2: USER
 elif [ $1 = "ROOT" ]
  then
   clear
    echo "$2 ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$2;


# ------------------------------------------------------------
# $2: USER | $3 Group
 elif [ $1 = "CHECK" ]
  then
   clear;
    echo "-------------------"
    cat /etc/passwd | grep $2;
    echo "-------------------"
    cat /etc/group  | grep $3;
    echo "-------------------"
    cat /etc/sudoers.d/$2;
    echo "-------------------"
    id $2;

# ------------------------------------------------------------
 else
  echo "Argument non reconnu";
# ------------------------------------------------------------
fi

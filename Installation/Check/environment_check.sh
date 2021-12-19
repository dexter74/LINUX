#######################################################
# Script à télécharger depuis Git-Gub puis à exécuter #
#######################################################

# Clear Console
clear;

echo "################################################"
echo "# - Ditribribution : '$DISTRIB'"
echo "# - Code Name      : '$RELEASE'"
echo "# - Histname       : '$HOSTNAME'"
echo "# - Domaine        : '$DOMAINE'"
echo "#"
echo "# ----------------------------------------"
echo "# - Region         : '$REGION'"
echo "# - VILLE          : '$VILLE'"
echo "# - LANGUE         : '$LANGUE'"
echo "# - KEY SSH        : '$SSH_KEY'"
echo "# ----------------------------------------"
echo "# - Interfaces     : '$(ip netconf | grep "inet ens18" | cut -c 6-10)'"
echo "# - Adresse IP     : '$(ip -br ad | grep ens18 | cut -d / -f 1 | cut -c 33-45)'"
echo "# - Passerelle     : '$NET_GATEWAY'"
echo "# - Serveur DNS    : '$NET_DNS0'"
echo "#                  : '$NET_DNS1'"
echo "#"
echo "# ----------------------------------------"
echo "# - UNIX  - USER   : [$USER_ID] $USER:$PASS"
echo "# - UNIX  - Groupe : [$GROUP_UID] $GROUP"
echo "# - SAMBA - COmpte : [XXXX] $SAMBA_USER:$SAMBA_PASS"
echo "################################################"

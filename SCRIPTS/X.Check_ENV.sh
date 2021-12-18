echo "
clear;

echo '################################################'
echo '# - Ditribribution : $DISTRIB'
echo '# - Code Name      : $RELEASE'
echo '# - Histname       : $HOSTNAME'
echo '# - Domaine        : $DOMAINE'
echo ''
echo '# ----------------------------------------'
echo '# - Region         : $REGION'
echo '# - VILLE          : $VILLE'
echo '# - LANGUE         : $LANGUE'
echo ''
echo '# ----------------------------------------'
echo '# - Interfaces     : $NET_INTERFACE1'
echo '# - Adresse IP     : $NET_ADDRESS'
echo '# - Passerelle     : $NET_GATEWAY'
echo '# - Serveur DNS    : $NET_DNS0'
echo '#                  : $NET_DNS1'
echo ''
echo '# ----------------------------------------'
echo '# - UNIX  - Groupe : $GROUP ($GROUP_UID)'
echo '# - SAMBA - COmpte : $APPZ_SAMBA_USER:$APPZ_SAMBA_PASS'
echo '################################################'
" >  Check_ENV.sh; sh Check_ENV.sh;










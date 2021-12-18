#######################################################
# Script à télécharger depuis Git-Gub puis à exécuter #
#######################################################



clear;
echo '################################################                          '
echo '# - Ditribribution : '$DISTRIB'                                           '
echo '# - Code Name      : '$RELEASE'                                           '
echo '# - Histname       : '$HOSTNAME'                                          '
echo '# - Domaine        : '$DOMAINE'                                           '
echo '#                                                                         '
echo '# ----------------------------------------                                '
echo '# - Region         : '$REGION'                                            '
echo '# - VILLE          : '$VILLE'                                             '
echo '# - LANGUE         : '$LANGUE'                                            '
echo '#                                                                         '
echo '# ----------------------------------------                                '
echo '# - Interfaces     : '$(ifconfig ens18 | grep "ens18" | cut -c 1-5  )'    '
echo '# - Adresse IP     : '$(ifconfig ens18 | grep "inet " | cut -c 14-25)'    '
echo '# - Passerelle     : '$NET_GATEWAY'                                       '
echo '# - Serveur DNS    : '$NET_DNS0'                                          '
echo '#                  : '$NET_DNS1'                                          '
echo '#                                                                         '
echo '# ----------------------------------------                                '
echo '# - UNIX  - USER   : '[$USER_ID] $USER:$PASS'                             '
echo '# - UNIX  - Groupe : '[$GROUP_UID] $GROUP'                                '
echo '# - SAMBA - COmpte : '[XXXX] $APPZ_SAMBA_USER:$APPZ_SAMBA_PASS'           '
echo '################################################                          '





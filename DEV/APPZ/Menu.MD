Guide
> https://morgan-durand.com/creer-des-boites-de-dialogues-en-bash/
> 
> https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail

**whiptail**
```consoleox options:
        --msgbox <text> <height> <width>
        --yesno  <text> <height> <width>
        --infobox <text> <height> <width>
        --inputbox <text> <height> <width> [init]
        --passwordbox <text> <height> <width> [init]
        --textbox <file> <height> <width>
        --menu <text> <height> <width> <listheight> [tag item] ...
        --checklist <text> <height> <width> <listheight> [tag item status]...
        --radiolist <text> <height> <width> <listheight> [tag item status]...
        --gauge <text> <height> <width> <percent>
	
Options: (depend on box-option)
        --clear                         clear screen on exit
        --defaultno                     default no button
        --default-item <string>         set default string
        --fb, --fullbuttons             use full buttons
        --nocancel                      no cancel button
        --yes-button <text>             set text of yes button
        --no-button <text>              set text of no button
        --ok-button <text>              set text of ok button
        --cancel-button <text>          set text of cancel button
        --noitem                        don't display items
        --notags                        don't display tags
        --separate-output               output one line at a time
        --output-fd <fd>                output to fd, not stdout
        --title <title>                 display title
        --backtitle <backtitle>         display backtitle
        --scrolltext                    force vertical scrollbars
        --topleft                       put window in top-left corner
        -h, --help                      print this message
        -v, --version                   print version information
```




**1.Message Box**
```console
#!/bin/bash
whiptail --title "Titre  Message Box" --msgbox "Utilisation de whiptail pour la creation d'un messageBox. Cliquer sur Ok pour continuer." 10 60
```

**2.Boîte de Dialogue**
```console
#!/bin/bash
if (whiptail --title "Boite de dialogue Oui / Non" --yesno "Voudrais-tu m'épouser ?" 10 60) then
	echo "C'est le plus beau jour de ma vie"
else
	echo "Nooooooon !!"
fi
```



**TEST**
```
#!/bin/bash
if (whiptail --title "CLUF" --yesno  "Accepter vous la licence ?" --yes-button "Accepter" --no-button "Refuser" 7 35) then
	echo "Merci d'avoir accepter le CLUF"
 else
	echo "Merci de relancer le programme"
fi

--------------------------------
TEST='whiptail --title "CLUF" --yesno  "Accepter vous la licence ?" --yes-button "Accepter" --no-button "Refuser" 7 35'
eval $TEST
--------------------------------
TEST='whiptail --title "CLUF" --yesno "Accepter vous la licence ?" --yes-button "Accepter" --no-button "Refuser" 7 35'
if eval $TEST
 then
  echo "ok"
 else
  echo "ko"
fi
--------------------------------
#!/bin/bash
TEST=$(whiptail --title "CLUF" --yesno "Accepter vous la licence ?" --yes-button "Accepter" --no-button "Refuser" 7 35 3>&1 1>&2 2$

exitstatus=$?
if [ $exitstatus = 0 ];
 then
  echo "OK"
  else
   echo "KO"
fi
```




**3.Input**
```console
#!/bin/bash
Name=$(whiptail --title "Input" --inputbox "Quel est ton prénom ?" 10 60 Morgan 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Okay, ton prénom est :" $Name
else
    echo "Tu as annuler... :-("
fi
```




**4.PasswordBox**
```console
#!/bin/bash
PASSWORD=$(whiptail --title "Password Box" --passwordbox "Entrer votre mot de passe utilisateur" 10 60 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Votre mot de passe est : " $PASSWORD
else
    echo "Vous avez annulez"
fi
```

**5.Menu Box**
```console
#!/bin/bash
OPTION=$(whiptail --title "Menu Box" --menu "Choisissez votre distriubtion linux" 15 60 4 \
"1" "Ubuntu 14.04 LTS" \
"2" " Fedora  21" \
"3" "Manjaro" \
"4" "Arch linux"  3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Vous avez choisi la distribution : " $OPTION
else
    echo "vous avez annulé"
fi
```

**RadioList**
```console
#!/bin/bash
DISTROS=$(whiptail --title "Test Checklist Dialog" --radiolist \
"What is the Linux distro of your choice?" 15 60 4 \
"debian" "Venerable Debian" ON \
"ubuntu" "Popular Ubuntu" OFF \
"centos" "Stable CentOS" OFF \
"mint" "Rising Star Mint" OFF 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Vous avez choisi la distribution :" $DISTROS
else
    echo "Vous avez annulé"
fi
```

**CheckList**
```console
#!/bin/bash
DISTROS=$(whiptail --title "Checklist Box" --checklist \
"Quel est votre distribution linux ?" 15 60 4 \
"debian 7" "Wheezy" OFF \
"ubuntu 14.04 LTS" "Trusty Tahr" ON \
"Fedora 21" "Twenty One" OFF \
"Elementary OS" "Luna" OFF 3>&1 1>&2 2>&3)
 
exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Vous avez choisi la distribution :" $DISTROS
else
    echo "Vous avez annulé"
fi
```



**Gauge** (Barre de Progression)
```console
#!/bin/bash
{
    for ((i = 0 ; i <= 100 ; i+=20)); do
        sleep 1
        echo $i
    done
} | whiptail --gauge "Veuillez patienter pendant l'installation" 6 60 0
```

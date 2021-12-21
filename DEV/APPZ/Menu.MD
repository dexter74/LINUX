Guide
> https://morgan-durand.com/creer-des-boites-de-dialogues-en-bash/
> https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail


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

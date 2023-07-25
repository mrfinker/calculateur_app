#!/bin/bash

zenity --info --text "Bienvenue dans la procédure d'installation des applications de la distribution Linux\npour tous les étudiants en informatique du département de mathématique et informatique !" --title "Bienvenue" --width 400 --height 200

# Générer un nom unique pour le dossier en utilisant la date et l'heure
download_folder="$HOME/Documents/$(date +'%Y%m%d%H%M%S')"

# Créer le dossier de téléchargement
mkdir "$download_folder"

choix=$(zenity --list --title "Menu principal" --text "Choisissez une option :" --radiolist --column "Sélection" --column "Option" FALSE "Installer tous les paquets" FALSE "Sélectionner les paquets à installer" FALSE "Quitter le programme" --width 400 --height 250)

path_distant="https://github.com/mrfinker/calculateur_app"
# Utiliser le dossier de téléchargement comme chemin d'enregistrement
path_local="$download_folder/"
user="$USER"

function dependance {
    dep=$(zenity --question --text "Voulez-vous mettre à jour les dépendances des paquets ? (une connexion internet est requise)" --width 600 --height 250)
    if [ "$dep" = "o" ]; then
        # Demander le mot de passe de l'utilisateur uniquement si une action nécessite les privilèges sudo
        echo "$user_password" | sudo -S apt update
        echo "$user_password" | sudo -S apt-get -f install
        echo "$user_password" | sudo -S apt --fix-broken install
    fi
}

# Fonction pour récupérer la liste des applications
function liste {
    # TODO: Remplacez la commande ci-dessous par la liste de vos applications sur GitHub
    apps=$(git ls-remote --heads https://github.com/mrfinker/calculateur_app.git | sed 's?.*refs/heads/??')

    # Exemple de commande pour récupérer la liste des fichiers/dossiers dans votre repo GitHub
    apps=("google_chrome" "visual_studio_code")

    # Afficher la liste dans une boîte de dialogue Zenity
    zenity --list \
        --title "Liste des applications" \
        --text "Voici la liste de tous nos paquets à installer" \
        --width 400 \
        --height 800 \
        --ok-label "Suivant >" \
        --column "Nom" ${apps[*]}
}

if [ "$choix" = "Installer tous les paquets" ]; then
    # Stocker le mot de passe de la machine utilisateur
    read -s -p $'\n'"veuiller saisir votre mot de passe : " user_password
    echo $''

    zenity --info --text "Téléchargement des fichiers depuis GitHub..." --width 400 --height 100
    
    # Télécharger les fichiers depuis GitHub en utilisant git clone
    git clone "$path_distant" "$path_local"

    if ls "$path_local"*.deb >/dev/null 2>&1; then
        # Demander le mot de passe de l'utilisateur uniquement si une action nécessite les privilèges sudo
        echo "$user_password" | sudo -S sh -c "echo \"$user ALL=(ALL) NOPASSWD:ALL\" > /etc/sudoers.d/$user"
        echo "$user_password" | sudo -S dpkg -i "$path_local"*.deb
        
        dependance

        zenity --info --text "L'installation est terminée !" --width 400 --height 200

        rm "$path_local"*.deb
        echo "$user_password" | sudo -S rm /etc/sudoers.d/$user >/dev/null
    fi

elif [ "$choix" = "Sélectionner les paquets à installer" ]; then
    # Stocker le mot de passe de la machine utilisateur
    read -s -p $'\n'"veuiller saisir votre mot de passe : " user_password
    echo $''

    liste
    
    zenity --info --text "Accès à la base de données\n(Téléchargement des fichiers depuis GitHub...)" --width 400 --height 100

    selected_packages=$(zenity --list --checklist --width 400 --height 400 \
        --column "" --column "Paquet" \
        FALSE "google_chrome" \
        FALSE "visual_studio_code" 
        #FALSE "app3" 
        # Ajoutez autant de lignes que nécessaire pour chaque paquet
    )

    if [ -z "$selected_packages" ]; then
        echo "Aucun paquet sélectionné."
        exit 1
    fi

    zenity --question --text "Confirmez-vous l'installation des paquets suivants ?" --width 400 --height 200

    zenity --info --text "Téléchargement des fichiers depuis GitHub..." --width 400 --height 100

    # Télécharger les fichiers sélectionnés depuis GitHub en utilisant git clone
    git clone "$path_distant" "$path_local"

    echo "Installation en cours (Mot de passe utilisateur local requis) !!!"

    for package in $selected_packages; do
        if ls "$path_local$package"*.deb >/dev/null 2>&1; then
            echo "$user_password" | sudo -S dpkg -i "$path_local$package"*.deb
            echo "$user_password" | sudo -S rm "$path_local$package"*.deb
        fi
    done

    dependance

    zenity --info --text "Félicitations votre installation est terminée avec succès !"
    
elif [ "$choix" = "Quitter le programme" ]; then
    zenity --info --text "Au revoir et à très bientôt !!!" --width 400 --height 100
    exit
fi

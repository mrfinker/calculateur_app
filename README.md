# Readme installer.sh v1
Programme d'installattion installer_v1

Chers étudiants,

Nous sommes heureux de vous présenter le Programme d'installation installer_v1, une initiative conçue pour faciliter vos études et améliorer votre expérience académique à l'Université de Kinshasa.

Voici la liste des étudiants qui ont accomplie ce travail :

1. Kiangebeni Demissa Caleb
2. Sidifuku Zulu Archime
3. Sokombe Kibangu Gogo
4. Asimwe Neemisha Pierrot
5. Mayimbi Vuanga Josue
6. Kabongi Isaac Isaac
7. Kabika Manyong Elie
8. Kafumu Mbuti Rondy
9. Kokoy Antho Grady
10. Katalay Maday Meddy

Ce programme a été rendu possible grâce à la collaboration d'autres étudiants L2 (Génie-UNIKIN, 2021-2022), ainsi qu'avec le soutien du Professeur Christian D. Bope.

Nous vous rappelons que la date de lancement du programme Unikin_Pack-v1.0 était le 25 juillet 2023, et depuis lors, nous nous efforçons de fournir des ressources et des outils essentiels pour vous accompagner dans votre parcours académique.

# Objectif
"Nous sommes fiers de vous présenter notre package complet de logiciels essentiels, compatible avec toutes les distributions dérivées de DEBIAN. Que vous soyez passionné de mathématiques ou d'informatique, ce package offre un large éventail d'outils pour répondre à vos besoins.

Les avantages de notre package sont nombreux :

1. Interface graphique unifiée : Vous pouvez accéder facilement à tous les logiciels via une interface conviviale (grâce à Zenity).
2. Facilité d'utilisation : Installer les logiciels est un jeu d'enfant, il vous suffit de cocher les cases correspondantes.
3. Diverses méthodes d'installation : Nous avons inclus plusieurs méthodes d'installation pour s'adapter à vos préférences. Vous pouvez installer via apt install les tout sans vous posez des questions et les installations sont automatiques ou utiliser un paquet deb specifique selon vos besoins d'installation.

Notre objectif est de rendre l'installation de logiciels plus simple et plus accessible pour tous les utilisateurs, quel que soit leur niveau d'expertise. Nous espérons que notre package vous sera utile et vous permettra de tirer le meilleur parti de vos activités mathématiques et informatiques.

# Compatibilité
Notre objectif avec ce script est de fournir une solution pratique pour installer des logiciels sur les distributions dérivées de Debian. Cependant, nous voulons également rendre le script flexible et utilisable dans d'autres configurations.

Voici quelques points importants à considérer :

1. Compatibilité Shell : Le script est conçu pour fonctionner avec le Shell "Bash", le Shell par défaut sous Ubuntu. Certaines fonctions peuvent ne pas être compatibles si vous le modifier par vous meme et le script risque de ne pas fonctionner correctement.

2. Anciennes versions d'Ubuntu : Le script devrait fonctionner sur d'anciennes versions d'Ubuntu, mais certains logiciels peuvent ne pas s'installer correctement, car ils nécessitent des méthodes spécifiques à la version plus récente.

3. Utilisation à distance via SSH : Si vous avez besoin d'utiliser le script à distance via SSH, n'oubliez pas d'utiliser le paramètre "-X" et "-Y" pour avoir l'export graphique et afficher l'interface graphique Zenity.

# Note pour les developpeurs
Le texte ci-dessous décrit le logiciel utilisé pour créer le package et fournit des informations sur les balises et légendes utilisées dans le script d'installation :

"Logiciel utilisé pour la création du package :

Pour que le script fonctionne correctement, le logiciel suivants est nécessaire :

- Zenity (permet l'affichage de la fenêtre graphique)

Si aucune balise n'est précisée, cela signifie que le logiciel s'installe de manière classique avec 'apt install' ou via un paquet Debian manuel.

Cas particulier :

- {Nécessite intervention !} : Pour certains logiciels, l'installation ne sont pas entièrement automatique.

- (cli) : Cette précision sur le logiciel indique qu'il s'utilise en mode CLI (Command Line Interface), c'est-à-dire en ligne de commande. Ces logiciels n'ont pas d'interface graphique et n'apparaissent généralement pas dans le menu ou le tableau de bord des applications. Pour les logiciels de la catégorie "outil en cli", cette indication n'est pas nécessaire, car tous les logiciels de cette catégorie sont en ligne de commande.

Bonne installation avec installer.sh

# Travail réalisé :

## Mercredi 5 Juin

### Début de l'interface graphique du FEED :
Page d'accueil avec les boutons non cliquables.

#### Explications : 
Le filtre et les réglages pourront se faire mais pour les versions futures.
Les boutons de feed, liste et ajouter ne sont pas les plus beaux, surtout concernant leur taille donc à changer.

### Création d'un template de carte :
Card + Espace de 10 a chaque nouvel appel d'une card

#### Explications :
Je crée pour le moment une carte complète mais il faut rajouter des conditions si l'utilisateur ne met pas de photos ou de commentaires.
J'ai fixé dans le raw la largeur possible du titre et du commentaire PRINCIPAL -> Il faudra aussi fixer une taille max pour le commentaire sinon on a la possibilité d'avoir une taille de carte beaucoup trop grande.
Pour le commentaire SECONDAIRE, pareil.
La taille de la photo représente une taille fixe -> À changer aussi pour que cela dépende de la taille de la carte ou autre.

## Jeudi 6 Juin

### Architecture du code
J'ai rendu l'archi du code beaucoup plus simple avec des widget qui vont être réutilisés dans Structure. Idem pour des methodes dans Services.
J'ai aussi séparer les affichages

### Affichage en fonction du JSONARRAY
Début de l'affichage des card en fonction du JsonArray.

#### Explications
    - Couleur de la card :
    Possibilité de donner une couleur à la card ou un gradient
    Si couleur on a alors gradiant=0 et juste couleur1=information de couleur
    Sinon gradiant=1 et couleur1 et couleur2 utilisées

    - Nom User :
    Problème possible sur la taille du pseudo. Donc soit réduire la taille du text en fonction ou donner une limite au pseudo

#### A FAIRE 
Il faut maintenant faire le reste donc name Habit qui est obligatoire pour poster

Et commentaire principal/secondaire et la photo que nous pouvons mettre ou nous. DANS CE CAS on redimenssionne la card en fonction de ce qu'on a en information.

#### TEST
Les tests sur un JSONARRAY fonctionne bien à continuer..


## Mardi 11 Juin

### Fin affichage Json
J'ai Fini l'affichage des Json mais il faudra limiter la taille de certain champs (en nombre de lettre par exemple ou reformer la card)

### BottomNavigationBar
Les icones ont un affichage en fonction du context. Je l'ai fait lors de la création d'une activité en envoyant le nom de mon activité comme variable de vérification.

Rediréction vers une activité uniquement si nous ne sommes pas déjà dans celle-ci (voit le case en bas de myBottomNavigationBar)

#### A FAIRE
L'interface de visualisation des ses habits
L'interface utilisateur pour la création des cards
Création de la Firebase
Faire les méthodes Post et Get pour la communication entre les utilisateurs.


## Mercredi 12 Juin

### Interface Utilisateur 
J'ai repris la structure de Card pour rapidement faire l'affichage.
On gardera seulement le nom de l'habitude et la description rapide.

#### A FAIRE
Il faut modifier la card utilisateur pour avoir un bouton "valider habitude" et si habitudes validés, On peut ajouter 1 Image et 1 Commentare.

On supprime la photo de profil et le nom utilisateur qui ne sert a rien

# Problèmes futurs
- Il faut fixer une limite de lettre pour le titre du habit, UserName, Description 1 car ce sont des containers de taille fixe pour le moment par volonté de design

- Comment prendre les photos : par url ou autre ??

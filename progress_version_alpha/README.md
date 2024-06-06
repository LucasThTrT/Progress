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






# Problèmes futurs
Comment prendre les photos : par url ou autre ??
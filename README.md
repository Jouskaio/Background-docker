# Explication du TP

*TP visant à lier trois containers NGINX, Node et Mongo avec la possibilité d'y accéder sur chacun des ports. Le port utulisé par NGINX et Node doivent renvoyer la page index du site tandis que le port Mongo doit être uniquement utilisé pour la data (pas de visuel du site).*

## Choix des langages

Pour ce TP j'ai souhaité développer une application en React. Pour la partie back-end, j'ai pris un des langages les plus communs avec React à savoir MongoDB.

Un projet React tourne avec le langage Node.js, j'ai donc pris un container node pour la partie script. Ayant besoin d'un container HTTP, j'ai décidé d'utiliser un container NGINX qui utilisera un fichier .conf pour configurer le serveur. La base de données étant en MongoDB j'ai utilisé un container mongo.

Les versions utilisées sont des versions nécessaires pour faire tourner l'application.

Container tpdockbdd :
    - Port : 27017:27017 car mongo utilises le port 27017 pour fonctionner

Container tpDockSCRIPT :
    - Port 5000:5000 parce que quand le serveur React est activé, il tourne sur ce port là

Container tpDockHTTP :
    - Port 8080:8080 qui est le port utilisé par défaut par NGINX pour afficher une page web

## Structure du projet

**Dossier app** : contient l'ensemble du projet React. En plus du projet React, un fichier server.js utilisant le langage Node.js permet de connecter la base de donnée initialisé dans le container tpdockbdd à l'application Nodes.js

**.gitignore** : Fichier qui spécifie les fichiers non envoyés dans le projet git

**defaut.conf** : fichier qui configure le serveur lancé.
    - root : spécifie l'emplacement du serveur considéré
    - listen : précise quel port nous écoutons (à partir du container tpDockHTTP qui est au port 8080 == 80)
    - serveur_name : le nom du serveur considéré
    - proxy_pass : écouter une adresse : ici nous écoutons l'adresse publique du container tpDockSCRIPT
    - proxy_redirect : empêcher une redirection
    - proxy_set_header : configuration du header du proxy pour permettre l'envois des images, js, css, ... entre le container tpDockHTTP et tpDockSCRIPT

**Dockerfile** : fichier qui lance un container avec plusieurs couches que nous pouvons configurer.
    - FROM permet de spécifier l'image que nous considérons
    - ENV permet d'afficher les erreurs potentiels lors de la création du fichiers
    - WORKDIR permet de dire le fichier que nous considérons
    - COPY permet de copier un fichier/dossier dans le container
    - RUN ajouter une nouvelle couche au container pour lui permettre de faire tourner le projet (ici effectuer rpm install à partir du fichier téléchargé)
    - CMD permet de lancer la commande qui va labcer le fichier
    - EXPOSE : sur quel port va tourner le container

**kill.sh** : fichier qui va tuer automatiquement les container et les supprimer

**launch.sh** : script à lancer pour lancer tous les container et faire tourner le projet

## Lancement du projet

Pour créer le projet, il suffit de :
    - cloner le git
    - rentrer dans le répertoire
    - Faire la commande `sh launch.sh`
    - Pour arrêter les containers il suffit de faire `sh kill.sh`

Enjoy !
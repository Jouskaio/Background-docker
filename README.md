# Explication du TP

*TP visant à lier trois containers NGINX, PHP et PostSQL avec la possibilité d'y accéder sur chacun des ports. Le port utilisé par NGINX et PHP doivent renvoyer la page index du site tandis que le port PostSQL doit être uniquement utilisé pour la data (pas de visuel du site).*

## Lancement du projet

Pour créer le projet, il suffit de :
   - cloner le git
   - rentrer dans le répertoire
   - Faire la commande `docker-compose build` pour construire l'image PHP que nous souhaitons
   - Faire la commande `docker-compose up -d` pour lancer les containers
   - Pour stopper les containers faire `docker-compose down --volumes`

Enjoy !
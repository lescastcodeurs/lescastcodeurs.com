---
layout: default
title: Read me
---
# Read me

## Todo

- install site build script on server + github push notif (cgi)
- keep video directory
- remove todo :)

## Remerciements

Ce site est construit avec:

- [Awestruct][Awestruct]: un framework pour créer des sites HTML statiques
- [Twitter bootstrap][Twitter bootstrap]: une boite à outils d'interfaces web (HTML, CSS Javascript)
- certains icônes de [Komodo Media, Rogie King][Komodo]

Le logo a été crée par [Nicolas Martignole][touilleur]. 
Le thème musical du podcast est le thème numéro 3 offert par <http://podcastthemes.com>.

## Comment construire le site

### Infrastructure

Vous avez besoin de:

- Git
- Ruby 1.8
- sur Mac OS X, XCode (pour les gems natives)

Installer Git. [La page d'aide de GitHub](http://help.github.com/) est un bon
point de départ. [Le blog d'Emmanuel](http://in.relation.to/Bloggers/HibernateMovesToGitGitTipsAndTricks)
sur les trucs et astuces de Git est utile également.

Installer Awestruct, un générateur de site basé sur Ruby.

    gem install awestruct 
    # ou
    sudo gem install awestruct

La version d'Awestruct testée est 0.2.18

    sudo gem install awestruct --version 0.2.18

Récupérer les sources du site web de GitHub.

    git clone git@github.com:lescastcodeurs/lescastcodeurs.com.git

### Servir le site localement

* Aller dans votre répertoire `~/lescastcodeurs.com`
* Lancer  `awestruct -d`
* Ouvrir votre navigateur à <http://localhost:4242>

Les changements sont automatiquement vu et le site reconstruit sauf pour les nouvelles
entrées de blog.

#### Si vos changements ne sont pas visibles...

Si pour une raison quelconque vos changement ne sont pas visibles,
vous pouvez regénérer complètement le site:

    rm -fR _site
    awestruct -d

#### Si les pages sont lentes à être servies...

Sous Linux, servir les pages peut être attrocement lent
(problème de WEBRick).

Utiliser l'approche suivante:

* Aller dans le répertoire `~/lescastcodeurs.com`  
* Lancer  `awestruct --auto -P development`
* En parallèle, aller dans `~/lescastcodeurs.com/_site`
* Lancer `python -m SimpleHTTPServer 4242`

Vous devriez avoir des pages rendues en quelques millisecondes :) 

### Comment ajouter un membre à l'équipe

Ajouter le fichier dans `_data/team`

Les propriétés du fichier sont les suivantes:

- `name`: le nom, par exemple Emmanuel Bernard
- `gravatar_hash`: le md5 de l'email utilisé pour gravatar eg `md5sum mon.email@domain.com` => `1fc6aa04011b2f0f9721df913b0fd415`
- `blog`: lien vers le blog (optionnel)
- `website`: lien vers le site web (optionnel)
- `twitter`: nom d'utilisateur twitter (optionnel)


## Licence et droits

Le contenu de ce dépôt de code est distribué sous licence 
[Creative Commons Attribution Share-Alike 3.0 Unported (CC BY-SA 3.0)][cc].

En soumettant une "pull request" ou contribuant de manière général à ce dépôt de code, 
vous acceptez de fournir votre contribution sous la licence mentionnée au dessus.

Le texte et le logo sont la propriété d'[Emmanuel Bernard][emmanuel-site].

[Wattie]: http://www.flickr.com/photos/wattie/2113068944/in/photostream
[Awestruct]: http://awestruct.org/
[Twitter bootstrap]: http://twitter.github.com/bootstrap/
[Komodo]: http://www.komodomedia.com
[cc]: http://creativecommons.org/licenses/by-sa/3.0/
[emmanuel-site]: http://emmanuelbernard.com
[touilleur]: http://www.touilleur-express.fr/
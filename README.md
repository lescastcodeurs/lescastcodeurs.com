# Read me

## Todo

- install site build script on server + github push notif (cgi)
- keep video directory
- trouver un moyen de traduire les titres des pages "paginées" (pas faisable avec jekyll-paginate ?)
- remove todo :)

## Remerciements

Ce site est construit avec :

- [Jekyll][Jekyll] : un framework pour créer des sites HTML statiques
- [Twitter bootstrap][Twitter bootstrap] : une boite à outils d'interfaces web (HTML, CSS Javascript)
- certains icônes de [Komodo Media, Rogie King][Komodo]

Le logo a été crée par [Nicolas Martignole][touilleur]. 
Le thème musical du podcast est le thème numéro 3 offert par <http://podcastthemes.com>.

## Comment construire le site ?

### Pré-requis

Pour construire le site vous aurez tout d'abord besoin de Git. [La page d'aide de GitHub](http://help.github.com/) est un bon point de départ, [le blog
d'Emmanuel](http://in.relation.to/Bloggers/HibernateMovesToGitGitTipsAndTricks) sur les trucs et astuces de Git est utile également.

Vous aurez aussi besoin de Jekyll. Pour son installation référez-vous à [la documentation officielle de Jekyll](https://jekyllrb.com/docs/installation/)) et
suivez la procédure en fonction de votre système d'exploitation.

### Servir le site localement
Récupérez les sources du site web de GitHub :

    git clone git@github.com:lescastcodeurs/lescastcodeurs.com.git

Puis lancez les commandes suivantes :

    cd lescastcodeurs.com
    bundle install # seulement nécessaire après le clonage du dépôt ou quand il y a eu une mise à jour des dépendances
    bundle exec jekyll serve --livereload

Et enfin ouvrez votre navigateur à l'adresse http://localhost:4000.

Les modifications sur les pages du site (ajout, modification, suppression) sont automatiquement détectées. À chaque changement le site est automatiquement
reconstruit et les pages ouvertes dans votre navigateur sont rafraichies (grâce à l'option `--livereload`). À noter que le rechargement ne fonctionne pas si
vous êtes sur la page 404.

Les modifications de layout nécessitent un rechargement manuel de la page. Et les modifications de configuration (`_config.yml`) nécessitent une régénération du
site.

### Si vos changements ne sont pas visibles...

Si pour une raison quelconque vos changements ne sont pas visibles, vous pouvez régénérer complètement le site :

    bundle exec jekyll clean
    bundle exec jekyll serve --livereload

### Activation des intégrations Google Analytics / Disqus

Les intégrations Google Analytics et Disqus ne sont pas actives en mode `development`. Si vous souhaitez les activer il vous faudra lancer le site en mode
`production` à l'aide de la variable [`JEKYLL_ENV`](https://jekyllrb.com/docs/configuration/environments/) :

    JEKYLL_ENV=production bundle exec jekyll serve --livereload

### Recommandations

Pour créer des liens vers des pages, posts, images ou tout autre fichier présent dans ce dépôt de code préférez l'utilisation de tags
[`link`](https://jekyllrb.com/docs/liquid/tags/#link) ou [`post_url`](https://jekyllrb.com/docs/liquid/tags/#linking-to-posts) à celle des filtres
[`relative_url`](https://jekyllrb.com/docs/liquid/filters/) ou [`absolute_url`](https://jekyllrb.com/docs/liquid/filters/). L'utilisation de ces tags est plus
concise que celle des filtres, et surtout quand on utilise les tags les liens sont validés et Jekyll ne build pas si la ressource n'est pas trouvée. Cette
recommandation ne s'applique pas aux liens externes ou au contenu généré (flux RSS, feuille de style...).

## Procédures

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
[Jekyll]: https://jekyllrb.com
[Twitter bootstrap]: http://twitter.github.com/bootstrap/
[Komodo]: http://www.komodomedia.com
[cc]: http://creativecommons.org/licenses/by-sa/3.0/
[emmanuel-site]: http://emmanuelbernard.com
[touilleur]: http://www.touilleur-express.fr/

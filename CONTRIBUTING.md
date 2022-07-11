## Pré-requis

Pour contribuer au site lescastcodeurs.com vous aurez tout d’abord besoin de Git. [La page d’aide de GitHub](http://help.github.com/) est un bon point de départ,
[le blog d’Emmanuel](http://in.relation.to/Bloggers/HibernateMovesToGitGitTipsAndTricks) sur les trucs et astuces de Git est utile également.

Vous aurez aussi besoin de [Jekyll](https://jekyllrb.com). Pour son installation, référez-vous à [sa documentation officielle](https://jekyllrb.com/docs/installation/)
et suivez la procédure en fonction de votre système d’exploitation.

Pour les habitués la procédure est la suivante une fois [Ruby 2.5+](https://www.ruby-lang.org/en/downloads/), [RubyGems](https://rubygems.org/pages/download),
et GCC / Make (pour les gems natives) installés :

    gem install bundler


## Mettre à jour lescastcodeurs.com

Pour mettre à jour lescastcodeurs.com vous devez :

1. Faire un fork du dépôt de code
2. Apporter vos modifications
3. Proposer une pull-request au mainteneur du dépôt

Si les modifications que vous comptez apporter sont d’ampleur pensez à prévenir au préalable le mainteneur [par un ticket GitHub](https://github.com/lescastcodeurs/lescastcodeurs.com/issues)
ou [par mail](mailto:commentaire@lescastcodeurs.com) pour lui demander son avis.

### Faire un fork du dépôt de code

Si vous ne savez pas comment faire, jetez un coup d’œil [à la documentation de GitHub](https://guides.github.com/activities/forking/#fork) sur le sujet. Ensuite
récupérez les sources de lescastcodeurs.com et créez une nouvelle branche :

    git clone git@github.com:<your-github-username>/lescastcodeurs.com.git

    cd lescastcodeurs.com
    git checkout -b ma-branche

### Apporter vos modifications

Quand vous aurez récupéré les sources et créé votre branche de développement, lancez les commandes suivantes à partir de la racine du dépôt :

    ./bin/serve

Apportez ensuite vos modifications et prévisualisez-les au fur et à mesure [dans votre navigateur](http://localhost:4000/).

Les modifications de contenu (ajout, modification ou suppression de page) et les modifications de CSS sont automatiquement détectées. lescastcodeurs.com est
alors automatiquement reconstruit et les pages ouvertes dans votre navigateur sont automatiquement rafraichies. À noter que le rechargement automatique ne
fonctionne pas si vous êtes sur une page 404.

Les modifications de layout nécessitent un rechargement manuel de la page. Et les modifications de configuration (i.e. du fichier `_config.yml`) nécessitent un
redémarrage du site.

Si pour une raison quelconque vos changements ne sont pas visibles, redémarrez à l’aide de `./bin/serve`.

### Proposer une pull-request au mainteneur du dépôt

Encore une fois si vous ne savez pas comment faire, jetez un coup d’œil [à la documentation de GitHub](https://guides.github.com/activities/forking/#making-a-pull-request)
sur le sujet.


## Procédures

### Construire le site

Pour construire le site exécuter :

    ./bin/build

Le site est alors disponible dans le répertoire `_site`.

### Publier le site

La publication du site passe par l’exécution du workflow GitHub Actions `deploy`. Ce workflow décompose globalement de la manière suivante :
1. Préparation de l’environnement (ruby, configuration SSH nécessaire pour le rsync)
2. Construction du site à l’aide de bin/build
3. Déploiement du site à l’aide de bin/deploy (rsync)

Pour fonctionner ce workflow GitHub Actions nécessite la déclaration des secrets suivants :
- `DEPLOY_USER` (obligatoire) : indique l’utilisateur SSH à utiliser pour la publication du site,
- `DEPLOY_KEY` (obligatoire) : contient la clé SSH privée utilisée pour la connexion au serveur,
- `DEPLOY_HOST` (obligatoire) : indique le serveur sur lequel le site doit être publié,
- `DEPLOY_PORT` (obligatoire) : indique le port SSH du serveur sur lequel le site doit être publié,
- `DEPLOY_TARGET` (obligatoire) : indique le répertoire cible sur le serveur où les fichiers du site seront copiés,
- `DEPLOY_OPTIONS` (optionnel) : indique les options additionnelles à passer à rsync.

Il est aussi possible de lancer manuellement la publication du site :

    ./bin/build && ./bin/deploy

Le script `bin/deploy` utilise les variables `DEPLOY_*` si elles sont définies. Si elles ne le sont pas des valeurs par défaut sont utilisées (cf.
[bin/deploy](/bin/deploy)).

### Mise à jour de Jekyll et de ses dépendances

Exécuter tout d’abord :

    ./bin/update-dependencies

Cette commande applique les mises à jour correctives et liste les dépendances directes pour lesquelles une nouvelle version mineure ou majeure est disponible.

Les mises à jour mineures ou majeures doivent être réalisée à la main en modifiant le [Gemfile](/Gemfile). Une fois ces mises à jour terminées pensez à relancer
`./update-dependencies` pour mettre à jour le [Gemfile.lock](/Gemfile.lock).

Il ne reste plus qu’à tester que le site fonctionne bien puis commiter le tout.

### Mise à jour de Bootstrap, Bootstrap Icons, JQuery, et Simple-Jekyll-Search

1. Allez sur [jsDelivr](https://www.jsdelivr.com/) à l’aide de l’un de ces liens :
   - [bootstrap.min.css](https://www.jsdelivr.com/package/npm/bootstrap?path=dist%2Fcss),
   - [bootstrap.bundle.min.js](https://www.jsdelivr.com/package/npm/bootstrap?path=dist%2Fjs),
   - [jquery.slim.min.js](https://www.jsdelivr.com/package/npm/jquery?path=dist) (la version à utiliser dépend de la version de Boostrap),
   - [bootstrap-icons.css](https://www.jsdelivr.com/package/npm/bootstrap-icons?path=font),
   - [simple-jekyll-search.min.js](https://www.jsdelivr.com/package/npm/simple-jekyll-search))
2. Sélectionner la version souhaitée.
3. Ajoutez le fichier à mettre à jour à votre collection.
4. Cliquer sur le bouton _SHOW & CONFIGURE ALL LINKS_.
5. Cliquer sur le bouton _SRI_ (_Enable Subresource Integrity check for increased security_).
6. Reportez le lien (`href`) et le hash (`integrity`) indiqué sur jsDelivr dans le fichier [_config.yml](/_config.yml) (propriété `dependencies`).

### Suivi des mises à jour

Que ce soit en grande partie automatique (pour Jekyll, avec [Bundler](https://bundler.io/)) ou manuel (pour Bootstrap ou simple-jekyll-search) pour mettre à
jour les dépendances utilisées par ce site, il faut déjà que vous soyez au courant que ces mises à jour existent. Pour cela plusieurs moyens :

- suivre les blogs des projets ([Jekyll](https://jekyllrb.com/news/), [Bootstrap](https://blog.getbootstrap.com/), [Bootstrap Icons](https://blog.getbootstrap.com/)),
- suivre les pages [GitHub](https://github.com) des projets ([Jekyll](https://github.com/jekyll/jekyll), [Bootstrap](https://github.com/twbs/bootstrap),
  [Bootstrap Icons](https://github.com/twbs/icons), [simple-jekyll-search](https://github.com/christian-fei/Simple-Jekyll-Search)),
- ou, plus simplement, utiliser [librairies.io](https://libraries.io/) ([Jekyll](https://libraries.io/rubygems/jekyll), [Bootstrap](https://libraries.io/npm/bootstrap),
  [Bootstrap Icons](https://libraries.io/npm/bootstrap-icons), [simple-jekyll-search](https://libraries.io/npm/simple-jekyll-search)).

### Ajouter un membre à l’équipe

Ajouter le fichier dans `_team`.

Les propriétés du fichier sont les suivantes :

- `name` : le nom, par exemple Emmanuel Bernard
- `gravatar_hash` : le md5 de l’email utilisé pour gravatar c-a-d `md5sum mon.email@domain.com` => `1fc6aa04011b2f0f9721df913b0fd415`
- `blog` : lien vers le blog (optionnel)
- `website` : lien vers le site web (optionnel)
- `twitter` : nom d’utilisateur twitter (optionnel)

### Lancement de lescastcodeurs.com en mode `production`

Vous pouvez activer le mode `production` à l’aide de la variable [`JEKYLL_ENV="production"`](https://jekyllrb.com/docs/configuration/environments/) ou en utilisant le script `serve` :

```shell
./bin/serve --prod
```

Suite au retrait de Google Analytics et de Disqus (voir #95), le mode `production` est identique au mode `development`.


## Notes et recommandations

### Et pourquoi pas GitHub pages ?

Cette question s’est posée lors de la migration de lescastcodeurs.com vers Jekyll (cf. #35). Il a été décidé de ne pas héberger lescastcodeurs.com sur [GitHub
Pages](https://pages.github.com/) dans le but de pouvoir conserver les règles [htaccess](/.htaccess) actuellement en place.

Si un jour l’hébergement sur GitHub Page est souhaité il faudra bien faire attention à la version de Jekyll utilisée. En effet lescastcodeurs.com utilise, au
18/11/2020, Jekyll 4.1 alors que GitHub Page fonctionne encore avec Jekyll 3.9 (mais a priori rien n’empêche lescastcodeurs.com de fonctionner avec Jekyll 3.9).

### Les plugins utilisés par lescastcodeurs.com

- [jekyll-paginate](https://github.com/jekyll/jekyll-paginate) pour la gestion de la pagination. Ce plugin n’est plus en développement actif depuis Jekyll 3,
  mais reste étrangement [le seul moteur de pagination disponible avec Jekyll 4](https://jekyllrb.com/docs/pagination/). L’utilisation de [jekyll-paginate-v2](https://github.com/sverrirs/jekyll-paginate-v2)
  a été envisagée, mais la dernière version n’est toujours pas compatible avec Jekyll 4.
- [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag) pour l’ajout automatique des balises meta nécessaires au bon référencement du site.
- [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap) pour la génération automatique du sitemap [sitemaps.org](https://www.sitemaps.org/) (pour
  [Google](https://developers.google.com/search/docs/advanced/sitemaps/build-sitemap) ou tout autre moteur de recherche).

[jekyll-feed](https://github.com/jekyll/jekyll-feed) n’est pas utilisé, car l’ajout d’[enclosure](https://bjohas.de/wiki/Enclosures_in_yahoo_media,_rss,_and_atom#Atom),
nécessaire pour les posts relatifs aux épisodes, n’est pas supporté. Le [template utilisé dans le plugin](https://github.com/jekyll/jekyll-feed/blob/702dd896f1351f84c7d284b7867096ee3a275241/lib/jekyll-feed/feed.xml)
a néanmoins servi de base pour [celui du site](/feed-intern.atom).

### De la bonne utilisation des plugins Jekyll

Dans la mesure du possible n’utilisez que des [plugins Jekyll](https://jekyllrb.com/docs/plugins/) [officiels](https://github.com/search?q=topic%3Ajekyll-plugin+org%3Ajekyll&type=Repositories).
et supportés par [GitHub Pages](https://pages.github.com/versions/). Les plugins fournis par la communauté ont tendance à être très lent à se mettre à jour (
Jekyll 4, qui est pourtant sorti le 20/08/2019, n’est au 17/11/2020 toujours pas supporté par certains des plugins les plus populaires) ou pire encore à n’être
plus maintenu du tout au bout d’un certain temps.

### De la bonne utilisation des liens

Pour créer des liens vers des pages, posts, images ou tout autre fichier présent dans ce dépôt de code préférez l’utilisation de tags
[`link`](https://jekyllrb.com/docs/liquid/tags/#link) ou [`post_url`](https://jekyllrb.com/docs/liquid/tags/#linking-to-posts) à celle des filtres
[`relative_url`](https://jekyllrb.com/docs/liquid/filters/) ou [`absolute_url`](https://jekyllrb.com/docs/liquid/filters/). L’utilisation de ces tags est plus
concise que celle des filtres, et surtout quand on utilise les tags les liens sont validés et Jekyll ne build pas si la ressource n’est pas trouvée. Cette
recommandation ne s’applique pas aux liens externes ou au contenu généré (flux RSS, feuille de style...).

### Notes sur l’intégration de Bootstrap

Dans le but de faciliter les mises à jour de Bootstrap / JQuery le choix a été fait d’utiliser le CDN [cdn.jsdelivr.net](https://www.jsdelivr.com). On utilise :
[bootstrap.min.css](https://www.jsdelivr.com/package/npm/bootstrap) pour la partie CSS, mais aussi [bootstrap.bundle.min.js](https://www.jsdelivr.com/package/npm/bootstrap)
et [jquery.slim.min.js](https://www.jsdelivr.com/package/npm/jquery) qui sont [nécessaires pour le collapse de la barre de
menu](https://getbootstrap.com/docs/4.5/getting-started/introduction/#components).

Ce type d’intégration a été choisi car :

- La mise à jour de Bootstrap / JQuery via bundler n’était pas possible sans utiliser [jekyll-assets](https://github.com/envygeeks/jekyll-assets). Hors ce
  plugin ne supporte pas Jekyll 4 (et n’est pas compatible avec GitHub Pages).
- L’utilisation des SCSS aurait nécessité l’utilisation de [Autoprefixer](https://github.com/postcss/autoprefixer) (depuis a priori
  [Bootstrap 4](https://freddyheppell.com/blog/using-bootstrap-4-with-jekyll)).
- On souhaitait s’épargner le téléchargement et la recopie manuelle des fichiers JS / CSS de Bootstrap / JQuery à chaque mise à jour.

### Notes sur l’intégration de Simple-Jekyll-Search

La [configuration de Simple-Jekyll-Search](https://github.com/christian-fei/Simple-Jekyll-Search/wiki) est directement dans le layout [search.html](episodes.html).

L’index de recherche est créé grâce au templates [search.json](search.json) :
- L’intégralité du contenu des articles est présent dans l’index : la taille du fichier généré n’est en effet que de ~ 750 KO pour 265 posts (et 250 KO si
  gzippé). Bref pas grand-chose avec les connexions actuelles ou par rapport à une simple image.
- Les retours chariots n’ont pas été supprimés (`strip_newlines`) de l’extrait (car il est affiché sur la page de recherche) ni du contenu (par sécurité). Quand
  on les supprime des mots sont en effet "fusionnés" (par exemple `Maxime\nCriteo` -> `MaximeCriteo`). Il n’est pas certain [que ça dérange
  Simple-Jekyll-Search](https://github.com/christian-fei/Simple-Jekyll-Search/wiki#if-search-isnt-working-due-to-invalid-json) lors de la recherche, mais bon...

## Todo

- keep video directory
- trouver un moyen de traduire les titres des pages "paginées" (pas faisable avec jekyll-paginate ?)
- trouver une liste de termes à [exclure](https://github.com/christian-fei/Simple-Jekyll-Search/wiki#exclude-array-optional) pour tenter d’améliorer la
  recherche avec Simple-Jekyll-Search.
- remove todo :)

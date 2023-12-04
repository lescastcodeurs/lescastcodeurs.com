---
title: LCC 303 - Interview sur Vert.x 4.5 avec Julien Viet
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 303
mp3_length: 34679570
tweet: TODO
# tweet size: 91-93 -> 99-101 #######################################################################
---
Ce qui a commencé comme un crowdcast a fini en interview de Julien Viet sur Vert.x 4.5.

Enregistré le 23 novembre 2023

Téléchargement de l'épisode [LesCastCodeurs-Episode-303.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-303.mp3)

## Interview

### Ta vie ton oeuvre (présentation de l’interviewé)

[Le site de Julien Viet](http://www.julienviet.com/)  
[X (ancien twitter)](https://x.com/julienviet)  

### Vert.x 4.5

Vert.X 4.5 est sorti [https://vertx.io/blog/whats-new-in-vert-x-4-5/](https://vertx.io/blog/whats-new-in-vert-x-4-5/)

- support des thread virtuels qui permet d'écrire le code synchrone pour des cas complexes et utiliser les thread locaux dans ces cas la. Cela ne remplacement pas le code de process des événements
- le code put faire des future await qui ne bloqueront pas le thread principal
- connection SQL dynamique: quand le host change dynamiquement dans l'application
- support des proxies de niveau 7 pour les clients SQL
- rotation certificats a chaud
- des builders (HTTP, SQL connection)
- extensions pour utiliser les coroutines kotlin

## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>  
<!-- vim: set spelllang=fr : -->

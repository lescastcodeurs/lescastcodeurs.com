---
title: LCC 270 - Interview de Nicolas De Loof sur Docker Compose
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 270
mp3_length: 53221858
tweet: Interview de Nicolas De Loof sur Docker Compose
# tweet size: 91-93 -> 99-101 #######################################################################
---
Nicolas De Loof rejoint Emmanuel et Antonio pour discuter de Docker Compose.

Enregistré le 17 décembre 2021

Téléchargement de l’épisode [LesCastCodeurs-Episode-270.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-270.mp3)

## Interview

### Ta vie ton œuvre

[Nicolas De Loof](https://twitter.com/ndeloof)  

### Introduction à la techno

Docker en 1 minute  
Docker compose d’où vient l’idée et le besoin  

### La techno en concepts

Un container c’est quoi ?  
Ça tourne comment ?  

Du coup, on veut en faire tourner plusieurs  
Comment on les "lie" ?  
Network  
autre chose ?  

Mais c’est pas le job de Kubernetes ?  

* deploy
* scaling
* rollback


La spécification  

Discussion sur les notions :

* service
* build
* label
* network
* sécurité (cap_add)

docker-compose vs docker compose

### Comment on l’utilise en pratique pour un dev

Comment je définis mon multi-container  
Lien vers des dockerfiles ?  
Échange d’infos (par exemple DB connection ou mot de passe entre DB et l’appli)  
Ma DB doit démarrer avant mon app  
Ça fait les health check ?  


Je commite ce fichier où typiquement ?
Comment je partage avec mon équipe ?
Et ma CI ?

Comment je mets en prod ?  Je mets en prod hein, ça marche sur ma machine.  

v2 vs v3  

### Sous le capot

Et donc comment ça marche docker compose?  
Zoom sur le network 

La sécurité  

### La communauté, le futur

Roadmap  
Docker desktop payant  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

---
title: LCC 160 - Interview sur Vert.x avec Julien Viet et Clément Escoffier
author: 'Emmanuel Bernard'
layout: blog-post
episode: 160
mp3_length: 71088379
---
Julien et Clément viennent discuter de programmation réactive, de systèmes réactifs et de vert.x.

Enregistré le 25 novembre 2016

Téléchargement de l'épisode [LesCastCodeurs-Episode-160.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-160.mp3)

##  Interview

### Ta vie, ton œuvre

[@julienviet](https://twitter.com/julienviet)  
[Son site](http://www.julienviet.com)  

[@clementplop](https://twitter.com/clementplop)  
[Le site de Clément](http://escoffier.me)  

### Réactif ?

Qu'est-ce que vert.x en 2 minutes.  
On entend beaucoup parler de réactif, ça veut dire quoi ?  
Pourquoi c'est important. 

Quelle est la compétition de vert.x ?  

[vert.x](http://vertx.io)  
[RxJava](https://github.com/ReactiveX/RxJava)  
[RxJava 2](https://github.com/ReactiveX/RxJava/tree/2.x)  
[Reactor](http://projectreactor.io)  

[Le manifeste réactif](http://www.reactivemanifesto.org)  
[Présentation Concurrency is not parallelism](https://blog.golang.org/concurrency-is-not-parallelism)  
[Loi de Amdahl](https://en.wikipedia.org/wiki/Amdahl%27s_law)
[Universal scalability law](http://www.perfdynamics.com/Manifesto/USLscalability.html)  

### Cas d'utilisation

Discussion sur les cas d'utilisation typique.  
Que faire si j'ai mon CRUD classique et un use-case réactif  

[Netty](http://netty.io)  

### Le cycle de développement

Comment est-ce que je démarre une application vert.x  
Embedded vs serveur ?  
Est-ce que je réécris mon serveur HTTP ?  
Le langage que je veux ?  
Quelles sont les primitives avec lesquelles je bosse ?  

Bon les callback c'est bien mais comment je debugge.  
Comment on passe de l'info entre traitement d'événement non bloquant  
Et ma transaction elle peut traverser plusieurs événements ?  
Et on peut encore avoir des bugs avec vert.x ? Comment je teste un système vert.x ?  

La partie web  
Accéder à mes données SGBD  
L'intégration avec des systèmes de messages et autres integration  

* AMQP, JMS, Stomp, Kafka

C'est quoi le message bus dont on parle dans vert.x  

### Partie Réactive et microservice

À Devoxx France 2014, RxJava c'était de la bombe. C'est has-been maintenant ?  
Quel est le paysage réactif aujourd'hui.  

Pour les microservices il y a plein de patterns à connaître.  
Vous fournissez des choses ?  

### Le moteur vert.x

Un seul thread ?  
Quid du bloquant  
Pourquoi un seul thread c'est peux que ce qu'on fait depuis des années ?  
[Mechanical sympathy](https://dzone.com/articles/mechanical-sympathy) ?  

Vous avez un cluster de vert.x  
Ils se parlent comment  
C'est quoi la taille classique  

### Communauté et le futur de vert.x

Alors la communauté Eclipse, ça pue ou pas ?  
Roadmap.  
[vert.x awesome](https://github.com/vert-x3/vertx-awesome)  

## Nous contacter

[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <https://lescastcodeurs.com/>  
En savoir plus sur le sponsoring ? [sponsors@lescastcodeurs.com](mailto:sponsors@lescastcodeurs.com)  

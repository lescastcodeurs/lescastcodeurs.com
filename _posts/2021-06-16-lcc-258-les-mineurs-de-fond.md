--- 
title: LCC 258 - Les mineurs de fond
author: 'Emmanuel Bernard'
layout: blog-post
episode: 258
mp3_length: 50556025
tweet: Les mineurs de fond #spring #vertx #fastly #gradle #mineurs #PR
# tweet size: 91-93 -> 99-101 #######################################################################
--- 
Arnaud, Antonio et Emmanuel discutent des actus du développeur en cette période pré-estivale.
Du Spring Boot, du Hibernate, du Vert.x, du web qui tombe, du Gradle 7, des mineurs et des méthodologies autour des pull-requests.

Enregistré le 11 juin 2021

Téléchargement de l'épisode [LesCastCodeurs-Episode-258.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-258.mp3)

## News

### Langages

[GraalVM 21 sur InfoQ’France](https://www.infoq.com/fr/news/2021/02/graalvm-21-jvm-java/?itm_source=infoq_en&itm_medium=link_on_en_item&itm_campaign=item_in_other_langs)

* Un interpréter Java en Java
* Plus simple a debugger
* Avant ils utilisaient hotspot
* Reste projet
* Java en tant que container de javas 
* Mélanger ahead of time et classique Java 

### Librairies

[Spring Boot 2.5.0 est sorti](https://spring.io/blog/2021/05/20/spring-boot-2-5-is-now-ga) 

* Support for Java 16
* Support for Gradle 7
* Enhanced Docker image building
* New mechanism for Datasource initialisation pour préparer R2DBC
* Les dépendances mises à jour (Spring data, hateoas’ spring Kafka et)
* En gros rien de révolutionnaire, beaucoup de mise à jour et du nettoyage

[Hibernate a 20 ans !](https://twitter.com/hibernate/status/1396425771040792577?s=21)

* Première sortie 
* Ça ne nous rajeuni pas 

[Vert.x 4.1 est sorti](https://vertx.io/blog/eclipse-vert-x-4-1-0/)

* Reactive Microsoft SQLServer driver 
* Vert.x HTTP proxy plutôt que de l’écrire soit même 
* RxJava 3
* OpenTelemetry tracing
* Plus conforme à OAuth2 et OIDC
* Kotlin 1.5
* Flexibilité dans la configuration de pools (plusieurs event loops par pool, waiter cancellation, lock free impl, etc
* Web session stockée dans Infinispan 
* Et plus au niveau sécurité, openapi, service proxy

### Infrastructure

[Un problème chez Fastly et l'internet tousse](https://www.fastly.com/blog/summary-of-june-8-outage)

* Fastly est un CDN
* héberge beaucoup d'artefacts de type NPM, Maven, JS resources etc
* consequence : sites defacés par manque de CSS ou JS, voir HTTP pages non accessibles
* bug déclenché par une config client => fait tomber 85 % du réseau

### Cloud

[Les services d’intelligence artificielle d’AWS ne respectaient pas le non déplacement des données hors de la région par défaut ](https://techmonitor.ai/techonology/cloud/aws-user-data)

* Et le défaut était très bien caché.  Les experts AWS n’avaient pas fait gaffe
* C’était légal mais en tout petit dans les conventions 
* Différence entre télémétrie et les données en propre en général. Pas pour les iA ;)
* Les services impacté AWS Terms 50.3 mention CodeGuru Profiler, Lex, Polly, Rekognition, Textract, Transcribe, and Translate. 60.4 also mentions this for SageMaker. 75.3 mentions this for Fraud Detector. 76.2 mentions this for Mechanical Turk and Augment AI.

### Web

[Vers un système unique et une API commune pour les extensions dans les navigateurs](https://appleinsider.com/articles/21/06/04/apple-mozilla-google-microsoft-form-group-to-standardize-browser-plug-ins)

* Des gens de Apple (Safari), Google (Chrome), Microsoft (Edge) et Mozilla (Firefox) vont collaborer ensemble, au sein du WECG
* [Web extensions community group](https://www.w3.org/community/webextensions/)
* Base sur le travail de safari de supporter les extensions des autres navigateurs 
* On a vu des défis et réduction de possibilités pour contrôler la sécurité et le tracking
* De toute façon tout le monde est sur Chromium haha 

### Outillage

[Gradle 7 est sorti et Cédric nous fait un crowdcast ](https://gradle.org/whats-new/gradle-7)

* D’ailleurs, Cédric quitte Gradle Inc après des années de bons et loyaux services 

[Prosus achète Stack Overflow pour 1,8 milliards](https://stackoverflow.blog/2021/06/02/prosus-acquires-stack-overflow/)

* Prosus avait déjà des parts dans des entreprises type Codeacademy, et Udemy, dans l’EDU/tech
* StackOverflow commence en 2008
* [Migration vers SaaS d StackOverflow](https://siliconangle.com/2020/05/18/stack-overflow-ramps-up-saas-model-as-it-builds-relationships-with-microsoft-and-developers-cubeconversations/) intéresse Prosus 
    * Jobs 50% du revenu
    * Team collaboration tool bonne croissance 
    * C’est stackoverflow pour les équipes internes 

[docker hub autobuild, les crypto mineurs m'ont tué](https://www.docker.com/blog/changes-to-docker-hub-autobuilds/). 

> En avril, nous avons vu le nombre d’heures de construction augmenter de 2 fois notre charge habituelle et à la fin du mois, nous avions déjà désactivé ~ 10 000 comptes en raison d’abus de minage. La semaine suivante, nous avons eu environ 2 200 mineurs supplémentaires.

* Il faut contacter Docker pour les projets OSS de bonne volonté qui ont besoin de ce service 

### Méthodologies

[Le temps moyen de PR entre Stripe et Mozilla](https://twitter.com/jlongster/status/1400511441556459523?s=21)

* Des jours à attendre le feedback vs 10 minutes 
* C’est un débat assez fondamental je trouve. Comment organiser les équipes pour que les PR soient vues comme la chose importante. Plus que « le code ». 
* Différence Service vs product 

### Loi, société et organisation

[Un article de rappel sur la copie privée](https://www.nextinpact.com/article/30201/108870-la-redevance-copie-privee-vache-a-lait-industries-culturelles)

* Copie privée basse sur les cassettes et VHS. Ensuite le stockage numérique explose 
* 270 millions d’euros en France en 2017
* Une commission administrative fixe les règles. Composée.  de 6 usagers, 6 vendeurs de stockage, 12 ayants droit et un président au droit de vote et pro ayant droit. Rapport de force clair
* Ils essayent de construire la vache à lait : prix basé sur la copie licite ou pas (cassé en 2008) ensuite argument de compression pour garder le barème haut 
* En théorie que pour les particuliers et procédure de remboursement pour les pros. Mais difficile à appliquer donc quasi jamais fait. 
* 25 % des gains financent des festivals et manifestations culturelles : instrument d’influence des élus locaux et pas si locaux 
* Efforts pour taper sur tous les disques durs nus, faire entrer dans le champ le stream ripping
* Et maintenant [la copie privée sur la vente d’occasion](https://actualitte.com/article/100640/politique-publique/copie-privee-les-appareils-reconditionnes-pomme-de-discorde). La grande classe. 
    * Risque pour l’économie solidaire qui sont sur des populations fragiles 
    * Le sénat veut favoriser l’écologie de la seconde main et serait pour l’exclusion de la taxe dans ce cas-là. 
    * Les smartphones c’est 70 % de leurs revenus

## Outils de l'épisode

[Google ZX pour écrire des scripts en JavaScript](https://t.co/kDnarh0A13)

## Conférences

[RivieraDev](https://rivieradev.fr)

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

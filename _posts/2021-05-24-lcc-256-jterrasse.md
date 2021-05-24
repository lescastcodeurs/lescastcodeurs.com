---
title: LCC 256 - jTerrasse
author: 'Emmanuel Bernard'
layout: blog-post
episode: 256
mp3_length: 85017000
tweet: jTerrasse #javadoc #quarkus #cyrotomonnaie #bootstrap5 #grafana #clouddeconfiance #cypress #hackcommitpush
# tweet size: 91-93 -> 99-101 #######################################################################
---
Antonio et Emmanuel discutent entre autre de JavaDoc, Quarkus, Crypto dans le CI, bootstrap 5, Grafana, cloud de confiance sans oublier les crowdcasts sur Cypress et sur hack.commit.push du 29 mai.

Enregistré le 21 mai 2021

Téléchargement de l'épisode [LesCastCodeurs-Episode-256.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-256.mp3)

## News

### Langages

[Un JEP pour améliorer la JavaDoc](https://openjdk.java.net/jeps/413)

* On va pouvoir référencer par exemple des morceaux de code dans un autre fichier, dans un test, et l’intégrer dans la JavaDoc d’une méthode, d’une classe. Ca permettra d’avoir de la doc vraiment à jour au niveau des bouts de code, vu que ce sera toujours le vrai code qui tourne qui sera inséré dans la JavaDoc.
* Il pourra y avoir également de la coloration syntaxique
* de définir des régions qui doivent être surlignées pour être bien visibles
* Il sera possible de modifier certaines parties d’un snippet de code, par exemple pour cacher une chaine de caractère de test dont on se moque de la valeur quand on explique ce bout de code
* Possibilité de rajouter des liens hypertextes sur certains bouts de code, pour pointer par exemple vers la JavaDoc d’une méthode utilisée dans ce bout de code
* Pourvu qu’ils reprennent le plus possible la syntaxe asciidoctor qui a déjà résolu ce problème 

[Asciidoclet](https://github.com/asciidoctor/asciidoclet)  

[Discussion sur le raisons du besoin derrière Loom](https://inside.java/2021/05/10/networking-io-with-virtual-threads/)

* Article qui reste d.un premier niveau, il faut creuser,les bénéfices réels 
* IO et synchro bloque un thread. Limite scalabilité. Le code asynchrone est plus dur à comprendre. 
* Virtual threads don’t bien pour des taches qui passent beaucoup de temps à attendre 
* Les API IO blocantes parkent le virtual thread quand elles sont en attente 
* Un poller (boucle d’evenement) regarde les IO et leur état et unpark les virtualthread correspondant 
* Mechanisme similaire aux frameworks non blocs to de type vert.x mais avec une API bloxante 

### Librairies

[Quarkus 2.0 alpha 1, 2 et 3 sont sortis](https://quarkus.io/blog/quarkus-2-0-0-alpha1-released/)

* Quarkus 2 parce que vert.x 4 et MicroProfile 4, pas de “gros” breaking changes mais quelques uns surtout pour les extensions
* Continuous Testing: dans la console, on voit les tests qui plantent. Et quand on fait un code change, uniquement les tests qui sont impactés sont joués (flow analysis).
* Lance aussi dans un container dédié les dépendances (e.g. une base de donnée pour les tests utilisant Hibernate). LE container pour les tests en continu est différent de celui pour le quarkus:dev qui tourner (pas de pollution).
* JDK 11 minimum

[Micronaut 2.5 est sorti ](https://docs.micronaut.io/latest/guide/#whatsNew)

* support for @java 16 and @graalvm 21.1 on Micronaut Launch,
* huge improvements to Micronaut Data from @DenisStepanov,
* improved @OracleCloud integration
* and many other small improvements

### Infrastructure

[Les cryptomineurs tuent les CI gratuite](https://layerci.com/blog/crypto-miners-are-killing-free-ci/)

* Les mineurs de crypto monnaies abusent des services de CI qui offre des capacités de build gratuites
* Une des nouvelles astuces c’est d’utiliser les outils comme Pupetteer pour automatiser l’utilisation d’un navigateur web, pour miner de la crypto monnaie dans le navigateur qui tourne en headless sur la machine de CI
* A la grande époque de OpenShift online et OpenShift.io, on a beaucoup appris sur le detection des Bitcoin miners :)
* on a eu le soucis sur Codeship (la CI SaaS de CloudBees). Ils ont passé un max de temps à virer et proteger les builds. J’ai vu que GitHub avait eu aussi le soucis

[Les 19 étapes facile pour écrire un dockerfile](https://jkutner.github.io/2021/04/26/write-good-dockerfile.html)

* En vérifiant l’ordre de ses commandes, en limitant le scope de Copy, d’aligner les RUN d’installation de package, d’utiliser des images officielles, voire de se créer ses images de base, d’utiliser des tags spécifiques pour des images plus reproductibles, effacer le cache du package manager, de builder dans une image offrant un environnement cohérent, de récupérer ses dépendance dans une étape à part, de faire du multi-stage build... Ou d’utiliser les Cloud Native Buildpacks! (sur lesquels Joe bosse)
* Article qui nous explique la complexité et les trade off impossibles. Et donc que buildpack c’est indispensable 

[Comparaison Apache Kafka et Apache Pulsar](https://blog.bigdataboutique.com/2021/03/apache-kafka-vs-apache-pulsar-video-fd3fi2)

* pulsar a des brokers sans etat et deriere il y a des bookkeepers (qui stockent les data).
* Cela permet plus de flexiblités pour augmenter ou descendre le nbombre de brokers. mais avec plus de “moving parts” et avec un hop de reseau supplémentaire.
* Mais l’architecture est plus flexible notamment pour Kubernetes
* Le stockage étagé et la geo replication est plus facile dans Pulsar (par default). Stockage etageé c’est de stocker l’info dans un S3 quand ellee st vielle par example.
* Pulsar est multitenant par design.
* Pulsar accepte des gros messages et sit les fragmenter au besoin
* plus grosse communaute sur Kafka mais il y a des composants non open source (Confluent).

### Cloud

[Red Hat OpenShift Streams for Apache Kafka : un service cloud de Kafkas managé](https://twitter.com/emmanuelbernard/status/1387687197621563396)

* C’est ce sur quoi emmanuel a bossé ses 9 derniers mois
* [Essayer le Managed Kafka de red hat](https://red.ht/TryKafka)
* Red Hat OpenShift Streams for Apache Kafka: un cloud service de Kafka managés https://twitter.com/emmanuelbernard/status/1387686420903563264
* Super intégration avec Quarkus et utilise Quarkus a l’intérieur 


### Web

[Bootstrap 5 est sorti](https://blog.getbootstrap.com/2021/05/05/bootstrap-5/)

* New offcanvas component
* New accordion
* New and updated forms
* RTL is here
* Overhauled utilities
* New snippet examples
* Improved customizing
* Browser support
* Dropped Microsoft Edge Legacy
    * Dropped Internet Explorer 10 and 11
    * Dropped Firefox < 60
    * Dropped Safari < 10
    * Dropped iOS Safari < 10
    * Dropped Chrome < 60
    * Dropped Android < 6
* JavaScript
    * No more jQuery!
* Le [Guide de migration est ici](https://getbootstrap.com/docs/5.0/migration/)

Crowdcast sur [Cypress](https://www.cypress.io/) par Emmanuel Demey  

[La fin de Google AMP ou son intérêt devrait descendre ](https://www.lafoo.com/the-end-of-amp/)

* AMP avait un avantage majeur. Celui d’être en premier sur les résultats du moteur de recherche. 
* Et les médias passaient en AMP rien que pour ça parce que le traffic du moteur de recherche dominant est essentiel
* Mais AMP posait beaucoup de problèmes techniques et éthiques. Le contenu était hébergé et caché sur des pros idées edge et en pratique Google. 
* Donc les mesures d’audience étaient plus compliqeees 
* Et les ads avaient aussi des bias pavers la régie google. 
* Les prochains scoring de google search seront neutre ce qui risque faire baisser les pages amp
* Les pages amp avaient du réinventer beaucoup de concepts du web 

### Outillage

[JFrog garde Bintray JCenter en lecture seule y compris le miroir de Maven central ](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/)

* Ca sent le truc planifie pour faire migrer et descendre le traffic et arriver en bon samaritain après. Cela dit ils étaient bon samaritains avec la version gratuite 
* Au moins les builds anciens ne vont pas casser 

[Docker desktop : sauter une mise à jour devient une option payante](https://www.docker.com/blog/changing-how-updates-work-with-docker-desktop-3-3/)

* a partir de Docker 3.3 on peut éviter l’installation d’une nouvelle version avec la souscription pro ou team. Si j’ai bien compris. 
* Tu peux faire un rappel pour plus tard mais tu ne peux effectivement pas refuser définitivement une version donnée sans payer sinon ils te harcèlent (je ne connais pas la fréquence) pour upgrader. 
* En gros si tu ne paies pas tu dois être sur latest. Ils ne vont pas faire du support sur d’anciennes version pour les clients gratuits 
* Ce qui est logique. 

[Spock 2.0](https://spockframework.org/spock/docs/2.0/release_notes.html)

* Spock est rebasé sur JUnit Platform
* Support de l’exécution en parallèle des test specs et des test features
* Support de Groovy 3
* Améliorations des tests avec des données tabulaires


### Sécurité

[Bug de dénie de service dans snakeyml](https://snyk.io/blog/java-yaml-parser-with-snakeyaml/)

* C’est du à la capacité de faire des références qui contiennent une référence à un élément plus haut. Paf récursion infinie. 
* à un moment, notre support YAML dans Groovy utilisait SnakeYaml il me semble, mais je viens de vérifier, on est passé à Jackson

### Loi, société et organisation

[Grafana, Loki et Tempo passent de ASL 2 à AGPL](https://grafana.com/blog/2021/04/20/grafana-loki-tempo-relicensing-to-agplv3/)

* La AGPL c’est la GPL mais pour lequel un services est comme une distribution
* inspiré par MongoLab CoackroachDB etc
* Cela reste open source au moins même si il y a des interprétations différentes du linkage et donc des risques 
* Est-ce que un service qui utilise grafana doit entièrement être AGPL?

[Quand un troll de brevet attaque, cloudflare contre attaque](https://techcrunch.com/2021/04/26/cloudflare-rallies-the-troops-to-fight-off-another-so-called-patent-troll/?guccounter=1&guce_referrer=aHR0cHM6Ly9kdWNrZHVja2dvLmNvbS8&guce_referrer_sig=AQAAAEKNBJxidgIYvuXxPu-69VCJuD9nzkRUHMT62_2SS9vEox3eoMhFekoDHrH4ZSrjpsithr74uN62VF-i-6mt4MRqRREcR7NOFjiGy1T5VARNkaXcxG6F3zXxBqCyBUSxaoECUB1yCMc7XChZ6BKwEjdbUPIQtzmraWENdciwdYja)

* cloud flare est attaqué par un troll de brevet et contre attaque pour la seconde fois en payant la recherche d’antériorité sur l’ensemble du porte feuille de brevets de cette entité.
* Pour lui faire perdre une bonne partie de la valeur. « You do not negotiate with terrorists or children »

[BaseCamp perd 30% de ses employés après son ban de conversations sociétales ](https://www.google.com/amp/s/marker.medium.com/amp/p/d487bed43155)

* La liste des noms d’employés « funny » est ressorti avec des relents racistes
* Les employés ont visiblement eu un débat dessus 
* DHH et Fry on fait un mémo bannissant les conversations politiques et sociétale parce que elle n’amenaient pas de bien pour la société (resentment etc)
* Mais les employés le voient comme une façon de ne pas voir les sujets importants en face et les impactes des produits tech sur la société 
* Ils on offert un golden parachute à qui voulait partir 
* Et boom 30% ont dit oui 

[Stratégie nationale du cloud français](https://www.lemonde.fr/economie/article/2021/05/17/cloud-la-france-se-veut-plus-souveraine_6080442_3234.html)

* cloud solution d'hébergement par défaut des services numériques d'état
* protégé de règlementation extracommunautaire
    * contre le cloud act et autres lois
* label "Cloud de confiance" c'est comme le porc salut
    * mise à jour du SecNumCloud de l'ANSSI
* solution hybride société Française ou Européenne en utilisant les briques logicielles de groups américains
    * serveurs en France
    * opérés par des entreprises européennes
    * détenues par des européens
* "les américains sont les plus avancés"
    * Google et Microsoft ont signé l'accord de licence
    * donc pas Amazon

[Cloud de Confiance en qui ? par Laurent Doguin](https://ldoguin.name/fr/2021/05/quoi-cloud/)  

## Outils de l'épisode

[MuseGroup rachète audacity](https://www.minimachines.net/actu/muse-group-rachete-le-logiciel-audacity-99063)

* Enfin la marque
* Promet des designers sur l’interface et des contributeurs
* Et de rester open source
* On va voir

## Conférences

[Devoxx france bougent au 29, 30 septembre et 1er octobre](https://twitter.com/DevoxxFR/status/1389489979978563584)  

Crowdcast d'Agathe sur [hack.commit.push](https://paris2021.hack-commit-pu.sh/) samedi 29 mai, inscrivez-vous !

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

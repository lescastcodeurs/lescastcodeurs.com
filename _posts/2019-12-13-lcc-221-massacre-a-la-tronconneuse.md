---
title: LCC 221 - Massacre à la tronçonneuse
author: 'Emmanuel Bernard'
layout: blog-post
episode: 221
mp3_length: 72585277
tweet: Massacre à la tronçonneuse #gc #rachat #vente #javaisback
# tweet size: 91-93 -> 99-101 #######################################################################
---
Guillaume, Arnaud et Emmanuel descendent dans les profondeurs des garbage collectors, Java 14, GraalVM 19.3 (Java is back!) et bien sûr pleins d'autres choses !

Enregistré le 5 décembre 2019

Téléchargement de l'épisode [LesCastCodeurs-Episode-221.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-221.mp3)

## News

### Langages

[GraalVM 19.3 with JDK 11 Support](https://medium.com/graalvm/graalvm-19-3-0-dfdb6f4ec8ed).  
[GraalVM se met aussi à WebAssembly](https://medium.com/graalvm/announcing-graalwasm-a-webassembly-engine-in-graalvm-25cd0400a7f2)  

[Microsoft ready to contribute to OpenJDK](https://mail.openjdk.java.net/pipermail/discuss/2019-October/005173.html)  

Trois JEPs prévus pour être intégrés à Java 14 :

* [JEP 305 : Pattern Matching for instanceof](https://openjdk.java.net/jeps/305)  
* [JEP 359 : Records](https://openjdk.java.net/jeps/359)  
* [JEP 343 : Packaging Tool dans l'Incubator](https://openjdk.java.net/jeps/343)  

[Stephen Colebourne râle sur le nouveau switch](https://blog.joda.org/2019/11/java-switch-4-wrongs-dont-make-right.html)  

[Tricher le GC de Go avec du poids mort](https://blog.twitch.tv/en/2019/04/10/go-memory-ballast-how-i-learnt-to-stop-worrying-and-love-the-heap-26c2462549a2/)  

* le GC se déclenche tous les 2x de heap
* si pas d'alloc, ca veut dire qu'il vide jusqu'à 1x mais déclenche des GC super fréquemment
* donc en allouant (virtuellement) un tableau de 10Go, on réduit le temps entre GC
* le cout d'un concurrent mark sweep c'est de marquer les objets vivants (les morts ont peu de cout)
* et les co-routines pendant une phase de mark-sweep doivent faire un travail de mark ce qui les ralenties
* donc moins de GC veut dire plus rapide
* c'est le coût à payer pour un GC avec 1 ou peu de paramètres.

[Shenandoah: éliminer les mots de pointeurs en avant](https://developers.redhat.com/blog/2019/06/28/shenandoah-gc-in-jdk-13-part-2-eliminating-the-forward-pointer-word/)  

* Shenandoah bouge les objets sans mettre à jour ses pointeurs
    * juste garde une copie dans l'objet même de ses references
    * puis met à jour les references de manière concurrente en parallèle de l'appli
    * et enfin peut virer les objets.
* par défaut Shenandoah demande un word supplémentaire par objet
    * si le word == l'objet, on est normal, sinon il pointe vers la nouvelle copie de l'objet
    * 5 à 10 % de mémoire supplémentaire en pratique
* peut réutiliser le mark word mais comparaison chère surtout à faire à chaque read-barrier
    * uniquement pendant un GC et sur les objets dans des collections set => peu fréquents
    * dans les tests le code de décoding supplémentaire est pas visible dans les benchmarks
* mais ils ont éliminé les read barrier en load-reference-barrier qui sont moins fréquentes en nombre d'objets
* meilleure densité mémoire, moins de pression sur le CPU cache, plus de throughput

### Librairies

* [Eclipse Collections](https://github.com/eclipse/eclipse-collections), [10 raisons de les utiliser](https://medium.com/oracledevs/ten-reasons-to-use-eclipse-collections-91593104af9d).  
* [Mapper des erreurs HTTP du REST client vers des exceptions avec Eclipse MicroProfile](https://itnext.io/how-to-deal-with-4xx-5xx-responses-in-microprofile-rest-client-2e16559f542)  
* [vert.x 3.8.4](https://vertx.io/blog/eclipse-vert-x-3-8-4/)  
* [Spring Boot 2.2.1](https://spring.io/blog/2019/11/07/spring-boot-2-2-1-available-now), [Spring Framework 5.2.2 and 5.1.12](https://spring.io/blog/2019/12/03/spring-framework-5-2-2-and-5-1-12-available-now). 

[Micronaut en Trial dans le tech radar de ThoughtWorks](https://www.thoughtworks.com/radar/languages-and-frameworks?blipid=201904032) et [Quarkus en assess](https://www.thoughtworks.com/radar/languages-and-frameworks/quarkus)  


### Middleware

[Le Camel a trois bosses](https://camel.apache.org/blog/Camel3-Whatsnew/)  

* un ensemble de projets (Camel, Camel K, Camel extensions pour Quarkus)
* nouveau site web
* Java 11 support et abandon de Java 8 durant 2020
* Camel core modularisé et moins de classes à démarrer, réduire la reflection
* support de GraalVM via Quarkus
* DSL typesafe de définition de endpoint
* Cœur réactif
* Intégration avec microprofile
* nouveaux composants ( - graphql - 4 more AWS components - Debezium components)

### Infrastructure

[Sonatype racheté](https://techcrunch.com/2019/11/18/sonatype-acquired/)  
[Annonce par Sonatype du rachat](https://blog.sonatype.com/vista-acquires-a-majority-interest-in-sonatype)  

* par une boite de private equity...
* il est temps de backuper central

[Docker à la découpe](https://www.docker.com/press-release/docker-new-direction). [Docker Enterprise racheté par Mirantis](https://techcrunch.com/2019/11/13/mirantis-acquires-docker-enterprise/)  
[Les fondateurs de Google tournent la page](https://www.blog.google/inside-google/alphabet/letter-from-larry-and-sergey/)  

### Cloud

[AppEngine Java 11 Runtime FAQ](https://ludoch.github.io/java11.html).   
[Pas bien les Fat JAR dans les images de conteneur](https://phauer.com/2019/no-fat-jar-in-docker-image/)  
[Helm 3 est sorti](https://helm.sh/blog/helm-3-released/)  

### Web

[.org est vendu](https://www.theregister.co.uk/2019/11/20/org_registry_sale_shambles/), [sauvons les .org](https://savedotorg.org/)  ( Ils ont réussi à [fâcher Kohsuke](https://givesignup.blog/2019/11/24/org-for-profit/) ).   

### Data

[R2DBC 0.8](https://r2dbc.io/2019/12/02/r2dbc-0-8-0-goes-ga)  
[Exposer les entités persistées dans vos API ou pas](https://thoughts-on-java.org/dont-expose-entities-in-api/)  

* Plus simple, un seul objet
* plus compliqué des détails d'implémentations (nouveau champ d'un cote ou de l'autre)
* accumulation d'annotations pour abstraire ses modèles (JSON, JPA)
* associations gérées en proxy dans JPA et en id ou null dans API
* V2 de l'API
* agrégation des données dans l'API

### Outillage

[La matrice arrive dans Jenkins Pipelines](https://jenkins.io/blog/2019/11/22/welcome-to-the-matrix/).  
[Jenkins Health Advisor par CloudBees](https://jenkins.io/blog/2019/11/22/jenkins-health-advisor-by-cloudbees/).   
[L'expérience zsh de Julien Ponge](https://julien.ponge.org/blog/a-good-terminal-experience-with-iterm2-and-zsh-on-macos/)  

[Cédric explose le mythe du scripting vs déclaratif dans Gradle](https://melix.github.io/blog/2019/11/gradle-scripting.html)  
[Comment éviter l'enfer des dépendances avec Gradle 6](https://blog.gradle.org/avoiding-dependency-hell-gradle-6)  

### Méthodologies

[L'humain est résiliant aux chocs de la vie mais pas tant que cela au chômage de longue durée](https://twitter.com/DKThomp/status/1201177826428215297)  

* [étude](https://ourworldindata.org/happiness-and-life-satisfaction)
* Plus on est dans un pays développé, plus on est heureux
* on est plus heureux maintenant qu'il y a quelques années (croissance)
* plus on est riche, plus on est heureux

### Loi, société et organisation

[Save your code on Software Heritage Archive](https://archive.softwareheritage.org/save/).  

## Conférences

* [Snowcamp du 22 au 25 janvier 2020](https://snowcamp.io/fr/)
* [DevFest Paris le 14 février 2020](https://devfest.gdgparis.com/) - Le [CfP](https://conference-hall.io/public/event/ODBtjOW9rpElZKnhzuXF) est ouvert.
* [Breizhcamp du 25 au 27 mars 2020](https://www.breizhcamp.org/) - [Le CfP est ouvert](https://breizhcamp.cfp.io)   
* [Devoxx France du 15 au 17 avril 2020](https://www.devoxx.fr/) - [Le CfP est ouvert](http://cfp.devoxx.fr/) - [Les places sont réservées en 57h](https://reg.devoxx.fr/)   
* [RivieraDev du 13 au 15 mai 2020](https://rivieradev.fr/) - [Le CfP est ouvert](https://conference-hall.io/public/event/93yz1UrcsugPKYsoxJjL)   

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

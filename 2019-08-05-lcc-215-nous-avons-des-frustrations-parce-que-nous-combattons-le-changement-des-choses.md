---
title: LCC 215 - Nous avons des frustrations parce que nous combattons le changement des choses
author: 'Emmanuel Bernard'
layout: blog-post
episode: 215
mp3_length: 62674276
tweet: Nous avons des frustrations parce que nous combattons le changement des choses #immuabilite #tendances #sondage #eventstorming #loi
# tweet size: 91-93 -> 99-101 #######################################################################
---
Arnaud et Emmanuel bravent les chaleurs pour discuter des tendances Java, des collections immuables (d'où le titre de l'épisode, une citation d'Alan Watts), de sondage de la population de développeurs, d'event storming, de lois et de data structures.

Enregistré le 31 juillet 2019

Téléchargement de l'épisode [LesCastCodeurs-Episode-215.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-215.mp3)

## News

### Langages

[Rapport sur les tendances Java par InfoQ](https://www.infoq.com/articles/java-jvm-trends-2019/)  
[Collections immuables en Java : ni maintenant, ni jamais](https://blog.codefx.org/java/immutable-collections-in-java/)  
[Yaegi : un nouveau compilateur pour Go](https://blog.containo.us/announcing-yaegi-263a1e2d070a)  
[Zulu 8 inclut maintenant le support de TLS 1.3, permettant aux applications Java 8 (serveurs, clients, peu importe) de négocier automatiquement TLS 1.3 sans modification du code. Ajoutez simplement `-XX:+UseOpenJSSE`](https://www.azul.com/downloads/zulu-community/)  

### Sondage

[L'état des développeurs: sondage JetBrains2019](https://www.jetbrains.com/lp/devecosystem-2019/)

* Langage
    * Java le langage principal pour 34% (JavaScript 40%) mais leseul langage pour 44% de ceux ci
    * OS de dev: Windows un peu en tête mais sinon égal
    * polyglot
* Apps
    * Backend 60% / front 46%)
    * Mobile 23%
    * data analysis (13%) / ML (7%)
    * ne developpe pas (13%)
    * polyapp
* OpenSource
    * 56% contribuent à l'open source dont 37% plusieurs fois par an ou plus
* Tests
    * aucun (16%)
* Mobile
    * 83% font de l'Android et 59% iOS
    * Frameworks cross-platforms 42: react native, 30 flutter, 29: cordova, 28 Ionic
* Outils
    * 9% IDE cloud
    * 10% code review
    * 44% issue tracker (Excel sinon?)
    * moi j'ai besoin gestion soirce, issue tracker, ide au minimum)
    * 83% dark theme
* Fun
    * 33% de chiens, 26% cats, 23% les deux, 17% sans ; 1% autre (alligator?)
    * Code le week end 87%
    * AI replace devs 6% oui completement, 57% partiellement

[Demographique du sondage](https://www.jetbrains.com/lp/devecosystem-2019/demographics/)

* 70% employee temps plein, 6% employeir, 6% freelance, 1% retraite
* La societe 10% opensource 61% produit 47% dev interne 
* taille de l'equipe 2-7: 51% 8-12 21%
* methodo agile 40% scrum, 11% kanban, 3% XP, 32% programming mother fucker (none)

[Ecosystème Java](https://www.jetbrains.com/lp/devecosystem-2019/java/)

* Version: 11: 22%, 10 et 9: 13-14%, 8: 83%, 
* Quel app serveur: 66% tomcat, 21% jetty, 5%: WL, WS, Wildfly, JBoss EAP, Glassfish, 23% aucun
* si aucun, quoi? SB 61%, netty 12% Spark Java 6%, vert.x 4%, undertow 3%
* embedded 62% , war: 53%
* Web framework: Spring Boot 56% (ca fait peur, comme Google == internet), Spring MVC 43%
* build system Maven 70%, gradle 53%, ant 13%
* latest Java EE 39%

[Scala](https://www.jetbrains.com/lp/devecosystem-2019/scala/)  

* versions 2.13: 20% 2.12: 68%, 2/11: 36%
* sinon 73% utilisent Java 8, 28% java 11
* unit test Scalatest 77%, JUnit 26%
* 10% whitebox macros, 60% n'utilisent pas les macros
* web framework akka-http: 39% Play 38% Spring 17%
* libraries Akka 55% Spark 40% 
* build system 71% sbt 39% maven 18% gradle

[Kotlin](https://www.jetbrains.com/lp/devecosystem-2019/kotlin/)

* target: Android: 66% JVM 57% native 8%
* JDK 11: 25% 10-9: 11-14% 8: 80%
* Android: 74% Pie 9 79% 8 Oreo, sous 50% à la 4 KitKat
* type of app: mobile: 62%, web abckend 41%, libraries 29%
* 71% pour travail, 69% maison
* autres langages 86% Java

[Databases](https://www.jetbrains.com/lp/devecosystem-2019/databases/)  

* usage MySQL 60%, PostgreSQL 32%, MongoDB 30%, Rediis 27% Oracle dB 16% ???

### Frameworks

[Quarkus 0.19 avec acces MongoDB, Neo4j, AWS DynamoDB et Apache Tika](https://quarkus.io/blog/quarkus-0-19.1-released/)  

### Middleware

[Elastic Cloud on Kubernetes (ECK) 0.9.0 Alpha 2](https://www.elastic.co/blog/announcing-elastic-cloud-on-kubernetes-eck-0-9-0-alpha-2)  

### Cloud

[Kubernetes est maintenant disponible sur CloudFoundry](https://content.pivotal.io/pivotal-announcements/pivotal-makes-kubernetes-easier-for-developers-and-operators)  

### Data

[Micronaut Predator est sorti](https://jaxenter.com/micronaut-predator-160237.html) et [renommé](https://objectcomputing.com/news/2019/07/26/micronaut-predator-renamed-micronaut-data)  

### Outillage

[Importer les rapports Jacoco au format XML dans SonarQube](https://community.sonarsource.com/t/coverage-test-data-importing-jacoco-coverage-report-in-xml-format/12151)  
[Netbeans 11.1, la première release ASF en tant que toplevel project](https://www.infoworld.com/article/3411936/netbeans-111-adds-java-ee-8-support.html)  

### Méthodologies

[Event Storming, une description](https://pablopernot.fr/2019/07/event-storming-description/)  

### Sécurité

[Jouez avec les adresses IPs](https://twitter.com/0xInfection/status/1148267196306427904)  
[Zoom Zero Day](https://medium.com/bugbountywriteup/zoom-zero-day-4-million-webcams-maybe-an-rce-just-get-them-to-visit-your-website-ac75c83f4ef5)  
[NoLimitSecu - Hors Série – Episode 1 – Histoire du droit du numérique](https://www.nolimitsecu.fr/hors-serie-episode-1-histoire-droit-numerique/)  

### Loi, société et organisation

[Le code source de l'ordinateur de guidage de module lunaire et du module de commande d'Apollon 11 open sourcé sur GitHub](https://github.com/chrislgarry/Apollo-11)  
[Quand GitHub applique la legislation US et bloque brutalement les utilisateurs d'Iran et autres pays sous sanction](https://medium.com/@hamed/github-blocked-my-account-and-they-think-im-developing-nuclear-weapons-e7e1fe62cb74) ([Et avec moins d'affectif](https://www.zdnet.com/article/github-starts-blocking-developers-in-countries-facing-us-trade-sanctions/)). [Des projets comme Nuxt.js impactés](https://twitter.com/nuxt_js/status/1154835177115455488)  
[L’Assemblée nationale adopte la loi sur la cyberhaine](https://www.numerama.com/politique/532530-lassemblee-nationale-adopte-la-loi-sur-la-cyberhaine.html)  
[Facebook écope d’une amende historique de 5 milliards de dollars et repense son fonctionnement](https://www.numerama.com/politique/535888-facebook-ecope-dune-amende-historique-de-5-milliards-de-dollars-et-repense-son-fonctionnement.html)  
[Taxe française sur les géants du net : 9 questions pour tout comprendre](https://www.numerama.com/business/479051-taxe-francaise-sur-les-geants-du-net-9-questions-pour-tout-comprendre.html)  
[La France a adopté la “loi Huawei” au grand dam des opérateurs télécoms](https://www.lesnumeriques.com/mobilite/la-france-a-adopte-la-loi-huawei-au-grand-dam-des-operateurs-telecoms-n138617.amp.html)  
[Handicap : les grandes entreprises vont devoir rendre accessibles leurs sites et applis](https://www.numerama.com/politique/536130-handicap-les-grandes-entreprises-vont-devoir-rendre-accessibles-leurs-sites-et-applis.html)  
[Qu'est ce qui se passerait si tous vos canaux Slack fuitaient ?](https://www.nytimes.com/2019/07/01/opinion/slack-chat-hackers-encryption.html)  
[Travail en remote : ce qu’il faut savoir avant de se lancer !](https://blog.alan.eu/bien-etre-au-travail/travail-en-remote)  
[En vrac par Tristan Nitot](https://standblog.org/blog/post/2019/07/27/En-vrac-pour-les-17-ans-du-Standblog)  

## Outils de l'épisode

[Twitter : cette extension Chrome et Firefox permet de revenir à l’ancienne version](https://www.numerama.com/tech/536423-twitter-cette-extension-chrome-et-firefox-permet-de-revenir-a-lancienne-version.html)  

## Rubrique débutant

[Les data structures, les objects et un un peu d'énervement sur les ORMs](http://blog.cleancoder.com/uncle-bob/2019/06/16/ObjectsAndDataStructures.html)  

* An Object is a set of functions that operate upon implied data elements.
* A Data Structure is a set of data elements operated upon by implied functions

## Conférences

[JugSummerCamp le 13 septembre 2019](http://www.jugsummercamp.org/edition/10).  
[DevFest Toulouse le 3 octobre 2019](https://devfesttoulouse.fr/).  
[Neo4j **Online** Developer Expo and Summit (NODES) le 10 octobre 2019](https://neo4j.com/blog/nodes-2019-neo4j-online-developer-expo-summit/).   
[KOTLIN/EverywhereParis le 19 octobre 2019](https://everywhere.kotlin.paris/#/).  
[DevFest Nantes les 21 et 22 octobre 2019](https://devfest.gdgnantes.com/).  
[Voxxed Microservices 21 au 23 octobre 2019](https://voxxeddays.com/microservices/).  
[ScalaIO](https://scala.io/) du 29 au 31 octobre a Lyon. Thème programmation fonctionelle.  
[Devoxx Belgique du 4 au 8 novembre 2019](https://devoxx.be/)  
[Bdx.io le 15 novembre 2019](https://www.bdx.io/#/home).  
[DevOps D-Day les 13 et 14 novembre 2019](http://2019.devops-dday.com/) - Le [CfP](http://2019.devops-dday.com/index.html) est ouvert.  
[Codeurs en Seine le 21 novembre 2019](https://www.codeursenseine.com/2019/)  


## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

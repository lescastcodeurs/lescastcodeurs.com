---
title: LCC 227 - Télétravailler une corona dans une main et un gamin dans l'autre
author: 'Emmanuel Bernard'
layout: blog-post
episode: 227
mp3_length: 63015187
tweet: Télétravailler une corona dans une main et un gamin dans l'autre #coronavirus #graphql #architecture #ghostcat
# tweet size: 91-93 -> 99-101 #######################################################################
---
Cet épisode parle du coronavirus, des conférences annulées, de la popularité des langages, de GraphQL, de Ghostcat et pleins d'autres choses encore.
L'intro date un peu : les infos sur le coronavirus étant encore plus fréquentes que les nouveaux frameworks JavaScript.

Enregistré le 13 mars 2020

Téléchargement de l'épisode [LesCastCodeurs-Episode-227.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-227.mp3)

## News

### Corona virus

Les actions des grosses boites  

* pas de meeting
* conf annulées
* limite du travail au bureau

### Langages

[RedMonk ranking - Le langage au top est...](https://redmonk.com/sogrady/2020/02/28/language-rankings-1-20/)  

* JavaScript Python Java
* Typescript dans le top 10
* R monte
* Rust stable comme Go (+1)
* Kotlin 19, Scala 13

[InfoQ meta sondage](https://www.infoq.com/news/2020/02/developer-surveys/)  

* Java 8 le plus déployé en prod, 25 % Java 11 et non LTS derrière
* Spring 60-80 %
* IntelliJ 60-80 %, Eclipse 20-25 %
* maven vs Gradle 66-33 ou 50-50

[Sondage sur Scala](https://scalacenter.github.io/scala-developer-survey-2019/)  

[Scala.js 1.0.0](https://www.scala-js.org/news/2020/02/25/announcing-scalajs-1.0.0/)

* 7 ans de dev
* not binary compatible with 0.6 nor 1.0RCx
* Écrire en scala des applications front
* interop avec les libraries JavaScript

[GraalVM se dote d'un advisory board](https://jaxenter.com/graalvm-project-advisory-board-168885.html?utm_source=twitter&utm_medium=social&utm_campaign=1week)

* Gluon, Red Hat, Amazon, Microdoc, Shopify, Twitter, OCI, Neo4J, Pivotal, ARM et Oracle bien sûr

[Gros round d'investissement dans Azul](https://www.azul.com/press_release/azul-systems-announces-strategic-growth-equity-investment-by-vitruvian-partners/)

* investissement / achat: 340 M$

### Librairies

[Eclipse MicroProfile GraphQL 1.0](https://microprofile.io/2020/02/25/microprofile-graphql-1-0-released/)  

* GraphQL : spec pour généraliser les endpoints en leur donnant de la flexibilité en termes de requêtage et graph retourné
* make GraphSQL schema available
* execute GraphQL requests
* code first approach

[Apache Camel 3.1 et 3.0 déprécié](https://camel.apache.org/blog/release-3-1-0.html)  
[Le guide de migration de Camel](https://camel.apache.org/manual/latest/camel-3x-upgrade-guide.html)  

* amélioration de mémoire

[Lightbend reçoit 25M d'investissement](https://www.benzinga.com/pressreleases/20/03/g15505587/lightbend-closes-25-million-investment-round-led-by-dell-technologies-capital#/.XmZXZGRo7yc.twitter)  

* de Dell capital
* pour la partie reactive
* spécifiquement pour le "serverless"
* pas de mention de Scala

OPTIONNEL [LightBend - Article sur pourquoi une architecture reactive est importante pour le cloud native](https://www.lightbend.com/blog/stateful-cloud-native-applications-why-reactive-matters)

* bonne piqure de rappel
* data localisée par microservice
* les avantages des systèmes event based

### Middleware

[ElasticSearch en prod, les choses a savoir](https://facinating.tech/2020/02/22/in-depth-guide-to-running-elasticsearch-in-production/)  

* les concepts de base (Clusters, Nodes, Indices and Shards)
* Quorum
* comment des noeuds rejoignent le cluster
* segments et le merge
* gestion de la memoire (compressed pointers /!\ inversé, 30GB, 2x memoire sur la machine par rapport au heap) voir <https://stackoverflow.com/questions/25120546/trick-behind-jvms-compressed-oops#25120926>
* options par workload (write heavy vs read heavy
* topology
* monitoring


### Infrastructure

[La M&A de have i been p0wned: l'histoire de l'abandon](https://www.troyhunt.com/project-svalbard-have-i-been-pwned-and-its-ongoing-independence/)  

* societe KPMG
* due diligence
* des milliards de questions
* les doutes
* exclusivité
* le risque du changement de stratégie

### Cloud

Les gens râlent car les clusters GKE vont avoir un cout de management de 10c/heure, ce qui change la relation du cluster au développeur (nombre de clusters en parallèle)  
[Une comparaison des prix des clusters en fonction de leur taille et de leur host provider](https://devopsdirective.com/posts/2020/03/managed-kubernetes-comparison/)  

Amazon annonce [Bottlerocket](https://aws.amazon.com/fr/bottlerocket/)

* Mise a jour par image recrée plutôt que par package mis a jour
* plus immuable et donc facile en rollback
* par contre chaque host goes down et up
* si orchestrateur c'est ok

### Outillage

[IntelliJ Big Data Tools](https://blog.jetbrains.com/blog/2020/02/25/update-on-big-data-tools-plugin-spark-hdfs-parquet-and-more/)  

* un IDE pour le big data !
* deja integration avec Zeppelin S3 
* nouveau Spark, HDFS, Paquet

### Architecture

[Les systèmes simples ont moins de downtime](https://www.gkogan.co/blog/simple-systems/?r=0)

* facile à comprendre, facile à corriger
* plus rapide de monter en competence
* trouver la cause est plus rapide
* solutions simples, plus d'alternatives disponibles
* règles : les fonctionnalités ne justifient pas la complexité, les idées complexes amènent des implémentations complexes, modifier avant d'ajouter
* challenge de l'automation pour faire avec moins de gens ?

OPTIONNEL [11 raisons pour lesquelles vous allez rater vos microservices](https://medium.com/xebia-engineering/11-reasons-why-you-are-going-to-fail-with-microservices-29b93876268b)  

* voir les titres de section

OPTIONNEL [Retour d'expérience sur l'usage incorrect d'un outil bloom filters](https://blog.cloudflare.com/when-bloom-filters-dont-bloom/)  

* problème idéal pour bloom filters
* mais suspicieusement plus long que prévu
* profilers
* random access memory >> sequential reading (trop grand pour L3)
* alternative plus simple qui réduit le nombre le chargement memoire, pas la conso memoire

### Méthodologies

[Les trains de merge](https://about.gitlab.com/blog/2020/01/30/all-aboard-merge-trains/)  

* rebasing, la course au collègue
* garder master green pour la CD
* impossible de faire trop de merge en parallèle ou doit faire pleins de rebase
* merge train séquentialise et batch les merges

[Retour sur le modèle GitFlow](https://georgestocker.com/2020/03/04/please-stop-recommending-git-flow/)  

* pas intuitif (merge bidirectionnels dans le temps entre develop, feature branch, release branch, hotfix et master) et cout cognitif haut
* risque grandi de merge conflit
* peut pas rebaser
* continuous delivery != trop de barrières
* en cas de repos multiples ou mono repos, impossible a gérer (microservices)
* ok pour des cycles de release par trimestre avec des équipes sur des releases en parallèle

[Mesure de la complexité de code: une meilleure mesure](https://empear.com/blog/bumpy-road-code-complexity-in-context/)  

* cyclomatic complexité est un mauvais oracle de la complexité de code
* les logiques conditionnelles emboîtées utilisent notre mémoire de travail (~indentation)
* les fonctions avec des dos d'ânes d'indentation multiples sont les pires
* refactorer pour externaliser chaque

Dans Sonarqube cela s'appelle Cognitive Complexity. Voici un exemple sur du code XWiki ou l'on voit très bien visuellement ce que cela veut dire : <https://sonarcloud.io/project/issues?id=org.xwiki.commons%3Axwiki-commons&issues=AWzY6RXo8pMOHxUYvkyE&open=AWzY6RXo8pMOHxUYvkyE>

### Sécurité

[Ghostcat: la faille dans Tomcat de 6 à 9](https://snyk.io/blog/ghostcat-breach-affects-all-tomcat-versions/)  

* dans le protocole Apache JServ (implicitement trusté par Tomcat (cs une requête)
* peut lire le contenu des web apps
* si la webapp peut uploader => activer un remote execution
* upgrader Tomcat 7, 8, 9, si 6, vous êtes dans la merde
* attention Tomcat est embarqué dans pleins d'outils comme Wildfly, Spring Boot etc

[Letencrypt révoque 3 millions de certs a multiples domaines](https://thehackernews.com/2020/03/lets-encrypt-certificate-revocation.html?m=1#click=https://t.co/zViFYyMIse)  

### Loi, société et organisation

[Amicus brief sur le copyright d'API par IBM et Red Hat](https://www.redhat.com/en/blog/red-hat-urges-us-supreme-court-support-unrestricted-use-software-interfaces)  

* computer interfaces ne sont pas copyrightable
* moteur de l'économie du logiciel
* va être entendu au printemps

[Amicus brief de chercheurs attaqué par Oracle](https://twitter.com/joshbloch/status/1237507340514889729)

* payés par Google

OPTIONNEL [Les hackers de Equifax condamnés pour crime](https://www.infoq.com/news/2020/02/equifax-charges/?utm_campaign=infoq_content&utm_source=twitter&utm_medium=feed&utm_term=java)  

* DOJ charge 4 militaires Chinois
* Struts CVE

## Rubrique débutant

[La tonte de Yak appliquée à Donald Knuth](https://yakshav.es/the-patron-saint-of-yakshaves/)

* écrire un livre
* écrire un programme pour écrire un livre
* invente un langage de programmation pour écrire le programme
* invente un mode de pagination
* design une police de caractère
* écrit un outil pour construire les polices de caractère
* invente un système de version pour son programme
* implémente un langage d'abstraction maison pour les documents imprimés

## Conférences

ANNULÉ - [Breizhcamp du 25 au 27 mars 2020](https://www.breizhcamp.org/)  
ANNULÉ - [MiXiT du 29 au 30 avril 2020](https://mixitconf.org/)  
VIRTUEL - [GitHub Satellite les 6 et 7 mai](https://githubsatellite.com/)  
ANNULÉ - [RivieraDev du 13 au 15 mai 2020](https://rivieradev.fr/)  
[Devoxx UK du 13 au 15 mai 2020](https://www.devoxx.co.uk/)  
[NewCrafts les 28 et 29 mai 2020](http://ncrafts.io/)  
[AlpesCraft les 4 et 5 juin 2020](https://www.alpescraft.fr/)  
ANNULÉ - [Best of Web les 4 et 5 juin 2020](http://bestofweb.paris/)  
[DevFest Lille le 12 juin 2020](https://devfest.gdglille.org/) - (Le [CFP](https://conference-hall.io/public/event/4o1awYXIRayhu3vmOmiQ) est ouvert)   
[Voxxed Days Luxembourg du 17 au 19 juin 2020](https://luxembourg.voxxeddays.com/)  
ANNULÉ - [Serverless Days Paris le 1 juillet 2020](https://paris.serverlessdays.io/en/)  
NOUVELLE DATE - [Devoxx France du 1 au 3 juillet 2020](https://www.devoxx.fr/)  
[Sunny Tech les 2 et 3 juillet 2020](https://sunny-tech.io/)  

Et encore plus sur [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda/blob/master/README.md) ....   
[Liste d'Aurélie](https://github.com/scraly/developers-conferences-agenda)  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

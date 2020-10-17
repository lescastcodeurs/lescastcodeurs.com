---
title: LCC 240 - Fuseaux horaires - la fontaine à bogues
author: 'Emmanuel Bernard'
layout: blog-post
episode: 240
mp3_length: 63145077
tweet: Fuseaux horaires - la fontaine à bogues #java15 #memoire #quarkus #micronaut
# tweet size: 91-93 -> 99-101 #######################################################################
---
Cet épisode consacre Java le langage et sa version 15 en particulier. On discute aussi l'impact des mémoires fautives sur la JVM, le réactif, les frameworks backends et bien d'autres choses. Et nous avons deux crowdcasts! 🕺

Enregistré le 13 octobre 2020

Téléchargement de l'épisode [LesCastCodeurs-Episode-240.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-240.mp3)

## News

### Langages

[Java 15](https://twitter.com/java/status/1305874025231650817) (plus de détails par [Remi Forax](https://groups.google.com/d/msgid/lescastcodeurs/63086933.1723204.1600182952350.JavaMail.zimbra%40u-pem.fr) ). 

* unicode 13,  
* hidden classes (non-discoverable implementation details of the framework eg classes générées au runtime, déchargement aggressif),  
* TreeMap amelioration de perf,  
* check de revocation pour le jar signer,  
* sha-3 support,  
* nashorn enlevé,  
* les lock biaisés sont désactivés/dépréciés,  
* ZGC prêt pour la prod,  
* amélioration d’ergo de G1 (on en avait parlé),  

[Azul couvre JDK 15](https://www.azul.com/jdk-15-release-64-new-features-and-apis/), avec un focus sur les Sealed classes, les Records, les Hidden classes.  


[Des bugs de timezone qui vous pouvez rencontrer dans vos applications](https://blog.davidojeda.dev/4-time-zone-bugs-i-ran-into). 

* Faire tourner son code sous une vieille version de JRE/JDK qui n’est pas à jour au niveau des données de TimeZone.  
* Le serveur est peut-être dans votre TimeZone à vous, ou bien sur UTC, alors attention !   
* En stockant des dates en bases de données, il faut aussi prendre en compte la TimeZone configurée dans la DB !  
* Parfois aussi côté affichage, on peut oublier de parser les dates avec les infos de TimeZone, ou côté client la TimeZone ou l’heure d’été peut être mal configurée...  

Enregistrements d’Oracle Developer Live Java

* <https://inside.java/2020/09/17/devlive-java-lang-futures/>
* <https://inside.java/2020/09/17/devlive-keynote/>

[Les crashs de JVM sont souvent des erreurs mémoire.](https://shipilev.net/jvm/test-your-memory/) Pourquoi ?  

* La JVM on lui donne souvent beaucoup de mémoire.  
* Les métadonnées utilisées par le GC sont importantes.   
* Ces métadonnées sont accédées entièrement lors d’un full GC.  

Romain Manni-Bucau explique [comment configurer Java Util Logging avec un formateur sur une ligne](https://rmannibucau.metawerx.net/post/jul-production-ready-pattern-with-simpleformatter), pour que ce soit plus sympa dans un contexte prod Docker



[Un rapport sur l’écosystème Groovy](https://e.printstacktrace.blog/groovy-ecosystem-usage-report-2020/) :  

* l’outil le plus utilisé : Gradle (pour le build). 
* librairie la plus populaire : Spock (pour les tests). 
* framework le plus populaire : Grails. 
* beaucoup d’utilisation de Groovy comme langage de script, d’automatisation, mais aussi comme langage général principal et comme Domain-Specific Language. 


### Librairies

[Sortie de JUnit 5.7](https://twitter.com/junitteam/status/1305140909223411712)  

* Isolated tests. 
* New Enabled/DisabledIf execution conditions. 
* Custom disabled reasons.  
* New MethodOrderer.DisplayName. 
* New DisplayNameGenerator.Simple. 
* Java Flight Recorder support. 
* Improved EngineTestKit. 

[Quarkus vs Spring Boot dans des environnements de plus en plus contraints mais quel est le choix d’équipe au final ?](https://medium.com/swlh/hail-to-the-new-king-or-not-295090a96bbf). 

[Sortie de Micronaut 2.1](https://micronaut.io/blog/2020-10-05-micronaut-21-released.html).  

* nouveau plugin Gradle qui facilite le build d’image natives Graal et de containers Docker en couches.  
* support des fonctions Oracle Cloud.  
* support amélioré de Google Cloud Platform, avec le logging structuré de Stackdriver,  
* et le support natif du messaging avec Google Cloud Pub/Sub. 
* Plus d’infos dans la doc dans la section des nouveautés : https://docs.micronaut.io/2.1.0/guide/index.html#whatsNew  

Sortie de [Quarkus 1.8](https://quarkus.io/blog/quarkus-1-8-0-final-released/) (et on n'avait pas annoncé 1.7)

* multiple persistence unit
* Micrometer
* intégration avec jbang
* GraalVM 20.2
* MongoDB pour Kotlin
* Elasticsearch REST client (1.7)
* Client vert.x Redis (1.7)
* Hibernate Envers (1.7)
* DB2 (1.7)


### Infrastructure

[NVidia rachète ARM à SoftBank pou 40Md$](https://www.engadget.com/nvidia-arm-acquisition-softbank-000846113.html), ça va faire un sacré concurrent à Intel et AMD. (<https://www.anandtech.com/show/16080/nvidia-to-acquire-arm-for-40-billion>)  
 
[Retour d’experience sur l’utilisation de Kubernetes.](https://medium.com/better-programming/3-years-of-kubernetes-in-production-heres-what-we-learned-44e77e1749c8) Java et ses problèmes (spécialement 8, toujours grosse conso mémoire),  mettre à jour Kubernetes (ils créent des nouveaux clusters), corriger un index au démarrage vs liveness probe, exposer des IPs externes et la limite de connections parallèles.  

[Project Natick: Datacenter mis sous l’eau en 2018 par Microsoft](https://www.theverge.com/2020/9/14/21436746/microsoft-project-natick-data-center-server-underwater-cooling-reliability).  

* 864 servers, 27.6 petabytes de stockage, 117 pieds au fond de l’ocean (Ecosse).  
* Aux dires de Microsoft, c’est un succès.  

[Google est neutre en carbone, et a même racheté sa dette carbone depuis sa création](https://blog.google/outreach-initiatives/sustainability/our-third-decade-climate-action-realizing-carbon-free-future/).  

* (1) We were the first major company to become carbon neutral in 2007. → Google a été “neutre” par compensation, chaque année depuis 2007, notamment en achetant autant d’énergie renouvelable que d’énergie carbonée.   
* (2) We were the first major company to match our energy use with 100 percent renewable energy in 2017... We’re eliminating our entire carbon legacy, effective today. → Depuis 2017, Google a en plus acheté autant d’énergie renouvelable l’année N que d’énergie carbonée consommée l’année N+1. En Septembre 2020, Google a fini fini par être totalement “neutre” en ayant consommé autant d’énergie renouvelable que d’énergie carbonée depuis la création de Google.   
* (3) We are the first major company to make a commitment to operate on 24/7 carbon-free energy in all our data centers and campuses worldwide... by 2030. → Dans 10 ans, Google espère ne plus consommer d’énergie carbonée du tout.  

### Data

[CrunchyDB offre un PostgresSQL as a service qui est cross clouds](https://info.crunchydata.com/blog/announcing-crunchy-bridge-a-modern-postgres-as-a-service). 

### Outillage

[Github sort la version 1.0 de son outil en ligne de commande pour gérer ses projets Github](https://github.blog/2020-09-17-github-cli-1-0-is-now-available/). 

### Architecture

Un vieux truc, [le memo de Bezos sur la service oriented company](https://gist.github.com/chitchcock/1281611).  
[Jonas Boner annonce les 8 principes réactifs](https://principles.reactive.foundation/). 

* I. Stay Responsive : Always respond in a timely manner. 
* II. Accept Uncertainty : Build reliability despite unreliable foundations. 
* III. Embrace Failure : Expect things to go wrong and design for resilience. 
* IV. Assert Autonomy : Design components that act independently and interact collaboratively. 
* V. Tailor Consistency : Individualize consistency per component to balance availability and performance. 
* VI. Decouple Time : Process asynchronously to avoid coordination and waiting. 
* VII. Decouple Space : Create flexibility by embracing the network. 
* VIII. Handle Dynamics : Continuously adapt to varying demand and resources.  

### Méthodologies

[Les recommendations de Red Hat aux Red Hatters sur la contribution à l'Open Source](https://www.redhat.com/en/about/open-source/participation-guidelines)

### Sécurité

[Jenkins vient avec pleins de fix de sécurité](https://groups.google.com/g/jenkinsci-advisories) comme tous les mois (voire 2 fois par mois). 


### Loi, société et organisation

[Est-ce que le Hacktoberfest de Digital Ocean fait mal à l’Open Source ?](https://blog.domenic.me/hacktoberfest/)

* plein de gens contribuent des commits à deux balles, juste pour gagner un t-shirt, et c’est les mainteneurs de projets open source qui sont obligés de se taper tous les pull requests comme des messages de spam
* [Update de DigitalOcean to reduce spam](https://hacktoberfest.digitalocean.com/hacktoberfest-update)
* [Comment une personne (un YouTuber avec 600K followers a pourri le système)](https://joel.net/how-one-guy-ruined-hacktoberfest2020-drama)

[Bye bye Stop Covid qui va devenir Alerte Covid.](https://www.europe1.fr/societe/information-europe-1-la-nouvelle-appli-stop-covid-sappellera-alerte-covid-3997914) L’application ne règle en rien les problèmes en terme d’efficacité et de vie privée déjà décriés dans le passé mais veut rajouter des usages en ciblant notamment l’utilisation dans les bars et restaurants et en y diminuant la durée d’exposition utilisée comme indicateur de contact. Elle devrait aussi pouvoir vous notifier d’alerte locale (le gouvernement dans votre poche).

## Outils de l'épisode

Un écran 49" 32:9 <https://www.samsung.com/us/computing/monitors/gaming/49-crg9-dual-qhd-curved-qled-gaming-monitor-lc49rg90ssnxza/>

## Rubrique débutant

Si vous débutez en Docker, il est important de [comprendre les différences entre les instructions RUN, CMD, et ENTRYPOINT de vos Dockerfiles](https://www.baeldung.com/devops/dockerfile-run-cmd-entrypoint). 

* RUN est exécuté quand on build l’image. 
* CMD est l’instruction par défaut lancée au démarrage de votre image. 
* ENTRYPOINT permet plus de flexibilité que CMD en supportant les paramètres en entrée. 

## Conférences

[Codeurs En Seine 2020 - Edition en ligne](https://twitter.com/codeursenseine/status/1301064575786405888?s=21)

* En novembre, les mardis à 19h et les jeudis à 21h
* 45 minutes de conférences + environ 15 minutes de questions
* En ligne sur Twitch + rediffusion Youtube

Crowdcast de Emmanuel Demey sur les conférences à venir dans le Nord.  

* Cloud Nord le 19/10 en remote : <https://cloudnord.fr/>  
* Web Stories le 5/2 en présentiel (pour le moment) <https://webstoriesconf.com/>  
* Le Devfest Lille le 11/6 en présentiel <https://devfest.gdglille.org/> 

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

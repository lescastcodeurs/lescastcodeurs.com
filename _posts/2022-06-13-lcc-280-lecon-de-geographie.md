---
title: LCC 280 - Leçon de géographie
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 280
mp3_length: 58763123
tweet: Leçon de géographie
# tweet size: 91-93 -> 99-101 #######################################################################
---
Cet épisode une fois n'est pas coutume parle beaucoup de nouvelles dans la rubrique langage et beaucoup de Java, wouhou !
On parle aussi de sigstore, http/3, Micronaut et de VMWare.

Enregistré le 10 juin 2022

Téléchargement de l'épisode [LesCastCodeurs-Episode-280.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-280.mp3)

## News

### Langages

[Sept raisons pour lesquelles Java a a encore du sens après 26 ans](https://foojay.io/today/7-reasons-why-after-26-years-java-still-makes-sense/)  

* communauté (dans toutes les grandes villes)
* force du langage et de la plateforme
* plus de problèmes résolus que non résolus (librairies)
* stabilité
* Innovation (Java 9 accélère l’innovation)
* outillage
* opportunité d’emploi

[Les débuts du projet Leyden](https://openjdk.java.net/projects/leyden/notes/01-beginnings)

* Mark Reinhold lance le projet Leyden, pour adresser les problèmes de temps de démarrage lent de Java, de lenteur du temps jusqu’à la performance max, et d’empreinte un peu lourde
* à l’aide d’une image statique de votre application
* une image statique ne fait tourner qu’une seule et unique application sur son JDK, et est un “monde fermé” (ne peut pas charger de classe externes)
* mais les ingés de la JVM vont travailler sur une approche assez souple, et voire quelles contraintes peuvent être allégées, par rapport à un monde complètement fermé d’une image statique
* en espérant avoir des améliorations à différents niveaux, pour un max d’appli et de use case différents
* Le close world c’est ce qui amène la valeur de GraalVM native image et les avantages pour Micronaut, Quarkus et le autres
* donc pas de closed world: c’est encore un projet de recherche pour l’équipe de la JVM

[JFR plus facile à configuer dans Java 17]( https://egahlin.github.io/2022/05/31/improved-ergonomics.html)

* un wizard en UI ou CLI pour generer le fichier .jfc

[Proposition de structured concurrency via le projet Loom](https://www.infoq.com/news/2022/06/java-structured-concurrency/)

* Targeted status for JDK 19. 
* This incubating JEP, under the auspices of Project Loom, 
* proposes to simplify multithreaded programming by introducing a library to treat multiple tasks running in different threads as a single unit of work. 
* This can streamline error handling and cancellation, improve reliability, and enhance observability

[RedMonk analyse l’apparition du langage Dart, grâce à Flutter, dans leur top 20 des langages de programmation les plus populaires](https://redmonk.com/jgovernor/2022/05/16/flutter-propels-dart-frameworks-language-adoption-and-cross-platform-development/)  

* JavaScript, Python, Java, toujours en tête
* Mais Rust et Dart sont rentrés récemment
* L’arrivée de Dart coïncide surtout avec l’émergence de Flutter comme framework d’interface graphique, que ce soit pour Android/iOS, que pour le desktop et le web
* Sur les applis mobiles, il y a toujours eu beaucoup de développement natif, mais est aussi arrivé React Native, mais aussi Flutter
* Des applis de Google comme Google Pay et Google Ads sont développées en Flutter, mais aussi le récent SNCF Connect  ou des entreprises telles que BMW ou Alibaba (modifié) 
* (cf le talk sur le REX par les développeurs de SNCF Connect à Devoxx France)
* les investissements initiaux de Dart vs Kotlin ou Ceylon qui ont démarrés en meme temps étaient colossaux 
* Dart en natif pour faire des applis iOS… qui tournent aussi sous Android

[Kotlin 1.7 est sorti](https://blog.jetbrains.com/kotlin/2022/06/kotlin-1-7-0-released/)  

* Kotlin K2 compiler pour la JVM em Alpha (les plug ins ne fonctionne pas)
* amélioration des perf de Kotlin et du compilo pour la JVM
* build incremental Gradle
* annotation OptIn et inférence de Builder stabilisés
* classes implementee par delegation automatique sans consommation mémoire (via inlining)

### Librairies

[Sortie de Micronaut 3.5](https://micronaut.io/2022/05/26/micronaut-framework-3-5-0/)

* Passage à GRAALVM 22.1.0
* Compilation incrémentale lors des builds, en particulier intéressant pour les métadonnées pour GraalVM, ce qui permet d’éviter de faire tourner les processeurs d’annotation inutilement
* Inclusion de Micronaut Data 3.4, avec support des enums Postgres pour JDBC, la pagination pour les Reactive Repositories
* Intégration avec Turbo pour la vue (Turbo Frame et Turbo Views)
* Nouveau module pour MicroStream (un moteur de graphe d’objet natif Java, intégré à Helidon)
* Mise à jour de nombreux plugins et extensions (y compris plugins de build)

### Infrastructure

[Kubernetes signals massive adoption of Sigstore for protecting open source ecosystem](https://blog.sigstore.dev/kubernetes-signals-massive-adoption-of-sigstore-for-protecting-open-source-ecosystem-73a6757da73)

* Kubernetes 1.24 (sorti en mai) est la première version utilisant officiellement Sigstore, permettant une vérification transparente des signatures pour protéger contre les attaques de la chaîne d’approvisionnement
* [Sigstore](https://www.sigstore.dev/) est une nouvelle norme pour la signature, la vérification et la protection des logiciels. Elle se veut être un remplaçant pour GPG par exemple. 
* Sigstore offre une variété d’avantages à la communauté Kubernetes comme:  
  * Sigstore’s keyless signing donne une grande expérience de développeur et supprime le besoin de la gestion de clé douloureuse.  
  * Le journal public et transparent de Sigstore ([Rekor](https://github.com/sigstore/rekor)) avec ses API permettent aux consommateurs Kubernetes de vérifier les signatures.  
  * ...   

### Web

[RFC 9114 - HTTP/3](https://www.rfc-editor.org/rfc/rfc9114.html) est validée (+ [RFC 9204 - QPACK: Field Compression for HTTP/3](https://www.rfc-editor.org/rfc/rfc9204.html) et [RFC 9218 - Extensible Prioritization Scheme for HTTP](https://www.rfc-editor.org/rfc/rfc9218.html)) 

* Basé sur le protocole de transport QUIC qui possède plusieurs fonctionnalités intéressantes telles que le multiplexage de flux, le contrôle de flux par flux et l’établissement de connexion à faible latence.
* QPACK : un format de compression pour représenter efficacement les champs HTTP à utiliser en HTTP/3. Il s’agit d’une variation de la compression HPACK qui vise à réduire la taille des headers.
* Extensible Prioritization Scheme for HTTP: schéma qui permet à un client HTTP de communiquer ses préférences quant à la façon dont le serveur en amont priorise les réponses à ses demandes, et permet également à un serveur d’indiquer à un intermédiaire en aval comment ses réponses devraient être priorisées lorsqu’elles sont transmises.

### Outillage

 [VSCode Java 1.5 est sorti](https://twitter.com/vscodejava/status/1514687434805686278?s=21&t=9B-Ur9W6tZf5mulv1K2KDA) 

* Java 18 support, inlay hints for method parameters, and improvements to class declaration navigation are just a few of the enhancements to expect.


### Architecture

[L'architecture Netflix](https://medium.com/swlh/a-design-analysis-of-cloud-based-microservices-architecture-at-netflix-98836b2da45f)

* Pas fou fou dans les infos mais ça fait longtemps qu’on a pas eu d’archi
* analyze the system design in terms of availability, latency, scalability and resilience to network failure
* basé sur AWS
* clients via un SDK est intelligent, contrôle le backend utilisé et la bande passante en temps réel
* Open Connect CDN: là ou les vidéos sont stockées
* le reste du bon vieux microservice en backend
* ramène les dix meilleurs points d’accès et le client choisi voire change
* API Gateway via Zuul: dynamic routing, traffic monitoring and security, resilience to failures at the edge of the cloud deployment
* etc

### Loi, société et organisation

[VMWare racheté par Broadcom](https://investors.broadcom.com/news-releases/news-release-details/broadcom-acquire-vmware-approximately-61-billion-cash-and-stock)

* 61 milliards de dollars
* Avec un objectif de passer de 3,5 à 8,5 milliard d’EBITA par an
    * Bouger dans la division cloud avec Symantec
* VMWare était content de sa liberté retrouvée après la spin off de Dell
* Apparemment pas d’alignement de tech
* une expansion de portefeuiille dans le software pour broadcom
* VMWare a beaucoup changé de mains ces dernières années
* La strategie d’investissement de broadcom: acheter des franchises avec une bonne position de marcher et un potentiel de profitabilité augmenté sans gros investissements
* [La rumeur](https://www.bloomberg.com/news/articles/2022-05-22/broadcom-said-to-be-in-talks-to-acquire-vmware)
* un ex de VMWare [qui pense que c’est la mort de VMWare](https://www.linkedin.com/pulse/brian-maddens-brutal-unfiltered-thoughts-broadcom-vmware-brian-madden/)


## Outils de l'épisode

[GitHub Copilot](https://copilot.github.com/) quand le code s'écrit tout seul ... (en fait non, les développeurs ont encore des beaux jours devant eux)

* A voir aussi: [Github Co-Pilot : Addictif ou Efficace ? (Johan Jublanc et Simon Provost)](https://www.youtube.com/watch?v=SQf9ZQsqW30) à Devoxx France 2022

## Rubrique débutant

## Conférences

Source: [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda) by [Aurélie Vache](https://github.com/scraly) et contributeurs

### June

* 14: [France API](https://www.franceapi.fr/) - Paris (France)
* 15-18: [VIVA Technology](https://vivatechnology.com/) - Paris (France)
* 17: [Cloud Ouest 2022](https://cloudouest.fr/) - Nantes (FR) + Online <a href="https://conference-hall.io/public/event/txK7ihjaAR4LtuJyYZCx"> <img alt="CFP Cloud Ouest 2022" src="https://img.shields.io/static/v1?label=CFP&message=Until%2030-04-2022&color=red"> </a>
* 21-22: [Voxxed Days Luxembourg](https://luxembourg.voxxeddays.com/en/) - Luxembourg <a href="http://cfp-voxxed-lux.yajug.org/"><img alt="CFP Voxxed Days Luxembourg" src="https://img.shields.io/static/v1?label=CFP&message=20-Feb-2022%20to%2010-Avr-2022&color=red"> </a>
* 23: [ServerlessDays Paris](https://paris.serverlessdays.io/en/) - Paris (France) <a href="https://vdlux20.cfp.dev/#/login"><img alt="CFP ServerlessDays Paris" src="https://img.shields.io/static/v1?label=CFP&message=Until%2020-Feb-2022&color=red"> </a>
* 24: [SoCraTes Rennes](https://socrates-rennes.github.io/) - Rennes (France)
* 27-1: [Hack in Paris](https://hackinparis.com/) - Paris (France) <a href="https://www.papercall.io/hackinparis2022"><img alt="CFP Hack in paris 2022" src="https://img.shields.io/static/v1?label=CFP&message=Until%20to%2011-Mar-2022&color=red"> </a>
* 28: [Dev nation Day France](https://hopin.com/events/devnation-day-france-2022#top) - Paris (France)
* 29-1: [BreizhCamp](https://www.breizhcamp.org/) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2022/"><img alt="CFP BreizhCamp 2022" src="https://img.shields.io/static/v1?label=CFP&message=14-Mar-2022%20to%2025-Apr-2022&color=red"> </a>
* 30-1: [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/public/event/m1kfbpSntxF3QBVUwoFY"><img alt="CFP Sunny Tech 2022" src="https://img.shields.io/static/v1?label=CFP&message=6-Dec-2021%20to%2027-Feb-2022&color=red"> </a>
* 30-1: [Agi'Lille 2022](https://agilille.fr/) - Lille (France) <a href="https://sessionize.com/agilille-2022/"><img alt="CFP Agi'Lille 2022" src="https://img.shields.io/static/v1?label=CFP&message=11-Mar-2022%20to%2007-May-2022&color=red"> </a>

### September

* 9: [JUG SummerCamp](https://www.jugsummercamp.org/edition/13) - La Rochelle (France) <a href="https://www.jugsummercamp.org/edition/13"><img alt="CFP JUG SummerCamp 2022" src="https://img.shields.io/static/v1?label=CFP&message=2-May-2022%20to%201-Jul-2022&color=green"> </a>
* 29: [Cloud Nord](https://cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/public/event/wGVYkl21UFxeiuakhKfu"><img alt="CFP Cloud Nord 2022" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2022&color=red"> </a>

### October

* 4-6: [Devoxx Morocco](https://devoxx.ma/) - Agadir (Morocco) <a href="https://dvma22.cfp.dev"><img alt="CFP Devoxx Morocco" src="https://img.shields.io/static/v1?label=CFP&message=6-Jun-2022%20to%2015-Jul-2022&color=green"> </a>
* 6-7: [Paris Web](https://paris-web.fr/) - Paris (France) <img alt="Closed Captions" src="https://img.shields.io/static/v1?label=CC&message=Closed%20Captions&color=blue" /> <a href="https://appel.paris-web.fr/"><img alt="CFP Paris Web" src="https://img.shields.io/static/v1?label=CFP&message=24-Mar-2022-%3E24-Apr-2022&color=red"> </a>
* 10-14: [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) <a href="https://devoxx.be/"><img alt="CFP Devoxx Belgium 2022" src="https://img.shields.io/static/v1?label=CFP&message=Jun-2022%20to%20July-2022&color=orange"> </a>
* 13-14: [Volcamp 2022](https://www.volcamp.io/) - Clermont Ferrand (France) <a href="https://conference-hall.io/public/event/8Wu147xoRDKQSjGcawoY"><img alt="CFP Volcamp" src="https://img.shields.io/static/v1?label=CFP&message=%3E13-May-2022&color=red"> </a>
* 20-21: [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) <a href="https://conference-hall.io/public/event/CfucIjaXxrZThJE0POR3"><img alt="CFP Sunny Tech 2022" src="https://img.shields.io/static/v1?label=CFP&message=1-Apr-2022%20to%2015-Jun-2022&color=green"> </a>
* 27-28: [Agile Tour Bordeaux](http://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2022/"><img alt="CFP Agile Tour Bordeaux" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-July-2022&color=green"> </a>

### November

* 8-9: [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) <a href="https://sessionize.com/open-source-experience-2022/"><img alt="CFP Open Source Experience" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-Jun-2022&color=green"> </a>
* 15-16: [ParisTestConf](https://paristestconf.com/) - Online <a href="https://paristestconf.com/call-for-papers-2022"><img alt="CFP ParisTestConf" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2022&color=red"> </a>
* 15-16: [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/agile-tour-toulouse-2022/"><img alt="CFP Agile Tour Toulouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-Jun-2022&color=green"> </a>
* 17: [Codeurs en Seine](https://www.codeursenseine.com/) - Rouen (France)
* 18: [Devfest Strasbourg](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/speaker/event/wgaja45IBdGT4sw4CXDB"><img alt="CFP Devfest Strasbourg" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-Jun-2022&color=green"> </a>
* 19-20: [Capitole du Libre](https://capitoledulibre.org/) - Toulouse (France)

### December

* 1: [Devops DDay #7](https://2022.devops-dday.com/) - Marseille (France) <a href="https://conference-hall.io/public/event/eKYGzptI6y44zoS8sGUz"><img alt="CFP Devops DDay" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-Jun-2022&color=green"> </a>
* 2: [BDX I/O](https://www.bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/OJC5Ou5YJodfetgSJCa3"><img alt="CFP BDX I/O" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-Jul-2022&color=green"> </a>
* 14-16: [API Days Paris](https://www.apidays.global/paris/) - Paris (France) & Online 

[Nom de la conf du x au y mois à Ville]() - [CfP]() jusqu'à y mois  
TODO: reprendre celles de l'épisode d'avant

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

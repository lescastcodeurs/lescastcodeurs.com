---
title: LCC 292 - Enterprise Go Beans
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 292
mp3_length: 69046475
tweet: Enterprise Go Beans #jdk #hibernate #serviceweaver #dockerhub #gradle #curl
# tweet size: 91-93 -> 99-101 #######################################################################
---
Cet épisode nouvelles discute d'améliorations dans le JDK, d'Hibernate 6, de Service Weaver, de la fin d'options dans DockerHub pour certains projets open source, de Gradle, de cURL et pleins d'autres choses encore.

Enregistré le 17 mars 2023

Téléchargement de l’épisode [LesCastCodeurs-Episode-292.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-292.mp3)

## News


### Langages

Quelle version de JDK utiliser en fonction des fonctionnalités que l'on souhaite utiliser mais aussi du long time support
[https://whichjdk.com/](https://whichjdk.com/)


JetBrains propose une formation Rust intégrée aux IDEs
[https://blog.jetbrains.com/rust/2023/02/21/learn-rust-with-jetbrains-ides/](https://blog.jetbrains.com/rust/2023/02/21/learn-rust-with-jetbrains-ides/)

- Un apprentissage directement intégré à l’IDE
- Avec un plugin “Academy” dédié, qui rajoute un troisième panneau avec les instructions, les explications, et on fait des exercices dans la partie IDE
- Une chouette manière d’apprendre intégrée directement à son IDE
- Chacun doit pouvoir créer ses propres ressources d’apprentissage, et on pourrait appliquer ça à des frameworks, des outils, ou pourquoi pas son propre projet informatique !

Retravail de classes du JDK `Bits` / `ByteArray` vers un usage via `VarHandle` pour le swapping de bits dans Java 21 [https://minborgsjavapot.blogspot.com/2023/01/java-21-performance-improvements.html](https://minborgsjavapot.blogspot.com/2023/01/java-21-performance-improvements.html)

- petit changement mais utilisé par beaucoup de classes comme `ObjectInputStream`  `RandomAccessFile` etc
- améliore la serialization en java

Rajout de la notion de “sequenced collection” dans la hiérarchie des collections, planifié pour JDK 21
[https://www.infoq.com/news/2023/03/collections-framework-makeover/](https://www.infoq.com/news/2023/03/collections-framework-makeover/)

- va permettre de codifier les collections qui ont un ordre donné (pas forcément trié)
- rajouter aussi des méthodes pour traverser des collections séquentielles à l’envers, ou pour récupérer ou ajouter un élément au début ou à la fin d’une collection ordonnée
- aujourd'hui ces methodes sont eparpillées dans les implémentaions et n'avaient aps de contrat commun

Le guide ultime des virtual threads
[https://blog.rockthejvm.com/ultimate-guide-to-java-virtual-threads/](https://blog.rockthejvm.com/ultimate-guide-to-java-virtual-threads/)

- un très long article qui couvre le sujet des nouveaux virtual threads
- comment en créer
- comment ils fonctionnent
- le scheduler et le scheduling coopératif
- les “pinned” virtual threads (lorsqu’un thread virtuel est bloqué dans un vrai thread, par exemple dans un bloc synchronized ou lors d’appel de méthondes natives)
- les thread local et thread pools


### Librairies

Quarkus 3 alpha 5 avec Hibernate ORM 6 et une nouvelle DevUI [https://quarkus.io/blog/quarkus-3-0-0-alpha5-released/](https://quarkus.io/blog/quarkus-3-0-0-alpha5-released/)

- passage d'Hibernate 5 a 6 (donc testez!
- switch de compatibilité supérieur pour aider la transition [https://github.com/quarkusio/quarkus/wiki/Migration-Guide-3.0:-Hibernate-ORM-5-to-6-migration#database-orm-compatibility](https://github.com/quarkusio/quarkus/wiki/Migration-Guide-3.0:-Hibernate-ORM-5-to-6-migration#database-orm-compatibility) (DB interaction esp schema
- `StatelessSession` injectable
- Gradle 8
- nouvelle DEvUI (nouveau look and feel, plus extensible pour els extensions et pplus facile a utiliser, va au dela des integrations d'extension (config etc)
- `quarkus deploy` dans la CLI, gradle et maven: deploie dans Kube, knative, OpenShift

La route vers Quarkus 3, article sure infoq [https://www.infoq.com/news/2023/03/road-quarkus-3/](https://www.infoq.com/news/2023/03/road-quarkus-3/)

- Jakarta EE, ORM 6, Microprofile 6, virtual threads, io_uring, ReactiveStreams=> Flow
- io_uring reduit les copie de buffer entre userspace et kernel space
- pas de support JPMS en vue mais Red Hat contribue a project Leyden
- Camel extensions, attendez Camel 4 (passage Jakarta EE)

Interview de Geert Bevin, l’auteur du framework Java RIFE2
[https://devm.io/java/rife2-java-framework](https://devm.io/java/rife2-java-framework)


Google annouce Service Weaver [https://opensource.googleblog.com/2023/03/introducing-service-weaver-framework-for-writing-distributed-applications.html](https://opensource.googleblog.com/2023/03/introducing-service-weaver-framework-for-writing-distributed-applications.html)

- EJB is back (Enterprise Go Beans :D)
- ecrire en tant que modular monolith
- permet au deploiement décider ce qui est distribué
- basé sur leur experience du surtout de maintance des microservices (contrats plus difficiles a casser - dbesoin de coordination de rollout etc)
- dans la communauté des entousiastes
- et des gens concernés par les 10 falaccies of distributed computing et le fait de cacher les appels distants
- EJB et corba avant cela ont été des échecs de ce point de vue la
- ils n'expliquement pas comment le binding de nouveax contrats et de deploiement se fait de maniere transparente
- des deployeurs implementables (go et GKE initialement)

Etude d'opinion de certains utilisateurs de Jakarta EE (OmniFaces community) [https://omnifish.ee/2023/03/10/jakarta-ee-survey-2022-2023-results/](https://omnifish.ee/2023/03/10/jakarta-ee-survey-2022-2023-results/)

- biaisée donc attention
- Java EE 8 suivi par Jakarta EE 8 et derriere Jakarta EE 10 etc
- WildFly puis Payara puis glassfish ensuite tomee et JBoss EAP
- gens contents de leurs serverus d'app sand Weblogic et Websphere
- les api utilisées le plus JPA, CDI, REST, Faces, Servlet, Bean Validation, JTA, EJB, EL etc
- Produit microprofile: Quarkus puis WildFlky puis Open Liberty puis Payara et Helidon
- Dans microprofile: Config, rest client, open api, health et metric sont les plus utilisés 

Comment utiliser des records et Hibernate [https://thorben-janssen.com/java-records-embeddables-hibernate/](https://thorben-janssen.com/java-records-embeddables-hibernate/)

- pas en tant qu'entité encore (final, pas de constructeur vide)
- mais en tant qu'`@Embeddable` 
- records sont immuable
- dans hibernate 6.2, c'est supporté par default (annoter le record `@Embeddable`
- Ca utilise le contrat `EmbeddableIntentiator`

Cinq librairies Java super confortables [https://tomaszs2.medium.com/5-amazingly-comfortable-java-libraries-887802e240de](https://tomaszs2.medium.com/5-amazingly-comfortable-java-libraries-887802e240de)

- mapstruct mapper des entités en DTO
- jOOQ requête de bases de données typées 
- WireMock mocker des API ou être entre le client et l’API pour ne mocker que certaines requêtes
- Eclipse Collections : pour rendre le code plus simple et facile à comprendre. Attention à la,surface d’attaque
- HikariCP connection pool rapide - agroal est dans la meme veine mais supporte JTA. C’est ce qui est dans Quarkus. 

Retour d’expérience  sur Hibernate 6 [https://www.jpa-buddy.com/blog/hibernate6-whats-new-and-why-its-important/](https://www.jpa-buddy.com/blog/hibernate6-whats-new-and-why-its-important/)

- côté APIs et côté moteur
- jakarta persistence 3 ; java 11
- annotations de types hibernate sont typesafe 
- support des types JSON OOTB
- meilleur support des dates avec `@TimeZoneStorage` soit natif de la base soit avec une colonne séparée 
- changement dans la génération des ID (changement cassant) mais stratégies de noms historique peut être activé 
- Options autour de UUID (Time base et IP based)
- composite id n’ont plus besoin d'être serialisable
- type texte long supportés via `@JdbcTypeCode` 
- multitenancy (shared schema, resolver de tenant a plugger)
- read by position (SQL plus court car sans alias, deserialisarion plus rapide, moins de joins dans certains cas)
- modele sous jacent commun entre HQL et l’api criteria et donc même moteur
- meilleure génération du SQL et plus de fonction SQL modernes réduisant le gap entre HQL et SQL
- ronctions analytiques et fenêtre quand la base les supportent
- graphe traverse en largeur plutôt qu’en profondeur (potentiellement plus de join donc bien mettre lazy sur vos associations)



### Cloud

Docker supprime les organisations open source sur DockerHub
[https://blog.alexellis.io/docker-is-deleting-open-source-images/](https://blog.alexellis.io/docker-is-deleting-open-source-images/)

- Les projets open source risquent de devoir passer de 0 $ à 420 $ par an pour héberger leurs images
- Rétropédalage de Docker [https://www.docker.com/blog/we-apologize-we-did-a-terrible-job-announcing-the-end-of-docker-free-teams/](https://www.docker.com/blog/we-apologize-we-did-a-terrible-job-announcing-the-end-of-docker-free-teams/)


### Web

Une base de connaissance sur le fonctionnement et les bonnes pratiques autour des WebHooks
[https://nordicapis.com/exploring-webooks-fyi-the-webhooks-knowledge-center/](https://nordicapis.com/exploring-webooks-fyi-the-webhooks-knowledge-center/)


Guillaume a refondu son blog
[https://glaforge.dev/](https://glaforge.dev/)

- Cette fois ci, c’est un site web statique, généré avec Hugo, avec des articles en Markdown, hébergé sur Github Pages, buildé / publié automatiquement par Github Actions



### Outillage

Gradle 8.0 est sorti
[https://docs.gradle.org/8.0/release-notes.html](https://docs.gradle.org/8.0/release-notes.html)


Une CLI connectée à OpenAI's Davinci model pour générer vos lignes de commandes
[https://github.com/TheR1D/shell_gpt](https://github.com/TheR1D/shell_gpt)

- `sgpt -se "start nginx using docker, forward 443 and 80 port, mount current folder with index.html"`
- -> `docker run -d -p 443:443 -p 80:80 -v $(pwd):/usr/share/nginx/html nginx`
- -> Execute shell command? [y/N]: y

Un petit outil en ligne basé sur le modèle GPT-3 qui permet d’expliquer un bout de code
[https://whatdoesthiscodedo.com/g/db97d13](https://whatdoesthiscodedo.com/g/db97d13)

- Copiez-collez un bout de code de moins de 1000 caractères, et le modèle de code de GPT-3, et l’outil vous explique ce que fait ces quelques lignes de code
- Assez impressionnant quand on pense que c’est un modèle de prédiction probabiliste des prochains caractères logiques
- Certaines réponses donnent vraiment l’impression parfois que l’outil comprends réellement l’intention du développeur derrière ce bout de code

Git: Comment rebaser des branches en cascade
[https://adamj.eu/tech/2022/10/15/how-to-rebase-stacked-git-branches/](https://adamj.eu/tech/2022/10/15/how-to-rebase-stacked-git-branches/)


`native-image` va être inclu dans la prochaine version de GraalVM JDK. Plus besoin de `gu install native-image`
[https://github.com/oracle/graal/pull/5995](https://github.com/oracle/graal/pull/5995)


Si vous utilisez l’outil Mermaid pour faire des graphes d’architecture, d’interactions, etc, il y a un petit cheatsheet sympa qui montre comment faire certains diagrammes
[https://jojozhuang.github.io/tutorial/mermaid-cheat-sheet/](https://jojozhuang.github.io/tutorial/mermaid-cheat-sheet/)


Un site avec plein de trucs et astuces sur psql, le langage SQL de PostgreSQL
[https://psql-tips.org/](https://psql-tips.org/)


CURL a 25 ans !
[https://daniel.haxx.se/blog/2023/03/10/curl-25-years-online-celebration/](https://daniel.haxx.se/blog/2023/03/10/curl-25-years-online-celebration/)

- Son créateur, Daniel Stenberg, est toujours à la tête du projet
- cURL est utilisé dans d’innombrables projets
- par défaut dans plein de systèmes d’exploitation

Cédric Champeau explique le concept de version catalog de Gradle et comment il améliore la productivité
[https://melix.github.io/blog//2023/03-12-micronaut-catalogs.html](https://melix.github.io/blog//2023/03-12-micronaut-catalogs.html)

- permet de réduire le temps et l’effort nécessaire à gérer la version de ses dépendances
- apport aussi plus de sécurité, de flexibilité, pour s’assurer qu’on a les bonnes versions les plus récentes des dépendances et qu’elles fonctionnent bien entre elles


### Architecture

La pyramide des besoins du code de qualité [https://www.fabianzeindl.com/posts/the-codequality-pyramid](https://www.fabianzeindl.com/posts/the-codequality-pyramid)

- le bas de la pyramide supporte le haut
- performance de build
- performance de test
- testabilité
- qualité des codes de composants
- fonctionalités
- performance du code
- pour chaque bloc, il explique les raisons, ses definitions et des astuces pour l'ameliorer
- par exemples les fonctionalites changent et donc build, testabilité et qualite de code permet des changements légers en cas de changement dans les fonctionalités
- perf viennent ensuite ("premature opt, root of all evil), regader des besoins globaux


### Méthodologies

Le DevSusOps est né [https://www.infoq.com/news/2023/02/sustainability-develop-operation/?utm_campaign=i[…]nt&amp;utm_source=twitter&amp;utm_medium=feed&amp;utm_term=culture-methods](https://www.infoq.com/news/2023/02/sustainability-develop-operation/?utm_campaign=infoq_content&amp;utm_source=twitter&amp;utm_medium=feed&amp;utm_term=culture-methods)

- bon serieusement, comment on couvre avec un nom pareil sans déraper :man-facepalming:
- ah dommage Micreosoft rejoints la FinOps foundation [https://www.infoq.com/news/2023/02/microsoft-joins-finops-org/?utm_campaign=infoq_content&amp;utm_source=twitter&amp;utm_medium=feed&amp;utm_term=Cloud](https://www.infoq.com/news/2023/02/microsoft-joins-finops-org/?utm_campaign=infoq_content&amp;utm_source=twitter&amp;utm_medium=feed&amp;utm_term=Cloud) Imagine si ils avaient rejoint la DevSusOps fondation


### Sécurité

Plein de choses qu’on peut faire avec des Yubikeys
[https://debugging.works/blog/yubikey-cheatsheet/](https://debugging.works/blog/yubikey-cheatsheet/)

- Pour générer des time-based one-time passwords, pour l’accès SSH,, pour sécuriser un base Keepass, comme 2FA pour le chiffrement de disque, pour la vérification d’identifiant personnel, pour gérer les clés privées...


### Loi, société et organisation

Le fabricant de graveurs de CPU hollandais ASML se voit interdire d'exporter ses technologies vers la chine [https://www-lemagit-fr.cdn.ampproject.org/c/s/www.lemagit.fr/actualites/365532284/Processeurs[…]le-escalade-dans-les-sanctions-contre-la-Chine?amp=1](https://www-lemagit-fr.cdn.ampproject.org/c/s/www.lemagit.fr/actualites/365532284/Processeurs-nouvelle-escalade-dans-les-sanctions-contre-la-Chine?amp=1)

- en tous cas les technologies de gravure des deux dernières generations
- de la pression commerciale on passe au registre d'exclusion par decision militaire
- ASML s'était fait espionner récemment
- CAnon et Sony aussi dans la restriction

Meta supprime de nouveau 10000 emplois soit 25% au total depuis la fin de l'année dernière [https://www.lesechos.fr/tech-medias/hightech/meta-va-supprimer-10000-postes-de-plus-1915528](https://www.lesechos.fr/tech-medias/hightech/meta-va-supprimer-10000-postes-de-plus-1915528)




## Rubrique débutant

Bouger les éléments d'une liste [https://www.baeldung.com/java-arraylist-move-items](https://www.baeldung.com/java-arraylist-move-items)

- discute le concept d'array list en dessous et donc le coût d'insérer au milieu
- decouverte de `Collections.swap` (pour intervertir deux elements)
- decouverte de `Collections.rotate` pour "deplacer" l'index zero de la liste


## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 15-18 mars 2023 : [JChateau](https://www.jchateau.org/) - Cheverny in the Châteaux of the Loire Valley (France) 
- 23-24 mars 2023 : [SymfonyLive Paris](https://live.symfony.com/2023-paris/) - Paris (France)  <a href="https://live.symfony.com/2023-paris/cfp"><img alt="CFP SymfonyLive Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-December-2022&color=red"></a>
- 23-24 mars 2023 : [Agile Niort](https://agileniort.fr/) - Niort (France)  <a href="https://sessionize.com/agile_niort_2023"><img alt="CFP AgileNiort" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-December-2022&color=red"></a>
- 30 mars 2023 : [Archilocus](https://www.archilocus.tech/) - Online (France)  <a href="https://conference-hall.io/public/event/RDgIWt2Qy01elL0Skezw"><img alt="Archilocus Printemps 2023" src="https://img.shields.io/static/v1?label=CFP&message=until-15-March-2023&color=green"></a>
- 31 mars 2023-1 avril 2023 : [Agile Games France](https://www.agilegamesfrance.fr/index.php?title=Evenement_2023) - Grenoble (France) 
- 1-2 avril 2023 : [JdLL](https://jdll.org/) - Lyon 3e (France)  <a href="https://jdll.org/participer"><img alt="CFP JDLL" src="https://img.shields.io/static/v1?label=CFP&message=until 31-January2023&color=red"></a>
- 4 avril 2023 : [AWS Summit Paris](https://aws.amazon.com/fr/events/summits/paris/) - Paris (France) 
- 4 avril 2023 : [Lyon Craft](https://lyon-craft.fr/) - Lyon (France) 
- 5-7 avril 2023 : [FIC](https://europe.forum-fic.com) - Lille Grand Palais (France) 
- 12-14 avril 2023 : [Devoxx France](https://www.devoxx.fr/) - Paris (France)  <a href="https://cfp.devoxx.fr/"><img alt="CFP Devoxx France" src="https://img.shields.io/static/v1?label=CFP&message=from%20November-21%20to%20January-8-2023&color=red"></a>
- 20 avril 2023 : [WordPress Contributor Day](https://wpfr.net/rendez-vous-a-la-journee-de-contribution-le-20-avril-2023/) - Paris (France) 
- 20-21 avril 2023 : [Toulouse Hacking Convention 2023](https://thcon.party/) - Toulouse (France)  <a href="https://thcon.party/cfp.html"><img alt="CFP THCon 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-February-2023&color=red"> </a>
- 21 avril 2023 : [WordCamp Paris](https://paris.wordcamp.org/2023/) - Paris (France) 
- 27-28 avril 2023 : [AndroidMakers by droidcon](https://androidmakers.droidcon.com/) - Montrouge (France)  <a href="https://sessionize.com/androidmakers-by-droidcon-2023/"><img alt="CFP Android Markers by droidcon 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2023&color=red"></a>
- 4-6 mai 2023 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece)  <a href="https://dvgr23.cfp.dev/"><img alt="CFP Devoxx Greece 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2023&color=red"></a>
- 10-12 mai 2023 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK)  <a href="https://devoxxuk23.cfp.dev/#/"><img alt="CFP Devoxx UK 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2023&color=red"></a>
- 11 mai 2023 : [A11yParis](https://www.a11yparis.org/) - Paris (France)  <img alt="Closed Captions" src="https://img.shields.io/static/v1?label=CC&message=Closed%20Captions&color=blue" />
- 12 mai 2023 : [AFUP Day](https://event.afup.org/) - lle & Lyon (France)  <a href="https://event.afup.org/"><img alt="CFP AFUP Day 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-November-2022&color=red"></a>
- 12 mai 2023 : [SoCraTes Rennes](https://socrates-rennes.github.io/) - Rennes (France) 
- 25-26 mai 2023 : [Newcrafts Paris](https://ncrafts.io/) - Paris (France)  <a href="https://sessionize.com/newcrafts-paris-2023"><img alt="CFP Newcrafts Paris 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2001-December-2022%20to%2012-February-2023&color=red"></a>
- 26 mai 2023 : [Devfest Lille](https://devfest.gdglille.org/) - Lille (France)  <a href="https://conference-hall.io/public/event/hRA5AjQjXYMPI3MpwyoF"> <img alt="Closed Captions" src="https://img.shields.io/static/v1?label=CC&message=Closed%20Captions&color=blue" /> <img alt="CFP Devfest Lille 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2003-Jan-2023%20to%20-31-March-2023&color=green"></a>
- 27 mai 2023 : [Polycloud](https://polycloud.fr) - Montpellier (France)  <a href="https://conference-hall.io/public/event/OR1ldOA5G0ASoizWvVbO"><img alt="Polycloud" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-April-2023&color=green"></a>
- 31 mai 2023-2 juin 2023 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland)  <a href="https://devoxxpl23.cfp.dev/"><img alt="CFP Devoxx Poland 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=red"></a>
- 31 mai 2023-2 juin 2023 : [Web2Day](https://www.web2day.co/) - Nantes (France) 
- 1 juin 2023 : [Javaday](https://javaday.parisjug.org/) - Paris (France) 
- 1 juin 2023 : [WAX](https://www.waxconf.fr/) - Aix-en-Provence (France)  <a href="https://conference-hall.io/public/event/BtpnpzTxdVAxEJCcfTJW"><img alt="CFP WAX Conf" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2023&color=green"></a>
- 2-3 juin 2023 : [Sud Web](https://sudweb.fr/2023/) - Toulouse (France)  <a href="https://sudweb.fr/2023/appel-a-sujet/"><img alt="CFP Sud Web" src="https://img.shields.io/static/v1?label=CFP&message=until%207-April-2023&color=green"></a>
- 7 juin 2023 : [Serverless Days Paris](https://paris.serverlessdays.io/fr/) - Paris (France)  <a href="https://sessionize.com/serverlessdays-paris-2023/"><img alt="CFP Serverless Days Paris 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-February-2023&color=red"></a>
- 15-16 juin 2023 : [Le Camping des Speakers](https://camping-speakers.fr/) - Baden (France)  <a href="https://conference-hall.io/public/event/HDF3RTtlPRv7WIuxthtr"><img alt="CFP Camping Speakers June 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=red"></a> 
- 20 juin 2023 : [Mobilis in Mobile](https://mobilis-in-mobile.io/) - Nantes (France)  <a href="https://conference-hall.io/public/event/xucx9AFfz79zIgxT6Lti"><img alt="CFP Mobilis in Mobile 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2023&color=green"></a>
- 20 juin 2023 : [Cloud Est](http://cloudest-event.fr/) - Villeurbanne (France)  <a href="https://conference-hall.io/speaker/event/ESKiH3aEGAWFiXKvcpby"><img alt="CFP Cloud Est 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-April-2023&color=green"></a>
- 21-23 juin 2023 : [Rencontres R](https://rr2023.sciencesconf.org) - Avignon (France) 
- 28-30 juin 2023 : [Breizh Camp](https://www.breizhcamp.org/) - Rennes (France) 
- 29-30 juin 2023 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France)  <a href="https://conference-hall.io/public/event/Jnevkv3bLyxZOyYyiWSC"><img alt="CFP Sunny Tech 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=red"></a>
- 29-30 juin 2023 : [Agi'Lille](https://agilille.fr/) - Lille (France)  <a href="https://sessionize.com/agilille-2023"><img alt="AgiLille 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2023&color=green"></a>
- 8 septembre 2023 : [JUG Summer Camp](https://www.jugsummercamp.org/) - La Rochelle (France) 
- 19 septembre 2023 : [Salon de la Data Nantes](https://salondata.fr/index.php/le-salon/) - Nantes (France) & Online 
- 21-22 septembre 2023 : [API Platform Conference](https://api-platform.com/con/2023) - Lille (France) & Online 
- 25-26 septembre 2023 : [BIG DATA & AI PARIS 2023](https://www.bigdataparis.com/) - Paris (France)  <a href="#"><img alt="CFP BIG DATA & AI PARIS 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-March-2023&color=green"></a>
- 28-30 septembre 2023 : [Paris Web](https://www.paris-web.fr/) - Paris (France)  <img alt="Closed Captions" src="https://img.shields.io/static/v1?label=CC&message=Closed%20Captions&color=blue" />
- 2-6 octobre 2023 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 10-12 octobre 2023 : [Devoxx Morroco](https://devoxx.ma/) - Agadir (Morroco) 
- 12 octobre 2023 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) 
- 12-13 octobre 2023 : [Volcamp 2023](https://www.volcamp.io/) - Clermont-Ferrand (France) 
- 12-13 octobre 2023 : [Forum PHP 2023](https://event.afup.org/forum-php-2023) - Marne-la-Vallée (France) 
- 19-20 octobre 2023 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) 
- 10 novembre 2023 : [BDX I/O](https://www.bdxio.fr/) - Bordeaux (France) 
- 6-7 décembre 2023 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) 
- 31 janvier 2024-3 février 2024 : [SnowCamp](https://snowcamp.io/fr/) - Grenoble (France) 
- 1-3 février 2024 : [SnowCamp](https://snowcamp.io/fr/) - Grenoble (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->


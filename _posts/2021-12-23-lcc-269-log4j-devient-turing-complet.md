---
title: LCC 269 - Log4J devient Turing-complet
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 269
mp3_length: 50620339
tweet: Log4J devient Turing-complet #log4Shell #log4j2 #kotlin #groovy4 #springboot #micronaut #docker #css
# tweet size: 91-93 -> 99-101 #######################################################################
---
Antonio et Guillaume discutent de nouvelle crèmerie, des fêtes de fin d’années, des cadeaux du père Noël, et... de log4j, le feuilleton de fin d’année !

Enregistré le 20 décembre 2021

Téléchargement de l’épisode [LesCastCodeurs-Episode-269.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-269.mp3)

## News

[Décès de Stéphane Maldini](https://twitter.com/glaforge/status/1470729181050937346) (14 Dec 2021)

* Une triste nouvelle pour commencer l’épisode avec l’annonce du décès soudain de Stéphane Maldini
* Un acteur de l’écosystème Grails à la fin des années 2000, grâce à de nombreux plugins
* Mais plus connu pour avoir cofondé le project Reactor, et popularisé le Reactive Programming au sein de la communauté Java
* Également à l’origine de R2DBC pour rendre l’accès aux bases de données plus réactif
* Après de nombreuses années chez Pivotal, il avait rejoint plus récemment Netflix, et c’est peut-être en partie grâce à lui que vous pouviez matter plein de séries !

[CloudBees clot un tour de table de 150 millions de dollars valorisant l’entreprise à 1 milliard de dollars](https://twitter.com/cloudbees/status/1468943708330643457?s=21) 

[Le feuilleton Log4j2](https://www.lunasec.io/docs/blog/log4j-zero-day/) (9 Dec 2021)

* Grosse faille de sécurité liée à l’utilisation des versions <2.15 de Log4j2
* Découverte par un chercheur en sécurité d’Alibaba Cloud
* [Détails](https://www.lunasec.io/docs/blog/log4j-zero-day/) publiés par LunaSec
    * Log4j2 permet de faire de l’interpolation de texte en remplaçant des parties variables d’un message à logguer
    * Hors il est possible d’ajouter des appels à des informations JNDI provenant d’un serveur LDAP
    * Un serveur LDAP peut retourner une classe compilée que JNDI va exécuter en local lorsque Log4j2 va vouloir insérer l’information JNDI
    * Donc potentiellement, la classe distante exécutée localement pourra exfiltrer des données, avoir accès aux processus qui tournent, etc.
* Log4j2 a été patché rapidement, mais d’autres [failles](https://www.lunasec.io/docs/blog/log4j-zero-day-update-on-cve-2021-45046/) sont apparues
* Différentes stratégies de mitigations ont été publiées
* Snyk a publié une "[cheat sheet](https://snyk.io/blog/log4shell-remediation-cheat-sheet/)" pour remédier à la faille

### Langages

[Kotlin à l’assaut du K2 avec son nouveau compilo](https://www.infoq.com/news/2021/11/jetbrains-k2-compiler-kotlin/) (11 Nov 2021)

* Lors de sa conférence [Kotlin 2021 Premier](https://pages.jetbrains.com/kotlin-premier-event-2021/) annoncent des nouveautés autour du langage
* Le nouveau compilateur plus rapide K2
    * qui sert dorénavant de base pour toutes les plateformes cibles supportées
    * qui apporte une nouvelle API pour créer des extensions au compilateur
    * utilise un langage intermédiaire (IR) au lieu de compiler directement en natif
    * avec un nouveau frontal avec sa propre représentation intermédiaire qui permet de simplifier la compréhension du langage dans les IDEs, pour désugariser le sucre syntaxique
    * rapidité accrue potentiellement jusqu’à 2 fois
* Le support de WebAssembly avec Kotlin/WASM
    *  Kotlin/JS continue d’exister, pour des applis Web, pour l’intégration JavaScript
    *  mais Kotlin/WASM apporte le support natif de WebAssembly
* Kover, un nouveau plugin de couverture de code pour Kotlin/JVM, utilisable avec un plugin Gradle, compatible avec JaCoCo
* Le Kotlin Symbol Processor, KSP, drivé par Google, est maintenant stable, plus rapide, plus ergonomique d’utilisation (remplace Kapt)

[Groovy 4, on y est presque !](http://groovy-lang.org/releasenotes/groovy-4.0.html)

* Sortie de la release candidate de Groovy 4, la finale est proche !
* Changement des coordonnées Maven pour passer à `org.apache.groovy` (bye bye Codehaus)
* Suppression de vieilles coordonnées de packages ou classes mal-situées, à cause des modules Java (XmlSlurper, XmlParser, AntBuilder, GroovyTestCase)
* Le module `groovy-yaml` est rajouté au pom `groovy-all` et le module `groovy-testng` devient optionnel
* Le vieux parseur basé sur Antlr2 est supprimé et le parseur introduit dans Groovy 3, "parrot", reste le seul parseur
* Le bytecode généré n’utilise plus que l’instruction `invokedynamic` partout où c’est possible
* Support des expressions `switch`
* Support des sealed types
* Incubation du support des records
* Inclusion de type-checkers, par exemple avec le premier pour valider les expressions régulières à la compilation
* Inclusion de macro pour faciliter le débogage
* Intégration de JavaShell dans la console Groovy pour faciliter les expérimentations cross-language
* Nouvelle annotation @POJO pour créer des POJO Java, sans la surcharge de bytecode spécifique à Groovy (pratique pour la compilation statique)
* Incubation de design by contract avec l’intégration de l’ancien module GContracts
* GINQ (Groovy Integrated Query) qui propose un langage proche de SQL, similaire à LINQ en .Net, pour faciliter le travail avec les collections
* Incubation du support pour le langage de configuration TOML

[Trisha Gee partage ses nouvelles Java annotés pour le mois de décembre](https://blog.jetbrains.com/idea/2021/12/java-annotated-monthly-december-2021/) (3 Dec 2021)

### Librairies

[Nouvelle paire de bottes 2.6 pour Spring Boot](https://spring.io/blog/2021/11/19/spring-boot-2-6-is-now-available) (19 Nov 2021)

* Support des attributs SameSite sur les cookies de session cookies pour les applications à base de servlet
* Support pour configurer les health groups sur le port principal ou de management
* Amélioration du endpoint `/info` avec des infos sur le runtime Java
* Support pour tester les applis Spring MVC en utilisant `WebTestClient`
* Auto-configuration de `spring-rabbit-stream`
* Support pour des règles personnalisées de nettoyage/filtrage des propriétés dans `/env` et `configprops`

[Micronaut 3.2](https://micronaut.io/2021/11/23/micronaut-framework-3-2-released/) (23 Nov 2021)

* Nouvelle version de Micronaut
* Passage de GraalVM à la version 21.3 avec le support de JDK 17 (il faut maintenant développer a minima avec la distribution GraalVM JDK 11 et non plus 8)
* Version 3 du plugin GraalVM pour Gradle
* Support de Kotlin 1.6
* Fonctionnalités HTTP
    * Annotation @JsonView sur les paramètres annotés @Body
    * Timeout configurable pour le handshake SSL
    * Support amélioré du server push HTTP/2 pour envoyer les resources en parallèle
    * Amélioration WebSocket avec le paramètre WebSocketPongMessage pour l’annotation @OnMessage pour répondre au Ping des WebSockets
    * Support du protocole WS/WSS des WebSockets
* Différentes mises à jour des modules fonctionnels (Data, Security, Reactive, OpenAPI, Kubernetes, ElasticSearch)

[Cédric Champeau compare Gradle et Maven niveau composition et héritage](https://melix.github.io/blog/2021/12/composition-in-gradle.html) (1 Dec 2021)

* Gradle et Maven prennent l’approche de "convention over configuration"
* Couvre les approches différentes entre Gradle et Maven : Maven prends une approche plutôt héritage, tandis que Gradle l’approche composition
* Les plugins Gradle sont plus faciles à maintenir grâce à la composition et permet de créer ses propres conventions


### Infrastructure

[GitHub collabore à la sécurité des packages NPM](https://github.blog/2021-11-15-githubs-commitment-to-npm-ecosystem-security/) (15 Nov 2021)

* GitHub est un des stewards du registre des packages NPM
* GitHub partage des détails sur les incidents de sécurités récents
    * malwares injectés récemment dans `ua-parser-js`, `coa`, et `rc` car un tiers avait réussi à usurper le compte d’un contributeur
    * temporairement, les packages privés étaient potentiellement découvrables sur le réplica de npmjs.com
    * une faille qui a été découverte grâce à un bug bounty qui permettait de publier des versions de certains modules avec des comptes mal-sécurisés
* GitHub investit dans la sécurité, en particulier en rendant obligatoire la 2-factor-authentication pour les administrateurs et admins des packages les plus populaires hébergés sur GitHub, en rajoutant de la détection de malwares automatique

[Jérôme Petazzoni et les anti-patterns Docker](http://jpetazzo.github.io/2021/11/30/docker-build-container-images-antipatterns/) (30 Nov 2021)

* Jérôme partage une liste d’anti-patterns qu’il voit fréquemment quand il aide les gens à construire leurs images de conteneur
* Parmi les anti-patterns :
    * les trop grosses images, comment les optimiser, comment monter des volumes plutôt que d’inclure de gros dataset dans l’image
    * les trop petites images, mais attention, car parfois on ne peut pas investiguer plus finement ce qui s’y passe
    * utilisation de zip et tar, mieux vaut éviter de compresser pour ne pas utiliser trop de CPU ou d’espace dans l’image
    * re-builder les bases communes : autant mettre l’image de base dans un registry, plutôt que de la re-construire à chaque fois
    * construire l’image à partir d’un monorepo géant et comment organiser ses sources et la localisation de son Dockerfile avec chaque projet
    * ne pas utiliser BuildKit
    * avoir besoin de rebuilder pour chaque changement minime
    * utiliser des scripts customs au lieu des outils existants comme Compose, Skaffold, Tilt et faire ses propres sh
    * obliger les gens à faire tourner certaines choses dans des conteneurs alors que ça peut très bien tourner en local sur la machine du développeur
    * utilisation d’outils trop complexes, autant utiliser des outils appropriés
    * conflit de noms entre scripts et images
    * builder dans des Dockerfiles

### Cloud

[Le runtime Java pour Google App Engine en Open Source](https://twitter.com/glaforge/status/1471485040005550080) (16 Dec 2021)

* Toujours dans un esprit d’ouverture pour éviter le lock-in, Ludovic Champenois qui dirige le runtime Java de Google App Engine Java a open sourcé les sources du runtime, du SDK.

[Azure : comment les développeurs migrent leurs applis Spring Boot dans le Cloud](https://techcommunity.microsoft.com/t5/apps-on-azure-blog/2021-report-how-developers-migrate-spring-apps-to-the-cloud/ba-p/3021421) (2 Dec 2021)

* Cible en majorité Kubernetes, 2x plus que sur des VMs
* Challenges spécifiques Spring rencontrés
    * Passer d’un monolith à une version cloud-friendly
    * Migrer d’anciennes versions des composants Spring Cloud
    * Migrer d’anciennes versions de Spring Boot
    * Migrer de servlet vers Boot
* Migration de Java vers Spring Boot
    * Java vers Boot
    * Java EE vers Boot
    * Spring Framework vers Spring Boot
    * Mainframe vers Spring
* Challenges spécifiques au Cloud
    * Migration de base de données
    * Monitoring end-to-end
* Outils d’APM les plus fréquents
    * Outils du provider cloud
    * Prometheus
    * Dynatrace
    * AppDynamics
* End-to-End monitoring
    * Splunk
    * Elastic
    * Outil du provider cloud
* Composants Spring les plus fréquemment utilisés
    * Spring Cloud Config Server
    * Spring Cloud Gateway
    * Spring Cloud Service Registry
    * Spring Cloud Load Balancer
    * Spring Cloud Circuit Breaker (Resilience4J)

### Web

[CSS défensif](https://ishadeed.com/article/defensive-css/) (7 Dec 2021)

* Ahmad Shadeed partage de bonnes pratiques CSS, comment écrire du CSS propre, sans comportement bizarroïde suivant les navigateurs, ou qui répond bien de manière responsive
* Avec des exemples sur l’utilisation de Flexbox, de l’espacement, la gestion du contenu long (et donc du clipping), de l’apparence des images suivant la taille de la fenêtre, les media queries en vertical, le texte au-dessus des images, la gestion des scrollbars.

[Le custom CSS Reset de Josh Comeau](https://www.joshwcomeau.com/css/custom-css-reset/) (23 Nov 2021)

* Josh Comeau partage une nouvelle version de CSS Reset, non-opinionated pour ce qui est design et cosmétique, mais qui prends certains partis pris (par exemple de l’italique reste italique)
* Couvre en détail chaque aspect : le box-sizing, les marges par défaut, la hauteur de ligne, des hauteurs basées sur les pourcentages, rendre les polices antialiasées, le word wrapping pour la gestion du retour à la ligne

[Google Fonts propose des articles sur l’utilisation des polices de caractères](https://fonts.google.com/knowledge) (7 Dec 2021)

* [Elliot Jay Stocks](https://elliotjaystocks.com/blog/google-fonts-knowledge) a participé à la base de connaissance et d’articles du Google Fonts Knowledge
* Introduction à la typographie, comment choisir une bonne taille d’interligne, comprendre les mesures des caractères et des lignes
* Comment choisir une typographie et une police de caractères
* Un glossaire sur les termes relatifs aux polices de caractères, à la typographie

### Outillage

[JetBrains annonce Fleet un nouvel IDE](https://www.jetbrains.com/fleet/) (29 Nov 2021)

* Développé from scratch
* Basé sur l’experience de 20 ans à developer des IDEs
* Fleet utilise le code-processing d’IntelliJ (polyglot)
* Nouvelle interface graphique
* Basé sur la librairie graphique 2D Skia (utilisée dans Chrome, Flutter, Android, Firefox...)
* Rapide et léger (démarre en quelques secondes)
* Architecture distribuée (tourne sur le PC, remote PC, dans le Cloud)
* Early Preview, pas encore accessible publiquement à tout le monde

[Mac: display_manager et Rectangle](https://twitter.com/glaforge/status/1465284619469742083) (29 Nov 2021)

* [display_manager](https://github.com/univ-of-utah-marriott-library-apple/display_manager) permet de scripter en ligne de commande la configuration des résolutions des écrans (interne ou externe), de changer la luminosité, la densité de pixel, la fréquence de rafraichissement
* [Rectangle](https://rectangleapp.com/) : cette petite application propose des raccourcis clavier pour positionner et retailler les fenêtres, pour les mettre rapidement en plein écran, à gauche/à droite, en quart, en tiers
* [Hammerspoon](https://www.hammerspoon.org/) qui permet d’automatiser mac OS, en rajoutant des raccourcis clavier, en réagissant à des événements comme le branchement d’un appareil sur un port USB, le fait de rejoindre un réseau Wifi

### Loi, société et organisation

[Un document du FBI liste les données des messageries chiffrées pouvant être récupérées](https://therecord.media/fbi-document-shows-what-data-can-be-obtained-from-encrypted-messaging-apps/) (30 Nov 2021)

* Même si le contenu des messages n’est pas récupérable, des informations de type méta-données peuvent l’être (date de dernière connection ou de création du compte, avatar, clé publique ou token, nombre de messages postés)

## Conférences

[Devoxx France du 20 au 22 avril 2021](https://www.devoxx.fr/)  
[SunnyTech les 30 juin et 1er juillet 2022 à Montpellier](https://sunny-tech.io/)  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

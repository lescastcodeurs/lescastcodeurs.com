---
title: LCC 267 - Lagom efface sa dette technique
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Heritier, Audrey Neveu'
layout: blog-post
episode: 267
mp3_length: 55275680
tweet: Lagom efface sa dette technique #microsoft #cryostat #lightbend #cors
# tweet size: 91-93 -> 99-101 #######################################################################
---
Antonio et Emmanuel discutent Microsoft et Java, cryostat, Java 17, Micronaut, Quarkus, Play framework, Lagom, Amazon, CORS, CSS (si si), Hibernate Reactive, AtomicJar, canary, amplification algorithmique.

Enregistré le 12 novembre 2021

Téléchargement de l'épisode [LesCastCodeurs-Episode-267.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-267.mp3)

## News

### Langages

[Blog sur les extraits de code dans les JavaDocs](https://www.morling.dev/blog/executable-javadoc-code-snippets/) (18 Oct 2021)  

* C’est plus agréable à utiliser que les balises pre, pas besoin d’escaping (pour < et >), l’espace à gauche est normalisé
* On peut mettre en valeur certaines portion, ou remplacer par une expression régulière certains bouts
* Et on peut également externaliser d’où vient l’extrait de code, au lieu de le mettre dans la JavaDoc, on peut référencer une région de son vrai code.
* Donc au moins, on est sûr que c’est du code valide et qui compile évidemment
* Gunnar explique comment reprendre le code provenant de nos classes de test, pour le faire apparaître dans les JavaDocs, créant ainsi une vraie documentation “exécutable”

[Compress class space](https://stuefe.de/posts/metaspace/what-is-compressed-class-space/) (27 Mars 2019)  

* compressed object ou class pointer sur 64buts en 32 bits vis adresse relative
* due adresse relative, la Klass structure dans le metaspace doit être mémoire contiguë et pré allouée initialement (risque de non reallocation si mémoire libre non contiguë )
* Donc le classpart et le non class part séparés dans le meta space. Klass is 32G max et contiguë et la klass part est appelé compressed class space
* Par défaut 1G mais configurable jusqu'à  3G. C'est virtual mémoire, juste une réservation.
* 1K pas classe environ donc 1000000 de classes max
* Que quand on utilise compressed oops
* Que pour Java heap size de 32G max

[Cryostat 2.0](https://developers.redhat.com/articles/2021/10/18/announcing-cryostat-20-jdk-flight-recorder-containers) (18 Oct 2021)  

* Fournit une API sécurisée pour profiler et monitored les applis Java dans les containers avec Java Flight Recorder
* Cryostat peut récupérer stoquer et analyser les enregistrements flight recorder de containers
* Ensuite consommé par graphana ou l.appli JDK Mission Control desktop
* Fichier reste local au container par défaut donc pas pratique
* Connection via JMX directe pas pratique ni secure par défaut
* Cryostat récupère les recording via HTTPS
* A un opérateur kubernetes
* Etc

[Microsoft augmente ses investissements dans Java](https://devblogs.microsoft.com/java/microsoft-deepens-its-investments-in-java/). (4 Nov 2021)  

* Microsoft rejoints le [JCP](https://jcp.org/)
* Travaille sur VSCode for Java avec Red Hat
* Est OK avec le LTS passant à 2 ans et va aider à supporter ces releases plus fréquentes

### Librairies

[Micronaut 3.1](https://micronaut.io/2021/10/11/micronaut-framework-released/) (11 Oct 2021)  

* support d'applications utilisant JDK 17
* améliorations d'injections de dependances (repeatable scopes, primitive beans, etc)
* les classes générées sont plus petites et amélioration de consommation mémoire sous GraalVM
* routes HTTP par regexp
* random port binding (pour les conflits de tests)
* Changement certificats TLs via refresh sans arreter le serveur
* Kotlin coroutine supportées dans micronaut data
* extension de la couverture de support JPA (e.g. attribute converter)
* support des informers Kubernetes via le Kubernetes SDK
* integration Oracle Coherence sortie du mode preview

[Quarkus 2.4](https://quarkus.io/blog/quarkus-2-4-0-final-released/) (27 Oct 2021)  

* Hibernate Reactive 1.0.0.Final
* Introducing Kafka Streams DevUI (c'est cool pour développer ca et savoir ce qui se passe
* Support continuous testing for multi module projects
* Support AWT image resize via new AWT extension

[Lightbend lâche Play Framework](https://www.lightbend.com/blog/on-the-future-of-play-framework) (20 Oct 2021)    

* lightbend construit sur Scala, akka, et play framework
* C'est le moment de la 2.0 je crois
* Mais avec le cloud, ils veulent se focaliser sur les systèmes distribués
* Akka Open Source et Akka Serverless (leur PaaS)
* Laisse Play à la,communité et lightbend arrête d’investir dedans
* Dans une orga séparée
* Besoin de sponsors et de contributeurs
* Question: ils n’avaient pas déjà arrêté Scala?

[Lightbend déveste de Lagom aussi](https://discuss.lightbend.com/t/the-future-of-lagom/8962) (27 Oct 2021)  

* Lagom effacé par akka Platform’et Akka Serverless
* Trop de contraintes limitantes dans le framework
* Mais si client de Lightbend, supporté sur Lagom mais sans nouvelle fonctionnalité

### Infrastructure

[Installer et utiliser podman-machine sur macOS](https://blog.while-true-do.io/podman-machine/) (19 Oct 2021)    

* La virtualisation s’appuie sur qemu et met en place une VM dans laquelle les pods tournent.
* Podman Machine pour installer une VM linux avec les outils
* fonctionne aussi sous linux pour ceux qu ne supportent pas podman ou pour sandboxer
* fonctionne sous M1
* homebrew pour l'installation
* comme docker machine avant en gros
* [il y a aussi une belle présentation de Devoxx France](https://www.youtube.com/watch?v=pUFIG2AMDhg)

### Cloud

[Amazon déclaré la guerre à Microsoft en utilisant les arguments “Proprietaire”](https://aws.amazon.com/blogs/aws/goodbye-microsoft-sql-server-hello-babelfish/) (28 Oct 2021)    

* Aurora a un font qui parler protocole SQL server ([Babelfish pour Aurora PostgreSQL](https://aws.amazon.com/fr/rds/aurora/babelfish/)).
* Et convertit les T-SQL
* Open source the t sql vers Postgres (debug). Sous license ASL
* Pas tout open sourcé encore

### Web

[CORS expliqué](https://jakearchibald.com/2021/cors/) (12 Oct 2021)    

* inclue images d'autres sites, c'est l'origine
* les cookies, credeitials etc etaient envoyés
* yahoo mail pouvait filer les credentials des utilisateurs
* une iFrame pouvait lire le contenu d'une autre iFrame (Netscape met en place le Cross-Frame Scripting)
* `Access-Control-Allow-Origin: *` est ok si pas de données privées

[Rendre une page HTML brute jolie en 100 caractères de CSS](https://www.swyx.io/css-100-bytes) (16 Oct 2021)   

* basique mais expliqué ligne par ligne
* E.g. 60-80 caractères pour la lecture
* Et 100 bytes de plus pour améliorer  

### Data

[elasticsearch 8.0 will require java 17](https://twitter.com/xeraa/status/1455980076001071106) (3 Nov 2021)    

* definitely easier for something standalone than a library or anything that needs to share the JDK with all its apps
* [PR GitHub](https://github.com/elastic/elasticsearch/pull/79873)

[Hibernate Reactive 1.0.0, ça vaut le coup ?](https://in.relation.to/2021/10/27/hibernate-reactive-performance/) (27 Oct 2021)  

* PostgreSQL, MySQL, MariaDB, Db2, SQL Server, and CockroachDB
* bases de donnés désignées pour des interactions classiques
* Donc les constructions haut niveau ont tendances à être limitées par le protocole sous-jacent ce qui ne se voyait pas ou peu en JDBC
* utiliser HR si  votre appli est déjà réactive au cœur (e.g. RESTEasy reactive dans Quarkus ou une appli Vert.x)
* Compareperfs acec techempower mais avec angle latence à un volume donné et  et pas throughout max
* 20 requêtes d’affilée 20k request/s -> 35k sous 10ms de latence. C'est la valeur relative qui est intéressante
* Une requête et du processing pour rendre au client, peu de différence
* Toruhghput tend à être meilleur
* Amélioration de réactive sur un an
* [Un vidéo cast sur le sujet](https://youtu.be/VGAnVX1lCxg)

### Outillage

[AtomicJar se lance dans une offre Cloud](https://www.atomicjar.com/2021/11/announcing-testcontainers-cloud/) (04 Nov 2021)    

* les containers de test containers ne tournent plus en local
* Mais dans le cloud de AtomicJar
* A plus de spores source qu'une machine locale typique (2 cores et 8GB ram pour la docker machine)
* peut utiliser la machine quand les tests tournent
* Pour CI limitées vs containers ou les cloud IDE pour pas trop dépenser
* Pas de problème avec M1
* Un petit binaire à installer (eg via curl)
* TestContainers et Quarkus: TestContainer Cloud fonctionne avec Dev Service (les containers lancés et configurés automatiquement)
* Encore en cours de développement (beta privée et on peut demander invitation)

### Méthodologies

[Canary releases ou avoir des testeurs](https://www.infoq.com/articles/canary-releases-testing/) (04 Nov 2021)    

* canary release est une release en prod mais sur un petit sous ensemble des utilisateurs
* Peut aider a voir si une nouvelle fonctionnalité intéresse les utilisateurs avant de commiter sur le long terme
* Toujours option du retour arrière
* Donc peut on réduire les tests internes ?
* Risque de réputation ou abandon utilisateur (acquisition et rétentions sont chères)
* Test automatisés compréhensifs permettent le risque de canary
* Test exploratoires pour compléter les tests automatiques

### Loi, société et organisation

[Le droit à decompiler pour corriger des erreurs confirmé légal](https://www.legalis.net/actualite/le-droit-a-decompiler-un-logiciel-pour-corriger-des-erreurs-confirme-par-la-cjue/) (21 Oct 2021)  

* arrêt du 6 octobre 2021
* Pour corriger une erreur affectant le fonctionnement y compris via la désactivation d'une fonction affectant le bon fonctionnement de l'application

[Influence de l’amplificartion algorithmique sur le contenu politique](https://blog.twitter.com/en_us/topics/company/2021/rml-politicalcontent) (21 Octo 2021)   

* les recommendations algorithmiques amplifient-elle le contenu politique ?
* dans le cas des timeline organisées algorithmiquement et pas reverse chronologique
* Est-ce que ça varie entre partis politiques ou groups politiques
* Des sources de nouvelles plus amplifiées que d’autre
* Les élus sont plus amplifiés que le contenu politique général
* Pas d’amplification particulière d.individus ces d’autres au sein du même parti ????
* La,droite tend à avoir une amplification plus importante que la gauche
* Les sources de nouvelles orientées à droite sont aussi plus amplifiées que celles de gauche
* La méthodologie est détaillée sur par exemple ce qu’est un journal de droite
* Pourquoi c'est amplifié différemment est une question plus difficile à répondre
* Amplification n’est pas mauvaise par défaut mais elle l'est si elle amène à un traitement préférentiel du à l’algorithme (vs comment les gens interagissent sur la plateforme)
* [Le PDF de l'étude intégrale](https://cdn.cms-twdigitalassets.com/content/dam/blog-twitter/official/en_us/company/2021/rml/Algorithmic-Amplification-of-Politics-on-Twitter.pdf) 

## Conférences

[DevFest Lille le 19 novembre 2021](https://devfest.gdglille.org/)  
[Devoxx France du 20 au 22 avril 2021](https://www.devoxx.fr/)  
[SunnyTech les 30 juin et 1er juillet 2022 à Montpellier](https://sunny-tech.io/)  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

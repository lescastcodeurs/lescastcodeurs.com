---
title: LCC 281 - Apérikube apomorphique - partie 1
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 281
mp3_length: 58437414
tweet: Apérikube apomorphique - partie 1
# tweet size: 91-93 -> 99-101 #######################################################################
---
Cet épisode marathon sera découpé en deux morceaux pour éviter à vos oreilles une écoute marathon.
Dans cet épisode on y parle Brian Goetz, Bian Goetz, Brian Goetz, usages des threads virtuels, OpenAPI, Kubernetes, KNative, copilot et Tekton.
La deuxième partie couvrira des sujets d'architecture et de loi société et organisation ainsi que les conférences à venir.

Enregistré le 8 juillet 2022

Téléchargement de l'épisode [LesCastCodeurs-Episode-281.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-281.mp3)

## News

### Langages

[Peut-être une nouvelle syntaxe spécifique aux Records Java pour tordre le cou aux builders](https://mail.openjdk.org/pipermail/amber-spec-experts/2022-June/003461.html)

* Brian Goetz discute de l’idée d’avoir une syntaxe spécifique pour les records pour facilement créer un record dérivé, potentiellement avec des valeurs par défaut, mais en paramétrant certains champs
* Point shadowPos = shape.position() with { x = 0 }
* Cela évite de créer la notion de paramètre par défaut dans les constructeurs ou les méthodes

[Il y a l’article Data Oriented Programming de Brian Goetz, sur InfoQ](https://www.infoq.com/articles/data-oriented-programming-java/)

* projet Amber amène des changements qui combinés permet de faire du data oriented programming en Java et pas que du OOP
* OO combine état et comportement (code)
* OO est super utile pour défendre des limites (programme large en des limites plus petites et plus gérable)
* mais on s’oriente vers des applications plus petites (microservices)
* data oriented programming: modélise data immuable et le code de la logique métier est séparée
* records -> data en tant que classe, sealed classes -> définir des choix, pattern matching -> raisonne sur des data polymorphiques
* algebraic data: hiérarchie de sealed classes dont les feuilles sont des records: nommées, immuable, testable (pas de code)

[Un nouveau JEP pour intégrer une Classfile API](https://openjdk.org/jeps/8280389)

* Le JDK inclut déjà des forks de ASM, de BCEL, et d’autres APIs internes, pour manipuler / produire / lire le bytecode
* Mais l’idée ici c’est que le JDK vienne avec sa propre API officielle, et qui soit plus sympa à utiliser aussi que le pattern visiteur de ASM par exemple
* La version d’ASM intégrée était toujours en retard d’une version (problème de poule et d’oeuf, car ASM doit supporter la dernière version de Java, mais Java n+1 n’est pas encore sorti)

[Lilian nous montre à quoi va ressembler les Record Patterns de JEP 405](https://www.lilian-benoit.fr/2022/06/JEP-405-Record-Patterns.html)

Apache Groovy et les virtual threads, et aussi Groovy et le Deep Learning

* Paul King, qui dirige actuellement le PMC de Apache Groovy, a partagé récemment plusieurs articles sur le blog d’Apache sur des intégrations intéressantes avec Groovy
* Groovy et sa librairie GPars pour la programmation concurrente et parallèle s’intègre facilement avec les Virtual Threads de JEP 425 / JDK 19 https://blogs.apache.org/groovy/entry/gpars-meets-virtual-threads
* Groovy avec Apache Wayang et Apache Spark pour classifier des Whiskey par clusterisation KMeans https://blogs.apache.org/groovy/entry/using-groovy-with-apache-wayang
* Et aussi Groovy avec différentes librairies de Deep Learning pour la classification https://blogs.apache.org/groovy/entry/classifying-iris-flowers-with-deep

[Le jargon (en anglais) de la programmation fonctionnelle, si vous avez rêvé d’avoir sous la main la définition de foncteur, de monoïde, et j’en passe](https://github.com/hemanth/functional-programming-jargon)

* avec des exemples en JavaScript
* des pointeurs vers des librairies fonctionnelles en JavaScript
* des traductions dans d’autres langues et d’autres langages de programmation


### Librairies

[Spring Boot 2.7](https://www.infoq.com/news/2022/06/spring-boot-2-7/?utm_source=twitter&utm_medium=link&utm_campaign=calendar)

* SpringBoot 2.7
* Spring GraphQL 1.0
* Support pour Podman
* Gestion de dépendance et auto configuration pour Cache2k
* nouvelle annotations pour Elasticsearch et CouchBase
* dernière versions avant SpringBoot 3 qui changera plus de choses. Recommande de migrer une version a la fois. Support pour 2.5 à fini (upstream)

[Quarkus 2.10.0](https://quarkus.io/blog/quarkus-2-10-0-final-released/)

* Travaux préliminaires sur les threads virtuels de Loom
* Support non-blocking pour GraphQL
* Prise en charge des Kubernetes service binding pour les clients SQL réactifs
* CacheKeyGenerator pour l’extension de cache
* quarkus-bootstrap-maven-plugin déprécié et remplacé par quarkus-extension-maven-plugin (uniquement utile pour les développeurs d’extensions Quarkus)
* Nouveaux guides:
*  [Using Stork with Kubernetes](https://quarkus.io/guides/stork-kubernetes) 
*  [OpenId Connect Client Reference Guide](https://quarkus.io/guides/security-openid-connect-client-reference) 
*  [Using Podman with Quarkus](https://quarkus.io/guides/podman) 

[Les différences entre OpenAPI 2 et 3](https://nordicapis.com/comparing-the-features-of-openapi-v3-vs-openapi-v2/)

* Introduction de la notion de lien pour créer des relations entre Response et Operations, pratique pour faire des APIs hypermédia
* La structure du document OpenAPI a été -un peu simplifiée, en combinant par exemple basePath et schemes, ou en rassemblant les securityDefinitions
* Des améliorations sur les security schemes, autour de OAuth et OpenID
* Plus de clarté dans la négociation de contenu et les cookies
* La section des exemples de Request / Response devrait aider les outils qui génèrent par exemple des SDK automatiquement à partir de la description OpenAPI
* Un support étendu de JSON Schema
* Introduction d’une notion de Callback, importante pour les APIs asynchrones, en particulier les WebHooks
* je me demande si ils ont l’intention d’embrasser AsyncAPI ou su la partie asynchrone d’OpenAPI 3 a pour objectif de faire de la competition


### Infrastructure

[N’utilisez pas Kubernetes tout de suite !](https://matt-rickard.com/dont-use-kubernetes-yet/)

* Kubernetes, c’est bien, mais c’est un gros marteau. Est-ce que vous avez des gros clous à enfoncer ?
* Ne commencez peut-être pas avec l’artillerie lourde de Kubernetes. Commencez plutôt avec des solutions managées genre serverless, ce sera plus simple, et au fur et à mesure si votre infrastructure a besoin de grossir et dépasse les fonctionnalités des solutions managées, à ce moment là seulement évaluer si Kubernetes peut répondre à votre besoin
* Choisir Kubernetes, c’est aussi avoir la taille de l’équipe qui va bien avec, et il faut des profils DevOps, SRE, etc, pour gérer un cluster K8S
* L’auteur suggère grosso modo que ça dépend de l’ordre de magnitude de la taille de l’équipe : avec quelques personnes, préférez des solutions type Google App Engine ou AWS App Runner, avec une dizaine de personne peut-être du Google Cloud Run ou AWS Fargate, avec moins d’une centaine là pourquoi pas du Kubernetes managé comme Google Kubernetes Engine, et si vous dépassez mille, alors peut-être vos propres clusters managés par vos soins et hébergés par vos soins sur votre infra
* ca impose d’utiliser les services du cloud provider? Parce que la vie ce n’est pas que du code maison.
* C’est la mode de dire de pas utiliser K8S : https://www.jeremybrown.tech/8-kubernetes-is-a-red-flag-signalling-premature-optimisation/
(mais bon, vu le nombre de fois où il est pas utilisé à b

[Knative Eventing Devlivery methods](https://medium.com/google-cloud/knative-eventing-delivery-methods-79d4ebe30a68)

* on peut faire de la delviery simple 1-1 sans garantie
* on peut faire de la delivery complexe et persistante en introduisant la notion de channel qui decouple la source de la destination.
* on peut repondre a la reception d’un message et pousser la réponse dans un second channel
* mais ca devient compliquer a gérer quand on rajoute des souscripteurs
* il y a la notiuon de broker qui definit: des flitres, un channel (automatique) et la capacité de répondre
* les triggers sont un abonnement non pas a un channel mais a un type d’évènement spécifique


### Cloud

[AWS is Windows and Kube is Linux](https://zwischenzugs.com/2019/03/25/aws-vs-k8s-is-the-new-windows-vs-linux/)

* pourquoi utilisez Kube qui etait pas stablewa lors qu’AWS offre tout
* AWS forcé d’offrir EKS
* MAis pourri
* Lockin AWSIAM
* Pourquoi AWS serait le windows
* economies d’echelles de faire chez soi
* kube devient rentable une certaine taille de l’organisation
* besoin alternative a AWS (bus factor)
* on voit le Kube distro modele arriver

Google data center Paris

### Outillage

[IntelliJ IDEA 2022.5 EAP 5 amène des nouveautés](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/)

*  [Frameworks and Technologies](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Frameworks_and_Technologies) 
*  [Spring 6 and Spring Boot 3](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Spring_6_and_Spring_Boot_3) 
*  [Support for new declarative HTTP Clients in Spring 6](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Support_for_new_declarative_HTTP_Clients_in_Spring_6) 
*  [URL completion and navigation for Spring Cloud Gateway routes](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#URL_completion_and_navigation_for_Spring_Cloud_Gateway_routes) 
*  [Experimental GraalVM Native Debugger for Java](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Experimental_GraalVM_Native_Debugger_for_Java) 
*  [Code insight improvements for JVM microservices test and mock frameworks](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Code_insight_improvements_for_JVM_microservices_test_and_mock_frameworks) 
*  [Code insight improvements for Spring Shell](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Code_insight_improvements_for_Spring_Shell) 
*  [Improved support for JAX-RS endpoints](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Improved_support_for_JAX-RS_endpoints) 
*  [Support for WebSockets endpoints in HTTP Client](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Support_for_WebSockets_endpoints_in_HTTP_Client) 
*  [Support for GraphQL endpoints in the HTTP Client](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Support_for_GraphQL_endpoints_in_the_HTTP_Client) 
*  [UI/UX improvements for the HTTP Client](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#UIUX_improvements_for_the_HTTP_Client) 
*  [Improved navigation between Protobuf and Java sources](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Improved_navigation_between_Protobuf_and_Java_sources) 
*  [Kubernetes and Docker](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Kubernetes_and_Docker) 
*  [Intercept Kubernetes service requests with Telepresence integration](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Intercept_Kubernetes_service_requests_with_Telepresence_integration) 
*  [Upload local Docker image to Minikube and other connections](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Upload_local_Docker_image_to_Minikube_and_other_connections) 
*  [Docker auto-connection at IDE restart](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Docker_auto-connection_at_IDE_restart) 
*  [Docker connection options for different docker daemons](https://blog.jetbrains.com/idea/2022/06/intellij-idea-2022-2-eap-5/#Docker_connection_options_for_different_docker_daemons) 

[GitHub copilot est disponible pour tous (les developpeurs)](https://github.blog/2022-06-21-github-copilot-is-generally-available-to-all-developers/)

* 40% du code écrit est généré par copilot en python (ca calme)
* gratuit pour les étudiants et les développeurs OSS
* Revue de Redmonk décrit copilot comme une extension d’intelligence ou auto complete mais qui « comprend » le code autour
* premiere fois pas une boite de cette taille et à cette échelle
* l’avantage de copilot en terme de productivité, de qualité de code, de sécurité et de légalité
* En gros, c’est encore à voir. Mais la qualité impressionne les gens qui l’ont testé ; sécurité pas de retour d’un côté ou de l’autre sauf que les développeurs humains ne sont pas des lumières de sécurité :D
* GitHub pense que GitHub n’est pas responsable de la violation de code vue que ce sont des machines et des algorithmes qui transforment: cela a l’air d’etre le consensus des avocats
* GitHub dit qu’on est responsable du code qu’on écrit avec copilot
* Et implicitement GitHub dit que la licensure du code « source » ne se propage pas au code generé. Et là, c’est pas clair et de la responsibilité de l’utilisateur, mais la encore les avocats sont plutot ok
* moralement c’est probablement pas ok mais bon et il y a débat autour des licenses copyleft notamment LGPL
* 1% du temps, code copié verbatim de > 150 caractères
* Question sur le code non open source sur lequel GitHub Copilot s’appuie
* mais en gros le marcher s’en fout un peu des licences
* Risque de reputation de Microsoft
* la question c’est quand / si les gens seront prêt à accepter cet usage

[Gradle publie sa roadmap](https://blog.gradle.org/roadmap-announcement)

* Historiquement, la société Gradle Inc ne publiait pas vraiment de roadmap officielle
* Outre les tickets que l’on pouvait voir dans Github, cette fois ci, une “roadmap board” est visible et disponible pour tout le monde, et pas seulement pour les clients

[Tekton est groovy (mais non, il n’utilise pas Groovy !)](https://blog.kywa.io/tekton-is-groovy/)

* Un grand tutoriel sur Tekton
* Une brève histoire de CI/CD (avec un contraste avec Groovy utilisé dans Jenkins)
* Un aperçu des grands concepts de Tekton, avec ses tâches et ses pipelines (Task, TaskRun, Pipeline, PipelineRun)
* Comment installer Tekton
* Les outils CLI
* Un exemple concret d’utilisation

[Sortie de Vim 9, surtout avec VimScript 9](https://www.vim.org/vim90.php)

* des changements incompatibles entre VimScript 8.2 et 9 font qu’il était nécessaire de passer à une version majeure
* mais l’ancienne version du langage reste supportée pour compatibilité
* avec la nouvelle, les utilisateurs peuvent s’attendre à des performances x10 voire x100 !
* le langage devient pré-compilé, au lieu d’être interprété ligne par ligne
* l’idée était d’avoir un langage plus proche de ce qu’on trouve dans JavaScript, TypeScript ou Java

## Conférences

De la part de Youen

Cette année Codeurs en Seine, c’est le 17 novembre et le [cfp est ouvert](https://cfp.codeursenseine.com/)  
N’hésitez pas à amener un peu de JVM dans l’appel à orateur. (ca commence à se faire rare).
Pour rappel : codeurs en seine c’est 1000 personnes autour des métiers du développement dans une des plus grande salle de Rouen, le kindarena.

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

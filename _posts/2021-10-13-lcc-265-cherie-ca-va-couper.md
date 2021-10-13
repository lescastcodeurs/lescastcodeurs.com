---
title: LCC 265 - Chérie, ça va couper
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Heritier, Audrey Neveu'
layout: blog-post
episode: 265
mp3_length: 45983373
tweet: Chérie, ça va couper. #oracle #springOne #facebook #twitch 
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans ce nouvel épisode news, Arnaud, Emmanuel et Audrey reviennent sur les annonces d'Oracle concernant le JDK, sur Spring One, mais aussi sur les petites fuites de données et autre panne généralisée qui ont fait l'actu récemment.

Enregistré le 8 octobre 2021

Téléchargement de l'épisode [LesCastCodeurs-Episode-265.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-265.mp3)

## News

### Langages

[Oracle annonce des LTS de deux ans](https://inside.java/2021/09/14/moving-the-jdk-to-a-2-year-lts-candence/) 

* Donc une LTS tous les 2 au lieu de 3 ans, ce qui fait que la prochaine sera la 21 et pas la 23.
* Une enquête récente auprès de développeurs montre qu'entre un quart et la moitié utilisent les release de six mois en dev, mais moins de la moitié d'entre eux en prod
* Mais pas de détail sur le temps de security patch support gratuit. Oracle en payant c’est 8 ans

[Oracle offre Oracle JDK gratuitement avec support pendant 1 LTS + 1 an (donc 3 ans)](https://blogs.oracle.com/java/post/free-java-license) 

* Java 17 et +
* Redistribution gratuite aussi. Pas de click through. 
* Sous license NFTC ("Oracle No-Fee Terms and Conditions").  
* Ils en ont marre d’avoir de la compétition ?

[Dans JDK 18, avec le JEP 400, le charset par défaut va enfin passer à UTF-8](https://inside.java/2021/10/04/the-default-charset-jep400/) 

* Autant ce n’était plus vraiment un problème pour les systèmes sour mac OS ou Linux, qui utilisent depuis assez longtemps UTF-8 par défaut, mais c’est surtout pour les systèmes Windows où c’est plus problématique
* Dans JDK 17, la propriété système `System.getProperty("native.encoding")` avait été introduite si on veut lire par exemple un fichier avec
* Deux approches de mitigation pour les problèmes de compatibilité, 
  * en recompilant et en utilisant cette propriété quand on ouvre un fichier
  * en utilisant -Dfile.encoding=COMPAT sans recompilation, qui gardera le même comportement qu’en JDK 17 et avant
* L’équipe d’Oracle suggère de tester ses applications avec -Dfile.encoding=UTF-8 pour voir s’il n’y a pas de soucis 

### Librairies

[JUnit 5.8](https://junit.org/junit5/docs/current/release-notes/index.html#release-notes-5.8.0)  

* les classes de test peuvent être ordonnées avec la Class Order API (par nom de classe, nom d'affichage, avec @order ou random)
* les classes de test imbriquées peuvent l'être avec @TestClassOrder
* @ExtendWith peut maintenant être utilisé pour enregistrer des extensions via des champs ou des paramètres de méthode (constructeur, méthodes de test ou lifecycle)
* @RegisterExtension peut maintenant être utilisé sur des champs privés.
* `assertThrowsExactly` version plus stricte de assertThrows()
* `assertDoesNotThrow()` supporte les suspending functions Kotlin
* `assertInstanceOf` produit de meilleurs messages d'erreurs (remplacement pour `assertTrue(obj instanceof X)`)
* `assertNull` comporte maintenant le type de l'object si sa méthode `toString` retourne null pour éviter les messages de type `expected <null> but was <null>`
* @TempDir 
    * peut maintenant être utilisé pour créer plusieurs répertoires temporaires (le retour au mode par context peut être fait par configuration)
    * fait un reset des permissions read and write du répetertoire root et de tout les répertoires contenus plutôt que d'échouer à les supprimer
    * peut maintenant être utilisé sur des champs private
* Nouvel UniqueIdTrackingListener qui va générer un fichier contenant les identifiants des test executés et qui peut être utilisé pour re-executer ces tests dans une image GraalVM par exemple.

[Stephen Colebourne avertit les utilisateurs de Joda Time de ne pas mettre à jour la base de données des fuseaux horaires](https://blog.joda.org/2021/09/big-problems-at-timezone-database.html) 

* Les personnes qui sont responsables de cette base de données veulent fusionner certaines zones ensemble, par exemple, Oslo et Berlin. Alors que ces deux villes (et d’autres) n’ont pas forcément toujours eu la même heure
* La base est censée référencer tous les changements depuis 1970
* mais en fusionnant plusieurs zones, le risque est de perdre l'historique pré-1970

Recap Spring.io : 

* [Récap Jour 1](https://tanzu.vmware.com/content/blog/springone-2021-day-1-recap-and-highlights) 
* [Récap Jour 2](https://tanzu.vmware.com/content/blog/springone-2021-day-2-recap-and-highlights) 
* [Récap en vidéo par Josh Long](https://www.youtube.com/watch?v=VMtUzytjo6Y) 
* [State of Spring 2021](https://www.youtube.com/watch?v=O0-IhAKnkWM) 
    * les chiffres:  
        * 61% des sondés utilisent spring boot
        * 94% d'entre eux pour faire des micro services
        * 35% sur des architectures reactive
        * 61% voudraient passer sur du natif d'ici 2 ans
    * Nouvelle baseline pour Spring Framework 6.0 
        * Java 17 et Jakarta EE 9 dès la 6.0 M1 de Spring Framework qui arrive Q4 2021 (GA en Q4 2022)
    * Spring Native arrive dans Spring Framework
        * Compilation AOT bénéficiera aux déploiements JVM aussi
        * Spring Boot starter pour applications natives
        * Spring Boot proposera des plugin de build et configuration native dès la 3.0
    * Support de RSocket and GraphQL
    * Spring Observability passe dans Spring Framework
        * API unifiée pour les metrics et le tracing, compatible Micrometer, Wavefront, Zipkin, Brave et OpenTelemetry
        * intégration consistante dans tout le portfolio
        * auto configuration dans Spring Boot 3.0
        * Core abstractions dans Spring Framework 6.0
* [Spring Native](https://springone.io/2021/sessions/spring-native)
* [De Spring framework 5.3 à 6.0](https://springone.io/2021/sessions/from-spring-framework-5-3-to-6-0)

### Infrastructure

(suite annonces Spring.io)
[Tanzu Application Platform](https://tanzu.vmware.com/content/blog/announcing-vmware-tanzu-application-platform) : 

* plateforme livrée avec toute la chaine d'outils mais configurable si les équipes préfèrent utiliser d'autres outils que ceux proposés  
* compatible AKS, EKS, GKS et TKG.
* application accelerator (inspiré par spring initializer) pour générer les templates des applications qui seront ensuite déployées
* Spring Cloud Gateway for K8s and API Portal for VMware Tanzu 

[Tanzu Community Edition](https://tanzu.vmware.com/content/blog/vmware-tanzu-community-edition-announcement) : 

  * Version OSS de Tanzu

### Cloud

[Azure installe des agents dans son image linux et ils sont vulnérables aux auto update](https://www.wiz.io/blog/secret-agent-exposes-azure-customers-to-unauthorized-code-execution)  

* Lié à OMI (open management infrastructure, l'équivalent de  Windows Management Infrastructure (WMI) pour les systèmes UNIX qui s'exécute en root avec tous les privilèges
* Dès qu’on utilise des services comme azure log, ils l’installent dans les VMs
* L’article dit que c’est la faute à l’open source et que seulement 20 contributeurs. C’est un peu BS.
* En fait si c’est installé via un service le service le mettra à jour
* Mais MS recommande de mettre à jour manuellement aussi

### Web

[Julia Evans nous explique CORS](https://twitter.com/b0rk/status/1445039796804542473) 

* Julia explique comment se comporte le navigateur qui voit qu’on essaie d’accéder à une URL différente de celle du domaine de la page web chargée, et le navigateur se demande s’il a le droit de charger cette page
* Il va faire un “preflight” request (avec une méthode HTTP OPTIONS) pour savoir s’il a le droit ou non, puis si c’est le cas, pourra accéder à la resource
* Julia explique la same-origin policy (càd qu’on ne doit accéder que des resources du domaine qu’on est en train de visiter dans son navigateur)

### Data

[Kafka 3.0](https://blogs.apache.org/kafka/)

* Le support Java 8 et Scala 2.12 est déprécié et sera retiré en version 4
* Nouvelles améliorations sur KRaft, le méchanisme de consensus qui remplacera à terme ZooKeeper

### Outillage

[TravisCI fait un petit partage de vos secrets dans toutes les PRs de vos repos par accident](https://arstechnica.com/information-technology/2021/09/travis-ci-flaw-exposed-secrets-for-thousands-of-open-source-projects/) 

* le problème a duré 8 jours
* rotation des secrets recommandé
* Travis a patché discretement sans disclosure initialement ce qui a fait un raffut

### Architecture

[Facebook est tombé pendant environ 6H ](https://engineering.fb.com/2021/10/05/networking-traffic/outage-details/) 

* Facebook prévoit de faire une maintenance sur son backbone (classique)
* Un ingénieur lance par erreur une commande qui declare l’ensemble du backbone inaccessible
* Oups, le système d’audit qui devrait empêcher de lancer une telle commande est buggé, la commande passe ...
* Toute l’infra de Facebook est désormais déconnectée du net. Les avertissements BGP sont stoppées puisque l’infra FaceBook n’est plus dispo et les DNS déprovisionnent les entrées FaceBook, le monde ne peut plus accéder à FaceBook
* Les ingé comprennent vite le problème sauf que ils ont perdus les accès remotes aux services et la plupart de leurs systèmes internes sont KO à cause du retrait des DNS
* Ils envoient donc du personnel sur site dans les datacenters pour physiquement remettre en service l’infra mais l’accès physique aux machines est super protégé
* Ils finissent par y arriver SAUF que le fait de tout redémarrer pause un vrai challenge du fait de l’affluence du traffic qui reprend. Ils risquent de refaire tomber les datacenters du fait de la surcharge électrique. (sans parler de sproblèmes plus haut niveau comme le rechargement des caches etc)
* Heureusement ils ont un plan de reprise qu’ils testent régulièrement qui est plutôt prévu dans le cadre d’une tempête qui mettrait HS tout ou partie du réseau. Ce système marche bien et tout rentre dans l’ordre petit à petit, Facebook est sauvé, la planète a reperdu 5 points de QI
* [Julia Evans explore BGP et son fonctionnement dans cet article](https://jvns.ca/blog/2021/10/05/tools-to-look-at-bgp-routes/)
* [Vu de dehors avec Cloudflare](https://blog.cloudflare.com/october-2021-facebook-outage/) 
* Impact non seulement du DNS mais des routes BGP elles même. Ces routes disent qu'une IP (our série d’IP) appartient à une personne donnee. 
    * Fondamentalement modèle de confiance.
    * Intéressant de voir comment Facebook DNS down ajouté beaucoup de traffic aux serveurs de DNS principaux qui ne cachent pas le SERVFAIL

### Sécurité

[Fuite massive de données chez Twitch](https://cyberguerre.numerama.com/13464-fuite-sur-twitch-revenus-de-streameurs-4-questions-sur-le-leak-colossal-qui-frapperait-la-plateforme.html)  

* Quoi ?
  * l'intégralité du code source
  * Les revenus (sur 3 ans) de plus de 10 000 streamers Twitch ont été publiés sur le net. 
  * certains codes d'accès AWS
  * attention c'est la partie 1, il pourrait y avoir d'autres données prochainement
* Comment ? 
  * Officiellement suite à une erreur dans un changement de config
  * Officieusement c'est plus probablement un employé ou un ex employé
* Pourquoi ?
  * le message sur 4chan dénonce un « un cloaque toxique dégoûtant », ce qui pourrait faire référence aux problèmes de harcèlements et de raids hostiles visant des streameurs et des streameuses en raison de leur origine ethnique, de leur orientation sexuelle ou genre. 
  * il est aussi question d'une revendication à une concurrence plus saine dans le secteur du streaming de jeu vidéo

## Conférences

[DevFest Nantes les 21 et 22 octobre 2021](https://devfest.gdgnantes.com/)  
[DevFest Lille le 19 novembre 2021](https://devfest.gdglille.org/)  
[SunnyTech les 30 juin et 1er juillet 2022 à Montpellier](https://sunny-tech.io/)  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

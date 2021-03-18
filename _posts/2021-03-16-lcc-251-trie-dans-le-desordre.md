---
title: LCC 251 - Trié dans le désordre
author: 'Emmanuel Bernard'
layout: blog-post
episode: 251
mp3_length: 52407644
tweet: Trié dans le désordre #java #kubernetes #ovh #SpringNative #Saga #OSS
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode désordonné mais complet, Antonio, Guillaume et Emmanuel parlent de JVM sur Kubernetes, des datacenters OVH, de Spring Native, de Flutter, de Saga, d'Open Source et de salaire.

Enregistré le 12 mars 2021

Téléchargement de l'épisode [LesCastCodeurs-Episode-251.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-251.mp3)

## News

### Infrastructure

[Un data center d'OVH en feu](https://www.phonandroid.com/ovh-un-incendie-detruit-completement-le-data-center-des-services-impactes.html)  

* Strasbourg
* data center entièrement détruit
* recommande d'activer les protocoles de disaster recovery
* impacte aussi d'autres data centers : SBG1, SBG3 et SBG4 (électricité coupée et une partie des salles serveurs)
* [Autre article couvrant l'évènement](https://www.journaldunet.com/web-tech/cloud/1498567-incendie-chez-ovh-3-6-millions-de-sites-web-hors-ligne/)
* 3,5 millions de sites down, les backups aussi?
* 18% des adresses IP attribuées à OVH
* redémarrage (sauf SBG2) la semaine prochaine
* touche la partie hosted private cloud
* quelques jours avant annonce de mise en bourse

[Améliorer le temps de démarrage des JVMs sur Kubernetes](https://tech.olx.com/improving-jvm-warm-up-on-kubernetes-1b27dd8ecd58)

* JIT etc, temps de démarrage relativement lent
* rajouter des pods et faire deu deployment graduel (3x coût)
* script de chauffe avec le readiness probe utilisant initialDelaySeconds  mais pas d’amelioration massive (rejoue les URLs de prod) et ralentit l’auto scaling
* changer les heuristiques de la JVM : 2x CPU request et limit  puis 3x => problème disparait, CPU throttling ; mais coûteux et plus difficile de positionner les pods
* utiliser des pods “burstable”, limit > requests
* Bon articles pour ceux qui sont en phase d’apprentissage de Jave et Kubernetes.
* Attention, leur modèle peut faire crasher un nœud en cas de problème et de reboot de pods excessifs puisque la charge théorique nécessaire est de 3x. Mais ce n’est probablement pas pire que leur problème initial

### Front

[Sortie de Flutter 2.0](https://developers.googleblog.com/2021/03/announcing-flutter-2.html)

* [poste plus technique](https://medium.com/flutter/whats-new-in-flutter-2-0-fe8e95ecc65)
* niveau production pour le support du Web
* Sound Null Safety qui permet d’éviter les null pointer exception
* le support du desktop est aussi en mode stable
* de nouvelles widgets
* Meilleur support dans IntelliJ et Visual Studio Code
* Filio une app exemple pour être progressive et belle sur tous les supports
* Flutter fix pour faire évoluer le code
* "500,000 Flutter developers across a growing number of platforms" wow

### Librairies

[Hibernate Reactive 1.0 CR arrive](https://in.relation.to/2021/03/08/hibernate-reactive-1/)  

[Spring Native est en beta](https://spring.io/blog/2021/03/11/announcing-spring-native-beta)  

[Micronaut 2.4](https://micronaut.io/blog/2021-03-09-micronaut-2-4-release.html) est sorti

* Ajout et support des annotations jakarta.inject comme alternative à javax.inject
* Ajout d'annotations @NonNull et @Nullable propres à Micronaut, car différents outils et frameworks proposent aussi des annotations nullables qui rentrent parfois en conflit les unes avec les autres
* Nouvelle annotation @InterceptorBean pour appliquer des interceptors à des beans, qui remplacent les annotations AOP existantes
* Support plus fin des erreurs de réponse, avec des content type plus fins
* Diverses améliorations de Micronaut Data, dont par exemple le support des records de Java 14+
* Support de Oracle Coherence CE pour Micronaut Data

### Outillage

[Gradle explique l’impact de la disparition de JCenter sur les builds Gradle](https://blog.gradle.org/jcenter-shutdown)

* téléchargement des dépendances et des plugins
* publications vers bintray
* beaucoup d'exemples utilisent jcenter + Gradle, donc verifier vos fichiers de build => `jcenter()` déprécié
* reco: enlever jcentral du build et verifier que ca continue de tourner
    * troubleshoot les dépendances qui ne sont que sur jcentral
* spécialement à risque Android
* Gradle Entreprise dans le build scan on sait d'où vient chaque dépendance 
* les plugins peuvent ajouter des repository à vos projets
* dépendance encore sur jcenter uniquement (attendre le maintainer, migrer vers une autre librairie, copier le jar
* attention aux confusions de dépendances et collisions de namespace
    * risque potentiel
    * activation de verification des dépendances (`<verify-metadata>true</verify-metadata> <verify-signatures>false</verify-signatures>`)

### Architecture

[InfoQ article sur le pattern Saga, le outbox pattern et change data capture](https://www.infoq.com/articles/saga-orchestration-outbox/)

* outbox pattern, évite l’écriture double DB/queue. Il écoute les changements de la base de donnée dans une table dédiée qui est transformée en message dans une queue apr le composant de change data capture (modifié) 
* cela évite tout besoin de XA ou autre synchronisation distribuée
* Saga, transaction métier large. utilise des compensations pour annuler partiellement ou totalement la transaction
* 2 approches
* choreography: passage des messages d’un service a l’autre
* 2. orchestration: un service coordonne les autres et fait les appels
* dual write: inconsistance si un ou l’autre des envois (DB tx ou message) échoue
* Article ensuite décrit comment implementer une saga entre 4 services via the outbox pattern en utilisant Kafka et Debezium

[Thoth un framework event sourcing de la Maif](https://maif.github.io/thoth/)  

### Méthodologies

[L’état des lieux du Dev Java par JAXenter](https://jaxenter.com/java-development-2021-173870.html)

* 49% de Dev java et le reste team lead architect et consultants
* 69% Java 8, JavaScript at 40%, Java 11 at 36% (note that they were allowed to select more than one programming language of choice). 16% Java 12 or newer, and 15% Java 7 or older.
* 66% convertissent ou utilisent microservices , 13% ne l’envisagent pas, 70% moins de 10 microservices
* App servers 66% tomcat, 19% wildfly, 18% weblogic, 15% jetty, 14% web sphere
* Spring boot 62% (83% l’année dernière), drop wizard 8%, Quarkus 6%
* Idea 65%, eclipse 48%, vscode 27%, Netbeans 13%
* 59% oracle JDK, 22% adopt et 10% corretto
* Maven 67% (50% l’année dernière)
* Docker 57% (74% en 2020), kube 42%, VMware 27%
* Jenkins 61%
* 76% utilisent un cloud
* AWS 39%, azure 24%, Google 18%
* Douleurs de Dev
* 54% temps de réponse
* Redeployment 59% 4 mins, 20% 10 mins

[D3.js 10 ans d’open source ; les leçons apprises](https://observablehq.com/@mbostock/10-years-of-open-source-visualization)

* apprendre aux autres >> code en terme d’impact ; exemples sont puissants (modifié) 
* Le support expose les problèmes de l’outil très rapidement pour apprendre les choses a améliorer. Mais dès que cela arrête d’être constructif pour vous, arrêter et ne vous sentez pas mal.
* visualisation utile pour l’exploration et l’explication mais ce sont deux cas d’utilisation différents
* ne commiter pas sur une forme de visualisation (camemberts, barres etc) avant d’avoir vu votre data dessus.
* 90% des bugs sur 10% des fonctionnalités: choisissez bien vos batailles
* Internet va vous faire sentir mal
* ne pas y aller seul
* Essayer d’avoir du bon temps

[Salaire égal pour tous dans la société](https://oxide.computer/blog/compensation-as-a-reflection-of-values/)

* 175k pour tous y compris les fondateurs
* Évite d’avoir à quantifier la performance de chacun
* Et le Risque incentivization individuelle != team (modifié) 
* Transparence du modèle
* Plus bas salaire pour certains si ils travaillaient ailleurs mais c’est une valeur qui permet de vivre correctement avec enfants (jugé et testé par les fondateurs)
* Paie basée sur le travail et non les coûts de l’employé -> pas de différence géographique
* Scale probablement pas mais une start up peut se le permettre (ils ne prennent pas de junior pour l'instant
* Carrière != compensation par rewards
* Mais pour les parts dans la boîte ils le font en fonction du risque du premier risque au dernier pas risque

### Loi, société et organisation

[Un autre renvoie d’une personne du groupe ethic AI chez google après qu’elle ait téléchargé avec un script des infos concernant la première employée renvoyée](https://www.cnbc.com/2021/01/21/margaret-mitchell-google-investigating-ai-researcher-awu-concerned.html)

* Elle a exfiltré des milliers de docs vers des comptes externes
* Met en doute le commitment du ethical ai chez Google
* Mais comment répondre à une personne ex filtrant des docs privés ?
* [Mitchell qui annonce qu'elle est virée](https://twitter.com/mmitchell_ai/status/1362885356127801345?s=21)
* Éthique vs lanceur d’alerte ?

## Conférences

[Mix-It (virtuel) les 18, 19 et 20 mai 2021](https://mixitconf.org/fr/)  

* 10 talks de 30 mn + 20mn de Q&A + 10 mn de pause 

[https://www.devoxx.fr/2021/02/25/preparation-du-programme-de-ledition-2021/](https://www.devoxx.fr/2021/02/25/preparation-du-programme-de-ledition-2021/)

* reprend une partie du CfP de l’année dernière.

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

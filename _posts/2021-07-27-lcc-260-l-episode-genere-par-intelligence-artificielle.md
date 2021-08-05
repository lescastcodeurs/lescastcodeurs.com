---
title: LCC 260 - L'épisode généré par intelligence artificielle
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 260
mp3_length: 50316360
tweet: L'épisode généré par intelligence artificielle #copilot #jvm
# tweet size: 91-93 -> 99-101 #######################################################################
---
Antonio, Guillaume et Emmanuel discutent de pleins de choses dont des analyses de l'écosystème de la JVM, de la generation de code via intelligence Artificielle avec CoPilot, mais pas que.

Enregistré le 16 juillet 2021

Téléchargement de l'épisode [LesCastCodeurs-Episode-260.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-260.mp3)

## News

### Langages

[Les prédictions d'Adam Bien pour la seconde moitié de 2021](https://adambien.blog/roller/abien/entry/mid_year_2021_observations_and)

* Kube a gagné la guerre. Les cloud providers fournissent des solutions dérivées plus simplifiées. La compatibilité kubernetes devient moins cruciale
* FaaS est utilisé pour son usage listener et point d'intégration et plus en général purpose tool
* Prix du cloud et repatriation. Bouger une app existante dans le cloud n’amène pas d’avantage. Le monolith devient une best practice
* Coût du cloud pousse a merger des microservices dans un cadre de cloud cost driven development
* Cloud deviennent intéressant pour les services uniques (text to speech, image recognition, etc). En parallèle la sécurité des cloud providers est reconnu. Donc boring load on prem, projects innovants dans le cloud. 
* Serverless va être le trend de 2021 (fonction mais aussi db, workflow, event streams etc) idée est scale down to zero
* La montée des frameworks next gen Micronaut et Quarkus est indisputable. Build time deployment.
* La popularité de quarkus a explosé, difficile de trouver un développeur Java qui n’a pas expérimenté. Le cocktail GraalVM, API familières Jakarta EE et MicroProfile, sa do so mémoire et temps de démarrage lui donne un avantage. Mais la compétition ne dort pas (Helidon et micronaut)
* Moins de langages alternatifs parce que l’innovation dans Java a accéléré
* Lombok moins populaire parce que Java Records.
* Kafka sera plus un data store immuable et source de vérité qu’un remplacement pour JMS
* Kafka et réactive en combo va rendre la programmation réactive populaire
* Le projet Loom éliminera la programmation reactive pour les resources non-reactives
* ARM sur le serveur
* GraalVM pour remplacer OpenJDK car rapide et multi langage. Et competitor a GraalVM qui arrive
* Visual studio code et ses features pour Java  pas forcément connu et donc va croître encore.
* Payara cloud serverless server ou l’app server est un opérateur Kube et on déploie un thin jar.

[GraalVM offre des plugins Gradle et Maven pour la compilation native](https://medium.com/graalvm/gradle-and-maven-plugins-for-native-image-with-initial-junit-testing-support-dde00a8caf0b)

* Tester les libraires en natif avec les tests JUnit 5 qui tournent en natif
* Après tourne les tests en JVM, ils sont loggués et ajoutés en réflexion et compilation native.
* Et un binaire de test est créé
* plugin Gradle
* License Oracle Universal Permissive
    * probablement un dérivé de [Universal Permissive License](https://opensource.org/licenses/UPL)

[Le rapport sur l’écosystème JVM](https://snyk.io/jvm-ecosystem-report-2021) par Snyk

* Sondage effectué durant six semaines (entre février et mars 2021) au prêt de 2000 développeurs et comparé à GitHub et Google Trends
* Mon (Emmanuel) intuition c'est qu'il y un biais dans les gens mesurés
* 44 % des Dev Java utilisent AdoptOpenJDK en prod. Oracle OpenJDK 28 et Oracle JDK 23 %
* 60 % utilisent Java 11 en prod, et 12 % la dernière. Mais encore 60 % de 8 en prod
* Java 91 %, kotlin 18 %, Groovy 13 % et Scala 10 
* IntelliJ IDEA 70 %, Eclipse 25 %, et VSCode 23 %. 50 % sont bi-IDE
* Maven 76 %, Gradle 38 %, Ant 12 % yah
* Spring Boot 58 %, Spring MVC 29 %, Jakarta EE 13 % et Quarkus 11 %

[JDK 17 en ramp down phase 2](https://mail.openjdk.java.net/pipermail/jdk-dev/2021-March/005266.html)

Schedule :

* 2021/07/15 Rampdown Phase Two
* 2021/08/05  Initial Release Candidate
* 2021/08/19 Final Release Candidate
* 2021/09/14  General Availability

Features integrated in JDK 17:

* [JEP 306: Restore Always-Strict Floating-Point Semantics](https://openjdk.java.net/jeps/306)
* [JEP 356: Enhanced Pseudo-Random Number Generators](https://openjdk.java.net/jeps/356)
* [JEP 382: New macOS Rendering Pipeline](https://openjdk.java.net/jeps/382)
* [JEP 391: macOS/AArch64 Port](https://openjdk.java.net/jeps/391)
* [JEP 398: Deprecate the Applet API for Removal](https://openjdk.java.net/jeps/398)
* [JEP 403: Strongly Encapsulate JDK Internals](https://openjdk.java.net/jeps/403) (sauf pour `sun.misc.Unsafe`)
* [JEP 406: Pattern Matching for switch (Preview)](https://openjdk.java.net/jeps/406)
* [JEP 407: Remove RMI Activation ](https://openjdk.java.net/jeps/407)
* [JEP 409: Sealed Classes ](https://openjdk.java.net/jeps/409)
* [JEP 410: Remove the Experimental AOT and JIT Compiler](https://openjdk.java.net/jeps/410)
* [JEP 411: Deprecate the Security Manager for Removal](https://openjdk.java.net/jeps/411)
* [JEP 412: Foreign Function & Memory API (Incubator)](https://openjdk.java.net/jeps/412)
* [JEP 414: Vector API (Second Incubator)](https://openjdk.java.net/jeps/414)
* [JEP 415: Context-Specific Deserialization Filters](https://openjdk.java.net/jeps/415) 

### Librairies

[Spring Native 0.10.0](https://spring.io/blog/2021/06/14/spring-native-0-10-0-available-now)

* Utilise Native testing de GraalVM
* Passe au plugin Gradle de l'équipe GraalVM
* Ahead of time proxies pour les classes

[Quarkus 2.0 est sorti](https://quarkus.io/blog/quarkus-2-0-0-final-released/)

* Guide de migration mais les applis devraient essentiellement fonctionner (extensions ont plus de taf)
* JDK 11+ GraalVM 21.1
* Vert.x 4
* Microprofile 4
* Continuous testing : les tests impactes tournent automatiquement en Dev mode. Les tests qui cassent sur un changement sont visibles tout de suite et en continu. Comme infinitest mais sans plugin IDE.
* Quarkus a une CLI pour simplifier l’interaction vs les plugins Maven ou Gradle. Notamment création de projets.
* JDK 11+ GraalVM 21.1
* Vert.x 4
* Microprofile 4
* GraphQL client (smallrye), CDI decorators supportés, transaction pour MongoDB avec Panache,
* Support kotlin grandement amélioré : resteasy reactive, rest client, reactive messaging extensions supportent tous les coroutines
* Support d’Amazon services system manager

[Crafting rolling releases for a Quarkus CLI application](https://andresalmiray.com/crafting-rolling-releases-for-a-quarkus-cli-application/)

* Y’a encore du chemin pour faire simplement des CLI avec graalVM en comparaison de go
* [JReleaser](https://jreleaser.org) outils permettant de livrer automatiquement des projets Java vers différentes plateformes (Homebrew, Snapcraft, Scoop)
* Inspiré de GoReleaser et jbang
* Le blog package l'outil `kcctl` créé par Gunnar avec JReleaser
* Pas mal de conf (Windows vs Linux/MacOS) mais à la fin il y arrive


### Infrastructure

[Amazon sort son OpenSearch 1.0 et OpenSearch Dashboard, leur fork d’Elastic Search et Kibana](https://opensearch.org/blog/updates/2021/07/opensearch-general-availability-announcement/)

* 1.0 sortie de [OpenSearch](https://opensearch.org) ([GitHub](https://github.com/opensearch-project))
* Suppression du code propriétaire
* Upgrading: mise a jour d'ElasticSearch et Kibana vers OpenSearch et OpenSearch Dashboard aussi simple qu'une mise a jour de version
* Compatibility : travaux de reflexion autour de la compatibilité avec les outils existants
* Testing: infrastructure de test moderne et flexible
* Supporte les architectures Linux ARM64
* Minimal artifacts for embedding of OpenSearch and OpenSearch Dashboards into existing products and services,
* Data stream support for OpenSearch Dashboards,
* Span attribute visibility and filtering in the Trace Analytics plugin,
* Scheduling and tenant support in the Reporting plugin.
* Aussi mentionne la roadmap

[Kubernetes 1.22 enlève le support des vieilles versions de ressource](https://kubernetes.io/blog/2021/07/14/upcoming-changes-in-kubernetes-1-22/#api-changes)

* Faites le ménage en continu pas des grosses migrations tous les 3 ans
* Release prévue en aout
* Ils vont supprimer des API qui étaient en beta

### Cloud

[Un tweet lance un faux service AWS InfiniDash qui a été repris par des devs et des boîtes](https://siliconangle.com/2021/07/05/fake-amazon-cloud-service-aws-infinidash-quickly-goes-viral/)

* La théorie est que la plupart des devs n’entendront parler de technologie que via les tweets et les articles.
* Aussi le métier de DevRel c’est de surfer la vague du social media. Les DevRels AWS ont continué la farce (je crois)
* Werner Vogels, oui pour sûr.
* gros effet boule de neige

### Outillage

[GitHub copilot](https://copilot.github.com/)

* IntelliSense boosté par les projets visible et hostés dans GitHub et autre données publiques
* via l'intelligence artificielle, essaie de comprendre l'intention via le contexte
    * uniquement le fichier édité en contexte pour l'instant
* VSCode extension donc tourne partout où les plugins VSCode tournent
* 0,1 % de copie exacte
* le code nous appartient en tant qu'utilisateur
* le code contexte est transmis a GitHub qui l'utilise pour ses télémétries et améliorer les modèles ML
* pas toujours du code de qualité
* [des secrets valides sont générés](https://twitter.com/alexjc/status/1411966249437995010) (du corpus original e.g. SendGrid)
* [propose du code GPL (derivation?)](https://drewdevault.com/2021/07/04/Is-GitHub-a-derivative-work.html)
* attaque de sécurité vont venir :)

[Audacity 3 spyware ou pas après le rachat](https://arstechnica.com/gadgets/2021/07/no-open-source-audacity-audio-editor-is-not-spyware/)

* la communauté "niveau 2" s'est emballée, a créé une dizaine de forks.
* C’était déjà annoncé et discuté avec la communauté Audacity.
* OS, pays, CPU, erreurs, rapports de crash
* Protection légale « law enforcement ». Les 13 ans, juste pour éviter des restrictions légales US
* 3.0.2 n’a pas le code des collections de données 
* Avec feedback initial passe de Google Analytics à un hébergement propre.
* Quand compile le project c’est off par défaut (donc seuls les binaires distribués l’ont par défaut) donc pas dans les distros linux

### Sécurité

[LinkedIn la brèche qui donne des infos de 92% de ses utilisateurs y compris les salaires inférés](https://9to5mac.com/2021/06/29/linkedin-breach/amp/?__twitter_impression=true)

* API LinkedIn abusée.
* Email, noms, telephone et adresse physique de 700M d'utilisateurs
* Presque intéressé de fouiller pour voir mon salaire théorique :)
* Dispo sur le dark web

### Loi, société et organisation

[Lettre à ceux qui veulent faire tourner la France sur l’ordinateur de quelqu’un d’autre](https://www.codeforfrance.fr/publications) par [Tariq Krim](https://twitter.com/tariqkrim)

* [Télécharger l'ebook au format PDF](https://www.codeforfrance.fr/assets/ebook/cloud_14Juillet2021.pdf). Très documenté et référencé
* Coulisses et manoeuvres pour installer les GAFAM au coeur de l’État
* 17 mai 2021, Bercy présente la nouvelle stratégie Cloud du Gouvernement
* GAM (Google Amazon Microsoft)
* À part OVH Cloud, aucun des acteurs français n’a été mentionné par les Ministres
* Les lois américaines dites FISA et Cloud Act permettent d’obliger les grandes sociétés US à fournir à la justice américaine les données situées sur leurs serveurs européens
* Si l’on met de côté les questions de souveraineté, les services de sociétés comme Amazon, Microsoft et Google sont très ergonomiques
* Les Américains offrent des services clé en main, les services “made in France” demandent de combiner plusieurs produits issus de sociétés différentes
* Apple, Google, Facebook, Amazon ont embauché des dizaines de milliers d’ingénieurs, dont de très talentueux Français
* Les clouds GAM pourraient décrocher le label SecNum Cloud (le plus haut niveau de sécurisation de l’État)
* Après avoir délocalisé notre industrie (le fameux “Fabless” de Serge Tchuruk ancien patron d’Alcatel), l’État et les grandes entreprises ont délocalisé leur informatique vers les grandes SSII qui se sont mises à produire des projets à la chaîne

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

---
title: LCC 254 - Fission acquisition
author: 'Emmanuel Bernard'
layout: blog-post
episode: 254
mp3_length: 57828811
tweet: TODO
# tweet size: 91-93 -> 99-101 #######################################################################
---
Arnaud et Emmanuel discutent la sortie de Java 16, diverses distributions d'OpenJDK, des outils comme JHipster, JReleaser, la décision de la court suprême dans le procès des API Java entre Google et Oracle et le refactoring de Michael Dell avec la cession de VMWare.

Enregistré le 16 avril 2021

Téléchargement de l'épisode [LesCastCodeurs-Episode-254.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-254.mp3)

## News

### Langages

[Java 16 est sorti](https://mail.openjdk.java.net/pipermail/announce/2021-March/000295.html)  

* [La version longue des release notes](https://builds.shipilev.net/backports-monitor/release-notes-16.txt)  
* [Les fonctionnalités préférées des Java Champion](https://blogs.oracle.com/javamagazine/java-champion-favorite-java16-records-vector-arm64-github?source=:em:nw:mt::::RC_WWMK200429P00043:NSL400139911&elq_mid=187945&sh=162609181316181313222609291604350235&cmid=WWMK200429P00043C0022)  
* [Lombok en conflit avec openJDK sur --add-open](https://github.com/rzwitserloot/lombok/issues/2681)  

[La plateforme Java moderne de 2021, selon James Ward](https://jamesward.com/2021/03/16/the-modern-java-platform-2021-edition/)  

* James parle de Java la plateforme, donc y compris ses langages alternatifs, en particulier Kotlin et Scala dont il est fan
* Java a l’avantage d’avoir un outillage moderne, aussi bien niveau IDE (Intellij, VS code...) que des librairies de tests (Java, Testcontainers...)
* Pour les frameworks les plus utilisés, évidemment Spring vient en tête, mais il mentionne aussi Micronaut (avec l’injection de dépendance à la compilation) et Quarkus (avec son focus sur l’expérience développeur)
* James fait la part belle à l’approche “reactive”, en mentionnant par exemple les drivers de base de données R2DBC
* Pour continuer sur le thème réactif, il mentionne aussi le reactive streaming (au dessus de Kafka par exemple), mais il parle aussi de CQRS et Event Sourcing, mais aussi les CRDTs
* Niveau containeurisation, il cite les initiatives comme Jib, les cloud native Buildpacks, ou les images Distroless, pour faciliter et simplifier le packaging d’applis Java pour les environnements à base de conteneurs
* Côté “serverless”, James évoque GraalVM, pour transformer les applis Java en native, pour gagner en temps de premier chargement (le cold start, fréquent dans les environnements serverless)
* (Il aurait pu mentionner les approches comme Micronaut avec l’injection de dépendance à la compilation qui éviter une bonne partie du coût de démarrage du framework sous-jacent et diminue donc le cold start)

[53 librairies Java pour résoudre vos problèmes](https://emmanuelbernard.com/blog/2021/03/16/53-java-libraries/)  

* Max Andersen avait demandé sur Twitter de donner des librairies Java utiles et pratiques qui résolvaient des problèmes concrets, Emmanuel a compilé la liste
* avec des librairies pour parser / générer du code Java, des structures de données, de conversion de format, pour parser des formats de données, pour le web aussi bien en tant que serveur que pour faire des requêtes, pour les tests de toutes sortes

[La migration d'AdoptOpenJDK vers Eclipse Adoptium a commencé](https://blog.adoptium.net/2021/03/eclipse-adoptium-announcement/)  

[Microsoft annonce sa distribution d'AdoptOpenJDK](https://devblogs.microsoft.com/java/announcing-preview-of-microsoft-build-of-openjdk/)  

* LTS gratuite et "sans coût"
* Support au sens patch jusqu’en 2024 de 11
* Utilisent en interne pour leurs clients et pour eux
* Ont aussi une version java 16 arm en preview
* utilise les tests adoptium
* ça peut devier de OpenDJK en terme de patchs
* Eclipse Adoptium pour Java 8
* docker image bientot
* Azuul vient de perdre un client

### Librairies

[Spring-Boot client app to access an Auth0 protected service (JWT)](https://www.aheritier.net/spring-boot-app-client-of-an-auth0-protected-service-jwt/).  
[JHipster release v7.0.0](https://www.jhipster.tech/2021/03/21/jhipster-release-7.0.0.html)  

### Outils

Andrés Almiray annonce la release de... [JReleaser](https://andresalmiray.com/jreleaser-says-hello/), un projet qui permet de facilement livrer un projet Java sur des plateformes comme Homebrew, Snapcraft, Scoop, ou des registries de conteneurs.

### Cloud

[AWS announce OpenSearch, une communauté qui forke ElasticSearch et Kibana](https://aws.amazon.com/fr/blogs/opensource/introducing-opensearch/)  

* OpenSearch (derived from Elasticsearch 7.10.2) and OpenSearch Dashboards (derived from Kibana 7.10.2)
* ASL 2.0
* marque OpenSearch avec usage permissif
* Amazon OpenSearch Service
* Red Hat, SAP, Capital One, and Logz.io 
* reutilise la marque OpenSearch [que Amazon avait avant pour autre chose](https://github.com/dewitt/opensearch)

### Infrastructure

[Pourquoi tous mes serveurs ont un fichier vide de 8 Go?](https://brianschrader.com/archive/why-all-my-servers-have-an-8gb-empty-file/)  

* rien de pire qu'un linux ou macOS avec zero espace disque, ca part en sucette
* donc 8Go pour se donner du temps
* ca touche mon égo de developpeur cette solution :)

[Docker Desktop for Apple Silicon en preview](https://docs.docker.com/docker-for-mac/apple-m1/)  

* ils offrent une alternative au framework de virt d'apple qui tourne sur qemu
* utilise encore rosetta 2 vu qu'il y a des libs qui utilisent encore intel
* fait tourner les images ARM, et sinon ajouter la platform amd64 mais les images amd crashent QEMU parfois
* pour qemu: "ping from inside a container to the Internet does not work as expected." LOL

[Levée de fond de 23 millions de dollar pour Docker](https://www.docker.com/press-release/Docker-Series-B)  

* Serie B, ahahah

[2ème incendie chez OVH](https://www.dna.fr/faits-divers-justice/2021/03/19/nouvel-incendie-chez-ovh) 

* Dégagement de fumée de 300 batteries de 25 kg
* Sgb1 et 3 coupés temporairement

### Loi, société et organisation

[Google chrome révèle le type de données collectées attachées à l’utilisateur.](https://www.forbes.com/sites/zakdoffman/2021/03/20/stop-using-google-chrome-on-apple-iphone-12-pro-max-ipad-and-macbook-pro/)  ( + [Google Chrome 90](https://stuffunknown.com/the-big-update-to-google-chrome-will-change-the-way-your-internet-browsing/) )  

* Beaucoup plus important que Firefox ou safari.
* Google a mis longtemps avant de donner ces infos.
* après c’est la course au nombre et beaucoup sont poussées par des fonctionnalités mais cela montre l’approche philosophique différente.
* chrome acte comme un super cookie.
* j'ai mis edge par defaut sur l'ordi de mon père

[Fin du procès Oracle vs Google](https://www.wsj.com/articles/supreme-court-rules-for-google-in-multibillion-dollar-copyright-battle-with-oracle-11617632233?mod=hp_lead_pos1)  

* les APIs ne sont pas copyrightable
* Pas exactement. Ils disent que dans le cas de Google oracle, c’est ok parce que les api sont devenues des choses familières aux développeurs et donc que dans ce cas c’est ok. Il ne se positionnent pas exactement sur api vs implementation
* Que les apis comme ça s’éloignent du cœur de la notion de copyright. Concept intéressant. Et d’où la notion de fair use.
* Mais ça dépend de comment le code est fait et utilisé
* "When a new interface, like an API or a spreadsheet program, first comes on the market, it may attract new users because of its expressive qualities, such as a better visual screen or because of its superior function- ality. As time passes, however, it may be valuable for a dif- ferent reason, namely, because users, including program- mers, are just used to it. They have already learned how to work with it"

[Microsoft a regardé ses employés remote et c’est pas beau](https://www.zdnet.com/article/microsoft-revealed-the-latest-truths-about-working-from-home-one-is-truly-disturbing/)  

* +52% de messagerie instantannée entre minuit et 6 heures
* 61% des leaders sont super efficaces vs 38% pour les non leaders
* Moins de chances de voir les problèmes en remote
* 37% pensent que la société les fait travailelr trop dur et 41% cherchent un nouvel employé
* consider how to reduce employee workloads, embrace a balance of synchronous and asynchronous collaboration, and create a culture where breaks are encouraged and respected
* Encourager les coupures y compris les vacances

[cratedb abandonne l'open core et retourne sur ses racines open source et s’éloigne de la business software license](https://opensource.com/article/21/4/crate-open-source)  

[Dell vend (encore) VMWare](https://www.lemondeinformatique.fr/actualites/lire-la-scission-avec-vmware-finalisee-fin-2021-selon-dell-82622.html)

* vente des 80% detenus
* pour rembourser sa dette
* independance mieux pour les deux sociétés
* "stimuler l'innovation et préserver les synergies"

## Conférences

[Mix-IT (virtuel) les 18, 19 et 20 mai 2021](https://mixitconf.org/fr/)  

* 10 talks de 30 mn + 20mn de Q&A + 10 mn de pause 

[https://www.devoxx.fr/2021/02/25/preparation-du-programme-de-ledition-2021/](https://www.devoxx.fr/2021/02/25/preparation-du-programme-de-ledition-2021/)

* reprend une partie du CfP de l’année dernière.

## Outils de l'épisode

[Pourquoi les prix d'AWS lambda sont trop élevés poiur du batch](https://www.infoq.com/articles/aws-lambda-price-change/)  

[topgrade](https://github.com/r-darwish/topgrade) pour mettre à jour tous vos systèmes de packages. 
[asdf](https://asdf-vm.com/#/) pour gérer facilement différentes versions de vos outils en lignes de commande (java, maven, gradle, kubectl, help, .....).  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

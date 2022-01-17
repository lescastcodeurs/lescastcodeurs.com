---
title: LCC 271 - UPX version Spinal Tap
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 271
mp3_length: 65324981
tweet: UPX version Spinal Tap
# tweet size: 91-93 -> 99-101 #######################################################################
---
Antonio, Guillaume et Emmanuel discutent 11, le 42 du rockeur, Quarkus, Java 17, limites de Kubernetes, #Y2k22, web3, Maven, Log4J, et et et cloud souverain.

Enregistré le 14 janvier 2022

Téléchargement de l’épisode [LesCastCodeurs-Episode-271.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-271.mp3)

## News

### Langages

[Quoi de neuf dans Java 18](https://www.loicmathieu.fr/wordpress/informatique/java-18-quoi-de-neuf/) de Loïc Mathieu

* Feature complete (mais encore des bugs)
* UTF-8 par défaut
* exemples de code dans la javadoc avec `@snippet`  y compris des references a des fichiers extérieurs
* Simple Web Server pour des resources statiques (comme d’autres plateformes comme Ruby ou Python je crois). En code ou via la commande `jwebserver`
* le mécanisme de finalisation proposé à la suppression `--finalization=disabled` pour tester. Celui-là il ne nous manquera pas 
* ré-implementation de la reflection avec les `MethodHandle`

[Le calendrier de l'Avent Java 2021 a plein d’articles très intéressants](https://www.javaadvent.com)

* pas tous révolutionnaires, mais c’est sympa
* [RXJava vs Kotlin Coroutines](https://www.javaadvent.com/2021/12/are-kotlin-coroutines-enough-to-replace-rxjava.html)
* [Analyser votre repo Git en Java avec jgit](https://www.javaadvent.com/2021/12/using-jgit-to-analyse-the-legacy-of-individual-developers.html)

[Cinq choses que vous ne saviez pas sur la concurrence en Java](https://www.javaadvent.com/2021/12/5-things-you-probably-didnt-know-about-java-concurrency.html)

* l’ordre du programme et l’ordre d’exécution n’est pas le même, mais il est sémantiquement similaire
* le nombre de threads dans une JVM est limité (dépend de la machine)
* plus de threads ne veut pas dire plus de perfs

### Librairies

Quarkus 2.5 et [2.6](https://quarkus.io/blog/quarkus-2-6-0-final-released/) sont sortis :

* API programmatique pour interagir avec le cache
* Kotlin 1.6
* Java 17 par défaut pour les nouveaux projets générés
* des extensions ont bougé du core vers le quarkiverse hub, peut-être quelques impacts [de migration](https://github.com/quarkusio/quarkus/wiki/Migration-Guide-2.6)
* images container plus petites en natif et [compression UPX](https://quarkus.io/blog/upx/) possible
    * plus petit sur disque, mais plus gros en memoire (pour la décompression)
    * `quarkus.native.compression.level` de 1 à 10 dans le fichier de config
* dev service pour Oracle DB

[Utiliser Neo4J pour analyser le chemin de code et pourquoi un bout de code est inclus en natif](https://quarkus.io/blog/quarkus-native-neo4j-call-tree/)  

* super utile pour les compilations natives
* `quarkus.native.enable-reports` pour avoir le rapport exploitable par neo4j

[SmallRye Stork](https://quarkus.io/blog/smallrye-stork-intro/)

* service discovery et client side load balancing
* support pour Consul, Eureka, and Kubernetes
* extensible notamment pour le load balancing
* intégration avec Quarkus REST Client et gRPC
* dans la config `stork://hello-service`

### Infrastructure

[Pourquoi et comment de la taille des containers Kubernetes](https://github.com/vsevel/article/blob/work/doc/tuning.md)

* Quand on ne partage pas, inefficient mais sécurisé
* Avec des VM, on peut overcommitter des resources sur l’hyperviseur, mais risque sur mésentente
* Ne remplace pas le capacity planning
* Les containers définissent des filtrages plus fins et tuent les process qui dépassent
* Discussion `cpu_share` (proportion en balance), `cpu_quota`, `cpu_period` pour définir les limites basses et hautes
* mais si ça reste statique par host ce n’est pas très pratique
* Orchestration de container via Kubernetes (request = min, limit = max)
* Kube donne au minimum `request` mais peut donner plus si le nœud n’est pas occupé à 100%
* Attention, la partie libre n’est pas distribuée équitablement, mais en proportion du ratio de `request` demandé vs les autres. Donc les containers avec des grosses `request` sont privilégiés. Donc mettre `limit` est important
* Donc jouer le jeu `request` et `monitored` pour ajuster à la baisse si nécessaire. Tous les workloads doivent jouer le jeu.
* Kubernetes QoS (best effort, burstable et guaranteed) utilisé lorsqu’on tourne bas en mémoire (pas en cpu !)
* Discussion de la sélection du nœud (selector, affinity, taints and tolerations ou isolation/ restriction) pour isoler des qualités de service ou prédictibilité, pour la sécurité etc
* besoins mémoire : si utilisation max, pod killed. Besoins CPU : si utilisation max, on est throttled -> slow
* Mettre mémoire request = limit sauf si le process peut rendre de la mémoire (pas fait avant java 11)
* CPU request = limit si la prédictibilité de l’application est très important.
* Étudier conso CPU de l’appli en percentile et targeted par exemple une garantie à 99% ou 90 ou moins si pas sensible
* Article ne parle pas du scale out

[Exchange 2016 et 2019 souffrent du bug de l’an 2022 Y2K22](https://arstechnica.com/information-technology/2022/01/exchange-server-bug-gets-a-fix-after-ruining-admins-new-years-plans/)

* Après Matrix et son opus Resurrections, Microsoft relance le bug de l’an 2000, 22 ans après, Y2k22
* dans Exchange server 2016 et 2019 et d’autres systems non microsoft
* pour Exchange c’est dû au système de scan d’antivirus qui ne reconnaissait pas les dates des signatures de virus `22010100001`  parce que le software stocke les dates dans un entier signé `2^31-1=2147483647` et la date est stockée sur les deux premiers chiffres.
* le workaround initial est assez marrant, le software considère qu’on est le 33 décembre 2021 `2112330001`

### Web

[Moxy de Signal (ex) discute web3](https://moxie.org/2022/01/07/web3-first-impressions.html)

* web1 était décentralisé, web2 est riche mais centralisé, web3 sera riche et décentralisé
* problème: les gens n’aiment pas faire tourner leurs propres serveurs et ne l’aimeront jamais
* même les entreprises ne font plus tourner leurs serveurs
* un protocole (standard) bouge beaucoup plus lentement qu’une plateforme
    * exemple Spring, exemple Quarkus vs Microprofile ou Jakarta EE
* puis discute blockchain et NFT
* l'état et la logique / les permissions pour mettre a jour sont décentralisées, mais pas l’interface avec l’utilisateur
* blockchain est une confiance entre serveurs plus qu’entre clients
* avec le mobile, les clients ne peuvent pas acter en tant que server (voir Bitcoin)
* donc des gens vendent des accès centralisés aux nœuds de la blockchain
* et les clients de ses APIs ont une confiance implicite (et pas par le système)
* et centralisation des accès et donc mining de ces informations
* NFTs stockent l’URL de l’objet (sans hash) donc pas sécurisé sans parler du rachat de domaine
* il a fait un NFT qui se change en émoji caca pour celui qui l’a acheté
* et il s’est fait virer son NFT *ET* sa preuve de possession
* mais c’est une blockchain ???
* sauf que le wallet passe par des fournisseurs centralisés
* pour faire web3, les gens se concentrent autour de plateformes, un comportement tres web2
* donc la blockchain et NFT ont du succès non pas parce que c’est distribué, mais parce que c’est un gold rush
* la dynamique rend les projets web3 successful mais fondamentalement les mêmes dynamiques vont les centraliser
* propositions
    * accepter que les gens ne font pas tourner leur serveur et utiliser la crypto pour distribuer la confiance

### Outillage

[Maven 3 à 5 une explication](https://www.javaadvent.com/2021/12/from-maven-3-to-maven-5.html)

* le POM est figé parce que c’est ce que publie maven central, donc maven 3 ne fera que des améliorations mineures
* Maven 5 la proposition : avoir un POM de build (v5) et produire un POM de consommation en v4, comme les autres systèmes de builds font
* Maven 4 va faire la même séparation, mais en faisant un POM v4 build to POM v4 consumer conversion en étape intermédiaire
* maven 4 alpha 1 se rapproche, il attend juste des contributions de @aheritier
* blog de Hervé Boutemy
* Maven Wrapper (ex takari) est désormais un projet officiel apache maven : <https://maven.apache.org/wrapper/maven-wrapper-plugin/>
* idem pour Maven Daemon <https://github.com/apache/maven-mvnd>
* Le maven Build Cache arrive : <https://github.com/apache/maven-build-cache-extension>

### Sécurité

Comme prévu, la saga log4j continue avec Log4j 2.17 et 2.17.1

* avec l’augmentation de la visibilité, plus de problèmes vont être trouvés
* Log4J 2.17 corrige un appel récursif infini exploitable en déni de service. Besoin d’avoir un pattern non standard dans la config (utilisant les context lookup) et un accès au Thread Context Map par l’attaquant (5.9) <https://logging.apache.org/log4j/2.x/security.html#CVE-2021-45105>
* Log4J 2.17.1 fixe un abus du JDBCAppender qui peut référencer une URL JNDI et exécuter du code à distance, mais l’attaquant doit pouvoir modifier la configuration de log4j (6.6) <https://logging.apache.org/log4j/2.x/security.html#CVE-2021-44832>
* doit-on quitter le navire ? équilibre entre fonctionnalités et sécurité
* on fera un épisode spécial Log4Shell bientôt

[H2 vulnérable à une attaque JNDI](https://jfrog.com/blog/the-jndi-strikes-back-unauthenticated-rce-in-h2-database-console/)

* fondamentalement comme Log4Shell
* Mais exploitable pour ceux qui passent une url ou un login mot de passe via des infos utilisateur
* Par exemple h2 console 
* Mais localhost par défaut
* Sauf dans jhipster

### Loi, société et organisation

[Tribune de Didier Girard sur le cloud souverain](https://www.lopinion.fr/economie/le-cloud-souverain-est-necessaire-le-cloud-de-confiance-indispensable-pour-y-parvenir-la-tribune-de-didier-girard)  

* investissement de 1,8 milliard sur 4 ans dans le cloud français sur 4 ans. C’est moins que chaque grand cloud provider par an
* consortiums européens, mais mauvaise histoire CloudWatt, Gaia-x et ses problèmes de gouvernance 
* initiative Soutenu par la dépense publique 
* Cloud de confiance est un moyen pour Didier du transfert technologique et de casser l’asymétrie de compétence et d’investissement 
* Ça ne répond pas aux problèmes clés levés par Quentin dans l’interview 

[La Maison Blanche demande à Oracle et Microsoft de réfléchir à la sécurisation des logiciels libres](https://twitter.com/bortzmeyer/status/1478348208669700100?s=21)

## Outils de l’épisode

[Rambox](https://rambox.app/)  

* en general je préfère les applis natives pour chaque service
* Mais avec les messageries instantanées, c’est la chienlit
* Et il y a les apps qui sont des tabs dans le navigateur (Trello, Gmail, calendar etc)
* Là tout est centralisé dans une seule app (notifications etc)
* C’est comme un mini browser dédié avec des sites webs fixes
* Et contre toute attente j’aime bien
* Version gratuite et version pro.
* Encore des limitations (vue de deux apps en parallèle) mais ils travaillent à une nouvelle version

## Conférences

[Sunny Tech](https://sunny-tech.io/) à Montpellier le 30 juin et 1er juillet — [CfP](https://conference-hall.io/public/event/m1kfbpSntxF3QBVUwoFY) ouvert jusqu’au 28 février

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

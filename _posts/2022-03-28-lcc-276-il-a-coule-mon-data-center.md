---
title: LCC 276 - Il a coulé mon data center !
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 276
mp3_length: 56855076
tweet: Il a coulé mon data center !
# tweet size: 91-93 -> 99-101 #######################################################################
---
Emmanuel, Guillaume et Antonio se réunissent pour discuter des nouvelles de ce début de printemps. On y parle retour de JavaOne, revue de pull request, de développement cloud natif, de SLO, et de log.

Enregistré le 25 mars 2022

Téléchargement de l’épisode [LesCastCodeurs-Episode-276.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-276.mp3)

## News

### Langages

[Remplacer vos APIs de logging avec System.Logger](https://renato.athaydes.com/posts/java-system-logging.html)

* Blog post rédigé suite à notre épisode 271 (où on avait cité `System.Logger`)
* Rapide histoire des APIs de log en Java
* Présentation de l’API `System.Logger`
* Formatage des messages basé sur `java.text.MessageFormat`
* Utilisation possible des `ResourceBundle`
* Niveaux `TRACE`, `DEBUG`, `INFO`, `WARNING`, `ERROR` (et non `FINE`, `FINER`, `FINEST` comme JUL)
* Le service `System.LoggerFinder` pour changer l’implémentation (JUG, Log4J, Logback, ...)
* Etude de perf : Logback est plus performant, suivit de JUG puis Log4J2


[Une série de petites librairies Java légères](https://jodd.org/). Librairies simples, avec chacune une tâche unique, dont :

* parsing JSON
* parsing HTML / CSS
* client HTTP
* client mail
* résolveur de noms de paramètres de méthode
* des `Properties` améliorés
* un framework d’injection de dépendances léger

[Java 18 est dans la place](https://openjdk.java.net/projects/jdk/18/)

* 400:  UTF-8 by Default
* 408:  Simple Web Server
* 413:  Code Snippets in Java API Documentation
    * un super [guide](https://docs.oracle.com/en/java/javase/18/code-snippet/index.html) sur l’utilisation des nouveaux javadoc code snippets
* 416:  Reimplement Core Reflection with Method Handles
* 417:  Vector API (Third Incubator)
* 418:  Internet-Address Resolution SPI
* 419:  Foreign Function & Memory API (Second Incubator)
* 420:  Pattern Matching for switch (Second Preview)
* 421:  Deprecate Finalization for Removal

### Librairies

[Micronaut 3.3 sorti, avec des nouveautés](https://micronaut.io/2022/01/27/micronaut-framework-3-3-released/) et [Micronaut 3.4](https://micronaut.io/2022/03/22/micronaut-framework-3-4-0-released/) aussi

* graalVM 22
* binding par valeur d'annotations (CDI)
* Serialization (remplace Jackson, plus léger en mémoire, ne fait pas de désérialisation arbitraire, pas de réflexion)
* module email qui permet d’envoyer avec MailJet, Amazon simple email service, SendGrid, Postmark
* Opérateurs Kubernetes
* possibilité de référencer des beans properties dans @Requires
* injection de localized message sources
* nouveau module Micronaut Data MongoDB
* support de Maven pour Micronaut AOT

[Hibernate 6: certains points clés](https://twitter.com/1ovthafew/status/1486818448055410690?s=21)

* nouveau parseur HQL (langage plus riche)
* API nettoyées (donc ça va peut-être demander des migrations)
* DDL de meilleure qualité plus adaptée à la base de donnée cible
* requêtes de type rapport (filter, rollup, cube, et les window functions arrivent bientôt)
* arithmétique sur les dates
* indexation des colonnes (SQL plus compact et rapide)

[Kubernetes Service Discovery and Selection with Stork](https://quarkus.io/blog/stork-kubernetes-discovery/)

[Quarkus 2.7](https://quarkus.io/blog/quarkus-2-7-0-final-released/)  

* Stork 1.0
* Quarkus CLI dans homebrew et SDKman
* extension pour le driver Oracle réactif
* terminal interactif

### Infrastructure

[L’énergie utilisée dans les data centers est constante à 1 à 1,5% de l’énergie mondiale d’après l’agence internationale de l’énergie](https://www.iea.org/reports/data-centres-and-data-transmission-networks)  

* hors cryptocurrency
* l’augmentation a continué, mais les efforts d’économies d’énergie ont compensé la croissance de la demande
* hors production du matériel je crois
* les alertes ont fait bouger les lignes
* études source [Masanet et al - science](https://datacenters.lbl.gov/sites/default/files/Masanet_et_al_Science_2020.full_.pdf) et une autre de Malmodin 2020 dans science aussi

### Cloud

[Sondage annuel “The State Of Cloud Native Development”](https://www.cncf.io/wp-content/uploads/2021/12/Q1-2021-State-of-Cloud-Native-development-FINAL.pdf)

* Sondage créé par Slash Data et soutenu par la CNCF
* Interroge 19 000 développeurs sur l’utilisation de Kubernetes, le edge computing, le cloud-native, les conteneurs et orchestrateurs
* Le nombre mondial de développeurs cloud-native a augmenté au cours des 12 derniers mois de 0,3 million, pour atteindre 6,8 millions.
* Dans le même temps, la proportion de développeurs backend impliqués dans les technologies cloud-native a diminué de 3 points de pourcentage, passant de 44 % à 41 %.
* Dans toutes les régions, l’Amérique du Nord (47 %) et l’Europe occidentale (46 %) affichent les taux d’adoption les plus élevés.
* Kubernetes est utilisé par 31% de tous les développeurs backend, ce qui représente une augmentation de 4 points de pourcentage au cours des 12 derniers mois. Actuellement, 5,6 millions de développeurs utilisent Kubernetes.
* Dans tous les secteurs, le edge computing a connu une croissance rapide de l’adoption de Kubernetes et présente désormais les taux d’utilisation les plus élevés des conteneurs et de Kubernetes.
* Parmi les développeurs spécialisés dans le edge computing, l’utilisation de Kubernetes a augmenté de 11 points au cours des 12 derniers mois, pour atteindre 63 %.
* L’architecture Serverless est également attrayante pour les développeurs edge computing : 48 % de tous les développeurs edge utilisent serverless, contre seulement 33 % de tous les développeurs backend.
* Parmi les outils serverless, AWS Lambda continue de jouer un rôle prépondérant. Cependant, Google Cloud Run a considérablement gagné du terrain au cours des 12 derniers mois.

[SLO et dépendances de service](https://queue.acm.org/detail.cfm?id=3096459)

* 99,99 en cible interne, au-dessus il y a tant de variables entre l’utilisateur et le service que c’est perdu dans le bruit (wifi, ISP etc)
* 99,999 pour les infras globales
* disponibilité est fonction du MTTF et MTBR = MTTF/(MTTF+MTTR)
* si on veut offrir 99,99, toutes les dépendances critiques doivent offrir beaucoup plus, règle du 9 supplémentaire
* sinon il faut des mitigations : cache, fail open, etc
* la disponibilité dépend du temps de détection et du temps de récupération
* donc forcer les clients (services dépendants) à baisser leur niveau ou architecturer pour compenser le bas niveau du service dont on est dépendant
* faire des scénarios (p. ex. 1 outage majeur, 3 faibles - p. ex. un shard, 5 de dépendances)
* considérer que la perte d’un shard du service veut dire SLO est 1 n-ième indisponible (n étant le nombre de shards)
* donc il reste peu de temps pour réagir quand on compte le temps de detection, le temps de paging, etc.
* error budget : 1-SLO, sur un mois et pouvant être une fenêtre glissante pour remonter graduellement. Si budget dépensé, on ne fait plus de mise en prod sauf critical security issues ou si c’est pour corriger les causes du problème qui a consommé le budget
* rendre le plus de dépendances possibles non critiques (par exemple en éliminant les SPOF)
* faire revue d’architecture pour identifier ces dépendances et leurs impacts
* appels a trois pools de serveurs indépendants et prendre le premier résultat
* les dépendances asynchrones peuvent réduire le nombre de dépendances critiques
* retours arrière rapide et automatisés : en enlevant un humain de la boucle on raccourcit les temps de réponse
* et bien d’autres choses encore.

### Architecture

[Les design patterns pour les systèmes distribués et donc les microservices](https://medium.com/everything-full-stack/design-patterns-and-principles-that-support-large-scale-systems-f3c9adf89ad)

* survol et définitions des patterns qu’il faut connaître dans les microservices
* Pas trop dans le détail donc bon survol
* Idempotence, asynchronicité, health-check, feature flag, fallback
* Bulkhead: cloisonnement
* Metrics, monitoring, alarmes
* Rate limiting, backpressure, etc

### Méthodologies

[La pyramide des fondamentaux dans la revue de code](https://www.morling.dev/blog/the-code-review-pyramid)

* codifie les points sur lesquels se concentrer sur la revue de code et ceux avec une priorité plus basse
* automatiser les points bas comment le style de code pour éviter de perdre du temps et de la frustration humaine

### Sécurité

[Removed unencrypted Git protocol and certain SSH keys](https://github.blog/changelog/2022-03-15-removed-unencrypted-git-protocol-and-certain-ssh-keys/)

* nettoyage de printemps
* plus de `git:` qui est non sécurisé
* plus ne nouvelles clés RSA SHA1
* plus de DSA
* de nouvelles courbes elliptiques

[Samsung utilise incorrectement la crypto rendant son enclave sécurisée, pas sécurisée](https://threatpost.com/samsung-shattered-encryption-on-100m-phones/178606/)

* l'article n’expose pas les détails techniques
* 100 millions de téléphones
* la même clé était réutilisée (et pas encapsulée)
* le vecteur d’initialisation pouvait être configuré et réutilisé à valeur unique
* n’importe quelle application pouvait essayer d’accéder aux secrets de l’enclave en essayant les combos parce que l’application avait accès à ces paramètres
* quand on réutilise les vecteurs d’initialisation, on peut faire un 1-1 entre le message clair et chiffré, ce qui permet de revenir a message clair si on produit le même message chiffré.
* https://knowledge-base.secureflag.com/vulnerabilities/broken_cryptography/reused_iv_key_pair_vulnerability.html

### Loi, société et organisation

[Alert: peacenotwar module sabotages npm developers in the node-ipc package to protest the invasion of Ukraine](https://snyk.io/blog/peacenotwar-malicious-npm-node-ipc-package-vulnerability/)

[Un développeur sabote son projet open source et paralyse des milliers d’applications](https://www.numerama.com/cyberguerre/813825-un-developpeur-sabote-son-projet-open-source-et-paralyse-des-milliers-dapplications.html#utm_medium=e-mail&utm_source=newsletter_hebdo&utm_campaign=20220115_global)

[Violation de RGPD par utilisation de Google fonts](https://news.ycombinator.com/item?id=30135264)

[French privacy regulator rules against use of Google Analytics](https://www.politico.eu/article/french-privacy-regulator-rules-against-use-of-google-analytics)

* [L’article de la CNIL](https://www.cnil.fr/fr/utilisation-de-google-analytics-et-transferts-de-donnees-vers-les-etats-unis-la-cnil-met-en-demeure)

[VMWare, Red Hat et d’autres s’ajoutent aux sanctions contre le gouvernement Russe en arrêtant la vente et les services pour les entités russes et biélorusse](https://www.redhat.com/en/blog/red-hats-response-war-ukraine)

[Une entrée en bourse pour Sonatype](https://venturebeat.com/2022/01/27/sonatype-which-secures-the-use-of-open-source-software-lays-groundwork-for-ipo)


## Conférences

[JavaOne à Las Vegas du 16 au 20 octobre 2022](https://blogs.oracle.com/java/post/javaone-is-back)  

* Java language & platform, cloud-native development, database, microservices, DevOps, artificial intelligence & machine learning, security & application management, and more.


## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

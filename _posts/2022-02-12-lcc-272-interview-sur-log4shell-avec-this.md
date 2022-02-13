---
title: LCC 272 - Interview sur Log4Shell avec this
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 272
mp3_length: 76025100
tweet: Interview sur #Log4Shell avec this
# tweet size: 91-93 -> 99-101 #######################################################################
---
Emmanuel et Arnaud reviennent sur la fameuse faille #log4shell qui a fait travailler beaucoup d’équipes Java en décembre et janvier.

Enregistré le 11 février 2022

Téléchargement de l’épisode [LesCastCodeurs-Episode-272.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-272.mp3)

## Interview

### Quelle est cette vulnérabilité et pourquoi est-elle si dangereuse ?

[CVE-2021-44228](https://logging.apache.org/log4j/2.x/security.html#CVE-2021-44228)

Reportée chez Apache le 24 novembre, enregistrée en CVE le 26 novembre
Probablement connue depuis au moins Mars 2021 : https://github.com/nice0e3/log4j_POC

* fix 2.15.0 le 10 décembre
* Apache Log4j2 JNDI features do not protect against attacker controlled LDAP and other JNDI related endpoints.
* Severity CVSS de 10 sur 10
    * jamais vu
* back to basics: C'est quoi JNDI ?
* the JNDI features used in configurations, log messages, and parameters do not protect against attacker-controlled LDAP and other JNDI related endpoints
* l’attaquant trouve une donnée utilisateur qui est loguée
    * Pas que HTTP
* et injecte `{JNDI:ldap` pointant vers un ldap malicieux qui retour du code java sérialisé
* Log4j désérialise et exécute ce que l’on veut
* que `log4j-core`, pas `log4j-api`
* détail de [Lunasec log4j zero day](https://www.lunasec.io/docs/blog/log4j-zero-day/)  
    * mitigations initiales

[CVE-2021-45046](https://logging.apache.org/log4j/2.x/security.html#CVE-2021-45046)

* 2.16.0 (change des fonctionnalités) le 13 décembre
* Apache Log4j2 Thread Context Lookup Pattern vulnerable to remote code execution in certain non-default configurations
* When the logging configuration uses a non-default Pattern Layout with a Context Lookup
    * `$${ctx:loginId})`
* attackers with control over Thread Context Map (MDC / Mapped Diagnostic Context) input data can craft malicious input data using a JNDI Lookup pattern
* donc on peut encore injecter une chaine JNDI
* mais on doit savoir comment de l’utilisateur on peut pousser dans une Thread Context Map référencée par la config
* ou alors l’attaquant a accès à la config et c’est game over
* Initialement on parlait de denial of services
    * via une reference infinie probablement
* c’est un chemin qui n’était pas protégé des interpolations de messages et donc de l’accès JNDI

[CVE-2021-45105](https://logging.apache.org/log4j/2.x/security.html#CVE-2021-45105)

* fix dans 2.17.0 le 18 décembre
* recursion non contrôlée dans un lookup autoréférentiel
* When the logging configuration uses a non-default Pattern Layout with a Context Lookup (for example, $${ctx:loginId})
* Besoin que l’attaquant contrôle la Thread Context Map (peut être une donnée injectée par un framework à partir d’une entrée utilisateur)
* changer la config Log4j locale ?

[CVE-2021-44832](https://logging.apache.org/log4j/2.x/security.html#CVE-2021-44832)

* 2.17.1 le 27 décembre
* Apache Log4j2 vulnerable to RCE via JDBC Appender when attacker controls configuration
    * malicious configuration using a JDBC Appender with a data source referencing a JNDI URI which can execute remote code.
* attaquant accède et modifie la config
    * pas simple
    * sauf si la plateforme permet la reconfiguration par un utilisateur ???
* log

[Google package analysis](https://security.googleblog.com/2021/12/understanding-impact-of-apache-log4j.html)

* montre 8% de packages sur central affectés par Log4j2
* niveau de dépendance transitive monte jusqu’à 9
    * du coup il y a neuf vendeurs qui doivent corriger leurs dépendances

[Toujours plus de 40% de téléchargement sur Maven central des versions impactées](https://www.sonatype.com/resources/log4j-vulnerability-resource-center)

Log4j1 n’est pas en reste :

* JMSAppender
    * JMS dit JNDI et paf on recommence
* JDBCAppender
    * SQL injection FTW
* Log4j1 n’est plus maintenue ah merde !
    * Apache Kafka

[Reload4j de ceki](https://reload4j.qos.ch)

* 1.2.17 compatible
* [voir les fixes](https://reload4j.qos.ch/news.html) 

### Des exploitations ?

Peu finalement
Car chaque usage de Log4j est unique
Entrée quoi est logué etc 
Donc trop dur pour les script kiddies 

Mais dans les metasploits et autres toolkits d’attaque

VMware vSphere et Horizon
Ubiquity 
SolarWinds 
etc

### Quel process suivre

* vérifier la véracité de la CVE et comprendre ses vecteurs d’attaque
* identifier ses dépendances et donc ses soft impacté
* identifier les éléments fournis par l’utilisateur qui sont logués
* définir le risque par software et par service
* appliquer le patch de sécurité et reconstruire le package
* déployer ou livrer chez les clients
* répéter pour les semaines à venir

* shading ? :) 

### Impact de l’industrie dans le futur

La Chine a tapé sur les doigts Alibaba qui n’a pas donné cette faille d’abord au gouvernement chinois 

[The Gift of It’s Your Problem Now](https://apenwarr.ca/log/20211229)  

* Discussion sur le paiement et l’open source
    * Pour un individuel l’open source est un cadeau et donner de l’argent n’améliore pas le cadeau
    * Injecter de la compensation financière dans un cadeau casse le cadeau et ne change pas la motivation (ou la casse)
    * Pour une société, l’open source est un moyen de récupérer du feedback et du marketing, donc c’est une transaction et pas un cadeau
* Un autre article similaire : [The burden of an Open Source maintainer](http://www.jeffgeerling.com/blog/2022/burden-open-source-maintainer)

[Open source maintainer pulls the plug on npm packages colors and faker, now what?](https://snyk.io/blog/open-source-npm-packages-colors-faker/)  

* mainteneur rajoute une boucle infinie dans un package modems très utilisé
* en protestation de non-contribution (financière)
* 20 millions de téléchargements par semaine
* [GitHub a bloqué son compte et nom a remis une ancienne version](https://www.bleepingcomputer.com/news/security/dev-corrupts-npm-libs-colors-and-faker-breaking-thousands-of-apps/)
* un peu de temps avant il [s’est fait copier son idée de faker.js as a service](https://web.archive.org/web/20210628030444/https://marak.com/blog/2021-04-25-monetizing-open-source-is-problematic)


[Reflection on log4shell par diabolical developer](https://www.javaadvent.com/2021/12/reflections-on-log4shell.html)  

* marathon pas un sprint, on fatigue après 5 ou 6 jours à fond, donc faites des rotations
* comm sur le réseau, que regarder : Adding encryption, Auth/Auth, I sanitize data that goes over the wire, I sanitize input that could execute, DOS protection – backoff strategies and more.
* supply chain sécurisation and component governance
* OSS funding (hum ?)

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

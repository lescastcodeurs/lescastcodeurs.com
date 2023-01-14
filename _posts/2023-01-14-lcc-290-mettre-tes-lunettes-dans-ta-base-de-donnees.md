---
title: LCC 290 - Mettre tes lunettes dans ta base de données
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 290
mp3_length: 54742137
tweet: Mettre tes lunettes dans ta base de données #graalvm #openjdk #rust #webassembly #containers #postgres #chatgpt #architect #retrospective
# tweet size: 91-93 -> 99-101 #######################################################################
---
Guillaume et Arnaud discutent de tech en cette nouvelle année 2023.
GraalVM dans OpenJDK, Rust, Webassembly, containers. postgres, ChatGPT, le rôle de l'architecte et la ribambelle de rétrospective 2022.

Enregistré le 13 janvier 2023

Téléchargement de l’épisode [LesCastCodeurs-Episode-290.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-290.mp3)

## News

### Langages

OpenJDK propose projet Galahad : pour fusionner dans OpenJDK certaines parties de GraalVM community edition
[https://www.infoq.com/news/2022/12/openjdk-galahad-Dec22/](https://www.infoq.com/news/2022/12/openjdk-galahad-Dec22/)

- [https://www.infoq.com/articles/graalvm-java-compilers-openjdk/](https://www.infoq.com/articles/graalvm-java-compilers-openjdk/)

Alex Snaps partage un article sur Rust pour le développeur Java
[https://wcgw.dev/posts/2023/rusty-java-intro/](https://wcgw.dev/posts/2023/rusty-java-intro/)

Google a sorti sa formation interne sur Rust en libre accès
[https://google.github.io/comprehensive-rcust/](https://google.github.io/comprehensive-rust/)


Paul King du projet Apache Groovy partage sa rétrospective de l’année 2022
[https://blogs.apache.org/groovy/entry/apache-groovy-2022-year-in](https://blogs.apache.org/groovy/entry/apache-groovy-2022-year-in)


Webassembly pour le developpeur Java [https://www.javaadvent.com/2022/12/webassembly-for-the-java-geek.html](https://www.javaadvent.com/2022/12/webassembly-for-the-java-geek.html)


Un article assez critique sur TypeScript
[https://dev.to/wiseai/17-compelling-reasons-to-start-ditching-typescript-now-249b](https://dev.to/wiseai/17-compelling-reasons-to-start-ditching-typescript-now-249b)

- On voit souvent des articles plutôt positif sur TypeScript, mais est-ce que tout est tout rose tout le temps, pas forcément !
- L’article cite 17 problèmes avec TypeScript, dont la courbe d’apprentissage, la baisse de productivité, la verbosité des types, le manque de flexibilité, le fait que ce n’est pas vraiment un sur-ensemble de JavaScript, la lenteur du temps de compilation...
- basé sur son talk sur le même thème qu’il a déjà présenté à Devoxx Maroc et Belgique
- Alex a également écrit une deuxième partie faisant suite à son article, dans lequel il parle un peu plus d’ownership, de borrowing, du trait Drop, etc. (càd sur la gestion mémoire)
- [https://wcgw.dev/posts/2023/rusty-java-2/](https://wcgw.dev/posts/2023/rusty-java-2/)


### Librairies

Sortie du Micronaut 3.8
[https://micronaut.io/2022/12/27/micronaut-framework-3-8-0-released/](https://micronaut.io/2022/12/27/micronaut-framework-3-8-0-released/)

- support de GraalVM 22.3.0
- possibilité d’annoter les records avec @RequestBean (pour binder les paramètres de requête et autre, aux paramètres de la méthode du controleur)
- amélioration du CorsFilter pour éviter certaines attaques
- également des améliorations sur le support de CRaC (Coordinated Restore at Checkpoint)
- et plein d’autres upgrades de versions, nouveaux plugins, et améliorations mineures

Swing n’est pas mort ! Un nouveau DSL Java open source pour Swing dénommé Sierra, pour faciliter la création d’interfaces graphiques Swing
[https://github.com/HTTP-RPC/Sierra](https://github.com/HTTP-RPC/Sierra)



### Infrastructure

Comprendre `root` dans et en dehors des containers [https://www.redhat.com/en/blog/understanding-root-inside-and-outside-container](https://www.redhat.com/en/blog/understanding-root-inside-and-outside-container)

- un article pas recent mais utile
- c'est quoi un container rootless
- on peut etre root et lancer le moteur de container
- on peut etre root dans le container lui meme
- quand on run en root le moteur, l'utilisateur exterieur et interieur sont mappés (meme # d'UID) ; par contre en non root, le UID de l'utilisateur du container est mappé sur un nouvel UID
- c'est top car les utilisateurs dedans et dehors ne sont pas mappés donc moins de risque en cas de sortie de bac a sable (sandbox escape)
- c'est le cas pour podman mais pour docker il y a un ajout: docker a un démon (root ou pas) et une CLI qui appelle ce demon (root ou pas), ce qui importe c'est le demon pour les risques de sécu
- l'idéal c'est de tourner non root le moteur et dans le container (meme si encore beaucoup d'images s'attendent a être root les folles)


### Cloud

Kubernetes 1.26 avec notamment une de corrélation de l’hébergement de la Registry par Google [https://www.infoq.com/news/2022/12/kubernetes-1-26/?utm_campaign=infoq_content&amp;utm_source=twitter&amp;utm_medium=feed&amp;utm_term=Devops](https://www.infoq.com/news/2022/12/kubernetes-1-26/?utm_campaign=infoq_content&amp;utm_source=twitter&amp;utm_medium=feed&amp;utm_term=Devops)



### Web

Evan You, le créateur de Vue.js revient sur l’année 2022
[https://blog.vuejs.org/posts/2022-year-in-review.html](https://blog.vuejs.org/posts/2022-year-in-review.html)

- C’est la grande migration de Vue 2 vers Vue 3
- Migration de l’API Composition de Vue 3 vers l’API Options de Vue 2 (mais supporté encore en 3)
- La documentation de Vue propose Vue 3 par défaut depuis février
- Pendant la phase de transition, gros focus sur l’outillage et l’expérience développeur
- L’écosystème a bien adopté Vue 3 et continue de le faire au fur et à mesure
- Pour 2023, espère faire plus de releases mineures régulières, et travail sur le “vapor mode” qui propose une stratégie de compilation  plus rapide


### Data

Un article de Stephan Schmidt qui suggère d’utiliser PostgreSQL... pour tout !
[https://www.amazingcto.com/postgres-for-everything/](https://www.amazingcto.com/postgres-for-everything/)

- pour du caching à la place de REDIS
- comme une queue de messages
- pour stocker des documents JSON au lieu de MongoDB
- pour faire des requêtes géo-spatiales
- pour le full-text search à la place d’ElasticSearch
- pour générer du JSON directement en base
- comme stockage / adaptateur pour GraphQL ou pour Timescale (base de données time-series)


### Outillage

ChatGPT en action sur le design d’un nouveau langage de programmation [https://judehunter.dev/blog/chatgpt-helped-me-design-a-brand-new-programming-language](https://judehunter.dev/blog/chatgpt-helped-me-design-a-brand-new-programming-language)


ChatGPT, on lui attribue plus de magie qu’il n’en a [https://arxiv.org/pdf/2212.03551.pdf](https://arxiv.org/pdf/2212.03551.pdf)


Github rajoute le scan des secrets dans vos répos publics aussi
[https://github.blog/2022-12-15-leaked-a-secret-check-your-github-alerts-for-free/](https://github.blog/2022-12-15-leaked-a-secret-check-your-github-alerts-for-free/)

- ce n’est plus seulement pour les organisations des entreprises
- aussi accessible pour les répos publics
- permet d’éviter de leaker des clés d’API et autre

Les nouveautés de Java sur Visual Studio Code
[https://foojay.io/today/java-on-visual-studio-code-update-december-2022/](https://foojay.io/today/java-on-visual-studio-code-update-december-2022/)

- amélioration visuelles pour les extensions Spring Boot et aussi pour la visualisation de la mémoire utilisée
- complétion “post-fix” comme dans IntelliJ
- plus de raccourcis pour générer du code
- support de Lombok intégré
- support de l’annotation processing de Gradle
- meilleure visualisation des erreurs de build
- 2 millions de développeurs utilisent Visual Studio Code pour Java

Encore un guide pour sortir de Vi
[https://thevaluable.dev/vim-advanced/](https://thevaluable.dev/vim-advanced/)


Le client HTTP de IntelliJ peut maintenant être utilisé en ligne de commande et dans un environnement d’intégration continue
[https://blog.jetbrains.com/idea/2022/12/http-client-cli-run-requests-and-tests-on-ci/](https://blog.jetbrains.com/idea/2022/12/http-client-cli-run-requests-and-tests-on-ci/)



### Architecture

L'évolution du rôle de l'architecte [https://www.infoq.com/articles/architecture-architecting-role/](https://www.infoq.com/articles/architecture-architecting-role/)


Le (très long) rapport des tendances 2023 par Didier Girard et Olivier Rafal
[https://www.linkedin.com/pulse/rapport-tendances-2023-didier-girard/?trackingId=wu9pJ4wNQAOKjh11R2UyjA%3D%3D](https://www.linkedin.com/pulse/rapport-tendances-2023-didier-girard/?trackingId=wu9pJ4wNQAOKjh11R2UyjA%3D%3D)

- un prisme tech/orga/culture pour préparer l’entreprise aux enjeux 
- un prisme produits/plateformes/data pour structurer notre approche d’un SI moderne.
- couvre des tonnes de sujets de l’intelligence artificielle, les données, le cloud, le web1/2/3, mais aussi l’organisation des équipes, les rôles, etc.

### Loi, société et organisation

Twitter n’apprécie guère Mastodon, et bride les tweets avec des liens vers Mastodon. La liberté d’expression façon Elon Musk !
[https://twitter.com/bluxte/status/1603656787097534464](https://twitter.com/bluxte/status/1603656787097534464)

- Statement de Mastodon sur le fait que Twitter bannit les liens vers Mastodon [https://blog.joinmastodon.org/2022/12/twitter-suspends-mastodon-account-prevents-sharing-links/](https://blog.joinmastodon.org/2022/12/twitter-suspends-mastodon-account-prevents-sharing-links/)
- Et finalement Twitter est revenu en arrière sur son changement des conditions d’utilisation

Dans la famille “les informaticiens ont des supers passions”, je voudrais Cédric Champeau, qui nous fait une magnifique rétrospective de ces clichés d’astrophotographie
[https://melix.github.io/blog//2022/12/astrophoto-2022.html](https://melix.github.io/blog//2022/12/astrophoto-2022.html)





## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 19 janvier 2023 : [Archilocus](https://www.archilocus.tech/about) - Bordeaux (France)  <a href="https://conference-hall.io/public/event/qII4ZCroLOcGUtnr0W3M"><img alt="Archilocus Winter 2023" src="https://img.shields.io/static/v1?label=CFP&message=December-31-2022&color=green"> </a>
- 19-20 janvier 2023 : [Touraine Tech](https://touraine.tech/) - Tours (France)  <a href="https://conference-hall.io/speaker/event/3lWSdH0pfZkHEAL7RWSJ"><img alt="Touraine Tech 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%20September-30%20to%20November-27-2022&color=red"> </a>
- 25-28 janvier 2023 : [SnowCamp](https://snowcamp.io/fr/) - Grenoble (France)  <a href="https://conference-hall.io/public/event/ZGJWM1x64evaNUzycEzn"><img alt="CFP SnowCamp 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2022&color=red"> </a>
- 31 janvier 2023 : [Duck Conf](https://www.laduckconf.com/) - Paris (France) 
- 2 février 2023 : [Very Tech Trip](https://conference-hall.io/public/event/hoyBWUXe43dnoiBekZaB) - Paris (France)  <a href="https://conference-hall.io/public/event/hoyBWUXe43dnoiBekZaB"><img alt="CFP Very Tech Trip 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-November-2022&color=red"> </a>
- 2 février 2023 : [AgiLeMans](https://www.agilemans.org/) - Le Mans (France)  <a href="https://sessionize.com/7ieme-journee-agile-au-mans-france-e/"><img alt="CFP Very Tech Trip 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-December-2022&color=red"> </a>
- 9-11 février 2023 : [World AI Cannes Festival](https://worldaicannes.com/) - Cannes (France) 
- 16-19 février 2023 : [PyConFR](https://www.pycon.fr/2023/) - Bordeaux (France)  <a href="https://cfp-2023.pycon.fr/"><img alt="CFP PyConFr 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-Janvier-2023&color=green"> </a>
- 7 mars 2023 : [Kubernetes Community Days France](https://community.cncf.io/events/details/cncf-kcd-france-presents-kubernetes-community-days-france-2023/) - Paris (France)  <img alt="CFP KCD Paris" src="https://img.shields.io/static/v1?label=CFP&message=from%20September-15%20to%20November-13-2022&color=red">
- 23-24 mars 2023 : [SymfonyLive Paris](https://live.symfony.com/2023-paris/) - Paris (France)  <a href="https://live.symfony.com/2023-paris/cfp"><img alt="CFP SymfonyLive Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-December-2022&color=red<"></a>
- 23-24 mars 2023 : [Agile Niort](https://agileniort.fr/) - Niort (France)  <a href="https://sessionize.com/agile_niort_2023"><img alt="CFP AgileNiort" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-December-2022&color=green"></a>
- 1-2 avril 2023 : [JdLL](https://jdll.org/) - Lyon 3e (France)  <a href="https://jdll.org/participer"><img alt="CFP JDLL" src="https://img.shields.io/static/v1?label=CFP&message=until 31-January2023&color=green"></a>
- 5-7 avril 2023 : [FIC](https://europe.forum-fic.com) - Lille Grand Palais (France) 
- 12-14 avril 2023 : [Devoxx France](https://www.devoxx.fr/) - Paris (France)  <a href="https://cfp.devoxx.fr/"><img alt="CFP Devoxx France" src="https://img.shields.io/static/v1?label=CFP&message=from%20November-21%20to%20January-8-2023&color=green"></a>
- 20-21 avril 2023 : [Toulouse Hacking Convention 2023](https://thcon.party/) - Toulouse (France)  <a href="https://thcon.party/cfp.html"><img alt="CFP THCon 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%205-February-2023&color=green"> </a>
- 4-6 mai 2023 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece)  <a href="https://dvgr23.cfp.dev/"><img alt="CFP Devoxx Greece 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2023&color=green"></a>
- 10-12 mai 2023 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK)  <a href="https://devoxxuk23.cfp.dev/#/"><img alt="CFP Devoxx UK 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2023&color=green"></a>
- 12 mai 2023 : [AFUP Day](https://event.afup.org/) - lle & Lyon (France)  <a href="https://event.afup.org/"><img alt="CFP AFUP Day 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-November-2022&color=red"></a>
- 25-26 mai 2023 : [Newcrafts Paris](https://ncrafts.io/) - Paris (France)  <a href="https://sessionize.com/newcrafts-paris-2023"><img alt="CFP Newcrafts Paris 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2001-December-2022%20to%2012-February-2023&color=green"></a>
- 26 mai 2023 : [Devfest Lille](https://devfest.gdglille.org/) - Lille (France)  <a href="https://conference-hall.io/public/event/hRA5AjQjXYMPI3MpwyoF"><img alt="CFP Devfest Lille 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2003-Jan-2023%20to%20-31-March-2023&color=green"></a>
- 27 mai 2023 : [Polycloud](https://polycloud.fr) - Montpellier (France)  <a href="https://conference-hall.io/public/event/OR1ldOA5G0ASoizWvVbO"><img alt="Polycloud" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-April-2023&color=green"></a>
- 7 juin 2023 : [Serverless Days Paris](https://paris.serverlessdays.io/fr/) - Paris (France)  <a href="https://sessionize.com/serverlessdays-paris-2023/"><img alt="CFP Serverless Days Paris 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-February-2023&color=green"></a>
- 15-16 juin 2023 : [Le Camping des Speakers](https://camping-speakers.fr/) - Baden (France)  <a href="https://conference-hall.io/public/event/HDF3RTtlPRv7WIuxthtr"><img alt="CFP Camping Speakers June 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=green"></a> 
- 29-30 juin 2023 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France)  <a href="https://conference-hall.io/public/event/Jnevkv3bLyxZOyYyiWSC"><img alt="CFP Sunny Tech 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=green"></a>
- 19 septembre 2023 : [Salon de la Data Nantes](https://salondata.fr/index.php/le-salon/) - Nantes (France) & Online 
- 21-22 septembre 2023 : [API Platform Conference](https://api-platform.com/con/2023) - Lille (France) & Online 
- 2-6 octobre 2023 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 12 octobre 2023 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) 
- 12-13 octobre 2023 : [Volcamp 2023](https://www.volcamp.io/) - Clermont-Ferrand (France) 
- 6-7 décembre 2023 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

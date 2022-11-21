---
title: LCC 288 - L'épisode marathon mastodonien
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 288
mp3_length: 73457029
tweet: L'épisode marathon mastodonien #graalvm #golang #springframework #docker #quarkus #mastodon
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans ce long épisode, retrouvez Emmanuel, Guillaume, Antonio et Arnaud qui reviennent sur les dernières sorties de GraalVM, GoLang, JBanking, Spring, Spring Modulith, Quarkus, Apache Maven. Vous retrouverez aussi de nombreux sujets infrastructure, cloud, méthodologie le tout accompagné d'un pachyderme très à la mode en ce moment: Mastodon.

Enregistré le 18 novembre 2022

Téléchargement de l’épisode [LesCastCodeurs-Episode-288.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-288.mp3)

## News

### Langages

**Alina Yurenko annonce la sortie de GraalVM 22.3**
[https://medium.com/graalvm/graalvm-22-3-is-here-jdk-19-builds-jlink-support-new-monitoring-features-and-more-f6e2b2eeff95](https://medium.com/graalvm/graalvm-22-3-is-here-jdk-19-builds-jlink-support-new-monitoring-features-and-more-f6e2b2eeff95)

- l’article mentionne l’annonce faite à JavaOne qu’Oracle contribue GraalVM CE à la communauté Open JDK [https://www.graalvm.org/2022/openjdk-announcement/](https://www.graalvm.org/2022/openjdk-announcement/)
- support du JDK 19
- possibilité de télécharger facilement (dans un script) la distribution avec un one-line (bash/curl)
- possibilité de compiler jWebserver en un exécutable natif
- diverses améliorations sur le monitoring et l’expérience développeur de native image (JFR, jvmstat, head dump...)
- nouvelles versions des reachability metadata
- nouvelle API native image
- et diverses autres updates sur le support de Python, de Ruby, des contributions de la communauté

**Go fête ses 13 ans**
[https://go.dev/blog/13years](https://go.dev/blog/13years)

- avec la grosse release de 1.18, avec le support des workspaces, du fuzzing, mais surtout des generics
- aussi une commande govuln qui fait analyse statique - intéressant la notion d’outil dans le langage
- les build go sont vérouillés vu qu’ils reconstruisent tout et qu’ils dépendent d’un sha1 pour les dependences git et beaucoup plus de choses ici [https://go.dev/blog/supply-chain](https://go.dev/blog/supply-chain)
- workspace qui permet de travailler sur plusieurs modules en parallèle sans avoir a changer tous les `go.mod`  à la main

### Librairies

**Sortie de JBanking 4 par Marc Wrobel**
[https://www.marcwrobel.fr/sortie-de-jbanking-4-0-0](https://www.marcwrobel.fr/sortie-de-jbanking-4-0-0)

- Une librairie utilitaire pour assister dans le développement d’applications bancaires
- Support des codes ISO des pays, des monnaies, des codes BIC, des IBAN, et aussi du calendrier des jours fériés des banques internationales

**Spring Modulith**, un projet expérimental d’Oliver Drotbohm, qui permet de s’assurer de la structure et architecture de ses projets Spring, par exemple pour vérifier les dépendances propres entre modules, pour bien structurer ses applications Spring Boot
[https://spring.io/blog/2022/10/21/introducing-spring-modulith](https://spring.io/blog/2022/10/21/introducing-spring-modulith)

**Une version alpha de Quarkus 3 arrive !**
[https://quarkus.io/blog/road-to-quarkus-3/](https://quarkus.io/blog/road-to-quarkus-3/)

- Plein d’upgrades : Hibernate ORM 6, Jakarta EE 10, Eclipse MicroProfile 6, HTTP/3, io_uring, Virtual Threads de Loom et Structured Concurrency, java.util.concurrent.Flow pour s’affranchir de Reactive Streams
- Version cible Java 11, mais recommendation d’utiliser Java 17
- les versions 3 seront en parallèle des versions 2 le temps que l'écosystème passe à la 3, notamment les dependences jakartaee
- peut essayer facilement depuis la CLI `quarkus create app --stream=3.0`
- quelques casse de compatibilités attendues mais minimisées, spécialement dans le core
- garde java 11 car demande de la communauté

**Spring 6.0 est sorti**
[https://spring.io/blog/2022/11/16/spring-framework-6-0-goes-ga](https://spring.io/blog/2022/11/16/spring-framework-6-0-goes-ga)

- Java 17+ de base
- Jakarta EE 9+
- Hibernate 6+
- foundations pour Ahead of Time transformations pour GraalVM
- Exploration des threads virtuels [https://spring.io/blog/2022/10/11/embracing-virtual-threads](https://spring.io/blog/2022/10/11/embracing-virtual-threads)
  - tester sur les threads servlets et autre
- SpringBoot arrive plus tard
- Détail des changements [https://github.com/spring-projects/spring-framework/wiki/What%27s-New-in-Spring-Framework-6.x/](https://github.com/spring-projects/spring-framework/wiki/What%27s-New-in-Spring-Framework-6.x/)

### Infrastructure

**Stop using CPU limits on Kubernetes**
[https://home.robusta.dev/blog/stop-using-cpu-limits](https://home.robusta.dev/blog/stop-using-cpu-limits)

- L’auteur fait une comparaison amusante avec le besoin de boire de l’eau !
- Il vaut mieux définir des requêtes (des besoins en eau / CPU), plutôt que des limites (pas le droit de boire plus / d’utiliser plus de CPU)
- c’est plus nuancé que ca, parce que aux cas limites des choses peuvent mal se passer
- cas 1: on atteind 100% d’usage. Le process avait définit un request mais en fait a besoin de plus en pratique, et là paf il se met à mal fonctionner, donc dès que votre systeme stresse, vous avez des erreurs en cascade
- cas 2: un ou plusieurs noeuds sont recyclés, ce qui veut dire que vous avez beaucoup de redémarrages de pods et du coup ca met la pression sur le CPU, tester ces cas là, certaines applis qui démarrent trop lentement ont tendance à tomber en cascade

**Comment faire des attaques d’injection sur les intelligences artificielles** qui recoivent du contenu utilisateur [https://hackaday.com/2022/09/16/whats-old-is-new-again-gpt-3-prompt-injection-attack-affects-ai/](https://hackaday.com/2022/09/16/whats-old-is-new-again-gpt-3-prompt-injection-attack-affects-ai/)

- le jeu est de donner des phrases ambigues qui font faire à l’IA des choses qu’elle n’est pas sensé faire
- un des outils c’est ignore les instructions au dessus et fait un truc que je veux que tu fasses et qui n’est pas dans ta programmation initiale
- Voir toucher l’intention initiale de l’AI (lui faire dire) et donc d’atteindre des sphères non publiques du service

**Mastodon et la scalabilité** [https://framablog.org/2022/11/13/de-la-friture-sur-le-fediverse/](https://framablog.org/2022/11/13/de-la-friture-sur-le-fediverse/)

- la decentralisatione et le protocole Mastodon est couteux en job
- donc une personne moderement populaire 27k personnes, devrait bouger vers son instance dédiée
- ce qui amènerait à couter assez cher par mois (en tous cas plus que 8$/mois)
- L'auteur explique que les devs devraient favorier un protocol fortement decentraliser plutot qu'optimiser pour les grosses instances
- un article qui couvre la configuration aux petits oignons de Sidekiq, qui traite les queues de tâches, pour scaler une instance Mastodon [https://nora.codes/post/scaling-mastodon-in-the-face-of-an-exodus/](https://nora.codes/post/scaling-mastodon-in-the-face-of-an-exodus/)

**Rollouts de release a l'échelle avec Argo** (rollback options) [https://monzo.com/blog/2022/11/02/argo-rollouts-at-scale/](https://monzo.com/blog/2022/11/02/argo-rollouts-at-scale/)

- gros investissement sur ArgoCD
- Mais encore release à la main par les ingenieurs et tout ou rien pour une application
- idealement: push dans git et oublie, prometheus metriques dirigent le rollout basé sur des alertes génériques, garder le sisteme ouvert pour des stratégies de rollout alternatives dans le futur
- basé sur Argo Rollouts et sur des erreurs generiques (20% de calls en erreur, beaucoup d'erreurs de base de donnees, crashs
- notifie dans slack en async du success ou de l'echec
- interessant de voir qu'ils s'appuient sur des metriques simples
- Lessons apprises
- migration est un gros job
- automatiser la migration au maximum meme si c'est un one shot
- change le moteurt avant de changer l'UX (progressive rollout) ca simplifie les chosez

### Cloud

**Google adopte progressivement Adoptium Temurin** comme version officielle de JDK dans ses produits
[https://glaforge.appspot.com/article/building-and-deploying-java-17-apps-on-cloud-run-with-cloud-native-buildpacks-on-temurin](https://glaforge.appspot.com/article/building-and-deploying-java-17-apps-on-cloud-run-with-cloud-native-buildpacks-on-temurin)

- nous avions mentionné l’annonce de ce support dans l’épisode précédent [https://blog.adoptium.net/2022/10/adoptium-welcomes-google/](https://blog.adoptium.net/2022/10/adoptium-welcomes-google/)
- dans l’article de Guillaume, il utilise les Cloud Native Buildpacks, configuré pour utiliser Java 17, et par défaut, c’est bien Temurin qui est utilisé quand on build à partir des sources
- dans l’exemple, une application Micronaut, développée avec Java 17, est déployée sur Google Cloud Run

**Pourquoi on quitte le Cloud** [https://world.hey.com/dhh/why-we-re-leaving-the-cloud-654b47e0](https://world.hey.com/dhh/why-we-re-leaving-the-cloud-654b47e0)

- témoignage de DHH de 37Signal (basecamp et hey)
- Les 30% de marges d’Amazon viennent de quelque part.
- On dépense 500k en RDS et ES. On peut acheter beaucoup de machines pour ce prix
- La réduction des ops est un mythe. On a autant de personnes gérant les services AWS ou Google Cloud
- Le gain pourrait être la micro startup qui ne sait pas si elle aura des clients ou les volumes de demandes très variables et
- imprédictibles
- Mais on a une croissance planifiée
- Donc on rapatrie  

Présentation de Mickaël Roger de Thales, enregistrée à Cloud Nord, qui explique le **fonctionnement de l’offre S3NS de Thales et Google Cloud pour le “cloud de confiance”** [https://www.youtube.com/watch?v=OBwBeqd-YFs](https://www.youtube.com/watch?v=OBwBeqd-YFs)

### Web

**Est-ce que le Web3 peut battre le cloud ?**
[https://blog.scottlogic.com/2022/10/31/can-web3-beat-the-cloud.html](https://blog.scottlogic.com/2022/10/31/can-web3-beat-the-cloud.html)

- Le Web3 est une autre approche pour des applications décentralisées, ce n’est pas un successeur du Web 2.0 classique, et il a généralement besoin du Web 2.0 pour offrir une interface à ses utilisateurs
- Ce n’est pas que pour faire des cryptomonnaies qui gâchent de l’électricité, ou des NFTs qui ne donnent pas vraiment de titre de propriété d’une oeuvre d’art
- Dans cet article, l’auteur essaie d’implémenter une fonctionnalité (le fait de pouvoir rajouter des “applaudissements” à un article, un peu comme sur Medium), en implémentant un smart contract en Web3.
- Mais il se heurte à plein d’écueils le long de sa route, à la dépendance à plein d’autres services, au fait que ce n’est pas la personne qui “vote” qui devrait payer l’action mais celui qui héberge. Au final, il est obligé d’ajouter plein d’adhérences qui font qu’au lieu d’être décentralisée, l’application dépends de trop d’autres services, et a finalement besoin du Web 2.0 pour fonctionner, et du Cloud
- L’autre déconvenue est sur le prix de chacune des transactions, qui est finalement exorbitant par rapport à une approche Web 2.0 classique
- Décentralisation amène de la lenteur (latence)
- Objectifs du Web3 c’est d’etre le propriétaire de ses processes et ses data et de mettre des agents qui interagissent avec des données

### Outillage

**Comment debugguer les images Docker slim ou distroless**
[https://iximiuz.com/en/posts/docker-debug-slim-containers/](https://iximiuz.com/en/posts/docker-debug-slim-containers/)

- Les images slim / distroless sont sympas car elles permettent d’avoir des petits conteneurs qui ne prennent pas trop de place, qui parfois sont plus rapides à charger, mais également qui exposent une surface d’attaque beaucoup plus faible
- Par contre, comme il n’y a pas tous les outils (parfois pas de shell, par exemple), c’est plus compliqué de comprendre ce qu’il se passe à l’intérieur quand quelque chose ne fonctionne pas
- L’article propose quelques approches pour pallier à cela :
- Installer des outils à la demande dans un conteneur qui tourne (à coup de apt-get)
- Passer temporairement à une image plus grosse et plus complète (par ex, distroless a des images avec un tag debug)
- Utiliser docker run avec un shared namespace
- Utiliser docker exec et un mount

**Podman Desktop**, une alternative à Docker Desktop, mais utilisant podman
[https://podman-desktop.io/](https://podman-desktop.io/)

**Docker annonce une technical preview de conteneurs WASM**
[https://www.docker.com/blog/docker-wasm-technical-preview/](https://www.docker.com/blog/docker-wasm-technical-preview/)

- nouveau packaging qui wrap un exécutable WASM et le fait tourner avec le runtime wasmEdge
- c’est un nouveau type de conteneur
- il y a beaucoup d’activité autour de WASM, et il y a eu de nombreuses annonces et démonstration lors de la conférence CloudNativeCon et le jour spécial sur WASM, lors de KubeCon
- [https://www.infoq.com/news/2022/11/cloud-native-wasm-day/](https://www.infoq.com/news/2022/11/cloud-native-wasm-day/)
- docker utilise Docker Desktop et docker engine pour demarrer des “shim"
- Ses shim (processeS) lancent soit runc (donc pour faire tourner un containeur)
- soit wasmedge pour faire tourner des modules wasm
- Donc docker s’éloigne des container et essaie de toucher l’orchestration

**Un petit tutoriel utilisant Docker et YouTube-dl pour récupérer / consulter les stats (views, likes) de vos vidéos (ou d’autres) sur YouTube**
[https://glaforge.appspot.com/article/retrieve-youtube-views-count-with-youtube-dl-jq-and-a-docker-container](https://glaforge.appspot.com/article/retrieve-youtube-views-count-with-youtube-dl-jq-and-a-docker-container)

**Apache Maven propose une extension de “build cache”** (qui devrait accélérer les builds, sans tout tout le temps recompiler)
[https://maven.apache.org/extensions/maven-build-cache-extension/](https://maven.apache.org/extensions/maven-build-cache-extension/)

- basé sur une clé construite des sources, des plugins etc par module
- permet paralelisation et de deploiement sur des agents genre dans le cloud
- on controle les regles de contournement des invarients (genre changement de compile, timestamp dans les manifests etc)

**Le guide complet pour publier une librairie Java sur Maven Central**
[https://maciejwalkowiak.com/blog/guide-java-publish-to-maven-central/](https://maciejwalkowiak.com/blog/guide-java-publish-to-maven-central/)

- Y compris l’intégration avec Github Actions
- et l’utilisation de Github Secrets pour les clés PGP
- Et enfin la configuration de JReleaser pour encore faciliter la tâche lorsque l’on pousse une nouvelle version

**Apache Maven 4.0.0-alpha-2** is out
[https://maven.apache.org/docs/4.0.0-alpha-2/release-notes.html](https://maven.apache.org/docs/4.0.0-alpha-2/release-notes.html)

- améliorations cli: `--also-make` , `--resume` (plus besoin de pré ciser d’où le build doit recommencer), `--non-recursive`, `--fail-on-severity`
- Utilisation du même   timestamps dans tous les modules
- build/consumer POMs (versioning automatique du parent, versioning automatique des dépendances dans le réacteur, détection automatique des sous modules)
- new maven 4 api
- et beaucoup d’autres choses: [https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12351403&amp;projectId=12316922](https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12351403&amp;projectId=12316922)

**Data Faker le nouveau générateur de données de test** [https://github.com/datafaker-net/datafaker](https://github.com/datafaker-net/datafaker)

- C’est un fork de Java Faker [https://github.com/DiUS/java-faker](https://github.com/DiUS/java-faker)
- Tout ça inspiré de Ruby Faker [https://github.com/faker-ruby/faker](https://github.com/faker-ruby/faker)
- La boite australienne qui l’avait créé ne maintenait plus le projet, ne le publiait plus dans Maven Central et il y avait des centaines de PRs
- Vous pouvez générer des données de centaines de provider (ex. adresse, compte bancaire, livres, films, etc) [https://github.com/datafaker-net/datafaker#providers](https://github.com/datafaker-net/datafaker#providers) en plusieurs langues

**Exécuter facilement des programmes Java avec dépendances, sans build, avec JBang**
[https://maciejwalkowiak.com/blog/single-file-java-with-jbang/](https://maciejwalkowiak.com/blog/single-file-java-with-jbang/)

- Dans la même veine que ce que Groovy propose depuis de nombreuses années avec sons système @Grapes qui récupère les dépendances nécessaires
- L’article montre un exemple simple, puis avec Spring Boot, comment faire un JAR aussi, voire comment conteneurisé sa petite appli

### Architecture

**Amélie Benoit continue ses fabuleux sketchnotes** sur le thème des design patterns
[https://twitter.com/AmelieBenoit33/status/1587397290251149312](https://twitter.com/AmelieBenoit33/status/1587397290251149312)

- celui ci est sur le pattern Adapter
- il y a eu aussi le pattern Builder [https://twitter.com/AmelieBenoit33/status/1584778615610228737](https://twitter.com/AmelieBenoit33/status/1584778615610228737)
- l’Observer [https://twitter.com/AmelieBenoit33/status/1579706242318360576](https://twitter.com/AmelieBenoit33/status/1579706242318360576)
- ou le Singleton [https://twitter.com/AmelieBenoit33/status/1570313646605234177](https://twitter.com/AmelieBenoit33/status/1570313646605234177)
- [https://twitter.com/AmelieBenoit33/status/1589869904404316162](https://twitter.com/AmelieBenoit33/status/1589869904404316162)
- Un petit coup de décorateur
- [https://twitter.com/AmelieBenoit33/status/1592468635599372289](https://twitter.com/AmelieBenoit33/status/1592468635599372289)

**35 misconceptions sur les dates et les heures**
[https://www.meziantou.net/misconceptions-about-date-and-time.htm](https://www.meziantou.net/misconceptions-about-date-and-time.htm)

- y a t’il toujours 24 heures par jour, 60 secondes dans une minute? ou 365 jours par an ?
- est-ce que les jours sont toujours consécutifs ?
- tout le monde a t’il le même calendrier ?
- lundi est il le premier jour de la semaine ?

### Méthodologies

**Interview d’un designer sur comment enlever la friction** [https://review.firstround.com/amazons-friction-killing-tactics-to-make-products-more-seamless?ct=t](https://review.firstround.com/amazons-friction-killing-tactics-to-make-products-more-seamless?ct=t)

- designer a Amazon (Music, Alexa), IMDB, Skype for Business
- types de fictions (choses non familières, friction inhérente - produit avancé - et chemin de friction important, friction par desalignement avec le comportement humain)
- la troisième catégorie difficile à anticiper
- en construisant des produits: on ajoute, enlève ou marque des frictions
- C’est sur le chemin du client
  1. Avant le premier contact
  2. Signature et premiere tâche transactionnelle (bien choisir la tache pour etre assez simple et ce que l’utilisateur répète)
  3. Premier moment de plaisir (regarder les points contre intuitifs dans les données, ou les cas d’utilisation en echec)
- l’indifférence genre la friction la plus importante pour les nouveaux produits
- Comment écouter son utilisateur?
- habitat naturel: sondes dans l’appli, tests chez l’utilisateur en milieu reel en utilisation du produit
- mentions et revues: aussi métriques d’usage (choses inhabituelles ou inattendues)
- standard de l’industrie: attentes des clients façonné par ça (barre de recherche en haut)
- Toujours migrer son audience vers le chemin de moindre resistance
- Comment éliminer la friction?
- réduire l’anxiété: décision et perte amènent de l’anxiété.
- supprimer les étapes non nécessaires: définir la liste des decisions du client et les questionner. (Heuristiques par defaut?)
- mitiger le changement de contexte: naviguer hors de l’appli pour faire quelque chose, risque d’abandon. Arrêter un livre pour lire un mot dans le dictionnaire, faciliter le retour et le rappel du contexte quand ils reviennent.
- Comment masquer la friction?
- temps d’attente: trouver de la valeur (message d’information)
- bouger la friction au début dans les services (carte credit tout de suite)
- s'ils investissent dans leur experience (vote), ils sont plus engagés et loyaux: friction positive : sense d’appartenance

**Glossaire et aide-mémoire sur l’approche de l’Event Storming**
[https://github.com/ddd-crew/eventstorming-glossary-cheat-sheet](https://github.com/ddd-crew/eventstorming-glossary-cheat-sheet)

- Si vous ne connaissez pas event storming, ça ne va pas vous éclairer assez
- plutôt un outil pour rafraichir votre mémoire
- voir aussi episode sur event storming [https://lescastcodeurs.com/2020/06/05/lcc-233-interview-sur-l-event-storming-avec-thomas-pierrain-et-bruno-boucard/](https://lescastcodeurs.com/2020/06/05/lcc-233-interview-sur-l-event-storming-avec-thomas-pierrain-et-bruno-boucard/)

### Sécurité

**Sigstore passe en General Availability, en version 1**
[https://opensource.googleblog.com/2022/10/sigstore-project-announces-general-availability-and-v1-releases.html](https://opensource.googleblog.com/2022/10/sigstore-project-announces-general-availability-and-v1-releases.html)

- Sujet également couvert par InfoQ [https://www.infoq.com/news/2022/11/sigstore-stability-ga/](https://www.infoq.com/news/2022/11/sigstore-stability-ga/)
- Sigstore est la pour aider au niveau de la sécurisation de la supply chain de code
- Notamment au niveau des signatures
- Ca addresse ce que fait PGP amis le rend plus utilisable et permet un usage supplémentaire par un log lisible par tous
- Plus d’infos dans une interview on espère

### Loi, société et organisation

**La proposition de loi sur la sécurisation de l’open source aux Etats-Unis** [https://blog.tidelift.com/tidelift-advisory-us-senators-introduce-the-securing-open-source-software-act-of-2022](https://blog.tidelift.com/tidelift-advisory-us-senators-introduce-the-securing-open-source-software-act-of-2022) (edited)

**Holly Cummins sur le sujet du code vestimentaire des femmes dans la tech**
[https://hollycummins.com/fashion-and-programming-ii/](https://hollycummins.com/fashion-and-programming-ii/)

- Pourquoi en 2023 on a encore autant d’abrutis qui font des remarques sur les vêtements que portent les femmes qui font des présentations à des conférences, et pire, sur le fait de savoir si elles sont à leur goût ou pas
- La tenue vestimentaire n’a rien à voir avec le talent, les connaissances, le professionnalisme, l’expertise des personnes
- Les femmes ont le droit de porter les vêtements qu’elles veulent sans être jugées par des idiots qui feraient mieux de retourner dans leur caverne

**Avec le rachat de Twitter par Elon Musk, beaucoup de gens commencent à s’intéresser de plus près à Mastodon.** On trouve de nombreux articles sur Mastodon ces jours ci
[https://gorillasun.de/blog/getting-started-with-mastodon](https://gorillasun.de/blog/getting-started-with-mastodon)

- et vous, avez vous un compte sur Mastodon ?
- quelle instance avez-vous choisie ?
- quels outils (client, mobile, web, etc) utilisez vous ?
- Pour ma part je n'ai pas de compte Mastodon (je n'utilise pas twitter non plus). J'ai rapidement regardé ce matin ça n'est pas facile de trouver une instance : celles que j'ai regardé ont fermé les inscriptions (d'après ce que j'ai pu lire à cause de problèmes pour gérer l'afflux de nouveaux utilisateurs, à cause de l'augmentation de la création de comptes spam, ou dans l'objectif de répartir les utilisateurs sur d'autres instances moins connues). Du coup j'ai pour le moment abandonné l'idée de me créer un compte.
- Le site JavaBubble liste plein de développeurs Java qui ont maintenant un compte sur Mastodon [https://javabubble.org/](https://javabubble.org/)
- Les Cast Codeurs sur Mastodon : 
    - [@agoncal@fosstodon.org](https://fosstodon.org/@agoncal)
    - [@aheritier@mastodon.social](https://mastodon.social/@aheritier)
    - [@glaforge@uwyn.net](https://uwyn.net/@glaforge)
    - [@emmanuelbernard@mamot.fr](https://mamot.fr/@emmanuelbernard)

## Conférences

La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 23-25 novembre 2022 : [Agile Grenoble 2022](http://agile-grenoble.org/) - Grenoble (France)
- 25 novembre 2022 : [HACK-IT-N 2022](https://hack-it-n.com/) - Bordeaux (France)
- 1 décembre 2022 : [Devops DDay #7](https://2022.devops-dday.com/) - Marseille (France) <a href="https://conference-hall.io/public/event/eKYGzptI6y44zoS8sGUz"><img alt="CFP Devops DDay" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2022&color=red"> </a>
- 2 décembre 2022 : [BDX I/O](https://www.bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/OJC5Ou5YJodfetgSJCa3"><img alt="CFP BDX I/O" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-Jul-2022&color=red"> </a>
- 2 décembre 2022 : [DevFest Dijon 2022](https://www.linkedin.com/posts/developers-group-dijon_apr%C3%A8s-des-%C3%A9changes-avec-google-le-developers-activity-6973555910140903424-rjRH/) - Dijon (France) <a href="https://conference-hall.io/public/event/cXWCepNzXVWwb1i6ktVA"><img alt="CFP DevFest Dijon 2022" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-October-2022&color=red"> </a>
- 14-16 décembre 2022 : [API Days Paris](https://www.apidays.global/paris/) - Paris (France) & Online
- 15-16 décembre 2022 : [Agile Tour Rennes](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2022/"><img alt="Agile Tour Rennes" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2022&color=green"> </a>
- 19-20 janvier 2023 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/speaker/event/3lWSdH0pfZkHEAL7RWSJ"><img alt="Touraine Tech 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%20September-30%20to%20November-27-2022&color=green"> </a>
- 25-28 janvier 2023 : [SnowCamp](https://snowcamp.io/fr/) - Grenoble (France) <a href="https://conference-hall.io/public/event/ZGJWM1x64evaNUzycEzn"><img alt="CFP SnowCamp 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2022&color=red"> </a>
- 2 février 2023 : [Very Tech Trip](https://conference-hall.io/public/event/hoyBWUXe43dnoiBekZaB) - Paris (France) <a href="https://conference-hall.io/public/event/hoyBWUXe43dnoiBekZaB"><img alt="CFP Very Tech Trip 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-November-2022&color=green"> </a>
- 2 février 2023 : [AgiLeMans](https://www.agilemans.org/) - Le Mans (France) <a href="https://sessionize.com/7ieme-journee-agile-au-mans-france-e/"><img alt="CFP Very Tech Trip 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-December-2022&color=green"> </a>
- 9-11 février 2023 : [World AI Cannes](https://worldaicannes.com/) - Cannes (France)
- 16-19 février 2023 : [PyConFR](https://www.pycon.fr/2023/) - Bordeaux (France)
- 7 mars 2023 : [Kubernetes Community Days France](https://community.cncf.io/events/details/cncf-kcd-france-presents-kubernetes-community-days-france-2023/) - Paris (France) <img alt="CFP KCD Paris" src="https://img.shields.io/static/v1?label=CFP&message=from%20September-15%20to%20November-13-2022&color=green">
- 23-24 mars 2023 : [SymfonyLive Paris](https://live.symfony.com/2023-paris/) - Paris (France) <a href="https://live.symfony.com/2023-paris/cfp"><img alt="CFP SymfonyLive Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-December-2022&color=green"></a>
- 5-7 avril 2023 : [FIC](https://europe.forum-fic.com) - Lille Grand Palais (France)
- 12-14 avril 2023 : [Devoxx France](https://www.devoxx.fr/) - Paris (France)
- 10-12 mai 2023 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk23.cfp.dev/#/"><img alt="CFP Devoxx UK 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2023&color=green"></a>
- 12 mai 2023 : [AFUP Day](https://event.afup.org/) Lille & Lyon (France) <img alt="CFP AFUP Day 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-November-2022&color=green"></a>
- 12-13 octobre 2023 : [Volcamp 2023](https://www.volcamp.io/) - Clermont Ferrand (France)

## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

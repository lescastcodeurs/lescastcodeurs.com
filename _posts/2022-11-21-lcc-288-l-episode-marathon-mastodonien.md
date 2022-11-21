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
Dans ce long épisode, retrouvez Emmanuel, Guillaume, Antonio et Arnaud qui reviennent sur les dernières sorties de GraalVM, GoLang, jbanking, Spring, Spring Modulith, Quarkus, Apache Maven. Vous retrouverez aussi de nombreux sujets infrastructure, cloud, méthodologie le tout accompagné d'un pachyderme très à la mode en ce moment : Mastodon.

Enregistré le 18 novembre 2022

Téléchargement de l’épisode [LesCastCodeurs-Episode-288.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-288.mp3)

## News

### Langages

**Alina Yurenko annonce la sortie de GraalVM 22.3**
[https://medium.com/graalvm/graalvm-22-3-is-here-jdk-19-builds-jlink-support-new-monitoring-features-and-more-f6e2b2eeff95](https://medium.com/graalvm/graalvm-22-3-is-here-jdk-19-builds-jlink-support-new-monitoring-features-and-more-f6e2b2eeff95)

- L’article mentionne l’annonce faite à JavaOne qu’Oracle contribue GraalVM CE à la communauté OpenJDK : [https://www.graalvm.org/2022/openjdk-announcement/](https://www.graalvm.org/2022/openjdk-announcement/).
- Support du JDK 19.
- Possibilité de télécharger facilement (dans un script) la distribution avec un one-line (bash/curl).
- Possibilité de compiler `jwebserver` en un exécutable natif.
- Diverses améliorations sur le monitoring et l’expérience développeur de native image (JFR, jvmstat, head dump...).
- Nouvelles versions des reachability metadata.
- Nouvelle API native image.
- Et divers autres updates sur le support de Python, de Ruby, des contributions de la communauté.

**Go fête ses 13 ans**
[https://go.dev/blog/13years](https://go.dev/blog/13years)

- Avec la grosse release de 1.18, et le support des workspaces, du fuzzing, mais surtout des generics.
- Aussi une commande `govuln` qui fait analyse statique - intéressant la notion d’outil dans le langage.
- Les builds go sont verrouillés vu qu’ils reconstruisent tout, qu’ils dépendent d’un sha1 pour les dépendances git, et beaucoup [d’autres choses](https://go.dev/blog/supply-chain)).
- Workspace qui permet de travailler sur plusieurs modules en parallèle sans avoir à changer tous les `go.mod` à la main.

### Librairies

**Sortie de JBanking 4 par Marc Wrobel**
[https://www.marcwrobel.fr/sortie-de-jbanking-4-0-0](https://www.marcwrobel.fr/sortie-de-jbanking-4-0-0)

- Une librairie utilitaire pour assister dans le développement d’applications bancaires.
- Support des codes ISO des pays, des devises, des codes BIC, des IBAN, et aussi des calendriers de jours fériés.

**Spring Modulith**, un projet expérimental d’Oliver Drotbohm, qui permet de s’assurer de la structure et de l’architecture de ses projets Spring, par exemple pour vérifier les dépendances propres entre modules, pour bien structurer ses applications Spring Boot
[https://spring.io/blog/2022/10/21/introducing-spring-modulith](https://spring.io/blog/2022/10/21/introducing-spring-modulith)

**Une version alpha de Quarkus 3 arrive !**
[https://quarkus.io/blog/road-to-quarkus-3/](https://quarkus.io/blog/road-to-quarkus-3/)

- Plein d’upgrades : Hibernate ORM 6, Jakarta EE 10, Eclipse MicroProfile 6, HTTP/3, io_uring, Virtual Threads de Loom et Structured Concurrency, `java.util.concurrent.Flow` pour s’affranchir de Reactive Streams.
- Version cible Java 11, mais recommendation d’utiliser Java 17.
- Les versions 3 seront en parallèle des versions 2 le temps que l’écosystème passe à la 3, notamment les dépendances JakartaEE.
- Testable facilement depuis la CLI : `quarkus create app --stream=3.0`.
- Quelques casses de compatibilités attendues, mais minimisées (spécialement dans le core).
- Garde java 11, car demande de la communauté.

**Spring 6.0 est sorti**
[https://spring.io/blog/2022/11/16/spring-framework-6-0-goes-ga](https://spring.io/blog/2022/11/16/spring-framework-6-0-goes-ga)

- Java 17+ de base, Jakarta EE 9+, Hibernate 6+.
- Fondations pour Ahead of Time transformations pour GraalVM.
- Exploration des threads virtuels : [https://spring.io/blog/2022/10/11/embracing-virtual-threads](https://spring.io/blog/2022/10/11/embracing-virtual-threads) (testé sur les threads servlets et autre).
- Spring Boot arrive plus tard.
- Détail des changements [https://github.com/spring-projects/spring-framework/wiki/What%27s-New-in-Spring-Framework-6.x/](https://github.com/spring-projects/spring-framework/wiki/What%27s-New-in-Spring-Framework-6.x/).

### Infrastructure

**Stop using CPU limits on Kubernetes**
[https://home.robusta.dev/blog/stop-using-cpu-limits](https://home.robusta.dev/blog/stop-using-cpu-limits)

- L’auteur fait une comparaison amusante avec le besoin de boire de l’eau !
- Il vaut mieux définir des requêtes (des besoins en eau / CPU), plutôt que des limites (pas le droit de boire plus / d’utiliser plus de CPU).
- C’est plus nuancé que ça, parce qu’aux cas limites des choses peuvent mal se passer.
- Cas 1 : on atteint 100% d’usage. Le process avait défini une requête mais en fait a besoin de plus en pratique, et là paf il se met à mal fonctionner, donc dès que votre système stresse, vous avez des erreurs en cascade.
- Cas 2 : un ou plusieurs nœuds sont recyclés, ce qui veut dire que vous avez beaucoup de redémarrages de pods et du coup ça met la pression sur le CPU, tester ces cas-là, certaines applis qui démarrent trop lentement ont tendance à tomber en cascade.

**Comment faire des attaques d’injection sur les intelligences artificielles qui reçoivent du contenu utilisateur** [https://hackaday.com/2022/09/16/whats-old-is-new-again-gpt-3-prompt-injection-attack-affects-ai/](https://hackaday.com/2022/09/16/whats-old-is-new-again-gpt-3-prompt-injection-attack-affects-ai/)

- Le jeu est de donner des phrases ambiguës qui font faire à l’IA des choses qu’elle n’est pas censé faire.
- Un des outils, c’est ignore les instructions au-dessus et fait un truc que je veux que tu fasses et qui n’est pas dans ta programmation initiale.
- Voir toucher l’intention initiale de l’AI (lui faire dire) et donc d’atteindre des sphères non publiques du service

**Mastodon et la scalabilité** [https://framablog.org/2022/11/13/de-la-friture-sur-le-fediverse/](https://framablog.org/2022/11/13/de-la-friture-sur-le-fediverse/)

- La décentralisation et le protocole Mastodon est coûteux en jobs.
- Donc une personne modérément populaire (27k personnes) devrait bouger vers son instance dédiée.
- Ce qui amènerait à coûter assez cher par mois (en tout cas plus que 8$/mois).
- L’auteur explique que les devs devraient favoriser un protocole fortement décentralisé plutôt qu’optimiser pour les grosses instances.
- Un article qui couvre la configuration aux petits oignons de Sidekiq, qui traite les queues de tâches, pour scaler une instance Mastodon [https://nora.codes/post/scaling-mastodon-in-the-face-of-an-exodus/](https://nora.codes/post/scaling-mastodon-in-the-face-of-an-exodus/).

**Rollouts de release a l’échelle avec Argo** (rollback options) [https://monzo.com/blog/2022/11/02/argo-rollouts-at-scale/](https://monzo.com/blog/2022/11/02/argo-rollouts-at-scale/)

- Gros investissement sur ArgoCD.
- Mais encore release à la main par les ingénieurs et tout ou rien pour une application.
- Idéalement : push dans git et oublie, les métriques prometheus dirigent le rollout basé sur des alertes génériques, le système restant ouvert pour des stratégies de rollout alternatives dans le futur.
- Basé sur Argo Rollouts et sur des erreurs génériques (par ex. 20 % de calls en erreur, beaucoup d’erreurs de base de données, crashs).
- Notifie dans Slack en async du succès ou de l’échec.
- Intéressant de voir qu’ils s’appuient sur des métriques simples.
- Leçons apprises :
  - La migration est un gros travail.
  - Automatiser la migration au maximum même si c’est un one shot.
  - Mieux vaut changer le moteur avant de changer l’UX (progressive rollout), ça simplifie les choses.

### Cloud

**Google adopte progressivement Adoptium Temurin** comme version officielle de JDK dans ses produits
[https://glaforge.appspot.com/article/building-and-deploying-java-17-apps-on-cloud-run-with-cloud-native-buildpacks-on-temurin](https://glaforge.appspot.com/article/building-and-deploying-java-17-apps-on-cloud-run-with-cloud-native-buildpacks-on-temurin)

- Nous avions mentionné l’annonce de ce support dans l’épisode précédent : [https://blog.adoptium.net/2022/10/adoptium-welcomes-google/](https://blog.adoptium.net/2022/10/adoptium-welcomes-google/).
- Dans l’article de Guillaume, il utilise les Cloud Native Buildpacks, configuré pour utiliser Java 17, et par défaut, c’est bien Temurin qui est utilisé quand on build à partir des sources.
- Dans l’exemple, une application Micronaut, développée avec Java 17, est déployée sur Google Cloud Run.

**Pourquoi on quitte le Cloud** [https://world.hey.com/dhh/why-we-re-leaving-the-cloud-654b47e0](https://world.hey.com/dhh/why-we-re-leaving-the-cloud-654b47e0)

- Témoignage de DHH de 37signals (Basecamp et HEY).
- Les 30% de marges d’Amazon viennent de quelque part.
- On dépense 500k en RDS et ES. On peut acheter beaucoup de machines pour ce prix.
- La réduction des ops est un mythe. On a autant de personnes gérant les services AWS ou Google Cloud.
- Le gain pourrait être la micro startup qui ne sait pas si elle aura des clients ou les volumes de demandes très variables et imprédictibles.
- Mais on a une croissance planifiée, donc on rapatrie.

Présentation de Mickaël Roger de Thales, enregistrée à Cloud Nord, qui explique le **fonctionnement de l’offre S3NS de Thales et Google Cloud pour le “cloud de confiance”** [https://www.youtube.com/watch?v=OBwBeqd-YFs](https://www.youtube.com/watch?v=OBwBeqd-YFs)

### Web

**Est-ce que le Web3 peut battre le cloud ?**
[https://blog.scottlogic.com/2022/10/31/can-web3-beat-the-cloud.html](https://blog.scottlogic.com/2022/10/31/can-web3-beat-the-cloud.html)

- Le Web3 est une autre approche pour des applications décentralisées, ce n’est pas un successeur du Web 2.0 classique, et il a généralement besoin du Web 2.0 pour offrir une interface à ses utilisateurs.
- Ce n’est pas que pour faire des cryptomonnaies qui gâchent de l’électricité ou des NFTs qui ne donnent pas vraiment de titre de propriété d’une œuvre d’art.
- Dans cet article, l’auteur essaie d’implémenter une fonctionnalité (le fait de pouvoir rajouter des “applaudissements” à un article, un peu comme sur Medium), en implémentant un smart contract en Web3.
- Mais il se heurte à plein d’écueils : à la dépendance à plein d’autres services, au fait que ce n’est pas la personne qui “vote” qui devrait payer l’action, mais celle qui héberge. Au final, il est obligé d’ajouter plein d’adhérences qui font qu’au lieu d’être décentralisée, l’application dépends de trop d’autres services, et a finalement besoin du Web 2.0 et du Cloud pour fonctionner.
- L’autre déconvenue est sur le prix de chacune des transactions, qui est finalement exorbitant par rapport à une approche Web 2.0 classique.
- La décentralisation amène de la lenteur (latence).
- Objectifs du Web3 c’est d’être le propriétaire de ses processes et ses data et de mettre des agents qui interagissent avec des données.

### Outillage

**Comment déboguer les images Docker slim ou distroless**
[https://iximiuz.com/en/posts/docker-debug-slim-containers/](https://iximiuz.com/en/posts/docker-debug-slim-containers/)

- Les images slim / distroless sont sympas, car elles permettent d’avoir des petits conteneurs qui ne prennent pas trop de place, qui parfois sont plus rapides à charger, mais également qui exposent une surface d’attaque beaucoup plus faible.
- Par contre, comme il n’y a pas tous les outils (parfois pas de shell, par exemple), c’est plus compliqué de comprendre ce qu’il se passe à l’intérieur quand quelque chose ne fonctionne pas.
- L’article propose quelques approches pour pallier cela :
  - installer des outils à la demande dans un conteneur qui tourne (à coup de apt-get),
  - passer temporairement à une image plus grosse et plus complète (par ex, distroless a des images avec un tag debug),
  - utiliser docker run avec un shared namespace,
  - utiliser docker exec et un mount.

**Podman Desktop**, une alternative à Docker Desktop, mais utilisant Podman
[https://podman-desktop.io/](https://podman-desktop.io/)

**Docker annonce une technical preview des conteneurs WASM**
[https://www.docker.com/blog/docker-wasm-technical-preview/](https://www.docker.com/blog/docker-wasm-technical-preview/)

- Nouveau packaging qui wrap un exécutable WASM et le fait tourner avec le runtime wasmEdge.
- C’est un nouveau type de conteneur.
- Il y a beaucoup d’activité autour de WASM, et il y a eu de nombreuses annonces et démonstration lors de la conférence CloudNativeCon et le jour spécial sur WASM, lors de KubeCon.
- [https://www.infoq.com/news/2022/11/cloud-native-wasm-day/](https://www.infoq.com/news/2022/11/cloud-native-wasm-day/).
- Docker utilise Docker Desktop et Docker engine pour démarrer des _shims_.
- Ces shims (processes) lancent soit `runc` (donc pour faire tourner un conteneur), soit wasmedge pour faire tourner des modules wasm.
- Donc docker s’éloigne des conteneurs et essaie de toucher l’orchestration.

**Un petit tutoriel utilisant Docker et YouTube-dl pour récupérer / consulter les stats (views, likes) de vos vidéos (ou d’autres) sur YouTube**
[https://glaforge.appspot.com/article/retrieve-youtube-views-count-with-youtube-dl-jq-and-a-docker-container](https://glaforge.appspot.com/article/retrieve-youtube-views-count-with-youtube-dl-jq-and-a-docker-container)

**Apache Maven propose une extension de “build cache”** (qui devrait accélérer les builds, sans tout le temps recompiler)
[https://maven.apache.org/extensions/maven-build-cache-extension/](https://maven.apache.org/extensions/maven-build-cache-extension/)

- Basé sur une clé construite à partir des sources, des plugins etc (par module).
- Permet la parallélisation et le déploiement sur des agents genre dans le cloud.
- On contrôle les règles de contournement des invariants (genre changement de compile, timestamp dans les manifests...).

**Le guide complet pour publier une librairie Java sur Maven Central**
[https://maciejwalkowiak.com/blog/guide-java-publish-to-maven-central/](https://maciejwalkowiak.com/blog/guide-java-publish-to-maven-central/)

- y-compris l’intégration avec Github Actions,
- et l’utilisation de Github Secrets pour les clés PGP,
- et enfin la configuration de JReleaser pour encore faciliter la tâche lorsque l’on pousse une nouvelle version.

**Apache Maven 4.0.0-alpha-2** is out
[https://maven.apache.org/docs/4.0.0-alpha-2/release-notes.html](https://maven.apache.org/docs/4.0.0-alpha-2/release-notes.html)

- améliorations de la CLI : `--also-make` , `--resume` (plus besoin de préciser d’où le build doit recommencer), `--non-recursive`, `--fail-on-severity`,
- utilisation du même timestamp dans tous les modules,
- build / consumer POMs (versioning automatique du parent, versioning automatique des dépendances dans le réacteur, détection automatique des sous modules),
- new maven 4 API,
- et beaucoup d’autres choses : [https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12351403&amp;projectId=12316922](https://issues.apache.org/jira/secure/ReleaseNote.jspa?version=12351403&amp;projectId=12316922).

**Data Faker le nouveau générateur de données de test** [https://github.com/datafaker-net/datafaker](https://github.com/datafaker-net/datafaker)

- C’est un fork de Java Faker [https://github.com/DiUS/java-faker](https://github.com/DiUS/java-faker).
- Tout ça inspiré de Ruby Faker [https://github.com/faker-ruby/faker](https://github.com/faker-ruby/faker).
- La boite australienne qui l’avait créé ne maintenait plus le projet, ne le publiait plus dans Maven Central et il y avait des centaines de PRs.
- Vous pouvez générer des données de centaines de [provider](https://github.com/datafaker-net/datafaker#providers) (ex. adresse, compte bancaire, livres, films, etc) en plusieurs langues.

**Exécuter facilement des programmes Java avec dépendances, sans build, avec JBang**
[https://maciejwalkowiak.com/blog/single-file-java-with-jbang/](https://maciejwalkowiak.com/blog/single-file-java-with-jbang/)

- Dans la même veine que ce que Groovy propose depuis de nombreuses années avec sons système `@Grapes` qui récupère les dépendances nécessaires.
- L’article montre un exemple simple, puis avec Spring Boot, comment faire un JAR aussi, voire comment conteneuriser sa petite appli.

### Architecture

**Amélie Benoit continue ses fabuleux sketchnotes** sur le thème des design patterns
[https://twitter.com/AmelieBenoit33/status/1587397290251149312](https://twitter.com/AmelieBenoit33/status/1587397290251149312)

- celui-ci est sur le pattern adapter,
- il y a eu aussi [builder](https://twitter.com/AmelieBenoit33/status/1584778615610228737),
- [observer](https://twitter.com/AmelieBenoit33/status/1579706242318360576),
- [singleton](https://twitter.com/AmelieBenoit33/status/1570313646605234177),
- [stratégie](https://twitter.com/AmelieBenoit33/status/1589869904404316162),
- [decorator](https://twitter.com/AmelieBenoit33/status/1592468635599372289).

**35 misconceptions sur les dates et les heures**
[https://www.meziantou.net/misconceptions-about-date-and-time.htm](https://www.meziantou.net/misconceptions-about-date-and-time.htm)

- Y a-t-il toujours 24 heures par jour ? 60 secondes dans une minute ? Ou 365 jours par an ?
- Est-ce que les jours sont toujours consécutifs ?
- Tout le monde a-t-il le même calendrier ?
- Lundi est-il le premier jour de la semaine ?

### Méthodologies

**Interview d’un designer sur comment enlever la friction** [https://review.firstround.com/amazons-friction-killing-tactics-to-make-products-more-seamless?ct=t](https://review.firstround.com/amazons-friction-killing-tactics-to-make-products-more-seamless?ct=t)

- Designer à Amazon (Music, Alexa), IMDB, Skype for Business.
- Types de fictions : choses non familières, friction inhérente - produit avancé - et chemin de friction important, friction par désalignement avec le comportement humain.
- La troisième catégorie difficile à anticiper.
- En construisant des produits : on ajoute, enlève ou marque des frictions.
- C’est sur le chemin du client :
  1. avant le premier contact,
  2. signature et première tâche transactionnelle (bien choisir la tache pour être assez simple et ce que l’utilisateur répète),
  3. premier moment de plaisir (regarder les points contre intuitifs dans les données, ou les cas d’utilisation en échec).
- L’indifférence est la friction la plus importante pour les nouveaux produits.
- Comment écouter son utilisateur ?
  - Habitat naturel : sondes dans l’appli, tests chez l’utilisateur en milieu reel en utilisation du produit.
  - Mentions et revues : aussi métriques d’usage (choses inhabituelles ou inattendues).
  - Standard de l’industrie : attentes des clients façonnées par ça (barre de recherche en haut).
- Toujours migrer son audience vers le chemin de moindre résistance.
- Comment éliminer la friction ?
  - Réduire l’anxiété : décision et perte amènent de l’anxiété.
  - Supprimer les étapes non nécessaires : définir la liste des décisions du client et les questionner (heuristiques par défaut ?).
  - Mitiger le changement de contexte : naviguer hors de l’appli pour faire quelque chose, risque d’abandon. Arrêter un livre pour lire un mot dans le dictionnaire, faciliter le retour et le rappel du contexte quand ils reviennent.
- Comment masquer la friction ?
  - Temps d’attente : trouver de la valeur (message d’information).
  - Bouger la friction au début dans les services (carte de crédit tout de suite).
  - S’ils investissent dans leur expérience (vote), ils sont plus engagés et loyaux : friction positive : sentiment d’appartenance.

**Glossaire et aide-mémoire sur l’approche de l’Event Storming**
[https://github.com/ddd-crew/eventstorming-glossary-cheat-sheet](https://github.com/ddd-crew/eventstorming-glossary-cheat-sheet)

- Si vous ne connaissez pas l’event storming, ça ne va pas vous éclairer assez.
- Plutôt un outil pour rafraichir votre mémoire.
- Voir aussi l’épisode sur l’event storming : [https://lescastcodeurs.com/2020/06/05/lcc-233-interview-sur-l-event-storming-avec-thomas-pierrain-et-bruno-boucard/](https://lescastcodeurs.com/2020/06/05/lcc-233-interview-sur-l-event-storming-avec-thomas-pierrain-et-bruno-boucard/).

### Sécurité

**Sigstore passe en General Availability, en version 1**
[https://opensource.googleblog.com/2022/10/sigstore-project-announces-general-availability-and-v1-releases.html](https://opensource.googleblog.com/2022/10/sigstore-project-announces-general-availability-and-v1-releases.html)

- Sujet également couvert par InfoQ [https://www.infoq.com/news/2022/11/sigstore-stability-ga/](https://www.infoq.com/news/2022/11/sigstore-stability-ga/)
- Sigstore est là pour aider au niveau de la sécurisation de la supply chain de code.
- Notamment au niveau des signatures.
- Ça adresse ce que fait PGP mais le rend plus utilisable et permet un usage supplémentaire par un log lisible par tous.
- Plus d’infos dans une interview on espère.

### Loi, société et organisation

**La proposition de loi sur la sécurisation de l’open source aux États-Unis** [https://blog.tidelift.com/tidelift-advisory-us-senators-introduce-the-securing-open-source-software-act-of-2022](https://blog.tidelift.com/tidelift-advisory-us-senators-introduce-the-securing-open-source-software-act-of-2022) (edited)

**Holly Cummins sur le sujet du code vestimentaire des femmes dans la tech**
[https://hollycummins.com/fashion-and-programming-ii/](https://hollycummins.com/fashion-and-programming-ii/)

- Pourquoi en 2023 on a encore autant d’abrutis qui font des remarques sur les vêtements que portent les femmes qui font des présentations à des conférences, et pire, sur le fait de savoir si elles sont à leur goût ou pas.
- La tenue vestimentaire n’a rien à voir avec le talent, les connaissances, le professionnalisme, l’expertise des personnes.
- Les femmes ont le droit de porter les vêtements qu’elles veulent sans être jugées par des idiots qui feraient mieux de retourner dans leur caverne.

**Avec le rachat de Twitter par Elon Musk, beaucoup de gens commencent à s’intéresser de plus près à Mastodon.** On trouve de nombreux articles sur Mastodon ces jours-ci
[https://gorillasun.de/blog/getting-started-with-mastodon](https://gorillasun.de/blog/getting-started-with-mastodon)

- Et vous, avez-vous un compte sur Mastodon ?
- Quelle instance avez-vous choisie ?
- Quels outils (client, mobile, web, etc) utilisez vous ?
- Ça n'est pas facile de trouver une instance : beaucoup ont fermé les inscriptions (à cause de problèmes pour gérer l'afflux de nouveaux utilisateurs, à cause de l'augmentation de la création de comptes spam, ou dans l'objectif de répartir les utilisateurs sur d'autres instances moins connues).
- Le site JavaBubble liste plein de développeurs Java qui ont maintenant un compte sur Mastodon : [https://javabubble.org/](https://javabubble.org/).
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
- 12 mai 2023 : [AFUP Day](https://event.afup.org/) Lille & Lyon (France) <a href="https://event.afup.org/"><img alt="CFP AFUP Day 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-November-2022&color=green"></a>
- 12-13 octobre 2023 : [Volcamp 2023](https://www.volcamp.io/) - Clermont Ferrand (France)

## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

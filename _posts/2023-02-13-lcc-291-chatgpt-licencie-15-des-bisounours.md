---
title: LCC 291 - ChatGPT licencie 15% des Bisounours
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 291
mp3_length: 72381885
tweet: ChatGPT licencie 15% des Bisounours #OracleJDK #JEP #Flutter #Hibernate #Mokito #Kafka #BigData #YAML #ChatGPT #licenciement #platformengineering #bisounours
# tweet size: 91-93 -> 99-101 #######################################################################
---
Antonio, Guillaume et Emmanuel discutent de licence Oracle pour Oracle JDK, de JEPs, de Flutter, d’Hibernate, de Mokito, de Kafka, de (not so) Big Data, du parsing de YAML, de ChatGPT, de licenciements, de platform engineering, et de nombres flottants.

Enregistré le 10 février 2023

Téléchargement de l’épisode [LesCastCodeurs-Episode-291.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-291.mp3)

## News

### Langages

Oracle a changé une des licences d’Oracle Java [https://redresscompliance.com/oracle-java-licensing-changes-explaned-free/](https://redresscompliance.com/oracle-java-licensing-changes-explaned-free/)

- Plus d’utilisateurs nommés.
- Mais basé sur tous les employés et même les employés de vos sous-traitants.
- Bref, ça va faire cher.
- Et si vous utilisez plus de 50k processeurs, vous payez en plus.
- Un autre article d’IDC : [https://blogs.idc.com/2023/01/30/oracle-java-subscription-changes-what-is-the-impact-to-customers/](https://blogs.idc.com/2023/01/30/oracle-java-subscription-changes-what-is-the-impact-to-customers/).
- Message à caractère informatif : il y a d’autres distributions de OpenJDK supportées de différents vendeurs ; ou la version non supportée.

InfoQ fait un résumé des dernières nouvelles Java, les mises à jour sur les JEPs, les dernières releases
[https://www.infoq.com/news/2023/01/java-news-roundup-jan23-2023/](https://www.infoq.com/news/2023/01/java-news-roundup-jan23-2023/)

- Sur Java spécifiquement.
- Des mises à jour de drafts autour du projet amber (primitive types in patterns etc).
- Une JEP pour discuter du futur process des JEP (évolutions).
- JDK 20 en rampdown phase avec en nouvelles features : scoped values, record patterns, pattern matching for switches, virtual threads, structured concurrency - toutes en incubation ou en preview.
- [https://www.infoq.com/news/2023/02/java-news-roundup-jan30-2023/](https://www.infoq.com/news/2023/02/java-news-roundup-jan30-2023/).
- Le framework RIFE fait son grand retour !

Sortie de Go 1.20
[https://go.dev/doc/go1.20](https://go.dev/doc/go1.20)

- Mais pas de gros changements, juste des améliorations de la toolchain, des librairies…

Récap de la conférence Flutter Forward 2023
[https://medium.com/@flutterqueen/flutter-forward-2023-recap-8f6da4876e3](https://medium.com/@flutterqueen/flutter-forward-2023-recap-8f6da4876e3)

- Annonces de Flutter 3.7 et Dart 2.19.
- Amélioration de la performance graphique (utilisation de Impeller au lieu de Skia).
- Layout adaptatif.
- Barres et sous-barres de menu.
- Validation de release iOS.
- Support de Material 3.
- Nouveaux widgets.
- Support de ses propres shaders.
- Facilitation de l’intégration native avec FFIgen et JNIgen.
- Support de la 3D.
- Support de WebAssembly.
- Support de RISC-V.
- Possibilité d’intégrer une app Flutter comme un élément HTML dans une page HTML.
- Un toolkit spécifique pour les applis de News.
- Côté langage Dart, il devrait bientôt y avoir du pattern matching.


### Librairies

Les bonnes pratiques d’accessibilité pour les applications en Flutter
[https://medium.com/flutter-community/creating-inclusive-apps-with-flutter-best-practices-for-accessibility-c7cebe0beb4d](https://medium.com/flutter-community/creating-inclusive-apps-with-flutter-best-practices-for-accessibility-c7cebe0beb4d)

- 4 grands thèmes dans l’article : l’accessibilité dans Flutter, les fonctionnalités intégrées à Flutter pour l’accessibilité, les meilleures pratiques pour rendre les apps Flutter accessibles et tester / déboguer l’accessibilité.
- Flutter supporte le text contrast, les screen readers, les labels sémantiques, l’utilisation au clavier.

Comment logger les requêtes Hibernate ORM [https://www.adeliosys.fr/articles/hibernate-monitoring/](https://www.adeliosys.fr/articles/hibernate-monitoring/)

- Log brut.
- Via un logger.
- Les requêtes lentes (plus lentes que n millisecondes).
- Les métriques plus avancées (Statement, requêtes, temps d’acquisition de connexions, cache).
- Exposable via JMX.
- Le pool de connexions.

Sortie de Mockito 5, avec la possibilité de mocker des constructeurs, des méthodes statiques et des classes finales
[https://www.infoq.com/news/2023/01/mockito-5/](https://www.infoq.com/news/2023/01/mockito-5/)

- Avant, c’était déjà possible avec `mockito-inline` mais maintenant, c’est “out of the box”.
- La version Java minimale passe de Java 8 à Java 11.



### Cloud

Kubernetes Java client ajoute le support de kubernetes 1.25 [https://www.infoq.com/news/2023/01/kubernetes-java-client/](https://www.infoq.com/news/2023/01/kubernetes-java-client/)

- Ajout d’APIs dynamique pour faire du monitoring générique.
- L’article montre l’API utilisée en alternative à certaines commandes `kubectl`
- fabric8 est une alternative.



### Data

Big data est mort [https://motherduck.com/blog/big-data-is-dead/](https://motherduck.com/blog/big-data-is-dead/)

- Fondateur de BigQuery.
- Puis, il a regardé comment les utilisateurs utilisaient BigQuery.
- Et pas un problème de big data.
- Retour des moteurs classiques MySQL / PostgreSQL vs MongoDB…
- La plupart des utilisateurs de BigQuery étaient sous les 1 TB et 50% at 100 GB ou moins.
- Donc le deluge de données n’est pas arrivé.
- Le shift moderne, c’est de détacher le stockage du compute.
- Les données grossissent plus vite que les besoins en compute sur ces données.
- La taille du workload est sur un petit sous ensemble de la taille des données entières (90% des requêtes BigQuery sont sur 100M de données).
- Bases de données modernes sont force à travailler sur un sous ensemble des données.
- Pression pour stocker moins de données sur les équipes.
- Les données sont requêtées dans la journée, dans la semaine et ensuite rarement touchées.
- Donc _big data = whatever doesn’t fit on a single machine_ est de moins en moins vrai.
- Map reduce en 2004 et machines de maintenant entre 2 et 4 ordres de grandeur de RAM en plus.
- Avant on se foutait de supprimer des données, mais RGPD et responsabilité pénale change la donne.
- _Data putrefaction_ comme le _bit rot_.
- Questionnaire pour savoir si les prochaines générations de data processing seront suffisantes pour vous.
- Distribution est une raison par contre.


### Outillage

Tous les soucis avec YAML [https://ruudvanasseldonk.com/2023/01/11/the-yaml-document-from-hell](https://ruudvanasseldonk.com/2023/01/11/the-yaml-document-from-hell)

- Article qui explique la complexité de YAML et ses incohérences.
- Comparaison à la simplicité de JSON.
- Les commentaires JSON ont été enlevés en 2005 parce que les gens mettaient des meta instructions pour les parseurs et l’implémentation des commentaires était très complexe.
- `22:22` est un nombre en base 60 vs `80:80` qui ne l’est pas (enlevé en YAML 1.2).
- `- **.png` est invalide, `**` est une référence vers une ancre.
- `- !.git` est parsé différemment par les parseurs : `!` est une échappe pour exprimer un type natif du langage (p. ex. Java) - ça veut dire que charger un YAML inconnu est non sûr.
- `- fr - de - no` retourne `["fr", "de", no]` le problème _Norvège_ a changé entre YAML 1.1 et 1.2, mais les parseurs gardent les anciens comportements. Boolean: `on`, `yes`, `y`.
- `on: "let's go"` est converti en `{ "True": "let's go" }` parce qu’`on` est un booléen accepté en clé non String dans YAML.
- `version: [ 9.5.1, 12.13]` -> `{ "version": [ "9.5.1", 12,13 ] }` les chiffres non échappé par des guillemets.
- Syntax highlighting est donc dépendant.
- Les templates dans YAML ça court à la cata.
- Alternatives : TOML, JSON, sous ensemble de YAML (toujours quoter les chaînes).

ChatGPT, on lui attribue plus de magie qu’il n’en a [https://arxiv.org/pdf/2212.03551.pdf](https://arxiv.org/pdf/2212.03551.pdf)

- Un article scientifique, mais de 8 pages seulement.
- ChatGPT en tant que _Large Language Model_ (LLM) avec un prompt Engineering au-dessus (le conversational agent).
- ChatGPT c’est une exécution du modèle _Next Token Prediction_.
- C’est de la statistique brute, mais extrêmement versatile dans ses usages.
- Tendance à anthropomorphismes parce qu’on a passé la sensation de _uncanny valley_.
- Considérant la distribution statistique des mots du corpus public, quels mots ont le plus de chance de venir après.
- Pas de relation au monde, aux objets et aux interactions d’êtres partageant le même langage.
- Pas des faits, ChatGPT ne _sait_ pas, n’a pas d’intention.
- C’est donc un outil génial pour éliminer un paquet du bullshit work de tous les jours, pas les gens qui le font.
- Est-ce que les capacités sont émergentes ? LLM fondamentalement est hors du concept.

Le méta tutoriel sur le parsing avec Antlr
[https://tomassetti.me/antlr-mega-tutorial/](https://tomassetti.me/antlr-mega-tutorial/)

- Couvre différents langages dont Java, Python, JavaScript et C#.
- Explique les différentes phases de lexing, de parsing.
- Explique comment résoudre les ambiguïtés avec les prédicats sémantiques, transformer du code, tester son parseur.
- Et autres trucs et astuces.

Un tutoriel sur comment releaser un module Java avec Maven, JReleaser et Github Actions
[https://foojay.io/today/how-to-release-a-java-module-with-jreleaser-to-maven-central-with-github-actions/](https://foojay.io/today/how-to-release-a-java-module-with-jreleaser-to-maven-central-with-github-actions/)

- Montre le setup nécessaire (clé GPG, propriété du `groupId`, config maven…).
- Montre comment faire la release à la main.
- Montre comment l’automatiser via GitHub actions.

Un tutoriel expliquant comment utiliser CRaC pour vos applis Java dans un conteneur
[https://foojay.io/today/how-to-run-a-java-application-with-crac-in-a-docker-container/](https://foojay.io/today/how-to-run-a-java-application-with-crac-in-a-docker-container/)

- Coordinated Restore at Checkpoint (développé par Azul).
- Permet de créer des snapshots d’une application Java.
- Pour qu’elle puisse être relancée rapidement après son démarrage, sans warmup.

Une intro à Kafka en français
[https://blog.octo.com/kafka-repond-il-a-mon-besoin/](https://blog.octo.com/kafka-repond-il-a-mon-besoin/)


Maven 3.9 est sorti
[https://lists.apache.org/thread/0tfr7t2j2ddbv4gjvxm47yohtk3dg6b3](https://lists.apache.org/thread/0tfr7t2j2ddbv4gjvxm47yohtk3dg6b3)

- [https://maven.apache.org/docs/3.9.0/release-notes.html](https://maven.apache.org/docs/3.9.0/release-notes.html)
  - Java 8 nécessaire pour lancer Maven.
  - Pas mal de nettoyage de code et de dépendances pour préparer Maven 4. Certains plugins mal conçus (ex : qui ne déclare pas la dep `plexus-util`) peuvent être incompatibles.
  - `.mvn/maven.config` doit désormais avoir 1 argument par ligne.
  - Maven avertit maintenant sur l’utilisation de plugins obsolètes, objectifs, paramètres, etc.
  - Ajout de la prise en charge de l’invocation `mvn pluginPrefix:version:goal` et mise à jour des logs (pour simplifier le copier/coller).
  - Ajout d’activation de profil par packaging.
  - Maven 3.9.0 est désormais entièrement compatible avec la nouvelle ligne 3.x d’installation et de déploiement de plugins (les versions précédentes préviennent à ce sujet).
  - Ajout du support du repo local partagé - [https://maven.apache.org/resolver/local-repository.html#shared-access-to-local-repository](https://maven.apache.org/resolver/local-repository.html#shared-access-to-local-repository).
  - Ajout de la possibilité de splitter le repo local (releases, vs snapshots…) et possibilité de gérer des workspaces - [https://maven.apache.org/resolver/local-repository.html#split-local-repository](https://maven.apache.org/resolver/local-repository.html#split-local-repository).
  - Filtrage des dépendances par repository - [https://maven.apache.org/resolver/remote-repository-filtering.html](https://maven.apache.org/resolver/remote-repository-filtering.html).
  - Chained local repository (pour l’isolation entre “outer” and “inner” builds) - [https://issues.apache.org/jira/browse/MNG-7612](https://issues.apache.org/jira/browse/MNG-7612).
  - Attention : il y aurait une regression (10%) sur les perfs de gros projets - [https://issues.apache.org/jira/browse/MNG-7677](https://issues.apache.org/jira/browse/MNG-7677).

[Les Bisounours](https://fr.wikipedia.org/wiki/Bisounours)

### Méthodologies

De operation engineering vers platform engineering [https://www.infoq.com/news/2022/10/platform-devops-summary/](https://www.infoq.com/news/2022/10/platform-devops-summary/)

- Et quand le sysadmin devient de nouveau sexy.
- Grosse tendance et beaucoup de discussions autour de la _platform engineering_.
- Une plateforme imposée aux devs mais sexy donc c’est bon cette fois : plus sérieusement customer focus - la fameuse _developer experience_.
- Rééquilibrage entre dev vs ops puis devops plat et maintenant ceci. Sans enlever devops.
- Car devops amène une charge mentale lourde.
- Objectif : développer la _core business value_ et donc supporter cela avec une _Internal Developer Platform_ (IDP).
- Backstage est la GUI au-dessus, mais une IDP est plus profonde.
- Infra <-> Platform <-> dev teams.
- IDP : ne pas avoir à faire tourner l’infra (pour une équipe dev metier).
- Et cela permet d’ajouter des contrôles "entreprise" : coût, gouvernance etc.
- C’est un pendule qui se rééquilibre, mais n’oublions pas que les devs aime le jeu, comme les otaries. Pas pisser du code metier le plus vite possible.
- Est-ce que les IDP seront populaires, c’est la grande question.
- Un contre point dans l’article : _IDP are expensive and hard to do, offer a mediocre service at best, destroy velocity, and create bad incentives_.
- Lié à la notion de _golden path_.


### Sécurité

Une liste de binaires Unix qui peuvent être utilisés pour bypasser des systèmes mal configurés
[https://gtfobins.github.io/](https://gtfobins.github.io/)

- Apparemment, même des images type distroless peuvent être affectées.
- Risques : accès à un shell, des privilèges élevés, transférer des fichiers, etc.


### Loi, société et organisation

Twitter désactive l’API pour les clients qui n’affichent pas les pubs de Twitter (comme Tweetbot [https://twitter.com/tweetbot/status/1613763746437947394](https://twitter.com/tweetbot/status/1613763746437947394))

- Et paf le support de Twitter sur ton ordi.

Dans la saga Twitter, après l’arrêt des clients Twitter tiers, maintenant l’accès même à l’API va devenir payant
[https://twitter.com/twitterdev/status/1621026986784337922](https://twitter.com/twitterdev/status/1621026986784337922)

- Donc par exemple, on ne pourra même plus créer des bots gratuitement, comme faire des annonces automatiques de release, etc.
- Ah bah merde, c’est ce que je fais pour les cast codeurs :/.

Ola Bini déclaré innocent [https://peoplesdispatch.org/2023/02/01/digital-rights-activist-ola-bini-declared-innocent-by-ecuadorian-court](https://peoplesdispatch.org/2023/02/01/digital-rights-activist-ola-bini-declared-innocent-by-ecuadorian-court)

- Arrêté en 2019 en Équateur.
- Accusé d’avoir eu accès à des ordinateurs et des systèmes de communication.
- En même temps que Julian Assange était renvoyé de l’ambassade Équatorienne de Londres.
- Il a fait 70 jours de prison.

Google a viré son équipe Open Source [https://www.infoworld.com/article/3686511/google-blew-it-with-open-source-layoffs.html](https://www.infoworld.com/article/3686511/google-blew-it-with-open-source-layoffs.html)

- Gros efforts autour de l’open sourcing (Kubernetes, Tensor flow).
- Paie des dividendes.
- Viré par les têtes de gondoles, mais ceux qui avaient fait des différences.
- Open Source program, Google Summer of Code.
- Grosse influence interne qui se perd, risque pour le futur.
- Ça reste l’opinion de Matt Asay ( :stuck_out_tongue_winking_eye: ).

On peut rajouter son Mastodon sur son profil Github
[https://github.blog/changelog/2023-02-02-add-more-social-links-to-your-user-profile/](https://github.blog/changelog/2023-02-02-add-more-social-links-to-your-user-profile/)

- Pratique pour la vérification Mastodon !
- On pouvait seulement mettre un lien vers Twitter, maintenant on peut avoir plusieurs profils de médias sociaux différents


## Rubrique débutant

Julia Evans a écrit deux articles intéressants sur les problèmes avec les nombres flottants et avec les nombres entiers
[https://jvns.ca/blog/2023/01/13/examples-of-floating-point-problems/](https://jvns.ca/blog/2023/01/13/examples-of-floating-point-problems/)
[https://jvns.ca/blog/2023/01/18/examples-of-problems-with-integers/](https://jvns.ca/blog/2023/01/18/examples-of-problems-with-integers/)

- Les problèmes classiques d’overflow.
- Le grand-écart entre les grands nombres flottants.
- Des cas concrets de valeurs approchées (proche à epsilon près), ou avec JavaScript qui interprète les entiers comme des flottants et du coup interprète mal des grands ID en JSON.
- Des clés primaires trop petites, les bizarreries de l’encodage des nombres signés ou non.

Quels sont les types de mémoires dans la JVM ?
[https://www.baeldung.com/java-jvm-memory-types](https://www.baeldung.com/java-jvm-memory-types)

- Heap, Stack, Native, Direct.
- Je pense que l’article a des incohérences, en tout cas native vs direct est mal expliqué. Un truc pas super clair, mais plus clair est ici sur native vs direct : [https://stackoverflow.com/questions/30622818/what-is-the-difference-between-off-heap-native-heap-direct-memory-and-native-m](https://stackoverflow.com/questions/30622818/what-is-the-difference-between-off-heap-native-heap-direct-memory-and-native-m).
- C’est en gros direct vers du hardware (IO, network etc).
- Memory mapped file permet d’aller au dela de la limite de memoire vive du système.


## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 9-11 février 2023 : [World AI Cannes Festival](https://worldaicannes.com/) - Cannes (France) 
- 16-19 février 2023 : [PyConFR](https://www.pycon.fr/2023/) - Bordeaux (France)  <a href="https://cfp-2023.pycon.fr/"><img alt="CFP PyConFr 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-Janvier-2023&color=red"> </a>
- 7 mars 2023 : [Kubernetes Community Days France](https://community.cncf.io/events/details/cncf-kcd-france-presents-kubernetes-community-days-france-2023/) - Paris (France)  <img alt="CFP KCD Paris" src="https://img.shields.io/static/v1?label=CFP&message=from%20September-15%20to%20November-13-2022&color=red">
- 15-18 mars 2023 : [JChateau](https://www.jchateau.org/) - Cheverny in the Châteaux of the Loire Valley (France) 
- 23-24 mars 2023 : [SymfonyLive Paris](https://live.symfony.com/2023-paris/) - Paris (France)  <a href="https://live.symfony.com/2023-paris/cfp"><img alt="CFP SymfonyLive Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-December-2022&color=red"></a>
- 23-24 mars 2023 : [Agile Niort](https://agileniort.fr/) - Niort (France)  <a href="https://sessionize.com/agile_niort_2023"><img alt="CFP AgileNiort" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-December-2022&color=red"></a>
- 30 mars 2023 : [Archilocus](https://www.archilocus.tech/) - Online (France)  <a href="https://conference-hall.io/public/event/RDgIWt2Qy01elL0Skezw"><img alt="Archilocus Printemps 2023" src="https://img.shields.io/static/v1?label=CFP&message=until-15-March-2023&color=green"></a>
- 31 mars 2023-1 avril 2023 : [Agile Games France](https://www.agilegamesfrance.fr/index.php?title=Evenement_2023) - Grenoble (France) 
- 1-2 avril 2023 : [JdLL](https://jdll.org/) - Lyon 3e (France)  <a href="https://jdll.org/participer"><img alt="CFP JDLL" src="https://img.shields.io/static/v1?label=CFP&message=until 31-January2023&color=red"></a>
- 4 avril 2023 : [AWS Summit Paris](https://aws.amazon.com/fr/events/summits/paris/) - Paris (France) 
- 5-7 avril 2023 : [FIC](https://europe.forum-fic.com) - Lille Grand Palais (France) 
- 12-14 avril 2023 : [Devoxx France](https://www.devoxx.fr/) - Paris (France)  <a href="https://cfp.devoxx.fr/"><img alt="CFP Devoxx France" src="https://img.shields.io/static/v1?label=CFP&message=from%20November-21%20to%20January-8-2023&color=red"></a>
- 20-21 avril 2023 : [Toulouse Hacking Convention 2023](https://thcon.party/) - Toulouse (France)  <a href="https://thcon.party/cfp.html"><img alt="CFP THCon 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-February-2023&color=green"> </a>
- 27-28 avril 2023 : [AndroidMakers by droidcon](https://androidmakers.droidcon.com/) - Montrouge (France)  <a href="https://sessionize.com/androidmakers-by-droidcon-2023/"><img alt="CFP Android Markers by droidcon 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2023&color=green"></a>
- 4-6 mai 2023 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece)  <a href="https://dvgr23.cfp.dev/"><img alt="CFP Devoxx Greece 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2023&color=red"></a>
- 10-12 mai 2023 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK)  <a href="https://devoxxuk23.cfp.dev/#/"><img alt="CFP Devoxx UK 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2023&color=red"></a>
- 12 mai 2023 : [AFUP Day](https://event.afup.org/) - lle & Lyon (France)  <a href="https://event.afup.org/"><img alt="CFP AFUP Day 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-November-2022&color=red"></a>
- 25-26 mai 2023 : [Newcrafts Paris](https://ncrafts.io/) - Paris (France)  <a href="https://sessionize.com/newcrafts-paris-2023"><img alt="CFP Newcrafts Paris 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2001-December-2022%20to%2012-February-2023&color=green"></a>
- 26 mai 2023 : [Devfest Lille](https://devfest.gdglille.org/) - Lille (France)  <a href="https://conference-hall.io/public/event/hRA5AjQjXYMPI3MpwyoF"> <img alt="Closed Captions" src="https://img.shields.io/static/v1?label=CC&message=Closed%20Captions&color=blue" /> <img alt="CFP Devfest Lille 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2003-Jan-2023%20to%20-31-March-2023&color=green"></a>
- 27 mai 2023 : [Polycloud](https://polycloud.fr) - Montpellier (France)  <a href="https://conference-hall.io/public/event/OR1ldOA5G0ASoizWvVbO"><img alt="Polycloud" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-April-2023&color=green"></a>
- 31 mai 2023-2 juin 2023 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland)  <a href="https://devoxxpl23.cfp.dev/"><img alt="CFP Devoxx Poland 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=green"></a>
- 31 mai 2023-2 juin 2023 : [Web2Day](https://www.web2day.co/) - Nantes (France) 
- 1 juin 2023 : [Javaday](https://javaday.parisjug.org/) - Paris (France) 
- 1 juin 2023 : [WAX](https://www.waxconf.fr/) - Aix-en-Provence (France)  <a href="https://conference-hall.io/public/event/BtpnpzTxdVAxEJCcfTJW"><img alt="CFP WAX Conf" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2023&color=green"></a>
- 7 juin 2023 : [Serverless Days Paris](https://paris.serverlessdays.io/fr/) - Paris (France)  <a href="https://sessionize.com/serverlessdays-paris-2023/"><img alt="CFP Serverless Days Paris 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-February-2023&color=green"></a>
- 15-16 juin 2023 : [Le Camping des Speakers](https://camping-speakers.fr/) - Baden (France)  <a href="https://conference-hall.io/public/event/HDF3RTtlPRv7WIuxthtr"><img alt="CFP Camping Speakers June 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=green"></a> 
- 29-30 juin 2023 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France)  <a href="https://conference-hall.io/public/event/Jnevkv3bLyxZOyYyiWSC"><img alt="CFP Sunny Tech 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=green"></a>
- 8 septembre 2023 : [JUG Summer Camp](https://www.jugsummercamp.org/) - La Rochelle (France) 
- 19 septembre 2023 : [Salon de la Data Nantes](https://salondata.fr/index.php/le-salon/) - Nantes (France) & Online 
- 21-22 septembre 2023 : [API Platform Conference](https://api-platform.com/con/2023) - Lille (France) & Online 
- 2-6 octobre 2023 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 12 octobre 2023 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) 
- 12-13 octobre 2023 : [Volcamp 2023](https://www.volcamp.io/) - Clermont-Ferrand (France) 
- 6-7 décembre 2023 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) 
- 31 janvier 2024-3 février 2024 : [SnowCamp](https://snowcamp.io/fr/) - Grenoble (France) 
- 1-3 février 2024 : [SnowCamp](https://snowcamp.io/fr/) - Grenoble (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>

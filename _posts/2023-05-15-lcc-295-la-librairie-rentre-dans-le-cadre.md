---
title: LCC 295 - La librairie rentre dans le cadre
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 295
mp3_length: 66761284
tweet: La librairie rentre dans le cadre #java20 #profiler #quarkus #micronaut #podman #jreleaser #github #cloudevent #graphql #licenciements
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Arnaud, Antonio et Emmanuel décortiquent les nouvelles d’avril et mai.
On y discute Java 20, écrire un profiler de zéro, Quarkus 3 (encore !), Micronaut 4, Podman, JReleaser, GitHub, CloudEvent, GraphQL, licenciements (encore !), et de la question a 1000 francs : librairie vs framework, quelle différence ?
Mais pas que.

Enregistré le 12 mai 2023

Téléchargement de l’épisode [LesCastCodeurs-Episode-295.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-295.mp3)

## News


### Langages

Un descriptif du changement de tarification d’Oracle JDK
[https://horstmann.com/unblog/2023-02-23/](https://horstmann.com/unblog/2023-02-23/)

- Article de Cay S. Horstmann.
- Explique OpenJDK avec plusieurs distributeurs.
- Préfère Adoptium, dont celle par défaut est Eclipse Temurin.
- Pour Oracle, beaucoup d’options de licenses (no-fee, binary code, OTM license).
- Oracle dépense beaucoup pour Java.
- La license en discussion est Java SE Universal Subscription Licensing.
- Passage de license par CPU (Java SE advanced) vers license par employé (et une assiette large).
- Bref si vous êtes concernés, passez sur OpenJDK : Adoptium, ou d’autres vendeurs.

Java 20 est sorti : qu’y a-t-il de nouveau dans Java 20 par rapport à Java 19 ?
[https://foojay.io/today/its-java-20-release-day-heres-whats-new/](https://foojay.io/today/its-java-20-release-day-heres-whats-new/)

- L’article fait le point sur ce qu’il y a de nouveau par rapport à la précédente release :
  - 4ème preview du pattern matching pour switch,
  - 2de preview des record patterns,
  - 2de preview des virtual threads,
  - incubation des scoped values (similaire au thread locals mais pour les virtual threads),
  - 2de incubation de la structured concurrency,
  - 2de preview de foreign function et memory API,
  - 5ème incubation de la vector API (pour utiliser les instructions vectorielles des processeurs).
- La liste des JEPs : [https://openjdk.org/projects/jdk/20/](https://openjdk.org/projects/jdk/20/).
- Les release notes : [https://jdk.java.net/20/release-notes](https://jdk.java.net/20/release-notes).
- Dans le pattern matching switch: guard `when` .
- Record pattern : `var` maintenant aussi utilisable dans les `for` : `for (Delay(var timeInMS) : delays)`
- Quelques changements autour de l’API `Thread` en non preview (main API).
- Les `ScopedValue`s sont comme les `ThreadLocal`s par (virtual) thread, mais elles sont immuables une fois écrites. 
- Use cases : copie d’état pour des données non changeantes pour le virtual thread.
- Serait intéressant d’avoir des details dessus.

PDF 2.0 maintenant un vrai format ISO ouvert et gratuit
[https://www.pdfa.org/sponsored-standards/](https://www.pdfa.org/sponsored-standards/)

- Standard disponible sans coût.
- Versions précédentes étaient payantes.
- Clarifications et corrections de beaucoup de cas aux limites.


### Librairies

Écrire un Profiler en 240 lignes de Java
[https://mostlynerdless.de/blog/2023/03/27/writing-a-profiler-in-240-lines-of-pure-java/](https://mostlynerdless.de/blog/2023/03/27/writing-a-profiler-in-240-lines-of-pure-java/)

- Ce n’est peut-être pas si compliqué d’écrire soi-même un Java Profiler ! Et justement cet article nous montre comment le faire, en créant un Java Agent, en analysant les stacks d’appel, et à la fin en créant même un flame graph en HTML.
- Très didactique !
- Fondamentalement : appeler `Threads:getAlStackStrace` régulièrement, faire une liste des méthodes visibles et créer un flamegraph à partir de ces données.

L’équipe de Flutter partage les grands thèmes de sa roadmap
[https://flutter.dev/go/strategy-2023](https://flutter.dev/go/strategy-2023)

- Performance, interopérabilité, portabilité, écosystème, sécurité, fondamentaux (comme la documentation, la fidélité des UI natives, adresser les issues publiques).

Quarkus 3 est sorti
[https://quarkus.io/quarkus3/](https://quarkus.io/quarkus3/)

- On a déjà couvert.
- Hibernate ORM 6.2.
- Nouvelle DevUI et admin sur un port different.
- Support for Pact.
- `quarkus deploy` et extensibilité de la CLI avec de nouveaux verbes.
- Dev Services for Kubernetes simule un Kube pour tester les calls vers l’API Kube.
- Java 11 et 17 (recommandé).
- Jakarta EE.
- Eclipse MicroProfile 6.

Une librairie en Java spécialement pour l’astronomie par Cédric Champeau
[https://melix.github.io/blog//2023/04-22-introducing-astro4j.html](https://melix.github.io/blog//2023/04-22-introducing-astro4j.html)

- Différentes librairies et applications pour traiter les images issues de Sol’Ex.
- Sol’Ex permet de prendre des photos du soleil.

Micronaut 4 milestone 2 est sorti. Les nouveautés de Micronaut 4
[https://docs.micronaut.io/4.0.0-M2/guide/index.html#whatsNew](https://docs.micronaut.io/4.0.0-M2/guide/index.html#whatsNew)

- Kotlin 1.8.0.
- Experimental Support for Kotlin Symbol Processing (KSP).
- Apache Groovy 4.0.
- Core Changes :
  - Java 17 Baseline,
  - Improved Modularity,
  - GraalVM Metadata Repository and Runtime Initialization,
  - Completed javax to jakarta Migration,
  - Expression Language,
  - Injection of Maps,
  - Arbitrary Nesting of Configuration Properties,
  - Improved Error Messages for Missing Configuration,
  - Improved Error Messages for Missing Beans,
  - Tracking of Disabled Beans.
- HTTP Changes :
  - Initial Support for Virtual Threads (Loom),
  - Rewritten HTTP layer,
  - Annotation-Based HTTP Filters,
  - JDK HTTP Client.


### Infrastructure

5 choses à savoir sur Podman Desktop pour un utilisateur Docker
[https://podman-desktop.io/blog/5-things-to-know-for-a-docker-user](https://podman-desktop.io/blog/5-things-to-know-for-a-docker-user)

- Une UI unique pour travailler avec différents moteurs de conteneurs, et pas uniquement Docker.
- Compatible avec Docker avec un mode adapté pour fonctionner aussi avec la docker CLI ou docker.sock pour les sockets.
- Support de Compose.
- Support de Kubernetes.
- Sécurité : on peut utiliser rootless sans avoir les privilèges root.
- Socket est particulièrement utile pour TestContainer.
- `compose` n’est pas supporté en tant que tel, mais on peut faire utiliser podman par `compose`.
- Podman peut émuler / exécuter des definitions de pods.
- Si besoin d’exposer des ports <1024, on peut activer le mode root.

Keycloak rejoins la CNCF
[https://www.tfir.io/keycloak-cloud-native-iam-for-cloud-native-applications-joins-the-cncf/)

- IAM complete au sein de la CNCF.
- Keycloak sur base Quarkus : “cloud natif”.


### Cloud

Un court article de chez Baeldung qui liste des distributions Kubernetes légères et partage leurs avantages et inconvénients respectifs
[https://www.baeldung.com/ops/kubernetes-lightweight-distributions](https://www.baeldung.com/ops/kubernetes-lightweight-distributions)

- Minikube (que des clusters à nœud unique),
- MicroK8S (à jour avec les releases Kubernetes, mais pas de support des CPUs ARM32),
- Kind (conteneurs considérés comme des nœuds, plus difficile à configurer avec autre chose que Docker),
- K3S (moins de consommation de resources).

Google I/O 2023 : la liste des 100 trucs annoncés
[https://blog.google/technology/developers/google-io-2023-100-announcements/](https://blog.google/technology/developers/google-io-2023-100-announcements/)

- Bard, le concurrent de ChatGPT, disponible dans 180 pays… sauf les pays européens.
- Pixel 7a, Pixel Tablet et Pixel Fold.
- Plein d’annonces autour de l’AI avec l’API PaLM (utilisée dans Bard), plein de Generative AI de partout dans les produits (search, workspace,..), y compris un modèle de code (qui comprend même le Groovy) qui va être intégré aux IDE, VSCode, etc.




### Outillage

Connaissiez-vous le flag `--json` de curl ?
[https://glaforge.dev/posts/2023/03/22/curl-s-json-flag/](https://glaforge.dev/posts/2023/03/22/curl-s-json-flag/)

- Ça simplifie les interactions avec les APIs qui utilisent du JSON.
- Plus besoin de passer les headers de `Content-Type` et d’`Accept`, c’est moins verbeux.
- Rajouté il y a un an dans curl 7.82 (pour info, sur mon mac, par exemple, je suis en 7.86).
- `curl --json '{ "drink": "coffe" }' https://example.com` ou `curl --json @prepared https://example.com` pour pointer vers un fichier.

Rétropédalage chez Docker
[https://www.docker.com/blog/no-longer-sunsetting-the-free-team-plan/](https://www.docker.com/blog/no-longer-sunsetting-the-free-team-plan/)

Github supprime le sponsoring par Paypal… et plein de développeurs Open Source perdent leurs sponsorships
[https://github.com/orgs/community/discussions/45183](https://github.com/orgs/community/discussions/45183)

- Juste un court blog post dans le changelog indiquant ce changement [https://github.blog/changelog/2023-01-23-github-sponsors-will-stop-supporting-paypal/](https://github.blog/changelog/2023-01-23-github-sponsors-will-stop-supporting-paypal/).
- Peut-être suite au piratage de Paypal et aux risques de paiements frauduleux et de réputation ?

Github a mis à jour sa clé RSA SSH Host
[https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/](https://github.blog/2023-03-23-we-updated-our-rsa-ssh-host-key/)

- Apparemment, ils ont commité brièvement leur clé privée, oops !
- Potentielle disruption pour certains, avec impossibilité de committer son code.
- Il faut alors “oublier” l’ancienne clé publique et mémoriser la nouvelle.
- Personnellement, j’ai commité du code à partir de Visual Studio Code et je n’ai pas eu de soucis.
- Que sur RSA et pas sur les clés à courbe elliptique.
- Clé privée aurait pu faire du spoofing ou du déchiffrement de flux en SSH via RSA vers GitHub.

2ème anniversaire de JReleaser
[https://andresalmiray.com/jreleasers-second-birthday/](https://andresalmiray.com/jreleasers-second-birthday/)

- JReleaser permet de publier sur plusieurs appstores (Homebrew, JBang, etc).
- Publie sur maven central automatiquement.
- Publie les annonces sur Twitter, Zulip…
- Publication de binaires (GitHub…) et de changelogs.


### Architecture

Introduction à CloudEvents
[https://atamel.dev/posts/2023/04-03_cloudevents_basics/](https://atamel.dev/posts/2023/04-03_cloudevents_basics/)

- Décrire des évènements de données de manière commune.
- Métadonnées standardisées pour le routage
- En JSON ou en `cloudevents+json`. 
- Métadonnées incluent : id, source, type, sujet, time, type de contenu de donnée, schema de données et des extensions comme partitioning…
- Binary mode : données dans le corps du message, et métadonnées en header. Efficace pour parsing minimal.
- Structured-mode : données et métadonnées dans la même enveloppe.
- Batch-mode : plusieurs évènements en un seul envoi.
- Formats : JSON, protobuf, Avro et XML.
- Protocoles : HTTP, AMQP, Kafka, MQTT, NATS, WebSocket.
- Des évolutions futures planifiées.

GraphQL, tout n’est pas si rose
[https://betterprogramming.pub/graphql-from-excitement-to-deception-f81f7c95b7cf](https://betterprogramming.pub/graphql-from-excitement-to-deception-f81f7c95b7cf)

- Pour Facebook qui pense en tant que graphe de données.
- Pour leur application mobile qui devait être à bande passante limitée.
- Choses positives : une requête pour plusieurs resources, sélection des données dont on a besoin uniquement, typé (entre client et serveur), meilleur outillage dev pour l’exploration, pas de soucis de version d’API ?
- Équipe qui embrace GraphQL en 2019.
- Les perfs optimisées par un choix de données ne se sont pas matérialisées pour eux (sauf mobile, donc pas machine-machine ou machine-desktop).
- La latence de REST reste mieux que GraphQL.
- En pratique desktop et mobile sont assez similaires en données fetchées.
- Schémas apportaient des problèmes en pratique ; synchro front et back, code first generation avait des problèmes de qualité du code généré.
- Schema → code est meilleur, mais synchro front back toujours un problème en pratique.
- Erreurs, plus simple en rest avec les codes HTTP a debugger et monitorer.
- Version free est un mensonge, les schemas ne peuvent être cassés.
- La pagination est compliquée et non standard. Caching primitif comparé à REST.
- N+1 problem comme dans les ORMs ou alors dataloaders qui amène de la complexité.
- La sécurité est plus compliquée à cause de la navigation libre de GraphQL.
- Écosystème pas encore super mature pour les besoins et paradoxalement très complexe.


### Méthodologies

Trends technologie et culture par InfoQ
[https://www.infoq.com/articles/culture-trends-2023/](https://www.infoq.com/articles/culture-trends-2023/)

- Les licenciements ont cassé les effets de _psychological safety_ dans l’industrie.
- Les IA génératives ont un impact fort sur la productivité du développeur, mais aussi avec des faiblesses significatives.
- Au-delà du légal, les responsabilités sociétales deviennent plus importantes pour retenir employés et clients.
- Le travail asynchrone devient plus accepté socialement, et adopter les pratiques apporte des bénéfices réels.
- Le travail hybride devient la norme, amener les gens ensemble devient un choix délibéré, plus un horaire fixe.



### Loi, société et organisation

Red Hat fête ses 30 ans ! (limite, on n’était même pas nés, hein ?)
[https://www.redhat.com/en/blog/red-hat-30th-anniversary-celebrating-red-hat-day-north-carolina](https://www.redhat.com/en/blog/red-hat-30th-anniversary-celebrating-red-hat-day-north-carolina)


Red Hat licencie 4% de ses employés
[https://wraltechwire.com/2023/04/24/red-hat-cutting-hundreds-of-jobs-ceo-says-in-letter-to-employees/](https://wraltechwire.com/2023/04/24/red-hat-cutting-hundreds-of-jobs-ceo-says-in-letter-to-employees/)

- IBM avait annoncé 3900 licenciements il y a peu et cela monte à 5000 avec les licenciements chez Redhat (les effectifs étaient de 2200 à Raleigh et 19000 à l’international).
- Licenciements suite au contexte économique post-Covid, les revenus trimestriels de Red Hat n’ont été que de 8% en Q1 alors que la croissance était de 15 depuis l’acquisition de Red Hat par IBM en 2019.

Crazy Bob est décédé 😭
[https://www.sfgate.com/bayarea/article/mill-valley-man-killed-sf-stabbing-17878809.php](https://www.sfgate.com/bayarea/article/mill-valley-man-killed-sf-stabbing-17878809.php)

- Annonce sur TechCrunch [https://techcrunch.com/2023/04/05/bob-lee-creator-of-cash-app-and-former-cto-of-square-stabbed-to-death/](https://techcrunch.com/2023/04/05/bob-lee-creator-of-cash-app-and-former-cto-of-square-stabbed-to-death/).
- Il avait créé le framework d’injection de dépendance Guice, mais aussi Dagger.
- Il a contribué aux librairies d’Android.
- Il avait proposé une syntaxe alternative aux lambda : CIC.
- Il a coécrit le livre Bitter EJB [https://www.manning.com/books/bitter-ejb](https://www.manning.com/books/bitter-ejb).
- Il avait des idées bien tranchées, anti-Spring, anti-Groovy (pro-BeanShell), anti-lambda (tels qu’on les connait aujourd’hui).
- Guillaume l’avait rencontré pour la première fois en 2007 [https://blog.octo.com/javaone-2007-et-groovy-chez-google/](https://blog.octo.com/javaone-2007-et-groovy-chez-google/).
- Les gens partagent leurs souvenirs sur ce thread sur HackerNews [https://news.ycombinator.com/item?id=35457341](https://news.ycombinator.com/item?id=35457341).

10 millions de comptes sur Mastodon
[https://mastodon.social/@mastodonusercount/110051957865629817](https://mastodon.social/@mastodonusercount/110051957865629817)

- Peut-être pas 10 millions de comptes actifs, mais d’autres commentateurs estiment le nombre d’actifs serait plutôt de 6 à 7 millions actifs, pour effectivement 10 millions de comptes créés donc certains inutilisés ou disparus (serveur disparu).

Gordon Moore meurt à 94 ans
[https://www.lemonde.fr/economie/article/2023/03/26/mort-de-gordon-moore-entrepreneur-par-accident-et-cofondateur-d-intel_6167037_3234.html](https://www.lemonde.fr/economie/article/2023/03/26/mort-de-gordon-moore-entrepreneur-par-accident-et-cofondateur-d-intel_6167037_3234.html)

- Chimiste de formation, il refuse de bosser autour de la bombe atomique et fini dans la silicon valley.
- Fonde un des premiers semi-conducteurs (plusieurs transistors ensembles).
- Intel sera un des premiers à parier sur le silicium (pour construire de la mémoire) et un des premiers à faire une puce intégrée regroupant plusieurs fonctions.

Twitter open source ses algorithmes de recommendation
[https://blog.twitter.com/engineering/en_us/topics/open-source/2023/twitter-recommendation-algorithm](https://blog.twitter.com/engineering/en_us/topics/open-source/2023/twitter-recommendation-algorithm)

- On retrouve le code source sur Github [https://github.com/twitter/the-algorithm-ml](https://github.com/twitter/the-algorithm-ml).
- Et quelqu’un a déjà trouvé où il y a des clauses particulières pour le cas où un tweet vient d’Elon Musk, où un tweet vient d’un républicain ou d’un démocrate : [https://uwyn.net/@danluu@mastodon.social/110119479811452246](https://uwyn.net/@danluu@mastodon.social/110119479811452246).
- L’algorithme de Twitter [https://aakashgupta.substack.com/p/the-real-twitter-files-the-algorithm](https://aakashgupta.substack.com/p/the-real-twitter-files-the-algorithm).
- Analyse sans sensation.
- Trois étapes : aggravation des données, construction des “features”, mixage.
- Followers, nos tweets et nous.
- Plus gros booster likes 30x, puis retweet 20x.
- Feature : SimCluster : groupe par categories/personnes le tweet.
- Feature : TwHIN : vecteur de prediction d’engagement pour un tweet donné.
- Feature : RealGraph : prend le tweet, le tweeter et le tweeté et construit un graphe pondéré de potentiel d’interaction.
- Règles de confiance et sécurité : élimine certains sujets (cela censure plus depuis Elon Musk)
- Mixer : prend tout et construit la “timeline”.
- Utilisateur répond aux réponses : x75.
- En fait que 80% du code ouvert.

The end of faking it in silicon valley
[https://www.nytimes.com/2023/04/15/business/silicon-valley-fraud.html](https://www.nytimes.com/2023/04/15/business/silicon-valley-fraud.html)

- Les startups qui brulaient du cash sans business model clair.
- Procès et prisons pour falsification de données clients.
- Les approches non éthiques ne sont plus ignorées.
- Avant les investisseurs avaient peur de se mettre les créateurs de boite à dos, maintenant, l’argent vaut cher.
- “finding out who is swimming naked when the tide goes out” Warren Buffett.
- “It feels like we were in a nightclub and the lights just turned on”.
- Ils vont évaluer plus exhaustivement les fondateurs.
- Le problème, c’est que VC c’est sur la confiance (one-way au moins) et que là, c'est cassé.



## Rubrique débutant

On parle souvent de librairies et de frameworks, mais c’est quoi la différence ?
[https://www.red-gate.com/simple-talk/development/other-development/the-difference-between-libraries-and-frameworks/](https://www.red-gate.com/simple-talk/development/other-development/the-difference-between-libraries-and-frameworks/)

- Une librairie est une collection de classes, de fonctions, de code, que l’on peut utiliser pour des tâches spécifiques, pour éviter au développeur de réinventer la roue (par exemple une librairie comme Joda Time qui permet de simplifier / codifier la représentation du temps).
- Il y a différents types de librairies : des librairies statiques ou dynamiques, suivant qu’elles sont chargées au runtime ou bien attachées au code que l’on compile. Il y a des librairies standards (comme celles venant du JDK et donc inclues avec lui) ou des librairies tierces (que l’on va par exemple trouver sur Maven Central).
- Un framework (un “cadriciel” en bon français) c’est aussi un ensemble de code, mais aussi de librairies, qui va offrir un cadre de développement pour ses applications. 
- Par exemple un framework Web qui permet de créer des applications Web plus facilement, ou Tensorflow pour développer de nouveaux algorithmes d’intelligence artificielle, ou Unity pour développer des jeux vidéos.
- Mais un framework est effectivement plus “cadrant” dans le sens où on doit suivre ses recommendations sur comment structurer son code, comment étendre des classes ou interfaces du framework, etc.
- Ainsi que les bonnes pratiques et parfois une boite à outil “prêt à l’emploi” vs assemblage.
- Article qui décrit les pour et les contre.


## Conférences

Une liste de conférences Java
[https://javaconferences.org/](https://javaconferences.org/)

La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 10-12 mai 2023 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk23.cfp.dev/#/"><img alt="CFP Devoxx UK 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2023&color=red"></a>
- 12 mai 2023 : [AFUP Day](https://event.afup.org/) - Lille & Lyon (France) <a href="https://event.afup.org/"><img alt="CFP AFUP Day 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-November-2022&color=red"></a>
- 12 mai 2023 : [SoCraTes Rennes](https://socrates-rennes.github.io/) - Rennes (France) 
- 25-26 mai 2023 : [Newcrafts Paris](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/newcrafts-paris-2023"><img alt="CFP Newcrafts Paris 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2001-December-2022%20to%2012-February-2023&color=red"></a>
- 26 mai 2023 : [Devfest Lille](https://devfest.gdglille.org/) - Lille (France) <a href="https://conference-hall.io/public/event/hRA5AjQjXYMPI3MpwyoF"> <img alt="Closed Captions" src="https://img.shields.io/static/v1?label=CC&message=Closed%20Captions&color=blue" /> <img alt="CFP Devfest Lille 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2003-Jan-2023%20to%2031-March-2023&color=red"></a>
- 27 mai 2023 : [Polycloud](https://polycloud.fr) - Montpellier (France) <a href="https://conference-hall.io/public/event/OR1ldOA5G0ASoizWvVbO"><img alt="Polycloud" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-April-2023&color=red"></a>
- 31 mai 2023-2 juin 2023 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxxpl23.cfp.dev/"><img alt="CFP Devoxx Poland 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=red"></a>
- 31 mai 2023-2 juin 2023 : [Web2Day](https://www.web2day.co/) - Nantes (France) 
- 1 juin 2023 : [Javaday](https://javaday.parisjug.org/) - Paris (France) 
- 1 juin 2023 : [WAX](https://www.waxconf.fr/) - Aix-en-Provence (France) <a href="https://conference-hall.io/public/event/BtpnpzTxdVAxEJCcfTJW"><img alt="CFP WAX Conf" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2023&color=red"></a>
- 1-2 juin 2023 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 2 juin 2023 : [Flutter Connection](https://flutterconnection.io/) - Paris (France) 
- 2-3 juin 2023 : [Sud Web](https://sudweb.fr/2023/) - Toulouse (France) <a href="https://sudweb.fr/2023/appel-a-sujet/"><img alt="CFP Sud Web" src="https://img.shields.io/static/v1?label=CFP&message=until%207-April-2023&color=red"></a>
- 7 juin 2023 : [Serverless Days Paris](https://paris.serverlessdays.io/fr/) - Paris (France) <a href="https://sessionize.com/serverlessdays-paris-2023/"><img alt="CFP Serverless Days Paris 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-February-2023&color=red"></a>
- 14-15 juin 2023 : [OW2 openSource Conf](https://www.ow2con.org/view/2023/) - Paris (France) <a href="https://pretalx.com/ow2con-2023/cfp"><img alt="CFP OW 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%20-26-February-2023&color=red"></a>
- 14-17 juin 2023 : [VivaTech (Viva Technology)](https://vivatechnology.com/) - https://vivatechnology.com/) - Paris (France) 
- 15-16 juin 2023 : [Le Camping des Speakers](https://camping-speakers.fr/) - Baden (France) <a href="https://conference-hall.io/public/event/HDF3RTtlPRv7WIuxthtr"><img alt="CFP Camping Speakers June 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=red"></a>
- 15-17 juin 2023 : [Pas Sage En Seine](https://participer.passageenseine.fr/) - Choisy-le-Roi (France) <a href="https://participer.passageenseine.fr/proposals/new"><img alt="CFP Pas Sage en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%202-April-2023&color=red"></a>
- 20 juin 2023 : [Mobilis in Mobile](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/public/event/xucx9AFfz79zIgxT6Lti"><img alt="CFP Mobilis in Mobile 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2023&color=red"></a>
- 20 juin 2023 : [Cloud Est](http://cloudest-event.fr/) - Villeurbanne (France) <a href="https://conference-hall.io/speaker/event/ESKiH3aEGAWFiXKvcpby"><img alt="CFP Cloud Est 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-April-2023&color=red"></a>
- 20-22 juin 2023 : [Adeo DevSummit](https://forms.gle/YPcjupChvqQif85B9) - Lille (France) <a href="https://forms.gle/YPcjupChvqQif85B9"><img alt="CFP adeo DevSummit 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-May-2023&color=green"></a>
- 21-23 juin 2023 : [Rencontres R](https://rr2023.sciencesconf.org) - Avignon (France) 
- 28-30 juin 2023 : [Breizh Camp](https://www.breizhcamp.org/) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2023"><img alt="CFP Breizh Camp 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-April-2023&color=red"></a>
- 29 juin 2023 : [Google Cloud Summit France](https://cloudonair.withgoogle.com/events/summit-france-2023) - Paris (France) 
- 29-30 juin 2023 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/public/event/Jnevkv3bLyxZOyYyiWSC"><img alt="CFP Sunny Tech 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=red"></a>
- 29-30 juin 2023 : [Agi’Lille](https://agilille.fr/) - Lille (France) <a href="https://sessionize.com/agilille-2023"><img alt="AgiLille 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2023&color=red"></a>
- 7-9 juillet 2023 : [Nantes Maker Campus](https://nantesmakercampus.fr/) - Nantes (France) 
- 8 septembre 2023 : [JUG Summer Camp](https://www.jugsummercamp.org/) - La Rochelle (France) <a href="https://conference-hall.io/public/event/wvKVYtvwGy7z5NEt8tOW"><img alt="CFP JUG Sumer Camp" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-June-2023&color=green"></a>
- 18 septembre 2023 : [Agile Tour Montpellier](https://agiletourmontpellier.fr/) - Montpellier (France) <a href="https://conference-hall.io/public/event/mXxbggAyDUbTFXazxkWX"><img alt="CFP Agile Tour Montpellier" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2023&color=green"></a>
- 19-20 septembre 2023 : [Agile en Seine](https://www.agileenseine.com/) - Paris (France) <a href="https://sessionize.com/agile-en-seine-2023/"><img alt="CFP Agile en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=green"></a>
- 19 septembre 2023 : [Salon de la Data Nantes](https://salondata.fr/index.php/le-salon/) - Nantes (France) & Online 
- 21-22 septembre 2023 : [API Platform Conference](https://api-platform.com/con/2023) - Lille (France) & Online 
- 25-26 septembre 2023 : [BIG DATA & AI PARIS 2023](https://www.bigdataparis.com/) - Paris (France) <a href="#"><img alt="CFP BIG DATA & AI PARIS 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-March-2023&color=red"></a>
- 28-30 septembre 2023 : [Paris Web](https://www.paris-web.fr/) - Paris (France) 
- 2-6 octobre 2023 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 6 octobre 2023 : [DevFest Perros-Guirec](https://devfest.codedarmor.fr/) - Perros-Guirec (France) <a href="https://conference-hall.io/public/event/sO14GCz3BN0lXwU5Ruf6"><img alt="CFP DevFest Perros-Guirec 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2023&color=green"></a>
- 10 octobre 2023 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-2023/"><img alt="CFP ParisTestConf 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2023&color=green"></a>
- 11-13 octobre 2023 : [Devoxx Morocco](https://devoxx.ma/) - Agadir (Morocco) <a href="https://devoxx.ma/"><img alt="CFP ParisTestConf 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2005-June%20to%2024-July-2023&color=red"></a>
- 12 octobre 2023 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/public/event/SkVFHQ5kzrrfUlSU4MK1"><img alt="CFP Cloud Nord 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June&color=green"></a>
- 12-13 octobre 2023 : [Volcamp 2023](https://www.volcamp.io/) - Clermont-Ferrand (France) <a href="https://conference-hall.io/public/event/b9seMUHc924mGItMl2aa"><img alt="CFP Volcamp 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-May-2023&color=green"></a>
- 12-13 octobre 2023 : [Forum PHP 2023](https://event.afup.org/forum-php-2023) - Marne-la-Vallée (France) 
- 19-20 octobre 2023 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) <a href="https://conference-hall.io/public/event/z5FSBfmwJSUWb4UO9hD4"><img alt="CFP DevFest Nantes 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=green"></a>
- 19-20 octobre 2023 : [Agile Tour Rennes](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2023/"><img alt="CFP Agile Tour Rennes 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-May-2023&color=green"></a>
- 26 octobre 2023 : [Codeurs en Seine](https://www.codeursenseine.com/2023) - Rouen (France) 
- 25-27 octobre 2023 : [ScalaIO](https://scala.io/) - Paris (France) 
- 26-27 octobre 2023 : [Agile Tour Bordeaux](https://agiletourbordeaux.fr/) - Bordeaux (France) 
- 10 novembre 2023 : [BDX I/O](https://www.bdxio.fr/) - Bordeaux (France) 
- 15 novembre 2023 : [DevFest Strasbourg](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/public/event/I0SQmndJ7vrnWeBdEuTQ"><img alt="CFP DevFest Strasbourg 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2023&color=green"></a>
- 16 novembre 2023 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://devfesttoulouse.fr/#le-cfp"><img alt="CFP DevFest Toulouse 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=green"></a>
- 6-7 décembre 2023 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) <a href="https://sessionize.com/open-source-experience-2023/"><img alt="CFP [Open Source Experience 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-june-2023&color=green"></a>
- 7-8 décembre 2023 : [TechRocks Summit](https://events.tech.rocks/summit-2023/fr/registration/ticketing) - Paris (France) 
- 31 janvier 2024-3 février 2024 : [SnowCamp](https://snowcamp.io/fr/) - Grenoble (France) 
- 19-22 mars 2024 : [KubeCon + CloudNativeCon Europe 2024](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe-2024/) - Paris (France) 
- 28-29 mars 2024 : [SymfonyLive Paris 2024](https://live.symfony.com/2024-paris/) - Paris (France) 
- 17-19 avril 2024 : [Devoxx France](https://www.devoxx.fr/) - Paris (France) 
- 25-26 avril 2024 : [MiXiT](https://mixitconf.org/fr/) - Lyon (France) 
- 25-26 avril 2024 : [Android Makers](https://androidmakers.droidcon.com/) - Paris (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->


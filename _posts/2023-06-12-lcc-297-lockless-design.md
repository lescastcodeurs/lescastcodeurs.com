---
title: LCC 297 - Lockless design
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 297
mp3_length: 53233552
tweet: Lockless design #rust #webassembly #guava #debezium #kafka #flamegraph #opensource #llm #lock
# tweet size: 91-93 -> 99-101 #######################################################################
---
Guillaume, Arnaud et Emmanuel discutent des nouvelles de mai et juin. La communauté Rust, WebAssembly. Guava, Debezium, Kafka, de flame graph, d’open source et bien sûr les _large language models_.
On répond aussi à la question fondamentale : mais pourquoi Maven n’a pas de fichier `.lock` ?

Enregistré le 9 juin 2023

Téléchargement de l’épisode [LesCastCodeurs-Episode-297.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-297.mp3)

## News


### Langages

Lors de Microsoft BUILD 2023, un des fondateurs de OpenAI a fait une excellente présentation de Large Language Models, des GPT
[https://build.microsoft.com/en-US/sessions/db3f4859-cd30-4445-a0cd-553c3304f8e2](https://build.microsoft.com/en-US/sessions/db3f4859-cd30-4445-a0cd-553c3304f8e2)

- Il parle du fonctionnement des LLM, comment/pourquoi ils arrivent à générer ce qu’ils génèrent.
- Le fine-tuning, l’apprentissage renforcé avec feedback humain, l’art du prompting.
- Des patterns comme Chain of Thought (CoT) ou ReAct (Reflect then Act).

Leaning Technologies annonce l’arrivée prochaine de CheerpJ 3 : le retour de Java dans le navigateur, grâce à WebAssembly
[https://leaningtech.com/announcing-cheerpj-3-0-a-jvm-replacement-in-html5-and-webassembly-to-run-java-applications-and-applets-on-modern-browsers/](https://leaningtech.com/announcing-cheerpj-3-0-a-jvm-replacement-in-html5-and-webassembly-to-run-java-applications-and-applets-on-modern-browsers/)

- Avant la version 3.0, CheerpJ utilisait une approche AOT (Ahead Of Time compilation) qui nécessitait aussi une étape d’intégration continue pour transformer aussi toutes les dépendances JAR associées à un projet.
- Avec la version 3.0, qui devrait sortir cet été, CheerpJ adopte une approche JIT (Just-In-Time compilation) qui ressemble plus à l’approche de Java lui-même.
- Plus besoin non plus de version custom d’OpenJDK.
- Les Applets vous avaient manqué ? Elles sont de retour avec WebAssembly 😀.

Communauté RUST : Il y a de l’eau dans le gaz 
[https://www.jntrnr.com/why-i-left-rust/](https://www.jntrnr.com/why-i-left-rust/)

- Plus d’infos sur [https://gist.github.com/fasterthanlime/42da9378768aebef662dd26dddf04849](https://gist.github.com/fasterthanlime/42da9378768aebef662dd26dddf04849).
- Lié au backchannel et un petit groupe qui essaie de faire les choses bien, mais qui dérape de l’extérieur.
- En gros, ils ont un process interne pour prendre des décisions.
- Avec ce process, ils ont invité une personne pas super pro-Rust à faire la keynote à RustConf.
- D’autres membres du commité ont vu ça et ont discuté en backchannel pour annuler la décision (sans suivre le process).
- Il y a eu une semaine de pause avant action, mais pas d’annonce.
- Le speaker a été dékeynoté et a donc refusé de venir à la conférence.
- Et paf ! Ça énerve des gens décisionnaire et ils démissionnent.
- Bref des gens qui veulent faire bien, mais en cercle un peu trop fermé.

Les gens de Wasmer étendent WASI avec WASIX, en rajoutant le support POSIX, les threads… permettant de compiler vers WASM plein de projet C/C++ ou Rust, comme cURL
[https://wasmer.io/posts/announcing-wasix](https://wasmer.io/posts/announcing-wasix)

- Ça frotte un peu entre innovation et standardisation dans la communauté WASM.
- WASMER sont un peu les cowboys startuper.
- Par exemple, ils ont essayé de déposer la marque WebAssembly au nez et à la barbe de la communauté.
- Donc la reaction du cœur de la communauté face à cette annonce est plutôt calme.
- WASI c’est standard, mais ça prend du temps à maturer.
- WASIX c’est cool et disponible maintenant, mais c’est un produit d’une société spécifique, donc pas de portabilité.


### Librairies

Guava 32 est sorti et beaucoup de choses annotées en `@Beta` ne le sont plus
[https://www.reddit.com/r/java/comments/13w2l8w/guava_320_released_today_and_the_beta_annotation/](https://www.reddit.com/r/java/comments/13w2l8w/guava_320_released_today_and_the_beta_annotation/)

- Ils ont eu des API en `@Beta` pendant longtemps pour protéger des risques de changements.
- En pratique quasi personne ne se limitait au non-beta, et ces API n’ont pas ou peu bougé.
- Ils ont donc enlevé `@Beta` de la plupart des API.
- Beaucoup de parties de Guava sont dans le JDK, le cache est dans Caffeine.
- De bons échanges dans les commentaires entre les utilisateurs et Kevin, un des mainteneurs chez Google

Comment démarrer avec l’API PaLM de Google, mais en Java !
[https://glaforge.dev/posts/2023/05/30/getting-started-with-the-palm-api-in-the-java-ecosystem/](https://glaforge.dev/posts/2023/05/30/getting-started-with-the-palm-api-in-the-java-ecosystem/)

- Guillaume a écrit une petite application qui génère des histoires pour enfants avec un Large Language Model (l’API PaLM) : [https://bed-time-stories.web.app/](https://bed-time-stories.web.app/).
- Le code est disponible sur Github : [https://github.com/glaforge/bedtimestories](https://github.com/glaforge/bedtimestories).
- Il explique également le processus incrémental des prompts qui aident à générer aussi le contenu de l’application : [https://glaforge.dev/posts/2023/06/08/creating-kids-stories-with-generative-ai/](https://glaforge.dev/posts/2023/06/08/creating-kids-stories-with-generative-ai/).


### Infrastructure

Debezium 2.2
[https://debezium.io/blog/2023/04/20/debezium-2-2-final-released/](https://debezium.io/blog/2023/04/20/debezium-2-2-final-released/)

- Experimental opt-in Parallel Snapshots,
- Incremental snapshots with surrogate keys,
- Quarkus 3 support,
- Ingestion of Oracle changes from logical standby instances,
- Google Spanner improvements,
- New Debezium Server sinks for Infinispan, RabbitMQ, and RocketMQ,
- New Storage APIs for Amazon S3 and RocketMQ,
- Many MongoDB improvements,
- Cassandra connector for Cassandra Enterprise.

Un article sur l’utilisation de Kafka par CloudFlare
[https://www.infoq.com/articles/kafka-clusters-cloudflare/](https://www.infoq.com/articles/kafka-clusters-cloudflare/)

- C’est du “classique”, mais bon de se le faire rappeler.
- Beaucoup d’évènements CloudFlare ne passent pas Kafka pour processing.
- Kafka en tant que bus générique.
- Ils ont imposé un message unique par topic via Protobuf.
- Ils ont une Application Service team (internal developer platform) depuis peu de temps.
- GitOps pour création de topic…
- Ils ont développé un connector framework déclaratif pour étendre le panel de patrons d’architecture disponibles.
- Ils ont développé des SDKs d’accès à Kafka avec monitoring (Prometheus).
- Sympa à lire.

Post mortem du problème chez Datadog
[https://www.datadoghq.com/blog/2023-03-08-multiregion-infrastructure-connectivity-issue/](https://www.datadoghq.com/blog/2023-03-08-multiregion-infrastructure-connectivity-issue/)

- Datadog a perdu tous ses services dans la plupart de ses regions pendant 3 heures avant la première récupération et 10 heures au total pour la récupération totale.
- Équipe : 10 senior engineering leaders, about 70 local incident commanders and a pool of 450 to 750 incident responders active throughout the incident, which required four shifts to bring the incident to full resolution.
- Cause : une mise à jour de systemd appliquée sur la plupart de leurs VM en quasi parallèle qui a effacé les routes des conteneurs et ne les a pas remis ; c’est un cas qui n’arrive pas au reboot d’un nœud (init sequence).
- Des dizaines de milliers de nœuds ont été impactés.
- En général, ils font du rollout par région en enlevant les nœuds etc, mais le base OS avait un legacy update channel activé (vs géré par les équipes de Datadog manuellement).
- Les nœuds de controllers qui sont censés recycler les nœuds n’ont pu le faire vu le nombre de nœuds et surtout parce qu’eux-mêmes étaient affectés.
- [L’autre article](https://open.substack.com/pub/pragmaticengineer/p/inside-the-datadog-outage).


### Cloud

Le datacenter parisien `europe-west9-a` est en panne depuis 3 semaines
[https://www.lebigdata.fr/data-center-panne](https://www.lebigdata.fr/data-center-panne)

- Un feu s’est déclenché et a touché une zone.
- Le datacenter reste opérationnel sur les zones non touchées, sauf BigTable qui a besoin de la zone touchée.
- Les autres services fonctionnent, sauf les applis utilisateurs qui ne tournaient que sur la zone affectée.


### Outillage

Podman Desktop 1.0 est sorti
[https://podman-desktop.io/blog/podman-desktop-release-1.0](https://podman-desktop.io/blog/podman-desktop-release-1.0)

- Pas grand-chose d’autre à dire que c’est la 1.0.
- "Works on my machine"

Contract testing with Pact
[https://hollycummins.com/contract-testing-devoxx-greece/](https://hollycummins.com/contract-testing-devoxx-greece/)

- Conférence.
- Quand on change un microservice l’autre casse.
- Les tests d’integration sont lents, instables et demandent de grosses machines ou des environnements remote de dev.
- Mock / unit tests ne sont pas vraiment le code de l’autre équipe.
- D’où les contract tests qui vivent entre les tests end to end et les tests unitaires. 
- Peut partir d’un test mock et remplacer avec pact côté consommateur.
- En faisant tourner un pact listener qui enregistre la déclaration et les retours attendus / générés par l’appel du test.
- Copier ce fichier vers le producteur.
- Copier à la main, dans le repo, via un broker.
- Ajoute un test pact côté producteur  qui va exercer le JSON et vérifier que cela marche.
- Tests de pact sont plus profonds qu’un test OpenAPI.
- Consommateur utilise pact comme mock et vérifie le provider avec le contract du mock.

Pourquoi Maven n’a pas de fichier lock ?
[https://www.reddit.com/r/Maven/comments/vkcmys/why_maven_doesnt_have_a_lock_file_like/](https://www.reddit.com/r/Maven/comments/vkcmys/why_maven_doesnt_have_a_lock_file_like/)

- Conversation intéressante sur les fichiers `.lock` dans les builds.
- Par exemple Ruby a le `Gemfile.lock`, npm pareil, mais pas Java ?
- Fondamentalement, c’est dû aux valeurs par défaut initiales et à la culture de la communauté.
- Les versions range sont peu ou pas utilisés en Maven.
- Alors que c’est l’approche par défaut sur d’autres plateformes
- La poule et l’œuf.

Simplifier les flame graph avec JBang
[https://someth2say.wordpress.com/2023/06/04/jbang-and-flame-graphs/](https://someth2say.wordpress.com/2023/06/04/jbang-and-flame-graphs/)

- Discute des flame graph.
- Pour le temps consommé et pas un call graph.
- En hauteur, c’est la profondeur d’appel.
- Ne regarder que la largeur, pas l’ordre.
- Pas quand et où une action est faite, mais qui l’a faite.
- Le reste discute de la manière d’utiliser JBang pour lancer le programme et le javaagent.

Les modérateurs de Stack Overflow en grève contre le flux de réponses d’intelligence artificielle
[https://openletter.mousetail.nl/](https://openletter.mousetail.nl/)

- Le ban des contenus générés par l’IA a été levé discrètement par Stack Overflow.
- Peur du flux de données massif et des hallucinations difficiles à détecter sans passer du temps.
- Pas de consensus communautaire.
- Stack Overflow est une des sources trustées pour les LLM des intelligences artificielles génératives (serpent qui se mord la queue).
- Les modérateurs font tourner l’anti-spam, gèrent les flags levés, ferment ou effacent les entrées, genre les bots qui détectent le plagiat…
- 414 votants dès les premières heures.

Just, un petit outil en ligne de commande avec une syntaxe inspirée de make, pour exécuter des commandes fréquentes dans nos projets
[https://glaforge.dev/posts/2023/06/07/just-a-handy-command-line-tool/](https://glaforge.dev/posts/2023/06/07/just-a-handy-command-line-tool/)

- Syntaxe proche de celle de make.
- Possibilité de définir des dépendances entre tâches.
- Support de paramètres.
- Peut charger des fichier `.env`.
- S’installe sur tous les systèmes d’exploitation qu’on aime bien (et qu’on n’aime pas aussi).



### Méthodologies

AWS retire ses documentations en Open Source
[https://www.infoq.com/news/2023/06/aws-documentation-github/](https://www.infoq.com/news/2023/06/aws-documentation-github/)

- Ils ont open-sourcé en espérant des contributions il y a deux ans, mais sans changer les approches en interne.
- Résultat : copie de repos de l’intérieur vers l’extérieur.
- Tracker de travail interne != externe.
- C’était plus compliqué.
- Leçon, embrasser entièrement sinon les frictions sont compliquées.

Un guide pour communiquer avec l’IA
[https://learnprompting.org/](https://learnprompting.org/)

- Gratuit et open source.
- Prompt Engineering ou comment rédiger vos prompts.
- Plusieurs niveaux (Basic, Intermédiaire, Avancé..).
- Défini plein de concepts: Prompt, Few Shot Prompt, LLMs…



### Loi, société et organisation

Migration de Twitter vers Mastodon (ou plutôt “dual run”)
[https://glaforge.dev/talks/2023/06/09/from-bird-to-elephant-starting-a-new-journey-on-mastodon/](https://glaforge.dev/talks/2023/06/09/from-bird-to-elephant-starting-a-new-journey-on-mastodon/)

- Présentation de Guillaume à Devoxx France et Grèce
- Avec code sur Github pour un bot Mastodon: [https://github.com/glaforge/stootistics](https://github.com/glaforge/stootistics)
- Et un service en ligne pour voir la popularité de ses derniers posts sur Mastodon [https://stootistics.web.app/](https://stootistics.web.app/)




## Conférences

Aurelie Vache publie son agenda des conferences via le site: [https://developers.events/](https://developers.events/)



La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 14-15 juin 2023 : [OW2 openSource Conf](https://www.ow2con.org/view/2023/) - Paris (France) <a href="https://pretalx.com/ow2con-2023/cfp"><img alt="CFP OW 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%20-26-February-2023&color=red"></a>
- 14-17 juin 2023 : [VivaTech (Viva Technology)](https://vivatechnology.com/) - https://vivatechnology.com/) - Paris (France) 
- 15-16 juin 2023 : [Le Camping des Speakers](https://camping-speakers.fr/) - Baden (France) <a href="https://conference-hall.io/public/event/HDF3RTtlPRv7WIuxthtr"><img alt="CFP Camping Speakers June 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=red"></a>
- 15-17 juin 2023 : [Pas Sage En Seine](https://participer.passageenseine.fr/) - Choisy-le-Roi (France) <a href="https://participer.passageenseine.fr/proposals/new"><img alt="CFP Pas Sage en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%202-April-2023&color=red"></a>
- 20 juin 2023 : [Mobilis in Mobile](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/public/event/xucx9AFfz79zIgxT6Lti"><img alt="CFP Mobilis in Mobile 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2023&color=red"></a>
- 20 juin 2023 : [Cloud Est](http://cloudest-event.fr/) - Villeurbanne (France) <a href="https://conference-hall.io/speaker/event/ESKiH3aEGAWFiXKvcpby"><img alt="CFP Cloud Est 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-April-2023&color=red"></a>
- 20-22 juin 2023 : [Adeo DevSummit](https://forms.gle/YPcjupChvqQif85B9) - Lille (France) <a href="https://forms.gle/YPcjupChvqQif85B9"><img alt="CFP adeo DevSummit 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-May-2023&color=red"></a>
- 21-23 juin 2023 : [Rencontres R](https://rr2023.sciencesconf.org) - Avignon (France) 
- 23 juin 2023 : [Unconf HackYourJob](https://www.helloasso.com/associations/hackyourjob-community-lyon/evenements/unconf-juin-2023) - Région lyonnaise (France) 
- 28-30 juin 2023 : [Breizh Camp](https://www.breizhcamp.org/) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2023"><img alt="CFP Breizh Camp 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-April-2023&color=red"></a>
- 29 juin 2023 : [Google Cloud Summit France](https://cloudonair.withgoogle.com/events/summit-france-2023) - Paris (France) 
- 29-30 juin 2023 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/public/event/Jnevkv3bLyxZOyYyiWSC"><img alt="CFP Sunny Tech 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=red"></a>
- 29-30 juin 2023 : [Agi’Lille](https://agilille.fr/) - Lille (France) <a href="https://sessionize.com/agilille-2023"><img alt="AgiLille 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2023&color=red"></a>
- 7-9 juillet 2023 : [Nantes Maker Campus](https://nantesmakercampus.fr/) - Nantes (France) 
- 2-3 septembre 2023 : [SRE France SummerCamp](https://summercamp.srefrance.org) - Chambéry (France) <a href="https://summercamp.srefrance.org/cfp/"><img alt="CFP sre-france-summercamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2021-August-2023&color=green"></a>
- 6 septembre 2023 : [Cloud Alpes](https://www.cloudalpes.fr/) - Lyon (France) <a href="https://conference-hall.io/public/event/90HSNNtojHqk1S8SbavA"><img alt="CFP Cloud Alpes" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2023&color=green"></a>
- 8 septembre 2023 : [JUG Summer Camp](https://www.jugsummercamp.org/) - La Rochelle (France) <a href="https://conference-hall.io/public/event/wvKVYtvwGy7z5NEt8tOW"><img alt="CFP JUG Sumer Camp" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-June-2023&color=green"></a>
- 14 septembre 2023 : [Cloud Sud](https://www.cloudsud.fr/) - Remote / Toulouse (France) <a href="https://conference-hall.io/public/event/UHdxMRvP0zJB2eVBwm1C"><img alt="Cloud Sud" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2023&color=green"></a>
- 18 septembre 2023 : [Agile Tour Montpellier](https://agiletourmontpellier.fr/) - Montpellier (France) <a href="https://conference-hall.io/public/event/mXxbggAyDUbTFXazxkWX"><img alt="CFP Agile Tour Montpellier" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2023&color=green"></a>
- 19-20 septembre 2023 : [Agile en Seine](https://www.agileenseine.com/) - Paris (France) <a href="https://sessionize.com/agile-en-seine-2023/"><img alt="CFP Agile en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=green"></a>
- 19 septembre 2023 : [Salon de la Data Nantes](https://salondata.fr/index.php/le-salon/) - Nantes (France) & Online 
- 21-22 septembre 2023 : [API Platform Conference](https://api-platform.com/con/2023) - Lille (France) & Online 
- 25-26 septembre 2023 : [BIG DATA & AI PARIS 2023](https://www.bigdataparis.com/) - Paris (France) <a href="#"><img alt="CFP BIG DATA & AI PARIS 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-March-2023&color=red"></a>
- 28-30 septembre 2023 : [Paris Web](https://www.paris-web.fr/) - Paris (France) 
- 2-6 octobre 2023 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) <a href="https://dvbe23.cfp.dev/"><img alt="CFP Devoxx Belgium 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%201-July-2023&color=green"></a>
- 6 octobre 2023 : [DevFest Perros-Guirec](https://devfest.codedarmor.fr/) - Perros-Guirec (France) <a href="https://conference-hall.io/public/event/sO14GCz3BN0lXwU5Ruf6"><img alt="CFP DevFest Perros-Guirec 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2023&color=red"></a>
- 10 octobre 2023 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-2023/"><img alt="CFP ParisTestConf 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2023&color=red"></a>
- 11-13 octobre 2023 : [Devoxx Morocco](https://devoxx.ma/) - Agadir (Morocco) <a href="https://dvma23.cfp.dev/"><img alt="CFP ParisTestConf 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2022-May%20to%2017-July-2023&color=red"></a>
- 12 octobre 2023 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/public/event/SkVFHQ5kzrrfUlSU4MK1"><img alt="CFP Cloud Nord 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June&color=green"></a>
- 12-13 octobre 2023 : [Volcamp 2023](https://www.volcamp.io/) - Clermont-Ferrand (France) <a href="https://conference-hall.io/public/event/b9seMUHc924mGItMl2aa"><img alt="CFP Volcamp 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-May-2023&color=red"></a>
- 12-13 octobre 2023 : [Forum PHP 2023](https://event.afup.org/forum-php-2023) - Marne-la-Vallée (France) <a href="https://afup.org/event/forumphp2023"><img alt="CFP ForumPHP 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-June-2023&color=green"></a>
- 19-20 octobre 2023 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) <a href="https://conference-hall.io/public/event/z5FSBfmwJSUWb4UO9hD4"><img alt="CFP DevFest Nantes 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=green"></a>
- 19-20 octobre 2023 : [Agile Tour Rennes](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2023/"><img alt="CFP Agile Tour Rennes 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-May-2023&color=red"></a>
- 26 octobre 2023 : [Codeurs en Seine](https://www.codeursenseine.com/2023) - Rouen (France) 
- 25-27 octobre 2023 : [ScalaIO](https://scala.io/) - Paris (France) 
- 26-27 octobre 2023 : [Agile Tour Bordeaux](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2023/"><img alt="CFP Agile Tour Bordeaux 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-July-2023&color=green"></a>
- 10 novembre 2023 : [BDX I/O](https://www.bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/VORL07zbTZ8CBB8kOVgq"><img alt="CFP BDX I/O 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-July-2023&color=green"></a>
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


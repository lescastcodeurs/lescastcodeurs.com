---
title: LCC 299 - Katia est dans la place !
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 299
mp3_length: 57764741
tweet: Sur @Java 21, @QuarkusIO, @micronautfw, @Hibernate, @NodeJS, Redis, des IAs ... et @karesti
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode de rentrée, Antonio et Arnaud ont le plaisir d'accueillir Katia Aresti dans l'équipe.
Ils passent en revue les dernières nouveautés et sujets chauds de cette rentrée, notamment la sortie de Java 21, les nouvelles versions de Quarkus, Micronaut, Hibernate, NodeJS, Redis, et bien d'autres encore.
Ils discutent de sujets plus généraux tels que l'observabilité, la nouvelle tendance "Platform Engineering", et la productivité des développeurs.
Ils abordent aussi les sujets sur la sécurité, tels que les failles sur les CPUs Intel et AMD, ainsi que la vie privée, avec les Tracking APIs de Chrome, Firefox et le projet de loi SREN.
Le tout est agrémenté de sa dose d'IA, avec des librairies telles que Semantic Kernel, ainsi que des sujets plus haut niveau tels que Google Gemini, Meta GPT, LLama 2, et les biais et la consommation énergétique de l'IA.

Enregistré le 8 septembre 2023

Téléchargement de l’épisode [LesCastCodeurs-Episode-299.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-299.mp3)

## News

### Langages

Apache Groovy a 20 ans!
[https://twitter.com/ApacheGroovy/status/1695388098950217909](https://twitter.com/ApacheGroovy/status/1695388098950217909)

- L'annonce du lancement du projet par James Strachan [https://web.archive.org/web/20030901064404/http://radio.weblogs.com/0112098/2003/08/29.html](https://web.archive.org/web/20030901064404/http://radio.weblogs.com/0112098/2003/08/29.html)
- Le projet a depuis énormément évolué et après plusieurs vies a été adopté par la fondation Apache en 2015

Java 21 arrive le 19 septembre
[https://www.infoworld.com/article/3689880/jdk-21-the-new-features-in-java-21.html](https://www.infoworld.com/article/3689880/jdk-21-the-new-features-in-java-21.html).

- C'est la nouvelle LTS
- Pas mal de nouvelles fonctionnalités comme les virtual threads, le pattern matching sur les switch, sequenced collections ...
- Retrouvez le 19 septembre une interview de Jean-Michel Doudoux par Charles Sabourdin pour l'épisode 300 des castcodeurs!

### Librairies

Semantic Kernel pour Java est (en train de) sorti:
[https://devblogs.microsoft.com/semantic-kernel/introducing-semantic-kernel-for-java/](https://devblogs.microsoft.com/semantic-kernel/introducing-semantic-kernel-for-java/)

- Framework OSS pour faire de l’IA
- .Net et Python
- Java 0.2.7 Alpha est publié
- Kernel car il est tout petit
- Se connecte à plusieurs fournisseurs (aujourd’hui OpenAI, Azure AI, Hugging Face), plusieurs DB vectorielles, plusieurs template de prompt (suit la specification de OpenAI)

OpenSSL qui committe
[https://www.openssl.org/blog/blog/2023/07/17/who-writes-openssl/](https://www.openssl.org/blog/blog/2023/07/17/who-writes-openssl/)

- en majorité des OSS payés
- puis des gens payés par leur boite
- et enfi des contributeurs non payés
- c'est ne passant rapide mais ca montre que depuis heartbleed, ca a changé

Micronaut 4.1.0
[https://micronaut.io/2023/09/01/micronaut-framework-4-1-0-released/](https://micronaut.io/2023/09/01/micronaut-framework-4-1-0-released/)

- Bean Mappers pour créer automatiquement une correspondance entre un type et un autre
- un Introspection Builder l'annotation @Introspected pour générer un builder dynamique si un type ne peut être construit que via un modèle builder
- améliorations pour les développeurs utilisant Kotlin Symbol Processing (KSP)

Quarkus 3.3.1 / 3.3.2

[https://quarkus.io/blog/quarkus-3-3-1-released/](https://quarkus.io/blog/quarkus-3-3-1-released/)

[https://quarkus.io/blog/quarkus-3-3-2-released/](https://quarkus.io/blog/quarkus-3-3-2-released/)

- Pas mal de fixes
  - [https://github.com/quarkusio/quarkus/releases/tag/3.3.1](https://github.com/quarkusio/quarkus/releases/tag/3.3.1)
  - [https://github.com/quarkusio/quarkus/releases/tag/3.3.2](https://github.com/quarkusio/quarkus/releases/tag/3.3.2)
- Il est important de noter qu'un problème de dégradation des performances et de la mémoire a été introduit dans Quarkus 3.3. Ce problème est corrigé dans Quarkus 3.3.2.

Hibernate ORM 6.3.0 et 6.2.8 [https://hibernate.org/orm/](https://hibernate.org/orm/) et Hibernate Reactive 2.0.5

- un support initial de la spécification Jakarta Persistence 3.2
- Un nouveau guide d'introduction Hibernate 6, un nouveau guide de syntaxe et de fonctionnalités pour le langage de requête Hibernate (Hibernate Query Language)
- Annotation @Find sur des méthodes -> créer des méthodes de recherche similaires aux méthodes de requête
- Reactive compatible avec Hibernate ORM 6.2.8.Final, certains changements d'api

### Infrastructure

Une série d'articles sur l'observabilité par Mathieu Corbin

- Observability: tout ce que vous avez toujours voulu savoir sur les métriques: [https://www.mcorbin.fr/posts/2023-07-04-metriques/](https://www.mcorbin.fr/posts/2023-07-04-metriques/)
- Tracing avec Opentelemetry: pourquoi c'est le futur (et pourquoi ça remplacera les logs): [https://www.mcorbin.fr/posts/2023-08-20-traces/](https://www.mcorbin.fr/posts/2023-08-20-traces/)

- L'auteur reprend les bases sur l'observabilité.
  - Qu’est ce qu’une métrique ? Les labels, les cardinalités
  - Les types de métriques (Compteurs, jauges, quantiles et histogrammes)
  - C’est quoi le tracing ?
  - Traces, Spans, Resources, Scopes qu'est ce que c'est?
  - Les Events pour remplacer les logs?

### Web

NodeJS 20.6.0 est disponible et ajoute le support des fichiers `.env`
[https://philna.sh/blog/2023/09/05/nodejs-supports-dotenv/](https://philna.sh/blog/2023/09/05/nodejs-supports-dotenv/)

- Configurable avec l'option `--env-file`
- Le fichier `.env` peut contenir des   variables d'environnement et commentaires `#`
- Attention par contre: pas de lignes multiples ni d'extension de variables
- Vous pouvez par exemple configurer _`NODE_OPTIONS`_ avec ce système

### Data

Redis 7.2 est sorti !
[https://redis.com/blog/introducing-redis-7-2/](https://redis.com/blog/introducing-redis-7-2/)

- Auto-tiering : cette nouvelle fonctionnalité permet de stocker les données sur des supports de stockage différents, en fonction de leur importance et de leur fréquence d'accès. Cela permet d'améliorer les performances et la scalabilité de Redis.
- RESP3 : cette nouvelle version du protocole RESP permet une communication plus efficace entre Redis et les clients.
- Improvements to performance : de nombreuses améliorations de performances ont été apportées à Redis 7.2, notamment pour les opérations  de lecture et d'écriture.
- New commands : plusieurs nouvelles commandes ont été ajoutées à Redis 7.2, notamment :
  - `CLIENT NO-TOUCH` : cette commande permet d'empêcher un client d'être touché par une opération AOF ou RDB.
  - `WAITAOF` : cette commande permet d'attendre que l'AOF soit écrite avant de poursuivre l'exécution.

Dans le podcast sont cités les hot replacement des Redis, comme <https://www.dragonflydb.io/>

### Architecture

Article sur Google Gemini et sa capacité a battre ChatGPT [https://www.semianalysis.com/p/google-gemini-eats-the-world-gemini](https://www.semianalysis.com/p/google-gemini-eats-the-world-gemini)

- Google a raté les premiers pas (ils avient le meilleur LLM public avant ChatGPT 3)
- ET les chercheurs qui invente le champs des LLMs
- Google va 5x ChatGPT-4 avant al fin de l'année, mais vont-il les publier
- les chercheurs se tirent la bourre sur le nombre de GPU (H100) auxquels ils ont accès ; ce sont lers grosses orga comme Meta OpenAI Google
- et les autres qui lutent avec des GPU qui n'ont pas assez de VRAM et ce qu'ils vont faire c'est de la merde et sans consequence
- le peuple utilise le modele dense de LLAMA mais pour les environnements contraints ca serait mieux des sparse models et du speculative decoding.
- ils devraient se concentre sur la performance de modele qui utilise plus de compute et memoire en evitant de consommer de la bande passante de memoire, c'est ce que l'edge a besoin
- les benchmarks public ne mesurent pas des choses utiles
- meme hugging faces est dans la category des pauvres de GPU
- Nvidia est entrain de se construire une machine de guerre (service)
- la chine et les us vont etre en competition mais l'europe qui fait du GPU pauvre ne va pas s'en sortir
- les startups ne peuvent pas payer les GPU en actiosn, il faut du cash
- Tout le monde rempli les poches de NVidia, sand Google
- Gogole grossi exponentiellement ses propres GPUs

Meta GPT [https://www.infoq.com/news/2023/08/metagpt-agent-collaboration/](https://www.infoq.com/news/2023/08/metagpt-agent-collaboration/)

IA: les biais et énergie qui consomme par Leslie Miley tech advisor du CTO de Microsoft [https://www.infoq.com/presentations/ai-bias-sustainability](https://www.infoq.com/presentations/ai-bias-sustainability)

- nouvels infranstructures
- consommation énergétique et d’eau des data center pour IA est terriblement coûteuse
- l'impact des infrastructures sur les comunautés (bruit)
- explique bien son point de vu sur les problèmes d'amplification des biais du IA
- propose des stratégies pour mitiger l'impact negatif

Kubeflow toolkit pour deployer machine learning (ML) workflow en Kubernetes est accepté par la CNCF (Cloud Native Computing Foundation)
[https://www.infoq.com/news/2023/08/kubeflow-cncf-project](https://www.infoq.com/news/2023/08/kubeflow-cncf-project)

### Méthodologies

Measuring developer productivity? A response to McKinsey by Kent Beck and Gergely Orosz ([pragmaticengineer.com](http://pragmaticengineer.com))
[https://tidyfirst.substack.com/p/measuring-developer-productivity](https://tidyfirst.substack.com/p/measuring-developer-productivity)

- McKinsey a sorti un [article](https://www.mckinsey.com/industries/technology-media-and-telecommunications/our-insights/yes-you-can-measure-software-developer-productivity) où ils expliquent la  recette miracle recherchée par tous les managers comme le graal: Comment mesurer la productivité des développeurs? (faut bien vendre du conseil)
- Kent et Gergely partent d’un model mental de description de la création de valeur par le développeur pour ensuite voir quels sont les besoins de mesurer la productivité et comparent cela avec d’autres secteurs (la vente, le support, le recrutement). 
- Ils concluent cette première partie avec les compromis à faire pour que ce type de mesures ait un intérêt sans impacter trop négativement les développeurs
- un autre article dans la même lignée de Martin Fowler [https://martinfowler.com/bliki/CannotMeasureProductivity.html](https://martinfowler.com/bliki/CannotMeasureProductivity.html)

Et si on parlait de Platform Engineering ?

- [DevOps vs. SRE vs. Platform Engineering (humanitec.com)](https://humanitec.com/blog/sre-vs-devops-vs-platform-engineering)
- [What is platform engineering? (gartner.com)](https://www.gartner.com/en/articles/what-is-platform-engineering) / [What is platform engineering? (platformengineering.org)](https://platformengineering.org/blog/what-is-platform-engineering)
- [Internal Developer Platform](https://internaldeveloperplatform.org/)
- [Cognitive load](https://platformengineering.org/blog/cognitive-load)
- [Team topologies](https://teamtopologies.com/key-concepts)
- [Engineering Effectiveness (thoughtworks.com)](https://www.thoughtworks.com/what-we-do/digital-solutions/engineering-effectiveness) and [Maximize your tech investments with Engineering Effectiveness (thoughtworks.com)](https://www.thoughtworks.com/insights/articles/a-comprehensive-methodology-for-engineering-effectiveness)

- Ces différents articles retracent la génèse du concept de Platform Engineering
- L'activité de Platform Engineering vient en réponse à la charge cognitive rajoutée aux équipes techs dans des transitions DevOps loupées (You build it, you run it ... et vous vous débrouillez).
- Cela conduit à la création de golden paths et d'une Internal Developers Platform qui doit proposer en interne les services nécessaires aux équipes pour livrer leurs produits le lus efficacement possible tout en suivant les critères de qualité, de compliance de l'entreprise.
- Pour en savoir plus, une table ronde à laquelle Arnaud a participé en Juillet : [https://youtu.be/N-tN7HUA4No?si=2P0wSqG32MLWUlGq](https://youtu.be/N-tN7HUA4No?si=2P0wSqG32MLWUlGq)

On call Process (Astreinte) , startup TinyBird par VP Engineering Félix López (ex google, ex eventbrite) [https://thenewstack.io/keeping-the-lights-on-the-on-call-process-that-works/](https://thenewstack.io/keeping-the-lights-on-the-on-call-process-that-works/)

- Si votre produit est SAAS, on doit avoir des astreintes. Cela impose un lourd fardeau à ceux qui doivent être en astreinte,, surtout en petite entreprise
- Petites entreprises évitent avoir un processus d'astreinte formel pour éviter le stress. Cela crée dans la pratique plus de stress: Si personne n'est responsable, tout le monde est responsable.
- Tinybird est la plateforme de données en temps réel pour les développeurs et les équipes de données. Pré création du process formel chez Tinybird: désorganisé, non structuré et stressant 
- Mise en place: Principes fondamentaux d'un processus d'astreinte: L'astreinte n'est pas obligatoire, minimiser le bruit, pas seulement pour les SRE, alert = runbook, avoir des backups pour la personne en astreinte, appeler quelqu'un devrait être la dernière solution, minimiser le temps en astreinte
- L'article explique comment ils sont passé regarder chaque alerte (comprehensible?, exploitable?),  puis avoir un board  grafana pour chacune et plan spécifique. Une fois le tri fait, tout migré vers un seul channel de com, et manuel d'astreinte pour chaque alerte. Itérer.
- Multiples benefices sur le long terme: rapports d'incident ouvert, atténuer les problèmes futurs, renforcement la propriété et les connaissances du  code et systèmes au sein de toute l'équipe etc.

### Sécurité

Downfall, une nouvelle faille de sécurité sur les processeurs intel ( [https://www.lemondeinformatique.fr/actualites/lire-la-faille-downfall-met-a-mal-des-milliards-de-processeurs-intel-91247.html](https://www.lemondeinformatique.fr/actualites/lire-la-faille-downfall-met-a-mal-des-milliards-de-processeurs-intel-91247.html) ) et AMD ne fait pas mieux avec une faille nommée Inception ([https://www.lemondeinformatique.fr/actualites/lire-les-puces-amd-vulnerables-a-la-faille-inception-91273.html](https://www.lemondeinformatique.fr/actualites/lire-les-puces-amd-vulnerables-a-la-faille-inception-91273.html))

- **Downfall**, La vulnérabilité est due à des fonctions d'optimisation de la mémoire dans les processeurs Intel qui révèlent involontairement les registres matériels internes aux logiciels. Cela permet à des logiciels non-fiables d'accéder à des données stockées par d'autres programmes, qui ne devraient normalement pas être accessibles. Tous les PC ou ordinateurs portables équipés de processeurs Intel Core de la 6e génération Skylake jusqu'aux puces Tiger Lake de 11e génération incluses contiennent cette faille. Les derniers processeurs Core 12e et 13e génération d'Intel ne sont pas concernés.
- **Inception**, nécessite un accès local au système pour être potentiellement exploité ce qui en limite de fait la portée. Tous les processeurs AMD depuis 2017 sont touchés, incluant les derniers modèles Zen 4 Epyc et Ryzen

Comment désactiver le nouveau tracking publicitaire ciblé sur Chrome
[https://www.blogdumoderateur.com/chrome-comment-desactiver-tracking-publicitaire-cible/](https://www.blogdumoderateur.com/chrome-comment-desactiver-tracking-publicitaire-cible/)

- Google a annoncé en juillet le déploiement de sa nouvelle [API Topics](https://developer.chrome.com/docs/privacy-sandbox/topics/overview/), permettant _« à un navigateur de partager des informations avec des tiers sur les intérêts d’un utilisateur tout en préservant la confidentialité »_. 
- C’est cette API, incluse dans la version Chrome 115 de juillet 2023, qui est censée remplacer les cookies tiers.

### Loi, société et organisation

Une nouvelle definition d'open pour Llama 2? [https://opensourceconnections.com/blog/2023/07/19/is-llama-2-open-source-no-and-perhaps-we-need-a-new-definition-of-open/](https://opensourceconnections.com/blog/2023/07/19/is-llama-2-open-source-no-and-perhaps-we-need-a-new-definition-of-open/)

- c'est relativement "open" mais il y a des restrictions donc pas open source
- pas plus de 700 M d'utilisateurs par mois
- pas le droit d'utiliser Llama pour améliorer d'autres  modèles autres que dse dérivés de Llama
- et c'est le modele final qui est ouvert, pas la sauce pour le construire, donc pas de maven build ni le "source code" pour y arriver "from scratch"
- attention au risuqe de sacrivier open source pour avoir l'IA plus vite, plus facile

HashiCorp passe tous ses projets open source en BSL, comme Confluent, Mongo, Redis, Elastic, etc
[https://thenewstack.io/hashicorp-abandons-open-source-for-business-source-license/](https://thenewstack.io/hashicorp-abandons-open-source-for-business-source-license/)

- Couverture par InfoQ [https://www.infoq.com/news/2023/08/hashicorp-adopts-bsl/](https://www.infoq.com/news/2023/08/hashicorp-adopts-bsl/)
- Fork de Terraform : OpenTF, avec pour objectif de rejoindre la CNCF [https://opentf.org/announcement](https://opentf.org/announcement)

Stack overflow annonce Overflow AI [https://www.infoq.com/news/2023/09/stackoverflow-overflowai/](https://www.infoq.com/news/2023/09/stackoverflow-overflowai/)

- l'intégration de l'IA générative dans leur plateforme publique, Stack Overflow for Teams, ainsi que de nouveaux domaines de produits
- IA/ML aident à générer des balises initiales et à suggérer des paires question-réponse, permettant aux développeurs de se concentrer sur l'amélioration et la précision
- Amélioration des Capacités de Recherche
- Les forums de questions-réponses basés sur la communauté sont le cœur battant de Stack Overflow. Selon Prashanth Chandrasekar, PDG de Stack Overflow, l'objectif d'OverflowAI est d'améliorer la communauté de diverses manières plutôt que de la remplacer complètement.

Vous avez entendu parler du projet de loi SREN ? 
[http://share.mozilla.org/817319645t](http://share.mozilla.org/817319645t)

- Le gouvernement français prépare une loi qui pourrait menacer la liberté sur Internet. Le projet de loi visant à sécuriser et réguler l’espace numérique (SREN) obligerait les navigateurs web, comme Mozilla Firefox, à bloquer des sites web directement au niveau du navigateur.
- Mozilla lance une pétition pour retirer cette  n-ieme solution stupide pour censurer Internet

## Conférences

La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 8 septembre 2023 : [JUG Summer Camp](https://www.jugsummercamp.org/) - La Rochelle (France) <a href="https://conference-hall.io/public/event/wvKVYtvwGy7z5NEt8tOW"><img alt="CFP JUG Sumer Camp" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-June-2023&color=red"></a>
- 14 septembre 2023 : [Cloud Sud](https://www.cloudsud.fr/) - Toulouse (France) & Online <a href="https://conference-hall.io/public/event/UHdxMRvP0zJB2eVBwm1C"><img alt="Cloud Sud" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2023&color=red"></a>
- 18 septembre 2023 : [Agile Tour Montpellier](https://agiletourmontpellier.fr/) - Montpellier (France) <a href="https://conference-hall.io/public/event/mXxbggAyDUbTFXazxkWX"><img alt="CFP Agile Tour Montpellier" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2023&color=red"></a>
- 19 septembre 2023 : [Salon de la Data Nantes](https://salondata.fr/index.php/le-salon/) - Nantes (France) & Online 
- 19-20 septembre 2023 : [Agile en Seine](https://www.agileenseine.com/) - Paris (France) <a href="https://sessionize.com/agile-en-seine-2023/"><img alt="CFP Agile en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=red"></a>
- 21-22 septembre 2023 : [API Platform Conference](https://api-platform.com/con/2023) - Lille (France) & Online 
- 22 septembre 2023 : [Agile Tour Sophia Antipolis](http://www.agiletoursophia.fr) - Valbonne (France) <a href="https://sessionize.com/agile-tour-sophia-2023/?sp_con=KGCdw4XVF7QH%2Fu4B8Gne1g%3D%3D"><img alt="CFP ATSA" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-june-2023&color=red"></a>
- 25-26 septembre 2023 : [BIG DATA & AI PARIS 2023](https://www.bigdataparis.com/) - Paris (France) <a href="#"><img alt="CFP BIG DATA & AI PARIS 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-March-2023&color=red"></a>
- 28-30 septembre 2023 : [Paris Web](https://www.paris-web.fr/) - Paris (France) 
- 2-6 octobre 2023 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) <a href="https://dvbe23.cfp.dev/"><img alt="CFP Devoxx Belgium 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-July-2023&color=red"></a>
- 6 octobre 2023 : [DevFest Perros-Guirec](https://devfest.codedarmor.fr/) - Perros-Guirec (France) <a href="https://conference-hall.io/public/event/sO14GCz3BN0lXwU5Ruf6"><img alt="CFP DevFest Perros-Guirec 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2023&color=red"></a>
- 10 octobre 2023 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-2023/"><img alt="CFP ParisTestConf 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2023&color=red"></a>
- 11-13 octobre 2023 : [Devoxx Morocco](https://devoxx.ma/) - Agadir (Morocco) <a href="https://dvma23.cfp.dev/"><img alt="CFP ParisTestConf 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2022-May%20to%2017-July-2023&color=red"></a>
- 12 octobre 2023 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/public/event/SkVFHQ5kzrrfUlSU4MK1"><img alt="CFP Cloud Nord 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-Jun-2023&color=red"></a>
- 12-13 octobre 2023 : [Volcamp 2023](https://www.volcamp.io/) - Clermont-Ferrand (France) <a href="https://conference-hall.io/public/event/b9seMUHc924mGItMl2aa"><img alt="CFP Volcamp 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-May-2023&color=red"></a>
- 12-13 octobre 2023 : [Forum PHP 2023](https://event.afup.org/forum-php-2023) - Marne-la-Vallée (France) <a href="https://afup.org/event/forumphp2023"><img alt="CFP ForumPHP 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-June-2023&color=red"></a>
- 13-14 octobre 2023 : [SecSea 2K23](https://www.helloasso.com/associations/hack-in-provence/evenements/secsea-2k23) - La Ciotat (France) 
- 17-20 octobre 2023 : [DrupalCon Lille](https://events.drupal.org/lille2023) - Lille (France) 
- 19-20 octobre 2023 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) <a href="https://conference-hall.io/public/event/z5FSBfmwJSUWb4UO9hD4"><img alt="CFP DevFest Nantes 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=red"></a>
- 19-20 octobre 2023 : [Agile Tour Rennes](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2023/"><img alt="CFP Agile Tour Rennes 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-May-2023&color=red"></a>
- 26 octobre 2023 : [Codeurs en Seine](https://www.codeursenseine.com/2023) - Rouen (France) <a href="https://cfp.codeursenseine.com/"><img alt="CFP Codeurs en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-Aug-2023&color=green"></a>
- 30 septembre 2023 : [ScalaIO](https://scala.io/) - Paris (France) <a href="https://www.papercall.io/scalaio2023"><img alt="CFP ScalaIO 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2027-August-2023&color=green"></a>
- 26-27 octobre 2023 : [Agile Tour Bordeaux](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2023/"><img alt="CFP Agile Tour Bordeaux 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-July-2023&color=red"></a>
- 26-29 octobre 2023 : [SoCraTes-FR](https://socrates-fr.github.io/) - Orange (France) 
- 10 novembre 2023 : [BDX I/O](https://www.bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/VORL07zbTZ8CBB8kOVgq"><img alt="CFP BDX I/O 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-July-2023&color=red"></a>
- 15 novembre 2023 : [DevFest Strasbourg](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/public/event/I0SQmndJ7vrnWeBdEuTQ"><img alt="CFP DevFest Strasbourg 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2023&color=red"></a>
- 16 novembre 2023 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://devfesttoulouse.fr/#le-cfp"><img alt="CFP DevFest Toulouse 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=red"></a>
- 18-19 novembre 2023 : [Capitole du Libre](https://capitoledulibre.org/) - Toulouse (France) <a hret="https://cfp.capitoledulibre.org/cdl-2023/cfp"><img alt="CFP Capitole du libre" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-August-2023&color=green"></a>
- 23 novembre 2023 : [DevOps D-Day #8](https://www.devopsdday.com/) - Marseille (France) <a href="https://hopscotch.key4events.com/abstract.aspx?e=321&c=2683"><img alt="CFP DevOps D-Day #8" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-July-2023&color=red"></a>
- 23 novembre 2023 : [Agile Grenoble](https://agile-grenoble.org/) - Grenoble (France) <a href="https://sessionize.com/agile-grenoble-2023/"><img alt="CFP Agile Grenoble" src="https://img.shields.io/static/v1?label=CFP&message=until%202-July-2023&color=red"></a>
- 30 novembre 2023 : [PrestaShop Developer Conference](https://events.prestashop.com/prestashop-developer-conference) - Paris (France) <a href="https://hopscotch.key4events.com/abstract.aspx?e=321&c=2683"><img alt="CFP PrestaShop Developer Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-September-2023&color=green"></a>
- 30 novembre 2023 : [WHO run the Tech](https://whorunthetech.com/) - Rennes (France) <a href="https://conference-hall.io/public/event/Pe62MIv1mSH9KF7nDGRA"><img alt="CFP Who Run The Tech #8" src="https://img.shields.io/static/v1?label=CFP&message=until%207-September-2023&color=green"></a>
- 6-7 décembre 2023 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) <a href="https://sessionize.com/open-source-experience-2023/"><img alt="CFP [Open Source Experience 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-june-2023&color=red"></a>
- 7 décembre 2023 : [Agile Tour Aix-Marseille](https://atmrs.esprit-agile.com/) - Gardanne (France) <a href="https://sessionize.com/agile-tour-aix-marseille-2023/"><img alt="CFP [Agile Tour Aix-Marseille" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-july-2023&color=red"></a>
- 7-8 décembre 2023 : [TechRocks Summit](https://events.tech.rocks/summit-2023/fr/registration/ticketing) - Paris (France) 
- 8 décembre 2023 : [DevFest Dijon](https://developers-group-dijon.fr/#devfest) - Dijon (France) <a href="https://conference-hall.io/public/event/YfMYBkCIuy2dMjdhRZlX"><img alt="CFP DevFest Dijon" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-october-2023&color=green"></a>
- 31 janvier 2024-3 février 2024 : [SnowCamp](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/organizer/event/Bq5k5rbMXGynAls6PjRB"><img alt="CFP SnowCamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2023&color=green"></a>
- 6-7 mars 2024 : [FlowCon 2024](https://my.weezevent.com/flowcon-2024) - Paris (France) 
- 19-22 mars 2024 : [KubeCon + CloudNativeCon Europe 2024](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe-2024/) - Paris (France) 
- 28-29 mars 2024 : [SymfonyLive Paris 2024](https://live.symfony.com/2024-paris/) - Paris (France) 
- 17-19 avril 2024 : [Devoxx France](https://www.devoxx.fr/) - Paris (France) 
- 25-26 avril 2024 : [MiXiT](https://mixitconf.org/fr/) - Lyon (France) 
- 25-26 avril 2024 : [Android Makers](https://androidmakers.droidcon.com/) - Paris (France) 
- 6-7 juin 2024 : [DevFest Lille](https://devfest.gdglille.org/) - Lille (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

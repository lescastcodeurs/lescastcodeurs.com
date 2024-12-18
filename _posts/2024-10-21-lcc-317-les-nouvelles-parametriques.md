---
title: LCC 317 - les nouvelles paramétriques
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 317
mp3_length: 59158126
tweet: De Java 23 à WebAssembly, en passant par l’IA et les design patterns, on a tout passé au crible #java #swift #webassembly #wordpress #webcomponents #llm #mongodb #keycloak #fairsource
# tweet size: 91-93 -> 99-101 #######################################################################
---
De Java 23 à WebAssembly, en passant par l’IA et les design patterns, on a tout passé au crible #java #swift #webassembly #wordpress #webcomponents #llm #mongodb #keycloak #fairsource

Enregistré le 18 octobre 2024

Téléchargement de l’épisode [LesCastCodeurs-Episode-317.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-317.mp3)

## News

### Langages

Java 23 est sorti ! InfoQ liste toutes les JEPs intégrées à la nouvelle version :
[https://www.infoq.com/news/2024/09/java23-released/](https://www.infoq.com/news/2024/09/java23-released/)

- JEP 455: [Primitive Types in Patterns, instanceof, and switch (Preview)](https://openjdk.org/jeps/455),
- JEP 466: [Class-File API (Second Preview)](https://openjdk.org/jeps/466),
- JEP 467: [Markdown Documentation Comments](https://openjdk.org/jeps/467),
- JEP 469: [Vector API (Eighth Incubator)](https://openjdk.org/jeps/469),
- JEP 471: [Deprecate the Memory-Access Methods in sun.misc.Unsafe for Removal](https://openjdk.org/jeps/471),
- JEP 473: [Stream Gatherers (Second Preview)](https://openjdk.org/jeps/473),
- JEP 474: [ZGC: Generational Mode by Default](https://openjdk.org/jeps/474),
- JEP 476: [Module Import Declarations (Preview)](https://openjdk.org/jeps/476),
- JEP 477: [Implicitly Declared Classes and Instance Main Methods (Third Preview)](https://openjdk.org/jeps/477),
- JEP 480: [Structured Concurrency (Third Preview)](https://openjdk.org/jeps/480),
- JEP 481: [Scoped Values (Third Preview)](https://openjdk.org/jeps/481),
- JEP 482: [Flexible Constructor Bodies (Second Preview)](https://openjdk.org/jeps/482),
- `StringTemplate` s’en va.

Et FooJay plonge dans le détail :
[https://foojay.io/today/java-23-has-arrived-and-it-brings-a-truckload-of-changes/](https://foojay.io/today/java-23-has-arrived-and-it-brings-a-truckload-of-changes/)

Un article sur l’API ClassFile qui sera un standard dans le JDK pour manipuler des classes (ala ASM) :
[https://www.unlogged.io/post/class-file-api-not-your-everyday-java-api](https://www.unlogged.io/post/class-file-api-not-your-everyday-java-api)

- Article long, mais qui revient sur les raisons.
- Notamment parce que ASM est dans le JDK et qu’ils sont un problème de poule et d’œuf.
- Et sur la forme de l’API.
- A des exemples d’usage.
- Tout cela reste en preview dans le JDK.
- Des optimisations comme le lazy parsing et le constant pool sharing (en gros faire de la reference sur ce qui n’a pas changé).

Tip and Tail is back, cette fois une JEP :
[https://openjdk.org/jeps/14](https://openjdk.org/jeps/14)

- Plus qu’une keynote provocative au language summit.
- Maintenant une JEP dite informative.
- Le langage est un peu flou sur l’objectif.
- Entre regarder tip and tail pour vos librairies c’est bien.
- Et adoptons tous le meme tip du JDK jusqu’aux stack applicatives.

Apple annonce la sortie de son langage Swift en version 6 :
[https://www.swift.org/blog/announcing-swift-6/](https://www.swift.org/blog/announcing-swift-6/)

- **Nouvelles plateformes :** Swift 6 s’étend à de nouvelles plateformes (tous les grands OS déjà supportés), y compris les systèmes embarqués (sous ARM et Risc V).
- **Swift Testing :** Swift 6 introduit Swift Testing, une nouvelle bibliothèque de tests conçue pour Swift.
- **Concurrence :** Détection de data race en tant qu’erreur de compilation.

Apple annonce travailler sur l’interopérabilité Swift / Java :
[https://github.com/swiftlang/swift-java](https://github.com/swiftlang/swift-java)

- Comme `jextract` mais dans l’autre sens.

The news Java :
[https://www.infoq.com/news/2024/10/java-news-roundup-oct07-2024/](https://www.infoq.com/news/2024/10/java-news-roundup-oct07-2024/)

- JDK 24 : Un calendrier pour la sortie de JDK 24 a été proposé. La première phase de réduction des fonctionnalités commencera le 5 décembre 2024. La version finale sera disponible le 18 mars 2025. 
- JDK 24 introduira des mises à jour avec deux nouvelles API. La Vector API (JEP 489) facilitera les opérations sur des vecteurs, tandis que la Class-File API (JEP 484) permettra une manipulation plus efficace des fichiers de classes Java.
- Un changement de sécurité important est proposé avec JEP 486. Il prévoit de désactiver définitivement le Security Manager, qui a été déprécié. Cette décision signifie que cette fonctionnalité ne sera plus disponible dans les futures versions, car elle est considérée comme obsolète.
- Apache Tomcat et Cassandra : Les nouvelles versions de Tomcat (11.0.0) et de Cassandra (5.0.0) sont sorties. Elles incluent des améliorations et des corrections de bogues.
- Spring Framework : Des mises à jour pour Spring Framework (versions 3.4.0-M2, 3.3.3 et 3.2.8) ont été publiées. Elles intègrent le support d’une nouvelle API qui aide à la gestion de la mémoire.
- Quarkus : Red Hat a sorti la version 3.15 de Quarkus, qui apporte des corrections et des améliorations. Une nouvelle version, la 3.16, est prévue pour la fin octobre.
- Commonhaus Foundation : Une nouvelle organisation, la Commonhaus Foundation, a été créée pour aider les projets open source à être durables. Quarkus a rejoint cette fondation.
- Cassandra, Camel, LangChain, Micronaut, OpenLiberty, JHipster, Ktor etc.

Design patterns revisited :
[https://www.youtube.com/watch?v=kE5M6bwruhw](https://www.youtube.com/watch?v=kE5M6bwruhw)

- Design and design patterns.
- Optional: patterns and anti-patterns.
- Iterator pattern.
- Lightweight Strategy.
- Factory Method using default methods.
- Laziness using Lambda Expressions.
- Decorator using Lambda Expressions.
- Creating Fluent interfaces.
- Execute Around Method Pattern.
- Creating a Closed Hierarchy with sealed classes.

Popularité des langages de programmation :
[https://www.techspot.com/news/105157-python-most-popular-coding-language-but-challengers-gaining.html](https://www.techspot.com/news/105157-python-most-popular-coding-language-but-challengers-gaining.html)

- Python reste le langage de programmation le plus populaire, surtout dans des domaines comme la science des données et le développement web.
- Il est apprécié pour sa simplicité et le grand nombre de bibliothèques disponibles, ce qui le rend facile à apprendre et à utiliser.
- De nombreuses entreprises, y compris des startups, utilisent Python pour diverses applications.
- Malgré sa dominance, d’autres langages comme JavaScript, Java et Go gagnent en popularité et pourraient défier la position de leader de Python. (Java est monté du poste 4 au 3, en 1 an)
- Les développeurs qui codent occasionnellement préfèrent Python, montrant ainsi son attrait au-delà des programmeurs professionnels.
- L’émergence d’outils comme ChatGPT facilite l’accès à la programmation, ce qui pourrait influencer les tendances futures en matière de langages de programmation.

### Librairies

Paramétrer ses tests JUnit 5 avec `@CsvSource` :
[https://mikemybytes.com/2021/10/19/parameterize-like-a-pro-with-junit-5-csvsource/](https://mikemybytes.com/2021/10/19/parameterize-like-a-pro-with-junit-5-csvsource/)

- L’annotation permet d’avoir ses données de test au plus près de la méthode.
- On écrit les données de test sous forme de CSV (éventuellement avec des délimiteurs de son choix pour plus de lisibilité, pour bien séparer les valeurs).
- Par exemple `->` ou `maps to`.
- Les valeurs peuvent être les paramètres de la méthode, mais aussi les valeurs de description du test.

### Infrastructure

Turbocharged Development: The Speed and Efficiency of WebAssembly par Danielle Lancashire :
[https://devsummit.infoq.com/presentation/munich2024/turbocharged-development-speed-and-efficiency-webassembly](https://devsummit.infoq.com/presentation/munich2024/turbocharged-development-speed-and-efficiency-webassembly)

- L’utilisation de WebAssembly avec Serverless. Faire tourner des applications plus facilement dans le cloud. WebAssembly est rapide et sûr pour exécuter du code. Cela aide à déployer les applications plus rapidement et à utiliser moins de ressources.
- De nombreuses entreprises utilisent WebAssembly pour des tâches comme le traitement d’images et de données. Des plateformes comme Cloudflare Workers et AWS Lambda.
- La communauté autour de WebAssembly grandit. De nouveaux outils et bibliothèques sont créés.
- Cependant, il y a encore des défis à relever, comme la compatibilité et les performances. Malgré cela, l’avenir de WebAssembly est prometteur.



### Web

C’est la guerre chez Wordpress :
[https://techcrunch.com/2024/09/26/wordpress-vs-wp-engine-drama-explained/](https://techcrunch.com/2024/09/26/wordpress-vs-wp-engine-drama-explained/)

- Une boite nommée WP Engine fait du hosting de WordPress mais ne contribue pas.
- Automatic, les gens derrière WordPress leur ont demandé de résoudre ce problème, soit en payant des droits de trademark soit en contribuant de l’engineering upstream à auteur de 8% de leurs revenus.
- WP Engine dit non.
- Automatic coupe l’accès aux mises à jour de thèmes et de plugins à WP Engine mettant des sites à risque (sécurité).
- WP Engine dit que c’est un abus de position du CEO d’Automatic sur les accès [WordPress.org](http://WordPress.org).
- Bref c’est le drame.
- Le CEO d’Automatic propose à ses employés six mois de salaire s’ils ne sont pas d’accord avec la stratégie ([https://www.cio.com/article/3550331/one-twelfth-of-automattic-staff-leave-over-wordpress-wp-engine-spat.html](https://www.cio.com/article/3550331/one-twelfth-of-automattic-staff-leave-over-wordpress-wp-engine-spat.html)).
- 8% ont pris l’offre.

Les WebComposants ne sont pas le futur :
[https://dev.to/ryansolid/web-components-are-not-the-future-48bh](https://dev.to/ryansolid/web-components-are-not-the-future-48bh)

- Un article d’un auteur proéminent de framework JavaScript.
- Discute les avantages et les inconvénients de la standardisation.
- Qui permet d’élever le débat, mais aussi bloque des avenues d’optimisations.
- Beaucoup d’exemples d’innovations en frameworks JS qui auraient été bloqués.
- Les commentaires apres l’article sont intéressants aussi (en contre perspective).
- Mais tout le monde n’est pas d’accord avec cet article : [https://www.abeautifulsite.net/posts/web-components-are-not-the-future-they-re-the-present/](https://www.abeautifulsite.net/posts/web-components-are-not-the-future-they-re-the-present/).

### Data et Intelligence Artificielle

Conseils et bonnes pratiques lors de l’intégration de LLM dans une application :
[https://glaforge.dev/posts/2024/09/23/some-good-practices-when-integrating-an-llm-in-your-application/](https://glaforge.dev/posts/2024/09/23/some-good-practices-when-integrating-an-llm-in-your-application/)

- Management de prompt effectif.
- Versionnage et externalisation des prompts.
- Fixer la version des modèles.
- Optimisation et caching.
- Mettre en place des rails de sécurité.
- Évaluer et monitorer le comportement et la performance.
- Prioriser la sécurité des données privées.

Encore une nouvelle version de LangChain4j, avec la version 0.35 !
Guillaume couvre les nouveautés côté Gemini et Google Cloud :
[https://glaforge.dev/posts/2024/09/29/lots-of-new-cool-gemini-stuff-in-langchain4j/](https://glaforge.dev/posts/2024/09/29/lots-of-new-cool-gemini-stuff-in-langchain4j/)

- Support des toutes nouvelles versions de Gemini 1.5 (version 002).
- Un “document loader” pour charger des documents à partir de Google Cloud Storage.
- Un “scoring model” qui permet de faire du “reranking” de résultat, pour trouver les résultats les plus pertinents pour une requête donnée.
- Support de nouveaux paramètres des embedding models (choix de la dimensionalité des vecteurs, du troncage des textes en entrée).
- Ajout d’un “embedding model” pour le module Google AI Gemini.
- Un estimateur de token pour Google AI Gemini.
- Support des chat listeners.
- Support des enums pour la sortie structurée JSON.
- Et plein de mise à jour de la documentation pour refléter tous ces changements et additions.

Self Correction Algo LLM :
[https://www.infoq.com/news/2024/10/google-deepmind-score/](https://www.infoq.com/news/2024/10/google-deepmind-score/)

- Google DeepMind a récemment publié **SCoRe**, une nouvelle méthode d’auto-correction pour les modèles de langage (LLM). Elle améliore la capacité des LLM à corriger leurs erreurs lorsqu’ils résolvent des problèmes de mathématiques ou de programmation.
- Contrairement aux méthodes antérieures, SCoRe utilise des données générées par le modèle lui-même pour créer des dialogues d’auto-correction. Cela permet au modèle de s’améliorer via un processus d’apprentissage par renforcement (RL) en deux étapes.
- Les modèles ajustés avec cette technique ont montré des améliorations significatives, surpassant les performances des modèles de base.
- Cette méthode pourrait ouvrir de nouvelles pistes pour rendre les LLM plus précis et robustes dans leurs réponses.

MongoDB 8 est sorti :
[https://www.mongodb.com/products/updates/version-release](https://www.mongodb.com/products/updates/version-release)

- La version 8.0 est plus rapide, avec des lectures plus rapides, une meilleure gestion des mises à jour et des agrégations de séries temporelles jusqu’à 60 % plus rapides.
- De nouvelles fonctionnalités incluent le support des Query pour les données chiffrées, rendant le traitement des données sensibles plus facile.
- Beaucoup d’améliorations pour la performance et scalabilité.

Guillaume explore les techniques avancées de Retrieval Augmented Generation pour améliorer la qualité des résultats de recherche dans ses propres documents, avec les LLMs :
[https://glaforge.dev/talks/2024/10/14/advanced-rag-techniques/](https://glaforge.dev/talks/2024/10/14/advanced-rag-techniques/)

- Présentations et vidéos données lors de la conférence Devoxx Belgique.
- Code des exemples disponibles sur GitHub.
- Techniques de chunking : sliding window, hypothetical questions, semantic chunking, context retrieval chunking.
- Techniques de retrieval : hypothetical document embedding, query compression, metadata filtering.

### Outillage

Article sur les cache alias en Infinispan :
[https://infinispan.org/blog/2024/10/07/cache-aliases-redis-databases](https://infinispan.org/blog/2024/10/07/cache-aliases-redis-databases)

- Explique comment on peut utiliser Infinispan pour remplacer Redis.
- Explique la différence entre les database de Redis et les caches d’Infinispan.
- Explique l’utilité des alias en général.
- Explique comment on peut avoir un mapping des databases de Redis vers des caches d’Infinispan.

### Sécurité

Keycloak 26 est sorti :
[https://www.keycloak.org/2024/10/keycloak-2600-released](https://www.keycloak.org/2024/10/keycloak-2600-released)

- Organizations feature : permet aux administrateurs de créer et gérer des structures organisationnelles, facilitant la gestion des rôles et des permissions.
- Persistent user sessions : les sessions des utilisateurs sont maintenant stockées par défault dans la base de donnée ce qui améliore la cohérence, surtout avec plusieurs instances.
- Login Theme : offre un design plus propre et une option de mode sombre qui s’adapte aux préférences des utilisateurs.
- L’amélioration du déploiement multi-sites renforce la fiabilité et réduit le temps d’arrêt lors des demandes des utilisateurs.
- Admin recovery : une méthode simple pour récupérer l’accès administrateur si tous les comptes sont bloqués, en créant un compte temporaire via des variables d’environnement.
- Pour les utilisateurs qui migrent vers cette version, il est important de prêter attention aux changements liés à la gestion des caches et aux sessions persistantes.

### Loi, société et organisation

Introduction des licences fair source :
[https://techcrunch.com/2024/09/22/some-startups-are-going-fair-source-to-avoid-the-pitfalls-of-open-source-licensing/](https://techcrunch.com/2024/09/22/some-startups-are-going-fair-source-to-avoid-the-pitfalls-of-open-source-licensing/)

- Certaines startups utilisent des licences "fair source" pour partager leur code tout en protégeant leurs intérêts commerciaux.
- Les licences FSL (Functional Source License) et BUSL (Business Source License) permettent d’ouvrir le code après 2 ou 4 ans.
- Ces licences empêchent les concurrents de vendre des produits similaires tout de suite, offrant une protection temporaire.
- Certains critiques pensent que ces licences sont compliquées et pourraient limiter l’innovation, car elles ne sont pas totalement ouvertes.
- Le "fair source" est encore un nouveau concept, mais il pourrait devenir un bon compromis entre open source et logiciel privé.
- Définition de fair source : code lisible publique, peut être utilisé et modifié avec des "restrictions minimales" pour protéger le business model du producteur ; et devient open source de manière déferrée.
- "any purpose other than a Competing Use. A Competing Use means use of the Software in or for a commercial product or service that competes with the Software or any other product or service we offer using the Software as of the date we make the Software available".

## Outils de l’épisode

Un petit outil sympa pour les utilisateurs de Macs avec un écran “wide”, pour partager un écran virtuel :
[https://github.com/Stengo/DeskPad](https://github.com/Stengo/DeskPad)

- Les écrans larges sont partagés entièrement et cela fait un rendu 16:9 pour les gens qui le voient.
- Cet écran acte comme un écran, mais il est virtuel et on peut mettre les applications que l’on veut dedans.
- On ne l’a pas testé.

## Conférences

La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 17-18 octobre 2024 : [DevFest Nantes](https://devfest.gdgnantes.com/en/) - Nantes (France) <a href="https://conference-hall.io/public/event/AJYPylkzTDd6j3O6ADZn"><img alt="CFP DevFest Nantes 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-June-2024&color=red"></a>
- 17-18 octobre 2024 : [DotAI](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/cfp"><img alt="CFP DotAI 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=red"></a>
- 30-31 octobre 2024 : [Agile Tour Nantais 2024](https://agilenantes.org/agile-tour-nantais-2024/) - Nantes (France) <a href="https://sessionize.com/agile-tour-nantais-2024"><img alt="CFP Agile Tour Nantais 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-July-2024&color=red"></a>
- 30-31 octobre 2024 : [Agile Tour Bordeaux 2024](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2024/"><img alt="CFP Agile Tour Bordeaux 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2024&color=red"></a>
- 31 octobre 2024-3 novembre 2024 : [PyCon.FR](https://www.pycon.fr/2024/) - Strasbourg (France) <a href="https://cfp.pycon.fr/pyconfr-2024/cfp"><img alt="CFP PyCon.FR" src="https://img.shields.io/static/v1?label=CFP&message=until%2021-July-2024&color=red"></a>
- 6 novembre 2024 : [Master Dev De France](https://www.masterdevfrance.com/) - Paris (France) 
- 7 novembre 2024 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse/"><img alt="CFP DevFest Toulouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-June-2024&color=red"></a>
- 8 novembre 2024 : [BDX I/O](https://bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/9udDKH96m45FLJmqz2Uu"><img alt="CFP BDX IO 24" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-July-2024&color=red"></a>
- 13-14 novembre 2024 : [Agile Tour Rennes 2024](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2024/"><img alt="CFP Agile Tour Rennes 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2024&color=red"></a>
- 16-17 novembre 2024 : [Capitole Du Libre](https://capitoledulibre.org/) - Toulouse (France) <a href="https://cfp.capitoledulibre.org/cdl-2024/cfp"><img alt="CFP Capitole du Libre" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-September-2024&color=red"></a>
- 20-22 novembre 2024 : [Agile Grenoble 2024](https://agile-grenoble.org/) - Grenoble (France) <a href="https://sessionize.com/agile-grenoble-2024/"><img alt="CFP Agile Grenoble 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2024&color=red"></a>
- 21 novembre 2024 : [DevFest Strasbourg](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/public/event/ZZv81ZNIzVzCMBxjX1xe"><img alt="CFP DevFest Strasbourg" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-July-2024&color=red"></a>
- 21 novembre 2024 : [Codeurs en Seine](https://www.codeursenseine.com) - Rouen (France) <a href="https://conference-hall.io/public/event/Su6sfM6SAhoHmg3GWKHS"><img alt="CFP Codeurs en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-September-2024&color=red"></a>
- 27-28 novembre 2024 : [Cloud Expo Europe](https://www.cloudexpoeurope.fr/) - Paris (France) 
- 28 novembre 2024 : [Who Run The Tech ?](https://whorunthetech.com) - Rennes (France) <a href="https://conference-hall.io/public/event/bJDribf9r5Lf2VzBgbYQ"><img alt="CFP Who Run The Tech ? 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%204-June-2024&color=red"></a>
- 2-3 décembre 2024 : [Tech Rocks Summit](https://events.tech.rocks/summit-2024) - Paris (France) 
- 3 décembre 2024 : [Generation AI](https://www.apidays.global/generationai-paris/) - Paris (France) <a href="https://apidays.typeform.com/to/BUasJhAb"><img alt="CFP Generation AI" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-November-2024&color=green"></a>
- 3-5 décembre 2024 : [APIdays Paris](https://www.apidays.global/paris/) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP API Days Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-November-2024&color=green"></a>
- 4-5 décembre 2024 : [DevOpsRex](https://www.devopsrex.fr/fr) - Paris (France) <a href="https://talks.devopsdays.org/devopsdays-paris-2024/cfp"><img alt="CFP DevOps Rex" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-July-2024&color=red"></a>
- 4-5 décembre 2024 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) <a href="https://pretalx.com/opensource-experience-2024/cfp"><img alt="CFP Open Source Experience" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-July-2024&color=red"></a>
- 5 décembre 2024 : [GraphQL Day Europe](https://www.apidays.global/graphqldayeurope/) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP GraphQL Days Europe" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-November-2024&color=green"></a>
- 6 décembre 2024 : [DevFest Dijon](https://devfest.developers-group-dijon.fr/) - Dijon (France) <a href="https://conference-hall.io/public/event/LvvYRcF5AIhpojdn2lkQ"><img alt="CFP DevFest Dijon 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2024&color=red"></a>
- 22-25 janvier 2025 : [SnowCamp 2025](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/snow-camp-2025"><img alt="CFP SnowCamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2024&color=green"></a>
- 30 janvier 2025 : [DevOps D-Day #9](https://www.devopsdday.com/) - Marseille (France) <a href="https://conference-hall.io/devops-dday-2025"><img alt="CFP DevOps D-Day #9" src="https://img.shields.io/static/v1?label=CFP&message=until%2021-October-2024&color=green"></a>
- 6-7 février 2025 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/touraine-tech-2025"><img alt="CFP Touraine Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-October-2024&color=green"></a>
- 25 mars 2025 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-6/"><img alt="CFP ParisTestConf 6" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2024&color=green"></a>
- 3 avril 2025 : [DotJS](http://www.dotjs.io) - Paris (France) 
- 10-12 avril 2025 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr24.cfp.dev/"><img alt="CFP Devoxx Greece 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-December-2024&color=red"></a>
- 16-18 avril 2025 : [Devoxx France](https://www.devoxx.fr) - Paris (France) 
- 7-9 mai 2025 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) 
- 12-13 juin 2025 : [DevLille](https://devlille.fr/) - Lille (France) 
- 24 juin 2025 : [WAX 2025](https://www.waxconf.fr/) - Aix-en-Provence (France) <a href="https://conference-hall.io/wax2025"><img alt="CFP WAX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-May-2025&color=green"></a>
- 18-19 septembre 2025 : [API Platform Conference](https://api-platform.com/con/2025/) - Lille (France) & Online 
- 9-10 octobre 2025 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

---
title: LCC 321 - Les évènements écran large
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 321
youtube: 
mp3_length: 53372497
tweet: Les évènements écran large #java #webassembly #wideevents #mcp
# tweet size: 91-93 -> 99-101 #######################################################################
---
Arnaud et Emmanuel discutent des versions Java, font un résumé de l'ecosystème WebAssembly, discutent du nouveau Model Context Protocol, parlent d'observabilité avec notamment les Wide Events et de pleins d'autres choses encore.

Enregistré le 17 janvier 2025

Téléchargement de l’épisode [LesCastCodeurs-Episode-321.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-321.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/@lescastcodeurs).

## News


### Langages

java trend par InfoQ [https://www.infoq.com/articles/java-trends-report-2024/](https://www.infoq.com/articles/java-trends-report-2024/)

- Java 17 finalement depasse 11 et 8 ~30/33%
- Java 21 est à 1.4%
- commonhaus apparait
- GraalVM en early majority
- Spring AI et langchain4j en innovateurs
- SB 3 voit son adoption augmenter

Un bon résumé sur WebAssembly, les différentes specs comme WASM GC, WASI, WIT, etc
[https://2ality.com/2025/01/webassembly-language-ecosystem.html](https://2ality.com/2025/01/webassembly-language-ecosystem.html)

- WebAssembly (Wasm) est un format d’instructions binaires pour une machine virtuelle basée sur une pile, permettant la portabilité et l’efficacité du code.
- Wasm a évolué à partir d’asm.js, un sous-ensemble de JavaScript qui pouvait fonctionner à des vitesses proches de celles natives.
- WASI (WebAssembly System Interface) permet à Wasm de fonctionner en dehors des navigateurs Web, fournissant des API pour le système de fichiers, CLI, HTTP, etc.
- Le modèle de composant WebAssembly permet l’interopérabilité entre les langages Wasm à l’aide de WIT (Wasm Interface Type) et d’ABI canonique.
- Les composants Wasm se composent d’un module central et d’interfaces WIT pour les importations/exportations, facilitant l’interaction indépendante du langage.
- Les interfaces WIT décrivent les types et les fonctions, tandis que les mondes WIT définissent les capacités et les besoins d’un composant (importations/exportations).
- La gestion des packages Wasm est assurée par Warg, un protocole pour les registres de packages Wasm.
- Une enquête a montré que Rust est le langage Wasm le plus utilisé, suivi de Kotlin et de C++; de nombreux autres langages sont également en train d’émerger.

Un algorithme de comptage a taille limitée ne mémoire a été inventé **[https://www.quantamagazine.org/computer-scientists-invent-an-efficient-new-way-to-count-20240516/](https://www.quantamagazine.org/computer-scientists-invent-an-efficient-new-way-to-count-20240516/)**

- élimine un mot de manière aléatoire mais avec une probabilité connue quand il y a besoin de récupérer de l’espace
- cela se fait par round et on augmente la probabilité de suppression à chaque round
- donc au final, ne nombre de mots / la probabilité d’avoir été éliminé donne une mesure approximative mais plutot précise


### Librairies

Les contributions Spring passent du CLA au DCO [https://spring.io/blog/2025/01/06/hello-dco-goodbye-cla-simplifying-contributions-to-spring](https://spring.io/blog/2025/01/06/hello-dco-goodbye-cla-simplifying-contributions-to-spring)

- d'abord manuel amis meme automatisé le CLA est une document legal complexe
- qui peut limiter les contribuitions
- le DCO vient le Linux je crois et est super simple
- accord que la licence de la conmtrib est celle du projet
- accord que le code est public et distribué en perpetuité
- s'appuie sur les `-s` de git pour le sign off

Ecrire un serveur MCP en Quarkus [https://quarkus.io/blog/mcp-server/](https://quarkus.io/blog/mcp-server/) MCP est un protocol proposé paor Antropic pour integrer des outils orchestrables par les LLMs

- MCP est frais et va plus loin que les outils
- offre la notion de resource (file), de functions (tools), et de proimpts pre-built pour appeler l'outil de la meilleure façon
- On en reparlera a pres avec les agent dans un article suivant
- il y a une extension Quarkus pour simplifier le codage
- un article plus detaillé sur l'integration Quarkus [https://quarkus.io/blog/quarkus-langchain4j-mcp/](https://quarkus.io/blog/quarkus-langchain4j-mcp/)

GreenMail un mini mail server en java [https://greenmail-mail-test.github.io/greenmail/#features-api](https://greenmail-mail-test.github.io/greenmail/#features-api)

- Utile pour les tests d'integration
- Supporte SMTP, POP3 et IMAP avec TLS/SSL
- Propose des integrations JUnit, Spring
- Une mini UI et des APIs REST permettent d'interagir avec le serveur si par exemple vous le partagé dans un container (il n'y a pas d'integration TestContainer existante mais elle n'est pas compliquée à écrire)


### Infrastructure

Docker Bake in a visual way [https://dev.to/aurelievache/understanding-docker-part-47-docker-bake-4p05](https://dev.to/aurelievache/understanding-docker-part-47-docker-bake-4p05)

- docker back propose d'utiliser des fichiers de configuration (format HCL) pour lancer ses builds d'images et docker compose
- en gros voyez ce DSL comme un Makefile très simplifié pour les commandes docker qui souvent peuvent avoir un peu trop de paramètres

Datadog continue de s'etendre avec l'acquisition de Quickwit [https://www.datadoghq.com/blog/datadog-acquires-quickwit/](https://www.datadoghq.com/blog/datadog-acquires-quickwit/)

- Solution open-source de recherche des logs qui peut être déployée on-premise et dans le cloud [https://quickwit.io/](https://quickwit.io/)
- Les logs ne quittent plus votre environment ce qui permet de répondre à des besoins de sécurité, privacy et réglementaire



### Web

33 concepts en javascript [https://github.com/leonardomso/33-js-concepts](https://github.com/leonardomso/33-js-concepts)

- [Call Stack](https://github.com/leonardomso/33-js-concepts#1-call-stack), [Primitive Types](https://github.com/leonardomso/33-js-concepts#2-primitive-types), [Value Types and Reference Types](https://github.com/leonardomso/33-js-concepts#3-value-types-and-reference-types), [Implicit, Explicit, Nominal, Structuring and Duck Typing](https://github.com/leonardomso/33-js-concepts#4-implicit-explicit-nominal-structuring-and-duck-typing), [== vs === vs typeof](https://github.com/leonardomso/33-js-concepts#5--vs--vs-typeof), [Function Scope, Block Scope and Lexical Scope](https://github.com/leonardomso/33-js-concepts#6-function-scope-block-scope-and-lexical-scope), [Expression vs Statement](https://github.com/leonardomso/33-js-concepts#7-expression-vs-statement), [IIFE, Modules and Namespaces](https://github.com/leonardomso/33-js-concepts#8-iife-modules-and-namespaces), [Message Queue and Event Loop](https://github.com/leonardomso/33-js-concepts#9-message-queue-and-event-loop), [setTimeout, setInterval and requestAnimationFrame](https://github.com/leonardomso/33-js-concepts#10-settimeout-setinterval-and-requestanimationframe), [JavaScript Engines](https://github.com/leonardomso/33-js-concepts#11-javascript-engines), [Bitwise Operators, Type Arrays and Array Buffers](https://github.com/leonardomso/33-js-concepts#12-bitwise-operators-type-arrays-and-array-buffers), [DOM and Layout Trees](https://github.com/leonardomso/33-js-concepts#13-dom-and-layout-trees), [Factories and Classes](https://github.com/leonardomso/33-js-concepts#14-factories-and-classes), [this, call, apply and bind](https://github.com/leonardomso/33-js-concepts#15-this-call-apply-and-bind), [new, Constructor, instanceof and Instances](https://github.com/leonardomso/33-js-concepts#16-new-constructor-instanceof-and-instances), [Prototype Inheritance and Prototype Chain](https://github.com/leonardomso/33-js-concepts#17-prototype-inheritance-and-prototype-chain), [Object.create and Object.assign](https://github.com/leonardomso/33-js-concepts#18-objectcreate-and-objectassign), [map, reduce, filter](https://github.com/leonardomso/33-js-concepts#19-map-reduce-filter), [Pure Functions, Side Effects, State Mutation and Event Propagation](https://github.com/leonardomso/33-js-concepts#20-pure-functions-side-effects-state-mutation-and-event-propagation), [Closures](https://github.com/leonardomso/33-js-concepts#21-closures), [High Order Functions](https://github.com/leonardomso/33-js-concepts#22-high-order-functions), [Recursion](https://github.com/leonardomso/33-js-concepts#23-recursion), [Collections and Generators](https://github.com/leonardomso/33-js-concepts#24-collections-and-generators), [Promises](https://github.com/leonardomso/33-js-concepts#25-promises), [async/await](https://github.com/leonardomso/33-js-concepts#26-asyncawait), [Data Structures](https://github.com/leonardomso/33-js-concepts#27-data-structures), [Expensive Operation and Big O Notation](https://github.com/leonardomso/33-js-concepts#28-expensive-operation-and-big-o-notation), [Algorithms](https://github.com/leonardomso/33-js-concepts#29-algorithms), [Inheritance, Polymorphism and Code Reuse](https://github.com/leonardomso/33-js-concepts#30-inheritance-polymorphism-and-code-reuse), [Design Patterns](https://github.com/leonardomso/33-js-concepts#31-design-patterns), [Partial Applications, Currying, Compose and Pipe](https://github.com/leonardomso/33-js-concepts#32-partial-applications-currying-compose-and-pipe), [Clean Code](https://github.com/leonardomso/33-js-concepts#33-clean-code)


### Data et Intelligence Artificielle

Phi 4 et les small language models [https://techcommunity.microsoft.com/blog/aiplatformblog/introducing-phi-4-microsoft%e2%80%99s-newest-small-language-model-specializing-in-comple/4357090](https://techcommunity.microsoft.com/blog/aiplatformblog/introducing-phi-4-microsoft%e2%80%99s-newest-small-language-model-specializing-in-comple/4357090)

- Phi 4 un SML pour les usages locaux notamment
- 14B de parametres
- belle progression de ~20 points sur un score aggregé et qui le rapproche de Llama 3.3 et ses 70B de parametres
- bon en math (data set synthétique)

Comment utiliser Gemini 2.0 Flash Thinking (le modèle de Google qui fait du raisonnement à la sauce chain of thought) en Java avec LangChain4j
[https://glaforge.dev/posts/2024/12/20/lets-think-with-gemini-2-thinking-mode-and-langchain4j/](https://glaforge.dev/posts/2024/12/20/lets-think-with-gemini-2-thinking-mode-and-langchain4j/)

- Google a sorti Gemini 2.0 Flash, un petit modèle de la famille Gemini
- the "thinking mode" simule les cheminements de pensée (Chain of thoughts etc)
- décompose **beaucoup plus** les taches coplexes en plusiewurs taches
- un exemple est montré sur le modele se battant avec le probleme

Les recommendations d’Antropic sur les systèmes d’agents
[https://www.anthropic.com/research/building-effective-agents](https://www.anthropic.com/research/building-effective-agents)

- défini les agents et les workflow
- Ne recommence pas les frameworks (LangChain, Amazon Bedrock AI Agent etc) le fameux débat sur l’abstraction
- Beaucoup de patterns implementable avec quelques lignes sans frameworks
- Plusieurs blocks de complexité croissante
- Augmented LLM (RAG, memory etc): Anthropic dit que les LLMs savent coordonner cela via MCP apr exemple
- Second: workflow prompt chaining : avec des gates et appelle les LLMs savent coordonner successivement ; favorise la precision vs la latence vu que les taches sont décomposées en plusieurs calls LLMs
- Workflow routing: classifie une entree et choisie la route a meilleure: separation de responsabilité
- Workflow : parallelisation: LLM travaillent en paralllele sur une tache et un aggregateur fait la synthèse. Paralleisaiton avec saucissonage de la tache ou voter sur le meilleur réponse 
- Workflow : orchestrator workers: quand les taches ne sont pas bounded ou connues (genre le nombre de fichiers de code à changer) - les sous taches ne sont pas prédéfinies
- Workflow: evaluator optimizer: nun LLM propose une réponse, un LLM l’évalue et demande une meilleure réponse au besoin 
- Agents: commande ou interaction avec l;humain puis autonome meme si il peut revenir demander des precisions à l’humain. Agents sont souvent des LLM utilisât des outil pour modifier l’environnement et réagir a feedback en boucle
- Ideal pour les problèmes ouverts et ou le nombre d’étapes n’est pas connu
- Recommende d’y aller avec une complexité progressive

L'IA c'est pas donné [https://techcrunch.com/2025/01/05/openai-is-losing-money-on-its-pricey-chatgpt-pro-plan-ceo-sam-altman-says/](https://techcrunch.com/2025/01/05/openai-is-losing-money-on-its-pricey-chatgpt-pro-plan-ceo-sam-altman-says/)

- OpenAI annonce que même avec des licenses à 200$/mois ils ne couvrent pas leurs couts associés...
- A quand l'explosion de la bulle IA ? 


### Outillage

Ghostty, un nouveau terminal pour Linux et macOS : [https://ghostty.org/](https://ghostty.org/)

- Initié par [Mitchell Hashimoto](https://mitchellh.com/) (hashicorp)
- Ghostty est un émulateur de terminal natif pour macOS et Linux.
- Il est écrit en Swift et utilise AppKit et SwiftUI sur macOS, et en Zig et utilise l'API GTK4 C sur Linux.
- Il utilise des composants d'interface utilisateur native et des raccourcis clavier et souris standard.
- Il prend en charge Quick Look, Force Touch et d'autres fonctionnalités spécifiques à macOS.
- Ghostty essaie de fournir un ensemble riche de fonctionnalités utiles pour un usage quotidien.

Comment Pinterest utilise Honeycomb pour améliorer sa CI [https://medium.com/pinterest-engineering/how-pinterest-leverages-honeycomb-to-enhance-ci-observability-and-improve-ci-build-stability-15eede563d75](https://medium.com/pinterest-engineering/how-pinterest-leverages-honeycomb-to-enhance-ci-observability-and-improve-ci-build-stability-15eede563d75)

- Pinterest utilise Honeycomb pour améliorer l'observabilité de l'intégration continue (CI).
- Honeycomb permet à Pinterest de visualiser les métriques de build, d'analyser les tendances et de prendre des décisions basées sur les données.
- Honeycomb aide également Pinterest à identifier les causes potentielles des échecs de build et à rationaliser les tâches d'astreinte.
- Honeycomb peut également être utilisé pour suivre les métriques de build locales iOS aux côtés des détails de la machine, ce qui aide Pinterest à prioriser les mises à niveau des ordinateurs portables pour les développeurs.



### Méthodologies

Suite à notre épisode sur les différents types de documentation, cet article parle des bonnes pratiques à suivre pour les tutoriels
[https://refactoringenglish.com/chapters/rules-for-software-tutorials/](https://refactoringenglish.com/chapters/rules-for-software-tutorials/)

- Écrivez des tutoriels pour les débutants, en évitant le jargon et la terminologie complexe.
- Promettez un résultat clair dans le titre et expliquez l’objectif dans l’introduction.
- Montrez le résultat final tôt pour réduire les ambiguïtés.
- Rendez les extraits de code copiables et collables, en évitant les invites de shell et les commandes interactives.
- Utilisez les versions longues des indicateurs de ligne de commande pour plus de clarté.
- Séparez les valeurs définies par l’utilisateur de la logique réutilisable à l’aide de variables d’environnement ou de constantes nommées.
- Épargnez au lecteur les tâches inutiles en utilisant des scripts.
- Laissez les ordinateurs évaluer la logique conditionnelle, pas le lecteur.
- Maintenez le code en état de fonctionnement tout au long du tutoriel.
- Enseignez une chose par tutoriel et minimisez les dépendances.

Les Wide events, un "nouveau" concept en observabilité [https://jeremymorrell.dev/blog/a-practitioners-guide-to-wide-events/](https://jeremymorrell.dev/blog/a-practitioners-guide-to-wide-events/)

- un autre article [https://isburmistrov.substack.com/p/all-you-need-is-wide-events-not-metrics](https://isburmistrov.substack.com/p/all-you-need-is-wide-events-not-metrics)
- L'idée est de logger des evenements (genre JSON log) avec le plus d'infos possible
- de la machine, la ram, la versiond e l'appli, l'utilisateur, le numero de build qui a produit l'appli, la derniere PR etc etc
- ca permet de filtrer et grouper by et de voir des correlations visuelles tres rapidement et de zoomer
- tiens les ventes baisses de 20%
- tiens en fait ca vient de l'appli andriod
- tiens aps correle a la version de l'appli
- mais la version de l'os si!
- le deuxieme article est facile a lire
- le premier est un guide d'usage exhaustif du concept

Entre argumenter et se donner 5 minutes [https://signalvnoise.com/posts/3124-give-it-five-minutes](https://signalvnoise.com/posts/3124-give-it-five-minutes)

- on veut souvent argumenter aka poser des questions en ayant déjà la reponse en soi emotionnellement
- mais ca amene beaucoup de verbiage
- donner 5 minutes à l'idée le temps d'y penser avant d'argumenter



### Loi, société et organisation

Des juges fédéraux arrêtent le principe de la neutralité du net [https://www.lemonde.fr/pixels/article/2025/01/03/les-etats-unis-reviennent-en-arriere-sur-le-principe-de-la-neutralite-du-net_6479575_4408996.html?lmd_medium=al&amp;lmd_campaign=envoye-par-appli&amp;lmd_creation=ios&amp;lmd_source=default](https://www.lemonde.fr/pixels/article/2025/01/03/les-etats-unis-reviennent-en-arriere-sur-le-principe-de-la-neutralite-du-net_6479575_4408996.html?lmd_medium=al&amp;lmd_campaign=envoye-par-appli&amp;lmd_creation=ios&amp;lmd_source=default)

- la neutralité du net c’est l’interdiction de traiter un paquet différemment en fonction de son émetteur 
- Par exemple un paquet Netflix qui serait ralenti vs un paquet Amazon 
- Donald trump est contre cette neutralité. 
- À voir les impacts concrets dans un marché moins régulé. 



## Rubrique débutant

Un petit article sur les float vs les double en Java <https://www.baeldung.com/java-float-vs-double>

- 4 vs 8 bytes
- precision max de 7 vs 15
- echele 10^38 vs 10^308 (ordre de grandeur)
- perf a peu pret similaire
- sauf peut etre pour des modeles d'IA qui vont privilegier une taille plus petite parfois
- attention overflow et les accumulation d'erreurs d'approximation `BigDecimal`


## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 20 janvier 2025 : [Elastic{ON}](https://www.elastic.co/events/elasticon/paris) - Paris (France) <a href="https://sessionize.com/elasticon"><img alt="CFP ElasticON" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-December-2024&color=red"></a>
- 22-25 janvier 2025 : [SnowCamp 2025](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/snow-camp-2025"><img alt="CFP SnowCamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2024&color=red"></a>
- 24-25 janvier 2025 : [Agile Games Île-de-France 2025](https://agilegamesfrance.fr/doku.php?id=evenement_agidf2025) - Paris (France) 
- 6-7 février 2025 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/touraine-tech-2025"><img alt="CFP Touraine Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-October-2024&color=red"></a>
- 21 février 2025 : [LyonJS 100](https://www.lyonjs.org/lyonjs-100) - Lyon (France) 
- 28 février 2025 : [Paris TS La Conf](http://typescript.paris/) - Paris (France) 
- 6 mars 2025 : [DevCon #24 : 100% IA](https://www.programmez.com/page-devcon/devcon-24-100-ia) - Paris (France) <a href="mailto:ftonic@programmez.com"><img alt="CFP DevCon Programmez" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2025&color=green"></a>
- 13 mars 2025 : [Oracle CloudWorld Tour Paris](https://www.oracle.com/fr/cloudworld-tour/) - Paris (France) 
- 14 mars 2025 : [Rust In Paris 2025](https://www.rustinparis.com/) - Paris (France) 
- 19-21 mars 2025 : [React Paris](https://react.paris/) - Paris (France) <a href="https://forms.gle/KfsWGQH2Xn2N2Nua8"><img alt="CFP React Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2027-December-2024&color=red"></a>
- 20 mars 2025 : [PGDay Paris](https://2025.pgday.paris) - Paris (France) 
- 20-21 mars 2025 : [Agile Niort](https://agileniort.fr/) - Niort (France) <a href="https://sessionize.com/agile-niort-2025"><img alt="CFP Agile Niort 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-January-2025&color=red"></a>
- 25 mars 2025 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-6/"><img alt="CFP ParisTestConf 6" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2024&color=red"></a>
- 26-29 mars 2025 : [JChateau Unconference 2025](https://jchateau.org/) - Cour-Cheverny (France) 
- 27-28 mars 2025 : [SymfonyLive Paris 2025](https://live.symfony.com/2025-paris/) - Paris (France) 
- 28 mars 2025 : [DataDays](https://days.data-lille.fr/2025/) - Lille (France) <a href="https://conference-hall.io/data-days-lille-2025"><img alt="CFP DataDays 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-February-2025&color=green"></a>
- 28-29 mars 2025 : [Agile Games France 2025](https://agilegamesfrance.fr/) - Lille (France) 
- 3 avril 2025 : [DotJS](http://www.dotjs.io) - Paris (France) <a href="https://www.dotjs.io/speak"><img alt="CFP dotJS 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-November-2024&color=red"></a>
- 3 avril 2025 : [SoCraTes Rennes 2025](https://socrates-rennes.github.io/) - Rennes (France) 
- 4 avril 2025 : [Flutter Connection 2025](https://flutterconnection.io) - Paris (France) <a href="https://sessionize.com/flutter-connection-2025"><img alt="CFP Flutter Connection 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-January-2025&color=green"></a>
- 10-11 avril 2025 : [Android Makers](https://androidmakers.droidcon.com/) - Montrouge (France) <a href="https://sessionize.com/android-makers-by-droidcon-2025/"><img alt="CFP Android Makers by droidcon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-February-2025&color=green"></a>
- 10-12 avril 2025 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr25.cfp.dev/"><img alt="CFP Devoxx Greece 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-November-2024&color=red"></a>
- 16-18 avril 2025 : [Devoxx France](https://www.devoxx.fr) - Paris (France) <a href="https://devoxxfr2025.cfp.dev/#/login"><img alt="CFP Devoxx France 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-January-2025&color=red"></a>
- 23-25 avril 2025 : [MODERN ENDPOINT MANAGEMENT EMEA SUMMIT 2025](http://endpointsummit.com) - Paris (France) <a href="https://sessionize.com/MEMSummit2025"><img alt="CFP MODERN ENDPOINT MANAGEMENT EMEA SUMMIT 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-January-2025&color=green"></a>
- 24 avril 2025 : [IA Data Day 2025](https://iadataday.capitale.dev/) - Strasbourg (France) <a href="https://conference-hall.io/ia-data-day-strasbourg-2025"><img alt="CFP IA Data Day 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-March-2025&color=green"></a>
- 29-30 avril 2025 : [MixIT](https://mixitconf.org/) - Lyon (France) <a href="https://sessionize.com/mixit-2025/"><img alt="CFP MixIT 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-January-2025&color=green"></a>
- 7-9 mai 2025 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk25.cfp.dev/#/"><img alt="CFP Devoxx UK 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2025&color=red"></a>
- 15 mai 2025 : [Cloud Toulouse](https://cloudtoulouse.com/) - Toulouse (France) <a href="https://conference-hall.io/cloud-toulouse-2025"><img alt="CFP Cloud Toulouse 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=green"></a>
- 16 mai 2025 : [AFUP Day 2025 Lille](https://event.afup.org/afup-day-2025/) - Lille (France) <a href="https://afup.org/event/afupday2025lille"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Lyon](https://event.afup.org/afup-day-2025/) - Lyon (France) <a href="https://afup.org/event/afupday2025lyon"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Poitiers](https://event.afup.org/afup-day-2025/) - Poitiers (France) <a href="https://afup.org/event/afupday2025poitiers"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 24 mai 2025 : [Polycloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/polycloud-2025"><img alt="Polycloud 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-February-2025&color=green"></a>
- 5-6 juin 2025 : [AlpesCraft](https://www.alpescraft.fr/) - Grenoble (France) 
- 5-6 juin 2025 : [Devquest 2025](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/devquest-2025"><img alt="CFP Devquest 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-March-2025&color=green"></a>
- 11-13 juin 2025 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxxpl25.cfp.dev/#/login"><img alt="CFP Devoxx Poland 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=green"></a>
- 12-13 juin 2025 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 12-13 juin 2025 : [DevLille](https://devlille.fr/) - Lille (France) <a href="https://conference-hall.io/devlille-2025"><img alt="CFP DevLille" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-March-2025&color=green"></a>
- 17 juin 2025 : [Mobilis In Mobile](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/mobilis-in-mobile-2025"><img alt="CFP Mobilis In Mobile 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-April-2025&color=green"></a>
- 24 juin 2025 : [WAX 2025](https://www.waxconf.fr/) - Aix-en-Provence (France) <a href="https://conference-hall.io/wax2025"><img alt="CFP WAX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-May-2025&color=green"></a>
- 25-27 juin 2025 : [BreizhCamp 2025](https://www.breizhcamp.org) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2025/"><img alt="CFP BreizhCamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-March-2025&color=green"></a>
- 26-27 juin 2025 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2025"><img alt="CFP SunnyTech 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-Feb-2025&color=green"></a>
- 1-4 juillet 2025 : [Open edX Conference - 2025](https://con.openedx.org) - Palaiseau (France) <a href="https://sessionize.com/open-edx-conference-2025"><img alt="CFP Open edX Conference - 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-December-2024&color=red"></a>
- 7-9 juillet 2025 : [Riviera DEV 2025](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/riviera-dev-2025/"><img alt="CFP Riviera DEV 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-March-2025&color=green"></a>
- 18-19 septembre 2025 : [API Platform Conference](https://api-platform.com/con/2025/) - Lille (France) & Online <a href="https://conference-hall.io/api-platform-conference-2025-lille-and-online"><img alt="CFP API Platform Conference 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-March-2025&color=green"></a>
- 2-3 octobre 2025 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) 
- 6-10 octobre 2025 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 9-10 octobre 2025 : [Forum PHP 2025](https://event.afup.org/) - Marne-la-Vallée (France) 
- 16-17 octobre 2025 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) 
- 4-7 novembre 2025 : [NewCrafts 2025](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/ncrafts/"><img alt="CFP NewCrafts 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=green"></a>
- 6 novembre 2025 : [dotAI 2025](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=green"></a>
- 7 novembre 2025 : [BDX I/O](https://bdxio.fr) - Bordeaux (France) 
- 12-14 novembre 2025 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) 
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 17 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

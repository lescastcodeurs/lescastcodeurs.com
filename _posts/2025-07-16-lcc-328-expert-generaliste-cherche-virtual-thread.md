---
title: LCC 328 - Expert généraliste cherche Virtual Thread
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 328
youtube: https://www.youtube.com/watch?v=FTMAb2XJEJs
mp3_length: 65131804
tweet: Expert généraliste cherche Virtual Thread #Quarkus #applets #virtualthreads #agents #accessibilité #GeminiCLI #IntelliJ #techradars 

# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Emmanuel et Antonio discutent de divers sujets liés au développement: Applets (et oui), app iOS développées sous Linux, le protocole A2A, l'accessibilité, les assistants de code AI en ligne de commande (vous n'y échapperez pas)... 
Mais aussi des approches méthodologiques et architecturales comme l'architecture hexagonale, les tech radars, l'expert généraliste et bien d'autres choses encore.

Enregistré le 11 juillet 2025

Téléchargement de l’épisode [LesCastCodeurs-Episode-328.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-328.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=FTMAb2XJEJs).

## News


### Langages

Les Applets Java c'est terminé pour de bon... enfin, bientot:

[https://openjdk.org/jeps/504](https://openjdk.org/jeps/504)

- Les navigateurs web ne supportent plus les applets.
- L'API Applet et l'outil `appletviewer` ont été dépréciés dans JDK 9 (2017).
- L'outil `appletviewer` a été supprimé dans JDK 11 (2018). Depuis, impossible d'exécuter des applets avec le JDK.
- L'API Applet a été marquée pour suppression dans JDK 17 (2021).
- Le Security Manager, essentiel pour exécuter des applets de façon sécurisée, a été désactivé définitivement dans JDK 24 (2025).


### Librairies

Quarkus 3.24 avec la notion d’extensions qui peuvent fournir des capacités à des assistants [https://quarkus.io/blog/quarkus-3-24-released/](https://quarkus.io/blog/quarkus-3-24-released/)

- les assistants typiquement IA, ont accès a des capacités des extensions 
- Par exemple générer un client à partir d’openAPI
- Offrir un accès à la,base de données en dev via le schéma. 

L’intégration d’Hibernate 7 dans Quarkus [https://quarkus.io/blog/hibernate7-on-quarkus/](https://quarkus.io/blog/hibernate7-on-quarkus/)

- Jakarta data
- api restriction nouvelle
- Injection du SchemaManager

Sortie de Micronaut 4.9
[https://micronaut.io/2025/06/30/micronaut-framework-4-9-0-released/](https://micronaut.io/2025/06/30/micronaut-framework-4-9-0-released/)

- **Core :**
  - Mise à jour vers Netty 4.2.2 (attention, peut affecter les perfs).
  - Nouveau mode expérimental “Event loop Carrier” pour exécuter des _virtual threads_ sur l’event loop Netty.
  - Nouvelle annotation `@ClassImport` pour traiter des classes déjà compilées.
  - Arrivée des `@Mixin` (Java uniquement) pour modifier les métadonnées d’annotations Micronaut sans altérer les classes originales.
- **HTTP/3 :** Changement de dépendance pour le support expérimental.
- **Graceful Shutdown :** Nouvelle API pour un arrêt en douceur des applications.
- **Cache Control :** API fluente pour construire facilement l’en-tête HTTP `Cache-Control`.
- **KSP 2 :** Support de KSP 2 (à partir de 2.0.2) et testé avec Kotlin 2.
- **Jakarta Data :** Implémentation de la spécification Jakarta Data 1.0.
- **gRPC :** Support du JSON pour envoyer des messages sérialisés via un POST HTTP.
- **ProjectGen :** Nouveau module expérimental pour générer des projets JVM (Gradle ou Maven) via une API.
- Un super article sur experimenter avec les event loops reactives dans les virtualthreads [https://micronaut.io/2025/06/30/transitioning-to-virtual-threads-using-the-micronaut-loom-carrier/](https://micronaut.io/2025/06/30/transitioning-to-virtual-threads-using-the-micronaut-loom-carrier/)
- Malheureusement cela demander le hacker le JDK
- C'est un article de micronaut mais le travail a ete collaboratif avec les equipes de Red Hat OpenJDK, Red Hat perf et de Quarkus et Vert.x
- Pour les curieux c'est un bon article

Ubuntu offre un outil de creation de container pour Spring notamment [https://canonical.com/blog/spring-boot-containers-made-easy](https://canonical.com/blog/spring-boot-containers-made-easy)

- creer des images OCI pour les applications Spring Boot
- basées sur Ubuntu base images bien sur
- utilise jlink pour reduire la taille
- pas sur de voir le gros avantage vs d'autres solutions plus portables
- d'ailleurs Canonical entre dans la danse des builds d'openjdk

Le SDK Java de A2A contribué par Red Hat est sorti [https://quarkus.io/blog/a2a-project-launches-java-sdk/](https://quarkus.io/blog/a2a-project-launches-java-sdk/)

- A2A est un protocole initié par Google et donne à la fondation Linux
- Il permet à des agents de se décrire et d’interagir entre eux
- Agent cards, skills, tâche, contexte
- A2A complémente MCP
- Red hat a implémenté le SDK Java avec le conseil des équipes Google
- En quelques annotations et classes on a un agent card, un client A2A et un serveur avec l’échange de messages via le protocole A2A

Comment configurer mockito sans warning après java 21 [https://rieckpil.de/how-to-configure-mockito-agent-for-java-21-without-warning/](https://rieckpil.de/how-to-configure-mockito-agent-for-java-21-without-warning/)

- les agents chargés dynamiquement sont déconseillés et seront interdis bientôt
- Un des usages est mockito via bytebuddy
- L’avantage est que la,configuration était transparente
- Mais bon sécurité oblige c’est fini. 
- Donc l’article décrit comment configurer maven gradle pour mettre l’agent au démarrage des tests 
- Et aussi comment configurer cela dans IntelliJ idea. 
- Moins simple malheureusement 




### Web

Des raisons “égoïstes” de rendre les UIs plus accessibles
[https://nolanlawson.com/2025/06/16/selfish-reasons-for-building-accessible-uis/](https://nolanlawson.com/2025/06/16/selfish-reasons-for-building-accessible-uis/)

- **Raisons égoïstes** : Des avantages personnels pour les développeurs de créer des interfaces utilisateurs (UI) accessibles, au-delà des arguments moraux.
- **Débogage facilité** : Une interface accessible, avec une structure sémantique claire, est plus facile à déboguer qu’un code désordonné (la « soupe de div »).
- **Noms standardisés** : L’accessibilité fournit un vocabulaire standard (par exemple, les directives WAI-ARIA) pour nommer les composants d’interface, ce qui aide à la clarté et à la structuration du code.
- **Tests simplifiés** : Il est plus simple d’écrire des tests automatisés pour des éléments d’interface accessibles, car ils peuvent être ciblés de manière plus fiable et sémantique.

Après 20 ans de stagnation, la spécification du format d’image PNG évolue enfin !
[https://www.programmax.net/articles/png-is-back/](https://www.programmax.net/articles/png-is-back/)

- **Objectif :** Maintenir la pertinence et la compétitivité du format.
- **Recommandation :** Soutenu par des institutions comme la Bibliothèque du Congrès américain.
- **Nouveautés Clés :**Prise en charge du **HDR** (High Dynamic Range) pour une plus grande gamme de couleurs.
- Reconnaissance officielle des **PNG animés (APNG)**.
- Support des métadonnées **Exif** (copyright, géolocalisation, etc.).
- **Support Actuel :** Déjà intégré dans Chrome, Safari, Firefox, iOS, macOS et Photoshop.
- **Futur :**Prochaine édition : focus sur l’interopérabilité entre HDR et SDR.
- **Édition suivante** : améliorations de la compression.

Avec le projet open source Xtool, on peut maintenant construire des applications iOS sur Linux ou Windows, sans avoir besoin d’avoir obligatoirement un Mac
[https://xtool.sh/tutorials/xtool/](https://xtool.sh/tutorials/xtool/)

- Un tutoriel très bien fait explique comment faire :
- Création d’un nouveau projet via la commande `xtool new`.
- Génération d’un package Swift avec des fichiers clés comme `Package.swift` et `xtool.yml`.
- Build et exécution de l’app sur un appareil iOS avec `xtool dev`.
- Connexion de l’appareil en USB, gestion du jumelage et du Mode Développeur.
- xtool gère automatiquement les certificats, profils de provisionnement et la signature de l’app.
- Modification du code de l’interface utilisateur (ex: `ContentView.swift`).
- Reconstruction et réinstallation rapide de l’app mise à jour avec `xtool dev`.
- xtool est basé sur VSCode sur la partie IDE


### Data et Intelligence Artificielle

Nouvelle edition du best seller mondial “Understanding LangChain4j” : [https://www.linkedin.com/posts/agoncal_langchain4j-java-ai-activity-7342825482830200833-rtw8/](https://www.linkedin.com/posts/agoncal_langchain4j-java-ai-activity-7342825482830200833-rtw8/)

- Mise a jour des APIs (de LC4j 0.35 a 1.1.0)
- Nouveaux Chapitres sur MCP / Easy RAG / JSon Response
- Nouveaux modeles (GitHub Model, DeepSeek, Foundry Local)
- Mise a jour des modeles existants (GPT-4.1, Claude 3.7…)

Google donne A2A a la Foundation Linux [https://developers.googleblog.com/en/google-cloud-donates-a2a-to-linux-foundation/](https://developers.googleblog.com/en/google-cloud-donates-a2a-to-linux-foundation/)

- Annonce du projet Agent2Agent (A2A) : Lors du sommet Open Source Summit North America, la Linux Foundation a annoncé la création du projet Agent2Agent, en partenariat avec Google, AWS, Microsoft, Cisco, Salesforce, SAP et ServiceNow.
- Objectif du protocole A2A : Ce protocole vise à établir une norme ouverte pour permettre aux agents d’intelligence artificielle (IA) de communiquer, collaborer et coordonner des tâches complexes entre eux, indépendamment de leur fournisseur.
- Transfert de Google à la communauté open source : Google a transféré la spécification du protocole A2A, les SDK associés et les outils de développement à la Linux Foundation pour garantir une gouvernance neutre et communautaire.
- Soutien de l’industrie : Plus de 100 entreprises soutiennent déjà le protocole. AWS et Cisco sont les derniers à l’avoir validé. Chaque entreprise partenaire a souligné l’importance de l’interopérabilité et de la collaboration ouverte pour l’avenir de l’IA.
- Objectifs de la fondation A2A :
  - Établir une norme universelle pour l’interopérabilité des agents IA.
  - Favoriser un écosystème mondial de développeurs et d’innovateurs.
  - Garantir une gouvernance neutre et ouverte.
  - Accélérer l’innovation sécurisée et collaborative.
- parler de la spec et surement dire qu'on aura l'occasion d'y revenir

Gemini CLI :[https://blog.google/technology/developers/introducing-gemini-cli-open-source-ai-agent/](https://blog.google/technology/developers/introducing-gemini-cli-open-source-ai-agent/)

  1. **Agent IA dans le terminal** : Gemini CLI permet d’utiliser l’IA Gemini directement depuis le terminal.
  2. **Gratuit avec compte Google** : Accès à Gemini 2.5 Pro avec des limites généreuses.
  3. **Fonctionnalités puissantes** : Génère du code, exécute des commandes, automatise des tâches.
  4. **Open source** : Personnalisable et extensible par la communauté.
  5. **Complément de Code Assist** : Fonctionne aussi avec les IDE comme VS Code.

Au lieu de blocker les IAs sur vos sites vous pouvez peut-être les guider avec les fichiers LLMs.txt [https://llmstxt.org/](https://llmstxt.org/) 

- Exemples du projet angular:
  - llms.txt un simple index avec des liens : [https://angular.dev/llms.txt](https://angular.dev/llms.txt)
  - lllms-full.txt une version bien plus détaillée : [https://angular.dev/llms-full.txt](https://angular.dev/llms-full.txt)


### Outillage

Les commits dans Git sont immuables, mais saviez vous que vous pouviez rajouter / mettre à jour des “notes” sur les commits ?
[https://tylercipriani.com/blog/2022/11/19/git-notes-gits-coolest-most-unloved-feature/](https://tylercipriani.com/blog/2022/11/19/git-notes-gits-coolest-most-unloved-feature/)

- **Fonctionnalité méconnue** : `git notes` est une fonctionnalité puissante mais peu utilisée de Git.
- **Ajout de métadonnées** : Permet d’attacher des informations à des commits existants sans en modifier le hash.
- **Cas d’usage** : Idéal pour ajouter des données issues de systèmes automatisés (builds, tickets, etc.).
- **Revue de code distribuée** : Des outils comme `git-appraise` ont été construits sur `git notes` pour permettre une revue de code entièrement distribuée, indépendante des forges (GitHub, GitLab).
- **Peu populaire** : Son interface complexe et le manque de support des plateformes de forge ont limité son adoption (GitHub n’affiche même pas/plus les notes).
- **Indépendance des forges** : `git notes` offre une voie vers une plus grande indépendance vis-à-vis des plateformes centralisées, en distribuant l’historique du projet avec le code lui-même.

Un aperçu dur Spring Boot debugger dans IntelliJ idea ultimate [https://blog.jetbrains.com/idea/2025/06/demystifying-spring-boot-with-spring-debugger/](https://blog.jetbrains.com/idea/2025/06/demystifying-spring-boot-with-spring-debugger/)

- montre cet outil qui donne du contexte spécifique à Spring comme les beans non activés, ceux mockés, la valeur des configs, l’état des transactions 
- Il permet de visualiser tous les beans Spring directement dans la vue projet, avec les beans non instanciés grisés et les beans mockés marqués en orange pour les tests
- Il résout le problème de résolution des propriétés en affichant la valeur effective en temps réel dans les fichiers properties et yaml, avec la source exacte des valeurs surchargées
- Il affiche des indicateurs visuels pour les méthodes exécutées dans des transactions actives, avec les détails complets de la transaction et une hiérarchie visuelle pour les transactions imbriquées
- Il détecte automatiquement toutes les connexions DataSource actives et les intègre avec la fenêtre d’outils Database d’IntelliJ IDEA pour l’inspection
- Il permet l’auto-complétion et l’invocation de tous les beans chargés dans l’évaluateur d’expression, fonctionnant comme un REPL pour le contexte Spring
- Il fonctionne sans agent runtime supplémentaire en utilisant des breakpoints non-suspendus dans les bibliothèques Spring Boot pour analyser les données localement

Une liste communautaire sur les assistants IA pour le code, lancée par Lize Raes
[https://aitoolcomparator.com/](https://aitoolcomparator.com/)

- tableau comparatif qui permet de voir les différentes fonctionnalités supportées par ces outils


### Architecture

Un article sur l’architecture hexagonale en Java [https://foojay.io/today/clean-and-modular-java-a-hexagonal-architecture-approach/](https://foojay.io/today/clean-and-modular-java-a-hexagonal-architecture-approach/)

- article introductif mais avec exemple sur l’architecture hexagonale entre le domaine, l’application et l‘infrastructure
- Le domain est sans dépendance
- L‘appli spécifique à l’application mais sans dépendance technique explique le flow
- L’infrastructure aura les dépendances à vos frameworks spring, Quarkus Micronaut, Kafka etc 
- Je suis naturellement pas fan de l’architecture hexagonale en terme de volume de code vs le gain surtout en microservices 
- mais c’est toujours intéressant de se challenger et de regarder le bénéfice coût. 

Gardez un œil sur les technologies avec les tech radar [https://www.sfeir.dev/cloud/tech-radar-gardez-un-oeil-sur-le-paysage-technologique/](https://www.sfeir.dev/cloud/tech-radar-gardez-un-oeil-sur-le-paysage-technologique/)

- Le Tech Radar est crucial pour la veille technologique continue et la prise de décision éclairée.
- Il catégorise les technologies en Adopt, Trial, Assess, Hold, selon leur maturité et pertinence.
- Il est recommandé de créer son propre Tech Radar pour l'adapter aux besoins spécifiques, en s'inspirant des Radars publics.
- Utilisez des outils de découverte (Alternativeto), de tendance (Google Trends), de gestion d'obsolescence (End-of-life.date) et d'apprentissage (roadmap.sh).
- Restez informé via les blogs, podcasts, newsletters (TLDR), et les réseaux sociaux/communautés (X, Slack).
- L'objectif est de rester compétitif et de faire des choix technologiques stratégiques.
- Attention à ne pas sous-estimer son coût de maintenance 


### Méthodologies

Le concept d'expert generaliste [https://martinfowler.com/articles/expert-generalist.html](https://martinfowler.com/articles/expert-generalist.html)

- L'industrie pousse vers une spécialisation étroite, mais les collègues les plus efficaces excellent dans plusieurs domaines à la fois
- Un développeur Python expérimenté peut rapidement devenir productif dans une équipe Java grâce aux concepts fondamentaux partagés
- L'expertise réelle comporte deux aspects : la profondeur dans un domaine et la capacité d'apprendre rapidement
- Les Expert Generalists développent une maîtrise durable au niveau des principes fondamentaux plutôt que des outils spécifiques
- La curiosité est essentielle : ils explorent les nouvelles technologies et s'assurent de comprendre les réponses au lieu de copier-coller du code
- La collaboration est vitale car ils savent qu'ils ne peuvent pas tout maîtriser et travaillent efficacement avec des spécialistes
- L'humilité les pousse à d'abord comprendre pourquoi les choses fonctionnent d'une certaine manière avant de les remettre en question
- Le focus client canalise leur curiosité vers ce qui aide réellement les utilisateurs à exceller dans leur travail
- L'industrie doit traiter "Expert Generalist" comme une compétence de première classe à nommer, évaluer et former
- ca me rappelle le technical staff

Un article sur les métriques métier et leurs valeurs  [https://blog.ippon.fr/2025/07/02/monitoring-metier-comment-va-vraiment-ton-service-2/](https://blog.ippon.fr/2025/07/02/monitoring-metier-comment-va-vraiment-ton-service-2/)

- un article de rappel sur la valeur du monitoring métier et ses valeurs
- Le monitoring technique traditionnel (CPU, serveurs, API) ne garantit pas que le service fonctionne correctement pour l’utilisateur final.
- Le monitoring métier complète le monitoring technique en se concentrant sur l’expérience réelle des utilisateurs plutôt que sur les composants isolés.
- Il surveille des parcours critiques concrets comme “un client peut-il finaliser sa commande ?” au lieu d’indicateurs abstraits.
- Les métriques métier sont directement actionnables : taux de succès, délais moyens et volumes d’erreurs permettent de prioriser les actions.
- C’est un outil de pilotage stratégique qui améliore la réactivité, la priorisation et le dialogue entre équipes techniques et métier.
- La mise en place suit 5 étapes : dashboard technique fiable, identification des parcours critiques, traduction en indicateurs, centralisation et suivi dans la durée.
- Une Definition of Done doit formaliser des critères objectifs avant d’instrumenter tout parcours métier.
- Les indicateurs mesurables incluent les points de passage réussis/échoués, les temps entre actions et le respect des règles métier.
- Les dashboards doivent être intégrés dans les rituels quotidiens avec un système d’alertes temps réel compréhensibles.
- Le dispositif doit évoluer continuellement avec les transformations produit en questionnant chaque incident pour améliorer la détection.
- La difficulté c’est effectivement l’évolution métier par exemple peu de commandes la nuit etc 
- ça fait partie de la boîte à outils SRE


### Sécurité

Toujours à la recherche du S de Sécurité dans les MCP [https://www.darkreading.com/cloud-security/hundreds-mcp-servers-ai-models-abuse-rce](https://www.darkreading.com/cloud-security/hundreds-mcp-servers-ai-models-abuse-rce)

- analyse des serveurs mcp ouverts et accessibles
- beaucoup ne font pas de sanity check des parametres
- si vous les utilisez dans votre appel genAI vous vous exposer
- ils ne sont pas mauvais fondamentalement mais n'ont pas encore de standardisation de securite
- si usage local prefferer stdio ou restreindre SSE à 127.0.0.1


### Loi, société et organisation

Nicolas Martignole, le même qui a créé le logo des Cast Codeurs, s’interroge sur les voies possibles des développeurs face à l’impact de l’IA sur notre métier
[https://touilleur-express.fr/2025/06/23/ni-manager-ni-contributeur-individuel/](https://touilleur-express.fr/2025/06/23/ni-manager-ni-contributeur-individuel/)

- **Évolution des carrières de développeur** : L’IA transforme les parcours traditionnels (manager ou expert technique).
- **Chef d’Orchestre d’IA** : Ancien manager qui pilote des IA, définit les architectures et valide le code généré.
- **Artisan Augmenté** : Développeur utilisant l’IA comme un outil pour coder plus vite et résoudre des problèmes complexes.
- **Philosophe du Code** : Un nouveau rôle centré sur le “pourquoi” du code, la conceptualisation de systèmes et l’éthique de l’IA.
- **Charge cognitive de validation** : Nouvelle charge mentale créée par la nécessité de vérifier le travail des IA.
- **Réflexion sur l’impact** : L’article invite à choisir son impact : orchestrer, créer ou guider.

Entraîner les IAs sur des livres protégés (copyright) est acceptable (fair use) mais les stocker ne l’est pas [https://www.reuters.com/legal/litigation/anthropic-wins-key-ruling-ai-authors-copyright-lawsuit-2025-06-24/](https://www.reuters.com/legal/litigation/anthropic-wins-key-ruling-ai-authors-copyright-lawsuit-2025-06-24/)

- Victoire pour Anthropic (jusqu’au prochain procès): L'entreprise a obtenu gain de cause dans un procès très suivi concernant l'entraînement de son IA, Claude, avec des œuvres protégées par le droit d'auteur.
- "Fair Use" en force : Le juge a estimé que l'utilisation des livres pour entraîner l'IA relevait du "fair use" (usage équitable) car il s'agit d'une transformation du contenu, pas d'une simple reproduction.
- Nuance importante : Cependant, le stockage de ces œuvres dans une "bibliothèque centrale" sans autorisation a été jugé illégal, ce qui souligne la complexité de la gestion des données pour les modèles d'IA.

Luc Julia, son audition au sénat [https://videos.senat.fr/video.5486945_685259f55eac4.ia--audition-de-luc-julia-concepteur-de-siri](https://videos.senat.fr/video.5486945_685259f55eac4.ia--audition-de-luc-julia-concepteur-de-siri)

- On aime ou pas on aide pas Luc Julia et sa vision de l’IA . C’est un eversion encore plus longue mais dans le même thème que sa keynote à Devoxx France 2025 ( [https://www.youtube.com/watch?v=JdxjGZBtp_k](https://www.youtube.com/watch?v=JdxjGZBtp_k) )
- **Nature et limites de l’IA :** Luc Julia a insisté sur le fait que l’intelligence artificielle est une “évolution” plutôt qu’une “révolution”. Il a rappelé qu’elle repose sur des mathématiques et n’est pas “magique”. Il a également alerté sur le manque de fiabilité des informations fournies par les IA génératives comme ChatGPT, soulignant qu’« on ne peut pas leur faire confiance » car elles peuvent se tromper et que leur pertinence diminue avec le temps.
- **Régulation de l’IA :** Il a plaidé pour une régulation “intelligente et éclairée”, qui devrait se faire _a posteriori_ afin de ne pas freiner l’innovation. Selon lui, cette régulation doit être basée sur les faits et non sur une analyse des risques _a priori_.
- **Place de la France :** Luc Julia a affirmé que la France possédait des chercheurs de très haut niveau et faisait partie des meilleurs mondiaux dans le domaine de l’IA. Il a cependant soulevé le problème du financement de la recherche et de l’innovation en France.
- **IA et Société :** L’audition a traité des impacts de l’IA sur la vie privée, le monde du travail et l’éducation. Luc Julia a souligné l’importance de développer l’esprit critique, notamment chez les jeunes, pour apprendre à vérifier les informations générées par les IA.
- **Applications concrètes et futures :** Le cas de la voiture autonome a été discuté, Luc Julia expliquant les différents niveaux d’autonomie et les défis restants. Il a également affirmé que l’intelligence artificielle générale (AGI), une IA qui dépasserait l’homme dans tous les domaines, est “impossible” avec les technologies actuelles.



## Rubrique débutant

Les weakreferences et le finalize [https://dzone.com/articles/advanced-java-garbage-collection-concepts](https://dzone.com/articles/advanced-java-garbage-collection-concepts)

- un petit rappel utile sur les pièges de la méthode finalize qui peut ne jamais être invoquée
- Les risques de bug si finalize ne fini jamais 
- Finalize rend le travail du garbage collector beaucoup plus complexe et inefficace
- Weak references sont utiles mais leur libération n’est pas contrôlable. Donc à ne pas abuser. 
- Il y a aussi les soft et phantom references mais les usages ne sont assez subtils et complexe en fonction du GC. 
- Le sériel va traiter les weak avant les soft, parallel non
- Le g1 ça dépend de la région
- Z1 ça dépend car le traitement est asynchrone 



## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 14-19 juillet 2025 : [DebConf25](https://debconf25.debconf.org) - Brest (France) 
- 5 septembre 2025 : [JUG Summer Camp 2025](https://www.jugsummercamp.org/edition/16) - La Rochelle (France) <a href="https://conference-hall.io/jug-summer-camp-2025"><img alt="CFP JUG Summer Camp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=red"></a>
- 12 septembre 2025 : [Agile Pays Basque 2025](https://agile-paysbasque.fr/) - Bidart (France) <a href="https://conference-hall.io/agile-pays-basque-2025"><img alt="CFP Agile Pays Basque 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-May-2025&color=red"></a>
- 18-19 septembre 2025 : [API Platform Conference](https://api-platform.com/con/2025/) - Lille (France) & Online <a href="https://conference-hall.io/api-platform-conference-2025-lille-and-online"><img alt="CFP API Platform Conference 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-March-2025&color=red"></a>
- 22-24 septembre 2025 : [Kernel Recipes](https://kernel-recipes.org/en/2025/) - Paris (France) 
- 23 septembre 2025 : [OWASP AppSec France 2025](https://www.owaspappsecdays.fr/2025/) - Paris (France) <a href="https://sessionize.com/owasp-appsec-days-france-2025/"><img alt="CFP OWASP AppSec France" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=red"></a>
- 25-26 septembre 2025 : [Paris Web 2025](https://www.paris-web.fr) - Paris (France) <a href="https://appel.paris-web.fr/"><img alt="CFP Paris Web 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-March-2025&color=red"></a>
- 2 octobre 2025 : [Nantes Craft](https://www.nantes-craft.fr) - Nantes (France) 
- 2-3 octobre 2025 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) <a href="https://conference-hall.io/volcamp-2025"><img alt="CFP Volcamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2025&color=red"></a>
- 3 octobre 2025 : [DevFest Perros-Guirec 2025](https://devfest.codedarmor.fr/) - Perros-Guirec (France) <a href="https://conference-hall.io/devfest-perros-guirec-2025"><img alt="CFP DevFest Perros Guirec 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2025&color=red"></a>
- 6-7 octobre 2025 : [Swift Connection 2025](https://swiftconnection.io) - Paris (France) <a href="https://sessionize.com/swift-connection-2025/"><img alt="CFP Swift Connection 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2025&color=red"></a>
- 6-10 octobre 2025 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) <a href="https://dvbe25.cfp.dev/"><img alt="CFP Devoxx Belgium 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-July-2025&color=green"></a>
- 7 octobre 2025 : [BSides Mulhouse](https://bsides-mulhouse.fr) - Mulhouse (France) <a href="https://conference-hall.io/bsides-mulhouse-2025"><img alt="CFP BSides Mulhouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-June-2025&color=red"></a>
- 9 octobre 2025 : [DevCon #25 : informatique quantique](https://www.programmez.com/page-devcon/devcon-25-informatique-quantique) - Paris (France) <a href="https://forms.gle/2Szh1rpTMQtH44Hk8"><img alt="CFP DevCon 25 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 9-10 octobre 2025 : [Forum PHP 2025](https://event.afup.org/) - Marne-la-Vallée (France) <a href="https://afup.org/event/forumphp2025"><img alt="CFP Forum PHP 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=red"></a>
- 9-10 octobre 2025 : [EuroRust 2025](https://eurorust.eu) - Paris (France) <a href="https://www.papercall.io/eurorust-2025"><img alt="CFP EuroRust 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-May-2025&color=red"></a>
- 16 octobre 2025 : [PlatformCon25 Live Day Paris](https://platformconlive.fr/) - Paris (France) <a href="https://conference-hall.io/platformcon25-live-day-paris"><img alt="CFP PlatformCon25 Live Day Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=red"></a>
- 16 octobre 2025 : [Power 365 - 2025](https://www.power365.fr) - Lille (France) <a href="https://sessionize.com/power-365-2025/"><img alt="CFP Power 365 - 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 16-17 octobre 2025 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) <a href="https://conference-hall.io/devfest-nantes-2025"><img alt="CFP DevFest Nantes 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-June-2025&color=red"></a>
- 17 octobre 2025 : [Sylius Con 2025](https://sylius.com/conference-2025/) - Lyon (France) <a href="https://sylius.com/conference-2025/#speakers"><img alt="CFP Sylius Con 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=red"></a>
- 17 octobre 2025 : [ScalaIO 2025](https://scala.io) - Paris (France) <a href="https://www.papercall.io/scala-io-2025"><img alt="CFP ScalaIO 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-August-2025&color=green"></a>
- 20 octobre 2025 : [Codeurs en Seine](https://www.codeursenseine.com/2025) - Rouen (France) <a href="https://conference-hall.io/codeurs-en-seine-20-novembre-2025"><img alt="CFP Codeurs en Seine 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-September-2025&color=green"></a>
- 23 octobre 2025 : [Cloud Nord](https://cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/cloud-nord-2025"><img alt="CFP Cloud Nord" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-August-2025&color=green"></a>
- 30-31 octobre 2025 : [Agile Tour Bordeaux 2025](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2025/"><img alt="CFP Agile Tour Bordeaux 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 30-31 octobre 2025 : [Agile Tour Nantais 2025](https://agilenantes.org/) - Nantes (France) <a href="https://sessionize.com/agile-tour-nantais-2025/"><img alt="CFP Agile Tour Nantais 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2025&color=red"></a>
- 30 octobre 2025-2 novembre 2025 : [PyConFR 2025](https://www.pycon.fr/2025/) - Lyon (France) <a href="https://cfp.pycon.fr/pyconfr-2025/cfp"><img alt="CFP PyConFR 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-July-2025&color=green"></a>
- 4-7 novembre 2025 : [NewCrafts 2025](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/ncrafts/"><img alt="CFP NewCrafts 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=red"></a>
- 5-6 novembre 2025 : [Tech Show Paris](https://www.techshowparis.fr/) - Paris (France) 
- 6 novembre 2025 : [dotAI 2025](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=red"></a>
- 6 novembre 2025 : [Agile Tour Aix-Marseille 2025](http://atmrs.esprit-agile.com/) - Gardanne (France) <a href="https://sessionize.com/agile-tour-aix-marseille-2025/"><img alt="CFP Agile Tour Aix-Marseille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-August-2025&color=green"></a>
- 7 novembre 2025 : [BDX I/O](https://bdxio.fr) - Bordeaux (France) <a href="https://conference-hall.io/bdx-i-o-2025"><img alt="CFP BDX I/O 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-June-2025&color=red"></a>
- 12-14 novembre 2025 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) <a href="https://dvma25.cfp.dev/"><img alt="CFP Devoxx Morocco 25" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-June-2025&color=red"></a>
- 13 novembre 2025 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse-2025"><img alt="CFP DevFest Toulouse 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=red"></a>
- 15-16 novembre 2025 : [Capitole du Libre](https://capitoledulibre.org/) - Toulouse (France) <a href="https://cfp.capitoledulibre.org/cdl-2025/"><img alt="CFP Capitole du Libre 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2025&color=green"></a>
- 19 novembre 2025 : [SREday Paris 2025 Q4](https://sreday.com/2025-paris-q4/) - Paris (France) <a href="https://www.papercall.io/sreday-paris-2025-q4"><img alt="CFP SREday Paris 2025 Q4" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-September-2025&color=green"></a>
- 20 novembre 2025 : [OVHcloud Summit](https://summit.ovhcloud.com/fr/) - Paris (France) 
- 21 novembre 2025 : [DevFest Paris 2025](https://devfest.gdgparis.fr/) - Paris (France) <a href="https://conference-hall.io/devfest-paris-2025"><img alt="CFP DevFest Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2025&color=red"></a>
- 27 novembre 2025 : [DevFest Strasbourg 2025](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/devfest-strasbourg-2025"><img alt="CFP DevFest Strasbourg 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-July-2025&color=red"></a>
- 28 novembre 2025 : [DevFest Lyon](https://devfest.gdglyon.com/) - Lyon (France) <a href="https://conference-hall.io/devfest-lyon-2025"><img alt="DevFest Lyon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=red"></a>
- 1-2 décembre 2025 : [Tech Rocks Summit 2025](https://events.tech.rocks/tech-rocks-summit-2025) - Paris (France) 
- 5 décembre 2025 : [DevFest Dijon 2025](https://devfest.developers-group-dijon.fr/) - Dijon (France) <a href="https://conference-hall.io/devfest-dijon-2025"><img alt="CFP Devest Dijon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 9-11 décembre 2025 : [APIdays Paris](https://www.apidays.global/paris/) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP API Days Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-December-2025&color=green"></a>
- 9-11 décembre 2025 : [Green IO Paris](https://greenio.tech/conference/17/paris-2025-december) - Paris (France) <a href="https://apidays.typeform.com/to/SMHd2wFE?=green-io-conference%3Dcall-for-speakers&typeform-source=greenio.tech"><img alt="CFP Green IO Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-December-2025&color=green"></a>
- 10-11 décembre 2025 : [Devops REX](https://www.devopsrex.fr/) - Paris (France) <a href="https://talks.devopsdays.org/devops-rex-2025/cfp"><img alt="CFP Devops REX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=red"></a>
- 10-11 décembre 2025 : [Open Source Experience](https://www.opensource-experience.com) - Paris (France) 
- 28-31 janvier 2026 : [SnowCamp 2026](https://snowcamp.io/) - Grenoble (France) 
- 2-6 février 2026 : [Web Days Convention](https://webdays.events/) - Aix-en-Provence (France) <a href="https://conference-hall.io/web-days-convention"><img alt="CFP Web Days Convention" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-February-2026&color=green"></a>
- 3 février 2026 : [Cloud Native Days France 2026](https://www.cloudnativedays.fr/) - Paris (France) <a href="https://cfp.cloudnativedays.fr/2026/"><img alt="CFP Cloud Native Days France 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-October-2025&color=green"></a>
- 12-13 février 2026 : [Touraine Tech #26](https://touraine.tech/) - Tours (France) 
- 22-24 avril 2026 : [Devoxx France 2026](https://www.devoxx.fr) - Paris (France) 
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 17 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->


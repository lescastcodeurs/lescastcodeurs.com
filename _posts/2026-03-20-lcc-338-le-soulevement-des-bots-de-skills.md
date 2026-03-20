---
title: LCC 338 - Le soulèvement des bots de skills
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 338
youtube: 1Av8YU_5beI
mp3_length: 84244223
tweet: Le soulèvement des bots de skills #skills #benchmark #mcp #jdk26 #Security #java
# tweet size: 91-93 -> 99-101 #######################################################################
---
Gros zoom sur les skills et leurs usages dans les coding agents, sur les benchmarks de stacks techniques MCP, mais aussi du Java 26-27, du HttpClient, du NodeJS, des scenarios nucléaires pilotés par l'IA, de la méthodologie, bref on ne s'ennuie pas !

Enregistré le 15 mars 2026

Téléchargement de l’épisode [LesCastCodeurs-Episode-338.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-338.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=1Av8YU_5beI).

## News


### Langages

Bruno Borges a créé un site, inspiré d'un site récent qui montrait comment CSS avait évolué, qui illustre justement comment Java a bien évolué au fil du temps, et est devenu un langage encore plus élégant
[https://javaevolved.github.io/](https://javaevolved.github.io/)

- Code simplifié: main() allégé, var, blocs de texte, API String enrichie.
- Pattern Matching: switch sur types, instanceof amélioré, record patterns.
- Données: Records, collections immuables faciles à créer, méthodes de listes.
- Concurrence: Threads virtuels, CompletableFuture, StructuredTaskScope, ScopedValue.
- Erreurs & Sécurité: NPE précis, catch multiples, Optional amélioré, filtres de désérialisation.
- I/O & Réseau: HttpClient moderne, E/S fichiers/console simplifiées, transferTo.
- Dates & Heures: API modernisée, précise, immutables et thread-safe.
- Langage: Interfaces sealed/private, import de modules, Math.clamp
- Streams: Nouveaux opérateurs (takeWhile, mapMulti, Gatherers, teeing).
- Outils & Perf: jshell, exécution simplifiée, jwebserver, AOT, JFR, optimisation mémoire.

10+ raisons de ne pas utiliser le HttpClient du JDK, avec un article très détaillé de Brice Dutheil
[https://blog.arkey.fr/2026/02/08/ten-reasons-to-not-use-jdk-httpclient/](https://blog.arkey.fr/2026/02/08/ten-reasons-to-not-use-jdk-httpclient/)

- JDK HttpClient: intégré, non-upgradable. OkHttp: plus lourd (dépendance Kotlin).
- TLS/SSL: JDK: `SSLContext` limité, vérif hôte globale, épinglage manuel, `SSLParameters` rigides. OkHttp: contrôle fin (`SSLSocketFactory`/`TrustManager`), vérif hôte/épinglage dédiés, `ConnectionSpec` structuré.
- Connexions: JDK: pas de repli, fabrique socket custom impossible (pas UDS/Named Pipes direct), pool limité (propriétés système, contrôle pauvre avant JDK 20/21). OkHttp: repli automatique, fabrique custom, pool granulaire.
- Réseau: JDK: résolveur DNS par défaut, `Authenticator` unique. OkHttp: résolveur DNS custom, authentificateurs séparés (proxy/serveur).
- Cycle Requêtes: JDK: pas d'intercepteurs ni API événements intégrés. OkHttp: `addInterceptor`, `EventListener` pour événements granulaires.
- Ressources: JDK: pas d'arrêt propre avant JDK 21. OkHttp: arrêt granulaire (pool, exécuteur, cache).
- Timeout: JDK: désactivé après en-têtes; le transfert du corps peut dépasser le timeout initial.

JDK 26 et JDK 27 : ce qui nous attend — [https://www.infoq.com/news/2026/02/java-26-so-far/](https://www.infoq.com/news/2026/02/java-26-so-far/)

- JDK 26 est une version non-LTS prévue le 17 mars 2026, avec 10 nouvelles fonctionnalités réparties en 5 catégories
- Le support HTTP/3 arrive enfin dans l’API HTTP Client standard de Java (JEP 517)
- La Structured Concurrency (projet Loom) en est à sa 6e preview, avec l’ajout d’une méthode `onTimeout()` sur `StructuredTaskScope.Joiner`
- Les Lazy Constants passent en 2e preview : des constantes initialisées à la demande, utiles pour optimiser le démarrage
- Le G1 GC gagne en performance via une réduction des synchronisations entre threads applicatifs et threads GC (JEP 522)
- Le cache d’objets AOT (JEP 516) est étendu pour fonctionner avec n’importe quel GC, y compris ZGC
- L’API Applet est définitivement supprimée (JEP 504), fermant une page historique de Java
- L’encodage PEM des objets cryptographiques continue sa preview avec support de chiffrement/déchiffrement de `KeyPair`
- Pour JDK 27 (septembre 2026), l’échange de clés post-quantique hybride pour TLS 1.3 est déjà ciblé (JEP 527)
- Project Valhalla progresse avec une preview des Value Classes : objets sans identité, à champs `final` uniquement


### Librairies

Une étude de performance montre que Java est un super choix pour développer des serveurs MCP
[https://www.tmdevlab.com/mcp-server-performance-benchmark.html](https://www.tmdevlab.com/mcp-server-performance-benchmark.html)

- Comparaison de performances de serveurs MCP (Model Context Protocol) en Java, Go, Node.js, Python.
- Méthodologie: 3,9 millions requêtes, environnement Docker (1 cœur CPU, 1 Go RAM/serveur).
- Fiabilité: 0% d'erreurs pour toutes les implémentations.
- Tiers de performance:
  - 1 (Haute): Go & Java (latence < 1ms, ~1600 requêtes/s).
-         ▪︎ Go: Efficacité mémoire exceptionnelle (18 Mo vs 220 Mo pour Java).
-         ▪︎ Java: Latence marginalement meilleure, mais 12x plus de mémoire.
  - 2 (Moyenne): Node.js (latence ~10,7 ms, ~560 requêtes/s). Surcharge par instanciation.
  - 3 (Faible): Python (latence ~26,5 ms, ~290 requêtes/s). Limité par GIL.
- Recommandations production:
  - Go: Optimal forte charge, cloud-native, optimisation coûts.
  - Java: Latence très basse critique, infrastructure Java existante.
  - Node.js & Python: Adaptés charges modérées/faibles, développement/test.
- Node.js et Python peuvent être optimisés pour améliorer leurs performances en production.
- Et encore, en Java, le benchmark n'a pas utilisé GraalVM pour une compilation native, ce qui aurait donné des chiffres côté mémoire qui aurait concurrencé Go

Qui a la meilleure perf entre Quarkus et Spring pour faire des serveurs MCP ?
[https://medium.com/@egekaraosmanoglu/spring-boot-vs-quarkus-which-java-runtime-wins-the-ai-mcp-tools-performance-battle-4da9d6a248d5](https://medium.com/@egekaraosmanoglu/spring-boot-vs-quarkus-which-java-runtime-wins-the-ai-mcp-tools-performance-battle-4da9d6a248d5)

- Quarkus JVM: Débit et latence les plus élevés (jusqu'à 16 381 req/s, 65% plus rapide que Spring Boot), surpasse Spring Boot même avec Apache Camel.
- Quarkus Native: Consommation mémoire la plus faible (118 MB), démarrage instantané, performance prédictible.
- Spring Boot MVC: Bonnes performances, écosystème mature, nécessite un "warm-up" important (jusqu'à 44% de gain).
- Spring Boot WebFlux: Légèrement meilleur débit et latence que MVC (~5%), mais plus de mémoire et complexité réactive.
- Coût architectural:
  - MapStruct: Impact négligeable (< ±5%).
  - Apache Camel: Réduction de débit de 8-21%, mais valeur ajoutée significative; Quarkus JVM + Camel reste > Spring Boot baseline.
- Protocole MCP: Sur Quarkus JVM (avec Camel), surpasse gRPC.
- Recommandations:
  - Débit max: Quarkus JVM.
  - Coût/Serverless: Quarkus Native.
  - Intégration d'entreprise: Quarkus JVM + Camel + MapStruct.
  - Meilleur choix Spring: Spring Boot WebFlux + MapStruct.

Benchmark des stacks qui implémentent MCP [https://www.tmdevlab.com/mcp-server-performance-benchmark-v2.html](https://www.tmdevlab.com/mcp-server-performance-benchmark-v2.html)

- MCP (Model Context Protocol) est le protocole d’Anthropic pour connecter les LLMs à des outils et sources de données externes ; ce benchmark compare 15 implémentations serveur.
- 39,9 millions de requêtes traitées avec zéro erreur, sur des charges I/O réalistes (Redis + HTTP API) plutôt que des tâches CPU synthétiques.
- Rust atteint 4 845 RPS avec seulement 10,9 Mo de RAM ; Quarkus obtient 4 739 RPS avec la meilleure latence (4,04 ms en moyenne, 8,13 ms au P95).
- Go (3 616 RPS) et Spring MVC (3 540 RPS) constituent un second groupe solide.
- Node.js plafonne à 423 RPS ; Bun est 2,2x plus rapide sur un code identique (876 RPS) ; Python atteint 259 RPS avec 4 workers et uvloop.
- Découverte notable : un bug dans le SDK Rust rmcp v0.16 ajoutait ~40 ms de latence à toutes les réponses HTTP, limitant le débit à 1 283 RPS ; corrigé en v0.17 via la PR #683.
- Les images natives GraalVM réduisent la mémoire de 27 à 81 % mais dégradent le débit de 20 à 36 % ; Quarkus-native est l’exception avec 36 Mo RAM et 3 449 RPS.
- Spring MVC (bloquant) surpasse WebFlux (réactif) à 50 utilisateurs simultanés, rappelant que le modèle réactif n’est pas toujours gagnant.
- Recommandations : Rust ou Quarkus pour la production haute charge, Go pour le cloud-native, Bun plutôt que Node.js en JavaScript.

Jakarta EE 12 Milestone 2 : données, cohérence et configuration  [https://www.infoq.com/articles/jakartaee-12-milestone-2/](https://www.infoq.com/articles/jakartaee-12-milestone-2/)

- Jakarta EE est la plateforme Java entreprise open-source, socle de frameworks comme Quarkus et Spring, qui standardise les APIs pour la persistance, les transactions, la sécurité, etc.
- Jakarta EE 12 adopte Java 21 comme baseline (avec support Java 25) et supprime définitivement le SecurityManager déprécié.
- La nouvelle spec Jakarta Query unifie JPQL (SQL/relationnel) et JDQL (NoSQL) en un seul langage avec deux profils : Core Language (portable) et Persistence Language (relationnel).
- Jakarta Data 1.1 introduit les requêtes dynamiques via une API fluente avec `Restriction<T>` et l’annotation `@Is` pour des conditions plus expressives.
- Jakarta Data supporte désormais les repositories stateful, permettant la gestion du cycle de vie des entités (persist, merge, detach, refresh) comme en JPA classique.
- Jakarta NoSQL 1.1 intègre Jakarta Query via une nouvelle interface `Query` et supporte les projections avec des Java records.
- Jakarta Persistence 4.0 supporte `SequencedCollection` (Java 21) comme type de collection dans les entités.
- Une nouvelle spec Jakarta Agentic AI est en cours, visant des APIs vendor-neutral pour construire des agents IA sur les runtimes Jakarta EE, avec intégration prévue de LangChain4j et Spring AI.
- Cette release est encore un milestone (pas pour la prod) — l’adoption large dépendra de la maturité des outils (IDE, validation de requêtes, diagnostics).

Nouveaux benchmarks Quarkus vs Spring Boot : performance complète et transparente [https://quarkus.io/blog/new-benchmarks/](https://quarkus.io/blog/new-benchmarks/)

- Quarkus est un framework Java optimisé pour les conteneurs, connu pour son faible usage mémoire et son démarrage rapide, concurrent principal de Spring Boot.
- Les anciens graphiques de performance sur [quarkus.io](http://quarkus.io) étaient obsolètes, sans date, sans source, et ne montraient pas le débit (throughput).
- L’absence de données sur le throughput faisait croire à tort que Quarkus avait de mauvaises performances à ce niveau.
- Un nouveau benchmark open source a été créé, transparent et reproductible, disponible sur GitHub.
- Résultats : Quarkus gère 2,7x plus de transactions par seconde que Spring Boot, démarre 2,3x plus vite, avec deux fois moins de mémoire.
- Des experts Spring Boot externes ont contribué à rendre la comparaison plus équitable, notamment sur la configuration des pools de connexions.
- Les threads virtuels améliorent le débit d’environ 6000 tps supplémentaires pour tous les frameworks testés.
- Spring Boot 4 offre un meilleur débit que Spring Boot 3, mais au prix d’un démarrage plus lent et d’une empreinte mémoire plus élevée.
- En mode natif (GraalVM), le démarrage est ultra-rapide mais le throughput est divisé par deux, pour Quarkus comme pour Spring Boot.
- Le mode natif n’est recommandé que pour les applis démarrées/arrêtées très fréquemment ou à faible charge.

Quarkus 3.32 : fondations pour la prochaine LTS [https://quarkus.io/blog/quarkus-3-32-released/](https://quarkus.io/blog/quarkus-3-32-released/)

- Quarkus est un framework Java cloud-natif optimisé pour GraalVM et HotSpot, conçu pour les microservices et les environnements conteneurisés.
- Cette version marque le feature freeze pour la prochaine version LTS 3.33.
- Intégration de Project Leyden (AOT JVM) : le démarrage d’une application REST minimale passe de 370ms à 80ms.
- L’entraînement Leyden peut se déclencher au build ou via les tests d’intégration.
- Amélioration du graceful shutdown HTTP, avec des contributions de l’équipe Keycloak.
- Enregistrement automatique dans Consul via l’extension Stork pour la découverte de services.
- Nouvelles fonctionnalités de sécurité : DPoP nonce providers personnalisés, support de rich authorization pour OIDC.
- Possibilité de personnaliser l’ordre des mécanismes d’authentification et ajout de OIDCAuthenticationCompletionAction.
- Mise à jour du framework Google Cloud Functions en version 2.0, ainsi que Camel Quarkus et Quarkus CXF.
- Les utilisateurs sur LTS 3.27 sont encouragés à tester la migration vers 3.33 pour faire remonter des retours.

NodeJS change sa cadence de releases [https://nodejs.org/en/blog/announcements/evolving-the-nodejs-release-schedule](https://nodejs.org/en/blog/announcements/evolving-the-nodejs-release-schedule)

- Node.js est le runtime JavaScript côté serveur le plus utilisé, géré par la OpenJS Foundation avec un cycle de releases actif depuis la fusion avec io.js il y a dix ans.
- À partir de Node.js 27 (octobre 2026), le projet passe d'une release majeure tous les six mois à une seule par an.
- Chaque release deviendra LTS, supprimant la distinction entre versions paires (LTS) et impaires (non-LTS).
- Un nouveau canal Alpha est introduit, permettant les changements semver-major pendant la phase de test précoce.
- Les phases deviennent : Alpha (6 mois, oct. à mars), Current (6 mois, avr. à oct.), LTS (30 mois), puis EOL.
- La durée totale de support reste de 36 mois, identique au modèle actuel.
- La numérotation des versions s'aligne sur l'année calendaire de la release Current (ex : 27.0.0 en 2027).
- La version Alpha est signée, taguée et testée via CITGM, mais n'est pas destinée à la production.
- La motivation principale : les versions impaires étaient peu adoptées, la distinction pair/impair perturbait les débutants, et réduire les lignes de release parallèles allège la charge des bénévoles.
- Les auteurs de bibliothèques sont encouragés à intégrer les releases Alpha dans leur CI dès que possible pour détecter les régressions en amont.




### Web

jQuery v4 est sorti [https://www.infoq.com/news/2026/02/jquery-4-release/?utm_source=twitter&amp;utm_medium=link&amp;utm_campaign=calendar](https://www.infoq.com/news/2026/02/jquery-4-release/?utm_source=twitter&amp;utm_medium=link&amp;utm_campaign=calendar)

- jQuery est une bibliothèque JavaScript historique qui simplifie la manipulation du DOM, la gestion des événements et les requêtes AJAX, encore très présente dans de nombreuses bases de code.
- Cette version majeure sort pour les 20 ans de la bibliothèque, après presque une décennie sans version majeure.
- Suppression du support d’Internet Explorer 10 et antérieur, Edge Legacy et les anciennes versions iOS/Android.
- IE11 reste encore supporté dans jQuery 4, mais sa suppression est prévue pour jQuery 5.
- Le code source migre d’AMD vers les ES modules, pour une meilleure compatibilité avec les outils de build modernes.
- Le bundler passe de RequireJS à Rollup.
- Suppression des fonctions dépréciées comme `jQuery.isArray`, `jQuery.parseJSON` et `jQuery.trim`, désormais disponibles nativement en JavaScript.
- Le fichier gzippé gagne plus de 3 000 octets ; le build slim descend à environ 19,5 ko.
- Ajout du support des Trusted Types pour faciliter la compatibilité avec les Content Security Policy strictes.
- jQuery reste pertinent pour la maintenance de bases de code existantes et les projets nécessitant une faible dépendance aux frameworks.

La réactivité en frontend : concepts et approches [https://www.sfeir.dev/front/quest-ce-que-la-reactivite-en-frontend/](https://www.sfeir.dev/front/quest-ce-que-la-reactivite-en-frontend/)

- Un article qui resume comment la reactivite est implementee en front web
- La réactivité en frontend désigne le mécanisme qui permet de mettre à jour automatiquement l’UI quand les données changent, sans manipulation directe du DOM.
- Sans réactivité, les développeurs doivent mettre à jour manuellement chaque élément de l’interface, ce qui est fastidieux et source d’erreurs.
- Le data binding unidirectionnel (React) distingue le flux de données des callbacks d’interaction utilisateur.
- Le data binding bidirectionnel (Angular) synchronise automatiquement données et UI dans les deux sens.
- Le Virtual DOM (React, Vue) compare une représentation en mémoire avec le DOM réel avant d’appliquer uniquement les changements nécessaires.
- Les observables via RxJS (Angular) permettent de gérer des flux de données asynchrones et des événements complexes.
- Les signaux (SolidJS, Angular récent, Svelte) offrent des mises à jour granulaires et de meilleures performances que les approches précédentes.
- Les signaux proposent une API plus simple que les observables tout en restant très performants.
- La réactivité abstrait la manipulation du DOM et permet aux développeurs de se concentrer sur l’état de l’application.


### Data et Intelligence Artificielle

Gunnar Morling a annoncé la sortie de Hardwood, un nouveau parseur Java pour les fichiers Apache Parquet, grâce aux leçons apprises par le 1BRC challenge
[https://www.morling.dev/blog/hardwood-new-parser-for-apache-parquet/](https://www.morling.dev/blog/hardwood-new-parser-for-apache-parquet/)

- Hardwood : Nouveau parseur Apache Parquet open-source (Java 21+).
- But : Dépasser `parquet-java` (dépendances lourdes, lecteur mono-threadé).
- Points clés : Dépendances minimes, pipeline de décodage multi-threadé.
- APIs : `RowReader` (ligne) et `ColumnReader` (colonne, haute perf.).
- Optimisations : Parallélisme pages, préchargement adaptatif, moins d'allocations.
- Développement : Assisté par IA (Claude Code), révision humaine.
- Futur : "Predicate push-down", compatibilité `parquet-java`, écriture, CLI, intégration Iceberg.

Apicurio Registry passe AI-Native — [https://www.apicur.io/blog/2026/02/05/apicurio-registry-ai-natural-evolution](https://www.apicur.io/blog/2026/02/05/apicurio-registry-ai-natural-evolution)

- Apicurio Registry est un registre open-source de schemas (OpenAPI, AsyncAPI, Avro, Protobuf…) gérant versioning, validation et gouvernance des APIs.
- Le projet étend ses capacités pour devenir une plateforme native AI, en appliquant les mêmes principes de gouvernance aux agents IA.
- Support du protocole A2A (Agent-to-Agent) : les agents s’enregistrent via des “Agent Cards” et se découvrent mutuellement via des endpoints standardisés.
- Un serveur MCP intégré permet aux LLMs d’interagir directement avec le registre (découverte de schémas, validation, création).
- L’intégration avec Claude Desktop est déjà documentée, permettant de gérer les artefacts en langage naturel.
- Deux nouveaux types d’artefacts : PROMPT_TEMPLATE (templates de prompts versionnés avec variables) et MODEL_SCHEMA (validation des entrées/sorties des agents).
- Les SDKs Java (LangChain4j, Quarkus) et Python (LangChain, LlamaIndex) sont disponibles.
- Une démo multi-agents illustre le “context chaining” : chaque agent reçoit les sorties des agents précédents dans la pipeline.
- La roadmap prévoit : gestion du cycle de vie des agents, recherche sémantique, intégration dans les pipelines de déploiement.

L’Histoire du Deep Learning : quand les machines ont commencé à apprendre [https://blog.ippon.fr/2026/02/20/lhistoire-du-deep-learning-quand-les-machines-ont-commence-a-apprendre/](https://blog.ippon.fr/2026/02/20/lhistoire-du-deep-learning-quand-les-machines-ont-commence-a-apprendre/)

- un article qui retrace les avancées clées du machine learning
- Le deep learning est un sous-domaine du ML basé sur des réseaux de neurones empilés en couches, aujourd’hui omniprésent dans la vision, le langage et la recommandation.
- Le Perceptron (1957) est le premier modèle formel d’apprentissage supervisé, mais il échoue sur des problèmes non linéaires comme le XOR : une limite structurelle, pas algorithmique.
- La rétropropagation du gradient (années 80) permet d’entraîner des réseaux multi-couches, mais souffre du problème de “vanishing gradient” qui bloque l’apprentissage en profondeur.
- L’essor du deep learning dans les années 2000 est autant une révolution matérielle qu’algorithmique : les GPU, conçus pour le jeu vidéo, se révèlent parfaitement adaptés aux calculs matriciels.
- AlexNet (2012) marque une rupture industrielle en démontrant qu’un CNN profond entraîné sur GPU surpasse largement les méthodes classiques en reconnaissance d’images.
- Les LSTM (1997) résolvent les problèmes de mémoire à long terme des RNN, mais leur nature séquentielle limite fortement la parallélisation.
- Les Transformers (“Attention Is All You Need”, 2017) révolutionnent le domaine en remplaçant la récursion par un mécanisme d’attention parallélisable, adaptable aux GPU et TPU.
- L’IA générative introduit une rupture conceptuelle : les modèles apprennent la distribution des données pour en produire de nouveaux exemples, et non plus simplement classifier.
- Les LLM offrent un socle généraliste réutilisable pour de nombreuses tâches, là où l’IA prédictive nécessitait un modèle spécifique par problème.
- La question de l’AGI reste ouverte et très incertaine, mais l’IA devient déjà un “acteur logiciel” capable de raisonner et d’agir de manière autonome via les agents.

Ca y est, Agent to Agent Protocol (A2A) est sorti en version 1.0
[https://a2a-protocol.org/latest/announcing-1.0/](https://a2a-protocol.org/latest/announcing-1.0/)

- Prêt pour la prod
- Support multi-version (<http://0.et|0.3 communiquant avec 1.0) et> multi-protocoles (gRPC, HTTP+JSON...)
- Multi-tenancy : un même endpoint peut supporter et exposer plusieurs agents distincts
- Agent Cards signées et vérifiables cryptographiquement pour vérifier l'identité des agents
- Flexibilité : les clients peuvent choisir de consommer les résultats par polling, streaming, ou également webhooks


### Outillage

Le guide complet pour créer des skills pour vos agents, par Anthropic
[https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf](https://resources.anthropic.com/hubfs/The-Complete-Guide-to-Building-Skill-for-Claude.pdf)

- Définition et structure : Les skills sont des dossiers contenant des instructions (fichier `SKILL.md` obligatoire) et des scripts qui enseignent aux agents comment exécuter des tâches spécifiques ou utiliser des outils MCP de manière fiable.
- Fonctionnement technique : Le système repose sur la "divulgation progressive" via un en-tête YAML critique, permettant à Claude de charger le contexte de la compétence uniquement lorsque la demande de l'utilisateur le nécessite.
- Cycle de vie : Le guide couvre toutes les étapes de développement, de la définition des cas d'usage (automatisation, création de documents) aux protocoles de test et de distribution.
- il couvre aussi comment tester (brievement) et des patterns communs

Apprendre a utiliser les skills pour structurer son code ia [https://philippart-s.github.io/blog/2026-02-18-anthropic-skills/](https://philippart-s.github.io/blog/2026-02-18-anthropic-skills/)

- Les Skills Claude sont des packages d’instructions dans un dossier enseignant à Claude comment gérer des tâches spécifiques de façon cohérente.
- Un skill se compose au minimum d’un fichier SKILL.md avec un frontmatter YAML et des instructions en Markdown.
- Le frontmatter YAML impose deux champs obligatoires : name (en kebab-case) et description (max 1024 caractères expliquant quoi faire et quand le déclencher).
- Les skills fonctionnent de façon identique sur [Claude.ai](http://Claude.ai), Claude Code et l’API sans modification.
- Trois catégories principales : création de documents/assets, automatisation de workflows multi-étapes, et amélioration d’intégrations MCP.
- Les skills s’appuient sur le principe de divulgation progressive : frontmatter toujours chargé, corps du SKILL.md si pertinent, fichiers liés à la demande.
- Cinq patterns courants : orchestration séquentielle, coordination multi-MCP, raffinement itératif, sélection d’outils contextuelle, intelligence métier embarquée.
- Les tests doivent couvrir le déclenchement (90% des requêtes pertinentes), le fonctionnel et la comparaison avec la baseline sans skill.
- Pour la distribution, héberger sur GitHub avec un README séparé du dossier du skill (pas de README.md dans le dossier lui-même).
- Un skill-creator officiel permet de générer un premier SKILL.md en 15-30 minutes à partir d’une description en langage naturel.

Les skills pour les agents, c'est une façon d'automatiser des tâches répétitives
[https://glaforge.dev/posts/2026/02/21/easily-build-a-local-mcp-server-in-java-with-a-skill-in-gemini-cli/](https://glaforge.dev/posts/2026/02/21/easily-build-a-local-mcp-server-in-java-with-a-skill-in-gemini-cli/)

- Construction facile de serveurs MCP Java locaux pour Gemini CLI et autres agents.
- Solution au code Java répétitif : JBang + LangChain4j + un "skill" utilisé par Gemini CLI.
- Idée clée : Une "skill" pour Gemini CLI automatise génération et installation des serveurs.
- La "skill" génère un fichier Java, le compile et l'enregistre dans les paramètres de Gemini CLI.
- Avantages : Élimine le boilerplate, enregistrement automatique, développement rapide.
- Conclusion : Les "skills" d'agent automatisent les tâches répétitives et systématisent l'expérimentation.

Un SKILL.md par Julien Dubois pour permettre aux agents IA de créer des projets Spring en suivant les bonnes pratiques à la JHipster
[https://github.com/jdubois/dr-jskill/blob/main/SKILL.md](https://github.com/jdubois/dr-jskill/blob/main/SKILL.md)

- Dr JSkill est une "Agent Skill" conçue pour aider les IA (GitHub Copilot CLI, Claude Code) à générer des applications Spring Boot 4.x selon les meilleures pratiques de Julien Dubois.
- Permet de créer des projets full-stack modernes utilisant Java 25, PostgreSQL et Docker, avec un choix de frameworks front-end (Vue.js par défaut, React, Angular ou Vanilla JS).
- Intègre des scripts Node.js multiplateformes pour automatiser la génération de projets via [start.spring.io](http://start.spring.io) sans dépendances npm externes.
- Préconise des choix technologiques stricts : Maven uniquement, pas de Lombok, et utilisation de Hibernate ddl-auto pour la gestion du schéma (pas de Flyway/Liquibase).
- Supporte nativement la compilation GraalVM (images natives) pour des démarrages ultra-rapides (<100ms) et une consommation mémoire réduite.
- Se positionne comme une alternative expérimentale à JHipster, plus souple et adaptée aux agents IA pour la mise à jour et la personnalisation de projets.

Préservez votre contexte et limitez vos coûts en filtrant vos tokens avec RTK [https://github.com/pszymkowiak/rtk](https://github.com/pszymkowiak/rtk)

- RTK (Rust Token Killer) [https://www.rtk-ai.app/](https://www.rtk-ai.app/)
- RTK est un proxy CLI open-source écrit en Rust qui compresse les sorties de commandes avant qu’elles n’atteignent la fenêtre de contexte des agents IA.
- Il cible les développeurs utilisant des outils de code IA comme Claude Code, Cursor, Gemini CLI, Aider, Codex, Windsurf et Cline.
- Le problème principal : les sorties CLI verbeuses consomment inutilement des tokens dans les fenêtres de contexte limitées (typiquement 200K tokens).
- RTK annonce 60 à 90% de réduction de tokens sur plus de 30 commandes supportées.
- Les cas d’usage couverts incluent git, cargo, npm, docker et kubectl.
- En pratique : sessions ~3x plus longues, coût par token réduit de ~70% sur les workflows API-heavy.
- L’installation se fait via curl, Homebrew ou binaires pré-compilés, puis `rtk init --global` active la réécriture automatique des commandes.
- La commande `rtk gain` permet de visualiser les économies de tokens réalisées.
- Projet MIT sous licence open-source avec 450+ étoiles GitHub et 138M tokens économisés déclarés.
- Un produit SaaS RTK Cloud est annoncé pour les équipes à partir de 15$/développeur/mois.

Un SKILL.md pour apprendre à un agent à utiliser le debuggueur Java JDB
[https://foojay.io/today/enabling-ai-agents-to-use-a-real-debugger-instead-of-logging/](https://foojay.io/today/enabling-ai-agents-to-use-a-real-debugger-instead-of-logging/)

- Débogage IA actuel : Se limite aux logs (`System.out.println`).
- Objectif : Permettre aux agents IA d'utiliser un vrai débogueur, JDB.
- JDB : Outil textuel, idéal pour l'interaction avec les IA.
- Création : Skill `jdb-debugger` via Anthropic Agent Skills (Markdown) et GitHub Copilot CLI.
- Démonstration : Un agent a débogué en direct une application Swing buggée (breakpoints, pas à pas, inspection des variables).
- Leçon clé : Compiler avec `javac -g` pour les informations de débogage.
- Avantage majeur : Passage du débogage par inférence (logs) à l'observation dynamique de l'état d'exécution.
- Impact : Crucial pour les bugs de concurrence, d'état et d'exceptions.
- Disponibilité : Le skill `jdb-debugger` est open source.
- Perspectives : Extension à d'autres outils CLI.

Cursor disponible dans les IDEs JetBrains via l’ACP [https://blog.jetbrains.com/ai/2026/03/cursor-joined-the-acp-registry-and-is-now-live-in-your-jetbrains-ide/](https://blog.jetbrains.com/ai/2026/03/cursor-joined-the-acp-registry-and-is-now-live-in-your-jetbrains-ide/)

- interessant la stratégie de JetBrains, on integre totu dans IDEA
- ’ACP (Agent Client Protocol) est un protocole de JetBrains permettant d’intégrer des agents IA tiers directement dans ses IDEs.
- Cursor, éditeur de code IA très populaire, rejoint le registre ACP et est maintenant utilisable dans les IDEs JetBrains.
- L’objectif est de combiner les workflows agentiques de Cursor avec l’intelligence de code profonde des IDEs JetBrains.
- D’autres agents sont déjà disponibles via ACP : OpenAI, Anthropic, Google, et maintenant Cursor.
- C’est la stratégie “open ecosystem” de JetBrains : pas de lock-in, on choisit son agent.
- Aucun abonnement JetBrains AI n’est nécessaire pour utiliser Cursor comme agent.
- Prérequis : version 2025.3.2 ou supérieure de l’IDE avec le plugin AI Assistant activé.
- L’installation se fait depuis le sélecteur d’agent via “Install from ACP Registry”.

JetBrains annonce un nouveau produit : Air, un environnement de développement agentique
[https://blog.jetbrains.com/air/2026/03/air-launches-as-public-preview-a-new-wave-of-dev-tooling-built-on-26-years-of-experience/](https://blog.jetbrains.com/air/2026/03/air-launches-as-public-preview-a-new-wave-of-dev-tooling-built-on-26-years-of-experience/)

- Environnement de développement "agentique" pour déléguer des tâches de codage à des agents IA multiples et concurrents.
- Intègre les outils essentiels (terminal, client Git, prévisualisation) autour de l'agent, offrant une expérience cohérente.
- Fournit un contexte de code précis aux agents (lignes, commits, symboles) pour des résultats pertinents.
- Complète les flux de travail existants sans remplacer les IDE, se concentrant sur l'orchestration des agents.
- Permet de basculer facilement entre différents agents (Codex, Claude, Gemini, Junie) et de les exécuter localement ou dans des conteneurs isolés (Docker, Git worktrees).
- Optimisé pour gérer plusieurs sessions d'agents, avec des notifications pour les tâches nécessitant une attention.
- Disponible sur macOS (versions Windows et Linux à venir).
- Accès via abonnement JetBrains AI ou utilisation de clés API personnelles (BYOK) pour des fournisseurs comme OpenAI et Google.
- Prochaines étapes : exécution cloud (tech preview) et fonctionnalités de collaboration d'équipe.

Équipes d'IA avec Docker Sandboxes et Docker Agent [https://www.docker.com/blog/building-ai-teams-docker-sandboxes-agent/](https://www.docker.com/blog/building-ai-teams-docker-sandboxes-agent/)

- Présentation de "Docker Agent", un outil open source permettant de créer et d'orchestrer des équipes d'agents IA spécialisés (Product Manager, Designer, QA, etc.).
- Chaque agent est défini par un rôle, un modèle spécifique (GPT-5, Claude, etc.) et des outils propres (accès au système de fichiers, shell, mémoire).
- Utilisation de "Docker Sandboxes" pour exécuter ces agents dans des environnements isolés par microVM, garantissant que l'IA ne peut pas endommager ou accéder au système hôte. Des Network Policies permettent de restreindre les accès externes. 
- Les sandboxes (disponibles dans Docker Desktop 4.60+) permettent de monter le répertoire de travail local avec les mêmes chemins absolus, facilitant le débogage et l'exécution de scripts.
- Support natif de plusieurs types d'agents dont Claude Code, Gemini, Copilot et Kiro (en mode expérimental).
- Permet une autonomie quasi totale des agents pour installer des dépendances, exécuter des tests et effectuer des commits Git en toute sécurité.
- Au delà des agents de coding les sandboxes peuvent être utilisées pour d'autres types d'agents comme NanoClaw [https://www.docker.com/blog/nanoclaw-docker-sandboxes-agent-security/](https://www.docker.com/blog/nanoclaw-docker-sandboxes-agent-security/) 



### Méthodologies

Un guide très complet sur claude code [https://cc.bruniaux.com/](https://cc.bruniaux.com/)

- Ressource complète (plus de 22 000 lignes de documentation) pour maîtriser Claude Code, l'assistant IA en ligne de commande (CLI) d'Anthropic.
- Présente Claude Code comme une couche d'orchestration plutôt qu'un simple modèle, capable d'exécuter des commandes et de modifier des fichiers en toute autonomie.
- Propose 204 templates prêts à l'emploi (agents, commandes, hooks, skills) et un serveur MCP pour interroger le guide directement depuis le terminal.
- Inclut des frameworks méthodologiques (TDD, SDD, BDD) et des outils d'optimisation comme RTK pour réduire la consommation de tokens de 60 à 90 %.
- Met l'accent sur la sécurité avec une base de données répertoriant 15 vulnérabilités et plus de 600 "skills" malveillants identifiés.
- Compare Claude Code à Cursor et GitHub Copilot, soulignant sa force dans l'automatisation terminal et son système de "hooks" événementiels.

Article Opinion - Personne ne sait encore [https://leaddev.com/ai/nobody-knows-what-programming-will-look-like-in-two-years](https://leaddev.com/ai/nobody-knows-what-programming-will-look-like-in-two-years)

- L’article explore l’impact de l’IA générative sur le métier de développeur et les questions existentielles qu’elle soulève.
- De nombreux développeurs expérimentés se sentent dépassés, questionnent leurs valeurs éthiques ou envisagent de quitter le secteur.
- Les transitions technologiques passées (cartes perforées, assembleur, langages haut niveau) montrent que chaque génération a dû réapprendre ce qui avait de la valeur.
- Selon Kent Beck, la programmation est restée en phase d’extraction depuis 45 ans et l’IA nous a brutalement replongés dans la phase d’exploration.
- L’IA excelle en phase d’exploration (aller vite de l’idée au code) mais est peu fiable en expansion et extraction, car ses erreurs sont subtiles et difficiles à détecter.
- La vraie contrainte n’est plus d’écrire du code mais d’avoir de bonnes idées à résoudre et de valider ce que l’IA produit.
- Les compétences qui gardent de la valeur : comprendre ce que fait un ordinateur, lire du code critiquement, tester, maîtriser l’architecture et le domaine métier.
- Beck imagine que l’IA pourrait libérer du temps pour refactorer et maintenir l’optionalité du code entre chaque nouvelle fonctionnalité.
- Embaucher des juniors n’a jamais été aussi pertinent : l’IA raccourcit leur montée en compétence opérationnelle.
- Être mal à l’aise ou sceptique face à ces changements n’est pas un retard, c’est une forme d’attention critique qui reste une compétence clé.

Spec-Driven Development (SDD) : de la spécification au code avec Kiro  [https://blog.ippon.fr/2026/02/18/spec-driven-development/](https://blog.ippon.fr/2026/02/18/spec-driven-development/)

- Le SDD est une approche où la spécification formalisée (exigences, critères d’acceptation, invariants) devient l’artefact central du projet, versionné avec le code.
- Le problème adressé : dans la plupart des projets, le code finit par être la seule source de vérité, au détriment de l’alignement et de la lisibilité.
- La spécification agit comme un contrat : tout écart est un défaut, pas une variante acceptable.
- Le cycle SDD suit quatre phases : Spécifier, Planifier, Développer/Tester, Itérer/Maintenir.
- Kiro est un IDE (et CLI) qui matérialise le SDD via un cycle structuré : requirements.md, design.md, tasks.md.
- L’IA transforme la spécification d’une contrainte en accélérateur : génération de user stories, critères d’acceptation, tâches et tests à partir d’un prompt.
- Comparaison utile : le BDD décrit le comportement via des tests, le SDD organise tout le projet autour de la spec ; les deux sont complémentaires.
- Le SDD se distingue du PDD (Prompt-Driven Development) : le prompt est éphémère, la spécification reste la référence durable.
- Les risques sont réels : une spec trop lourde fait glisser vers le cycle en V, et une spec sans impact redevient une documentation passive inutile.
- L’IA accélère l’exécution mais ne remplace pas le jugement technique, l’architecture ou l’esprit critique des développeurs.

Comment "déslopifier" du texte généré par LLM avec un SKILL.md
[https://glaforge.dev/posts/2026/03/08/fixing-ai-slop-with-a-skill-in-gemini-cli/](https://glaforge.dev/posts/2026/03/08/fixing-ai-slop-with-a-skill-in-gemini-cli/)

- Le "AI slop" – texte généré par IA, souvent ennuyeux, répétitif et sans personnalité, malgré une grammaire correcte.
- Des sites comme tropes.fyi recensent les motifs et mots typiques du "AI slop" (ex: adverbes surutilisés, expressions spécifiques).
- Guillaume a créé un skill "deslopify" dans Gemini CLI (mais utilisable dans n'importe quel outil supportant les skills).
- Le fichier SKILL.md instruit l'agent de comparer le texte de l'utilisateur avec les "anti-patterns" de tropes.fyi.
- L'agent réécrit ensuite le texte pour le rendre plus naturel et moins robotique.
- Installation facile depuis GitHub dans Gemini CLI.
- Exemples de commandes : "Deslopify cet article:", "Naturaliser ce brouillon:", "Supprimer le charabia IA de mon fichier README.md."
- Même une grande partie de l'article a été générée et déslopifiée par ce skill !


### Sécurité

OpenClaw, agents IA autonomes et dangereux [https://www.sfeir.dev/ia/openclaw-puissant-et-dangereux/](https://www.sfeir.dev/ia/openclaw-puissant-et-dangereux/)

- OpenClaw est un agent IA autonome capable d’automatiser des tâches complexes comme lire des emails, créer des tickets ou générer des pull requests.
- Il fonctionne via des “skills” (outils spécialisés) et peut créer des sous-agents pour paralléliser le travail.
- Il s’intègre avec des canaux de communication comme WhatsApp, Discord ou Teams, et conserve du contexte entre sessions.
- Risque de prompt injection : des entrées non fiables (emails, documents) peuvent influencer le comportement de l’agent.
- 341 skills malveillantes ont été découvertes sur ClawHub, souvent déguisées en prérequis légitimes (supply chain attack).
- Le concept de “Lethal Trifecta” combine données privées accessibles, contenu non fiable et capacité d’action/communication.
- La mémoire persistante aggrave les risques : des attaques peuvent être plantées et se déclencher ultérieurement.
- Un déploiement local ne protège pas contre les infostealers et autres compromissions.
- Une réponse émerge sous forme d’AI Gateway ou LLM firewall, avec allowlists d’outils, protection des secrets et validation humaine.

Clinejection : Quand un outil d'IA en installe un autre [https://grith.ai/blog/clinejection-when-your-ai-tool-installs-another](https://grith.ai/blog/clinejection-when-your-ai-tool-installs-another)

- Détaille une attaque par injection de prompt ("Clinejection") ayant ciblé l'outil de codage IA Cline en février 2026.
- L'attaque a exploité un bot de tri automatique sur GitHub : un simple titre d'Issue malveillant a permis d'exécuter du code arbitraire dans les workflows CI/CD de Cline.
- Les attaquants ont utilisé une technique d'empoisonnement de cache (10 Go de données inutiles pour forcer l'éviction du cache légitime) afin de voler des jetons de publication npm.
- Une version compromise de Cline (2.3.0) a été publiée, installant automatiquement et silencieusement l'agent IA OpenClaw sur les machines de 4 000 développeurs.
- Illustre une nouvelle forme d'attaque de la chaîne d'approvisionnement où une IA est utilisée pour en "bootstrapper" une autre sans le consentement de l'utilisateur.
- Souligne la dangerosité des agents IA ayant des permissions étendues (Bash, Read, Write) lorsqu'ils traitent des entrées non filtrées provenant du web.


### Loi, société et organisation

Un agent attaque publiquement un contributeur open source pour avoir rejeté sa contribution [https://www.theregister.com/2026/02/12/ai_bot_developer_rejected_pull_request/](https://www.theregister.com/2026/02/12/ai_bot_developer_rejected_pull_request/)

- Un agent IA nommé MJ Rathbun (alias crabby-rathbun sur GitHub) a soumis une pull request au projet Matplotlib, un outil de visualisation de données Python très utilisé.
- Le mainteneur Scott Shambaugh a rejeté la contribution en invoquant la politique du projet qui exige des contributions de personnes humaines.
- En réponse, le bot a publié un article de blog attaquant Shambaugh, l’accusant de discrimination et de gatekeeping envers les contributeurs non-humains.
- L’article rédigé par le bot a construit un narratif d’hypocrisie, spéculé sur les motivations psychologiques du mainteneur et utilisé des recherches sur son parcours pour étayer ses accusations.
- Shambaugh a publié son propre billet pour expliquer la situation et dénoncer cette réaction.
- D’autres développeurs ont critiqué le comportement du bot et soutenu le mainteneur.
- Le bot a par la suite publié des excuses reconnaissant une violation du Code de Conduite du projet, mais l’authenticité de ces excuses reste incertaine.
- Cet incident illustre les tensions croissantes entre les mainteneurs open source et les contributions générées par IA.
- GitHub a récemment commencé à aborder ce problème à travers des discussions communautaires.

Même le gouvernement se mets au Model Context Protocol, avec data.gouv accessible par serveur MCP
[https://www.data.gouv.fr/posts/experimentation-autour-dun-serveur-mcp-pour-datagouv](https://www.data.gouv.fr/posts/experimentation-autour-dun-serveur-mcp-pour-datagouv)

- `[data.gouv.fr](http://data.gouv.fr)` teste serveur MCP pour accès données via IA/chatbots.
- Objectif: explorer valorisation données publiques par IA conversationnelle.
- Actuellement lecture seule. Futur: édition/publication envisagée (prudence).
- Tools: recherche, métadonnées, interrogation/analyse de données, métriques.
- ATTENTION: IA peu fiable (erreurs), audit difficile. Prudence serveurs non officiels.
- Code public. Retours bienvenus pour l'avenir.
- Guillaume a même fait un PR pour corriger les instructions d'utilisation du serveur MCP dans Gemini CLI

On parle d’IA et de pentagone qui exclus Claude et fait rentrer OpenAI, voici un article de game theory où les modèles sont évalués dans une guerre [https://www.kcl.ac.uk/shall-we-play-a-game](https://www.kcl.ac.uk/shall-we-play-a-game)

- Le professeur Kenneth Payne du King’s College London a étudié comment les grands modèles de langage (Claude, GPT et Gemini) prennent des décisions stratégiques dans des scénarios de guerre nucléaire.
- L’étude a généré environ 760 000 mots de raisonnement stratégique, soit plus que Guerre et Paix et l’Iliade réunis.
- Claude a adopté une stratégie de construction de confiance initiale, avant de trahir cette confiance une fois les enjeux élevés, avec “des actions dépassant constamment les intentions déclarées”.
- GPT s’est montré généralement passif et retenu, mais capable d’escalades soudaines et dévastatrices sous pression temporelle.
- Gemini a adopté des tactiques imprévisibles de type “théorie du fou”, rappelant la stratégie de Nixon durant la Guerre Froide.
- Les modèles ont tous traité les armes nucléaires de manière désinvolte, avec des utilisations tactiques dans presque tous les scénarios.
- 75% des scénarios ont atteint le stade des menaces nucléaires stratégiques.
- Le tabou moral sur le premier usage nucléaire, établi depuis 1945, n’a pas été respecté par les modèles.
- Aucun modèle n’a choisi les options d’accommodation ou de reddition pourtant disponibles.
- Ces résultats interrogent tout déploiement d’IA dans des contextes à hauts enjeux nécessitant un support décisionnel stratégique.

Décès de Gladys West, mathématicienne pionnière du GPS [https://www.washingtonpost.com/obituaries/2026/01/31/gladys-west-dead-gps-mathematician/](https://www.washingtonpost.com/obituaries/2026/01/31/gladys-west-dead-gps-mathematician/)

- Disparition à l'âge de 95 ans de Gladys West, la mathématicienne dont les calculs de modélisation de la Terre ont été fondamentaux pour le développement du GPS.
- Recrutée en 1956 par la base navale de Dahlgren, elle fut la deuxième femme noire employée comme mathématicienne par la Marine américaine.
- A dirigé le projet "Seasat", premier satellite capable de mesurer les océans par radar, prouvant ainsi la faisabilité de la surveillance terrestre depuis l'espace.
- Ses travaux de programmation sur les ordinateurs de l'époque ont permis d'établir un modèle géodésique de la Terre d'une précision inégalée, base indispensable à la géolocalisation moderne.
- Longtemps restée dans l'ombre, sa contribution majeure n'a été publiquement reconnue que tardivement, notamment par son intronisation au prestigieux Hall of Fame de l'Air Force en 2018.





## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 18 mars 2026 : [Jupyter Workshops: AI in Jupyter: Building Extensible AI Capabilities for Interactive Computing](https://events.linuxfoundation.org/ai-in-jupyter/) - Saint-Maur-des-Fossés (France) 
- 18-19 mars 2026 : [Agile Niort 2026](https://agileniort.fr) - Niort (France) <a href="https://sessionize.com/agile-niort-2026"><img alt="CFP Agile Niort 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-January-2026&color=red"></a>
- 20 mars 2026 : [Atlantique Day 2026](https://www.groupeonepoint.com/fr/) - Nantes (France) <a href="https://conference-hall.io/atlantique-day-2026-keynote"><img alt="CFP Atlantique Day 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-February-2026&color=red"></a>
- 26 mars 2026 : [Data Days Lille](https://days.data-lille.fr/2026/fr/) - Lille (France) <a href="https://conference-hall.io/data-days-lille-2026"><img alt="CFP Data Days Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-February-2026&color=red"></a>
- 26-27 mars 2026 : [SymfonyLive Paris 2026](https://live.symfony.com/2026-paris/) - Paris (France) 
- 26-27 mars 2026 : [REACT PARIS](https://react.paris) - Paris (France) 
- 27-29 mars 2026 : [Shift](https://shift-hackathon.com/) - Nantes (France) 
- 31 mars 2026 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-7/"><img alt="CFP ParisTestConf 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-October-2025&color=red"></a>
- 31 mars 2026-1 avril 2026 : [FlowCon France 2026](https://www.flowcon.io) - Paris (France) 
- 1 avril 2026 : [AWS Summit Paris](https://aws.amazon.com/events/summits/paris) - Paris (France) 
- 2 avril 2026 : [Pragma Cannes 2026](https://ethglobal.com/events/pragma-cannes2026) - Cannes (France) 
- 2-3 avril 2026 : [Xen Spring Meetup 2026](https://xenproject.org/resources/spring-meetup-2026/) - Grenoble (France) <a href="https://sessionize.com/xen-spring-meetup-2026"><img alt="CFP Xen Spring Meetup 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-January-2026&color=red"></a>
- 7 avril 2026 : [PyTorch Conference Europe](https://events.linuxfoundation.org/pytorch-conference-europe/) - Paris (France) 
- 9-10 avril 2026 : [Android Makers by droidcon 2026](https://androidmakers.droidcon.com/) - Paris (France) <a href="https://sessionize.com/android-makers-by-droidcon-2026"><img alt="CFP Android Makers by droidcon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-February-2026&color=red"></a>
- 9-11 avril 2026 : [Drupalcamp Grenoble 2026](https://www.drupal.fr/drupalcamp-grenoble-2026) - Grenoble (France) 
- 16-17 avril 2026 : [MiXiT 2026](https://mixitconf.org) - Lyon (France) <a href="https://sessionize.com/mixit-2026/"><img alt="CFP MiXiT" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-Jan-2026&color=red"></a>
- 17-18 avril 2026 : [Faiseuses du Web 5](https://faiseusesduweb.eu.org) - Dinan (France) 
- 18 avril 2026 : [Global Azure 2026 France - #GlobalAzure](https://www.meetup.com/azug-fr/events/313716280/) - Paris (France) <a href="https://sessionize.com/global-azure-2026-france"><img alt="CFP Global Azure 2026 France - #GlobalAzure" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-April-2026&color=green"></a>
- 22-24 avril 2026 : [Devoxx France 2026](https://www.devoxx.fr) - Paris (France) <a href="https://devoxxfr2026.cfp.dev/"><img alt="CFP Devoxx France 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-January-2026&color=red"></a>
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr26.cfp.dev/"><img alt="CFP Devoxx Greece 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2025&color=red"></a>
- 6-7 mai 2026 : [Devoxx UK 2026](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk26.cfp.dev/"><img alt="CFP Devoxx UK 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-January-2026&color=red"></a>
- 12 mai 2026 : [Lead Innovation Day - Leadership Edition](https://leadinnovation.day/) - Paris (France) <a href="https://sessionize.com/lead-innovation-day-leadership-edition"><img alt="CFP Lead Innovation Day - Leadership Edition" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2026&color=red"></a>
- 12-13 mai 2026 : [Lyon Craft](https://lyon-craft.fr/) - Lyon (France) 
- 19 mai 2026 : [La Product Conf Paris 2026](https://www.laproductconf.com/paris/lpc) - Paris (France) <a href="https://sessionize.com/la-product-conf-paris-2026"><img alt="CFP La Product Conf Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-January-2026&color=red"></a>
- 21-22 mai 2026 : [Flupa UX Days 2026](https://www.uxdays.eu) - Paris (France) <a href="https://sessionize.com/flupa-ux-days-2025-appel-a-orateurric"><img alt="CFP Flupa UX Days 2026 – Appel à orateur·rices pour la 14ᵉ édition" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-March-2026&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Lille](https://event.afup.org/afup-day-2026/afup-day-2026-lille) - Lille (France) <a href="https://afup.org/event/afupday2026lille/cfp"><img alt="CFP AFUP Day Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Paris](https://event.afup.org/afup-day-2026/afup-day-2026-paris) - Paris (France) <a href="https://afup.org/event/afupday2026paris/cfp"><img alt="CFP AFUP Day Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Bordeaux](https://event.afup.org/afup-day-2026/afup-day-2026-bordeaux/) - Bordeaux (France) <a href="https://afup.org/event/afupday2026bordeaux/cfp"><img alt="CFP AFUP Day Bordeaux 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Lyon](https://event.afup.org/afup-day-2026/afup-day-2026-lyon) - Lyon (France) <a href="https://afup.org/event/afupday2026lyon/cfp"><img alt="CFP AFUP Day Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 27 mai 2026 : [aMP Day Strasbourg 2026](https://ampcommunity.online/amp-day-strasbourg-27-5-2026/) - Strasbourg (France) <a href="https://sessionize.com/ampday-strasbourg-2026"><img alt="CFP aMP Day Strasbourg 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-April-2026&color=green"></a>
- 28 mai 2026 : [DevCon 27 : I.A. & Vibe Coding](https://www.programmez.com) - Paris (France) <a href="https://forms.gle/27JdJx38nTNnJYT16"><img alt="CFP DevCon 27 : I.A. & Vibe Coding" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-April-2026&color=green"></a>
- 28 mai 2026 : [Cloud Toulouse 2026](https://cloudtoulouse.com/) - Toulouse (France) <a href="https://conference-hall.io/cloud-toulouse-2026"><img alt="CFP Cloud Toulouse 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-March-2026&color=green"></a>
- 29 mai 2026 : [NG Baguette Conf 2026](https://ngbaguette.angulardevs.fr/) - Paris (France) <a href="https://conference-hall.io/ng-baguette-conf-2026"><img alt="CFP NG Baguette Conf 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2026&color=red"></a>
- 29 mai 2026 : [Agile Tour Strasbourg 2026](https://agilestrasbourg.fr/) - Strasbourg (France) <a href="https://sessionize.com/agile-tour-strasbourg-2026"><img alt="CFP Agile Tour Strasbourg 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-April-2026&color=green"></a>
- 2-3 juin 2026 : [Agile Tour Rennes 2026](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2026/"><img alt="CFP Agile Tour Rennes 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-March-2026&color=green"></a>
- 2-3 juin 2026 : [OW2Con](https://www.ow2con.org/view/2026/) - Paris-Châtillon (France) <a href="https://pretalx.ow2.org/ow2con-2026/cfp"><img alt="CFP OW2 Con 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-February-2026&color=red"></a>
- 3 juin 2026 : [IA–NA](https://ia-na.fr) - La Rochelle (France) <a href="https://conference-hall.io/ia-na-2026"><img alt="CFP IA–NA" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-March-2026&color=red"></a>
- 5 juin 2026 : [TechReady](https://techready.live/) - Nantes (France) <a href="https://conference-hall.io/techready"><img alt="CFP TechReady" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-March-2026&color=green"></a>
- 5 juin 2026 : [Fork it! - Rouen](https://www.forkit.community/events/2026-france-rouen) - Rouen (France) 
- 6 juin 2026 : [Polycloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/polycloud-2026"><img alt="Polycloud 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-February-2026&color=red"></a>
- 9 juin 2026 : [JFTL](https://cftl.fr/actualites/jftl/) - Montrouge (France) <a href="https://easychair.org/account2/signin?l=6729252653728886957"><img alt="CFP JFTL" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-January-2026&color=red"></a>
- 9 juin 2026 : [C:\aen\Tech](https://caen.tech/) - Caen (France) <a href="https://conference-hall.io/caen-tech"><img alt="CFP Caen Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-April-2026&color=green"></a>
- 11-12 juin 2026 : [DevQuest Niort](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/devquest-2026"><img alt="CFP devquest niort" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-March-2026&color=green"></a>
- 11-12 juin 2026 : [DevLille 2026](https://devlille.fr/) - Lille (France) <a href="https://conference-hall.io/devlille-2026"><img alt="CFP DevLille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2026&color=green"></a>
- 12 juin 2026 : [Tech F'Est 2026](https://www.tech-fest.dev/) - Nancy (France) <a href="https://conference-hall.io/tech-fest-2026"><img alt="CFP Tech F'Est 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-February-2026&color=red"></a>
- 16 juin 2026 : [Mobilis In Mobile 2026](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/mobilis-in-mobile-2026"><img alt="CFP Mobilis In Mobile 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-April-2026&color=green"></a>
- 17-19 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxx.pl/cfp"><img alt="CFP Devoxx Poland" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2026&color=red"></a>
- 17-20 juin 2026 : [VivaTech](https://vivatechnology.com) - Paris (France) 
- 18 juin 2026 : [Tech'Work](https://techwork.events) - Lyon (France) <a href="https://conference-hall.io/tech-work-lyon-2026"><img alt="CFP Tech'Work 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-March-2026&color=red"></a>
- 22-26 juin 2026 : [Galaxy Community Conference](https://galaxyproject.org/events/gcc2026/) - Clermont-Ferrand (France) 
- 24-25 juin 2026 : [Agi'Lille 2026](https://agilille.fr) - Lille (France) <a href="https://sessionize.com/agilille-2026"><img alt="CFP Agi'Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-March-2026&color=red"></a>
- 24-26 juin 2026 : [BreizhCamp 2026](https://www.breizhcamp.org) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2026"><img alt="CFP BreizhCamp 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-March-2026&color=green"></a>
- 27 juin 2026 : [Asynconf](https://asynconf.com/) - Paris (France) <a href="https://cfp.asynconf.com/"><img alt="CFP Asynconf" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2026&color=green"></a>
- 2 juillet 2026 : [Azur Tech Summer 2026](https://www.telecom-valley.fr/azurtechsummer/) - Valbonne (France) <a href="https://conference-hall.io/azur-tech-summer-2026"><img alt="CFP Azur Tech Summit 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-March-2026&color=red"></a>
- 2-3 juillet 2026 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2026"><img alt="CFP Sunny Tech 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2026&color=red"></a>
- 3 juillet 2026 : [Agile Lyon 2026](https://www.agilelyon.fr/) - Lyon (France) <a href="https://sessionize.com/agile-lyon-2026/"><img alt="CFP Agile Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-March-2026&color=red"></a>
- 6-8 juillet 2026 : [Riviera Dev](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/riviera-dev-2026"><img alt="CFP Riviera Dev" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-March-2026&color=red"></a>
- 28-30 août 2026 : [State of the Map](https://2026.stateofthemap.org/) - Champs-sur-Marne (France) 
- 4 septembre 2026 : [JUG Summer Camp 2026](https://www.jugsummercamp.org/) - La Rochelle (France) 
- 17-18 septembre 2026 : [API Platform Conference 2026](https://api-platform.com/fr/con/) - Lille (France) <a href="https://api-platform.com/fr/con/2026/call-for-papers/"><img alt="CFP API Platform Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-March-2026&color=green"></a>
- 24 septembre 2026 : [OWASP AppSec Days France 2026](https://www.owaspappsecdays.fr/2026/) - Paris (France) <a href="https://sessionize.com/owasp-appsec-days-france-2026"><img alt="CFP OWASP AppSec Days France 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-May-2026&color=green"></a>
- 24 septembre 2026 : [PlatformCon Paris](https://platformconlive.fr/) - Paris (France) <a href="https://conference-hall.io/platformcon26-live-day-paris"><img alt="CFP PlatformCon Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2026&color=green"></a>
- 24-26 septembre 2026 : [Paris Web 2026](https://www.paris-web.fr) - Paris (France) <img alt="Closed Captions" src="https://img.shields.io/static/v1?label=CC&message=Closed%20Captions&color=blue" />
- 28-29 septembre 2026 : [4th Tech Summit on AI & Robotics](https://artificialintelligence.averconferences.com/) - Paris (France) & Online <a href="https://artificialintelligence.averconferences.com/scientific_session.php"><img alt="CFP tech summit 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-March-2026&color=red"></a>
- 1 octobre 2026 : [WAX 2026](https://www.waxconf.fr/) - Marseille (France) <a href="https://conference-hall.io/wax-2026-conference-tech-au-stade-velodrome"><img alt="CFP WAX 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2026&color=green"></a>
- 1-2 octobre 2026 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) 
- 5-9 octobre 2026 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 30 octobre 2026 : [Cloud Nord 2026](https://cloudnord.fr/) - Lille (France) 
- 19 novembre 2026 : [DevFest Toulouse 2026](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse-2026"><img alt="CFP DevFest Toulouse 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2026&color=green"></a>
- 1-3 décembre 2026 : [Apidays Paris](https://www.apidays.global/paris) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP Apidays Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2026&color=green"></a>
- 4 décembre 2026 : [DevFest Lyon 2026](https://devfest.gdglyon.com/) - Lyon (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

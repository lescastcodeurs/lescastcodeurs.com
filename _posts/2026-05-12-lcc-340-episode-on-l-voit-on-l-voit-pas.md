---
title: LCC 340 - Episode on l'voit on l'voit pas
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 340
youtube: MtAbley8Uwk
mp3_length: 80493191
tweet: Episode on l'voit on l'voit pas #Java26 #GraalVM #Quarkus #OpenJDK #Infinispan #IA #Microservices #Cloud #Performance #CyberSecurite #DevTools
  #GitWorktree
# tweet size: 91-93 -> 99-101 #######################################################################
---
Java 26 est là, GraalVM cartonne chez Trivago (43 à 12 réplicas !), OpenJDK interdit le code généré par LLM, Spring et Quarkus enchaînent les releases.
Côté IA : ADK 1.0, A2A, Lyria 3 chante (mal ?), Yann LeCun lance Ami Labs et ses World Models. Mythos d'Anthropic fait trembler la sécu, Claude Code a leaké son source, et les git worktrees envahissent vos terminaux.
Bonus : la mort annoncée de l'IDE, vagues de licenciement chez Oracle et Block, et nos voix toutes clonées. Bon week-ends de mai !


Enregistré le 7 mai 2026

Téléchargement de l’épisode [LesCastCodeurs-Episode-340.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-340.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=MtAbley8Uwk).

## News


### Langages

Retour d'expérience d’une migration vers graalVM chez Trivago [https://medium.com/graalvm/inside-trivagos-graalvm-migration-native-image-for-graphql-at-scale-912bca9df841](https://medium.com/graalvm/inside-trivagos-graalvm-migration-native-image-for-graphql-at-scale-912bca9df841) 

- La passerelle GraphQL de Trivago (point d'entrée de tout le trafic vers 48 microservices) souffrait de pics de timeout au démarrage JVM
- Résultats spectaculaires après migration vers GraalVM Native Image : réduction des réplicas de 43 à 12, CPU de 15 à 5 cœurs, images Docker plus légères
- Obstacles techniques : incompatibilité Log4j → migration vers Logback, remplacement de Mockk par Testcontainers, compilation CI/CD très gourmande
- Netflix DGS et d'autres librairies manquaient de support GraalVM → l'équipe a contribué des correctifs upstream en open source
- Approche recommandée : commencer par les services les moins complexes, investir massivement dans les tests automatisés
- À la 14e migration, le processus était si rodé qu'il allait plus vite que la toute première tentative

OpenJDK Interim Policy on Generative AI -  [https://openjdk.org/legal/ai](https://openjdk.org/legal/ai)

- OpenJDK adopte une politique intérimaire interdisant toute contribution incluant du contenu généré par des LLMs, modèles de diffusion ou systèmes deep-learning
- Le périmètre est large : code source, texte, images dans les dépôts Git, pull requests GitHub, emails, pages wiki et issues JBS
- Les contributeurs peuvent utiliser les outils d'IA de manière privée pour comprendre, déboguer et relire le code OpenJDK, mais ne peuvent pas contribuer le contenu généré
- Trois risques justifient cette politique : surcharge des relecteurs face au code plausible mais incorrect, risques de sûreté/sécurité pour une plateforme critique, et risques de propriété intellectuelle (l'OCA exige que les contributeurs possèdent les droits IP de leurs contributions)
- Même éditer partiellement du code AI-généré ne le rend pas acceptable à la contribution
- Oracle, sponsor corporatif d'OpenJDK, travaille sur une politique complète à soumettre au Governing Board

GraalVM Native Image et la Closed-World Assumption en Java [https://pvs-studio.com/en/blog/posts/java/1357/](https://pvs-studio.com/en/blog/posts/java/1357/)

- Un bon article de rappel du contexte de closed world en Java
- GraalVM Native Image compile les applications Java en exécutables natifs statiques, sans JVM au runtime.
- La JVM fonctionne en monde ouvert : les classes sont chargées à la demande, les appels sont des références symboliques résolues dynamiquement.
- Native Image impose la "closed-world assumption" : tous les chemins d'exécution doivent être connus à la compilation.
- Les fonctionnalités dynamiques Java (réflexion, proxies, chargement de classes) créent des chemins cachés invisibles à l'analyse statique.
- C'est pourquoi Native Image exige des fichiers de configuration explicites pour la réflexion, les proxies, les ressources et la FFM API.
- L'article illustre le problème avec la Foreign Function &amp; Memory API pour appeler `printf` natif : fonctionne sur JVM, échoue en Native Image sans config.
- Inclure tout le bytecode accessible serait inutilisable : binaire géant, compilation très lente, et la réflexion nécessite des métadonnées précises.
- La configuration n'est pas un défaut de conception mais une conséquence logique du passage du dynamique au statique.

Java 26 : les nouveautés [https://foojay.io/today/java-26-whats-new/](https://foojay.io/today/java-26-whats-new/)

- Java est le langage de la JVM, publié tous les 6 mois depuis Java 9 ; Java 26 est une version non-LTS avec 10 JEPs.
- JEP 500 : protection des champs `final` modifiés par réflexion profonde, avec des avertissements configurables.
- JEP 504 : suppression définitive de l'API Applet, plus supportée par les navigateurs.
- JEP 516 : le cache AOT (Project Leyden) fonctionne désormais avec n'importe quel garbage collector.
- JEP 517 : support HTTP/3 dans le client HTTP, HTTP/2 reste le défaut mais HTTP/3 est accessible à la demande.
- JEP 522 : amélioration du débit du GC G1 en réduisant la synchronisation entre threads applicatifs et threads GC.
- Nouveau support des UUIDv7 via `UUID.ofEpochMillis()`, naturellement triables et adaptés aux identifiants de bases de données.
- `Process` devient `AutoCloseable`, utilisable dans un try-with-resources.
- Aucune fonctionnalité en preview n'est graduée en standard ; Structured Concurrency en est à sa 6e preview.


### Librairies

Guillaume a créé une petite librairie Java sans dépendance pour extraire le JSON d'une réponse d'un LLM un peu verbeux
[https://glaforge.dev/posts/2026/03/22/extracting-json-from-llm-chatter-with-jsonspotter/](https://glaforge.dev/posts/2026/03/22/extracting-json-from-llm-chatter-with-jsonspotter/)

- Les LLM génèrent souvent du JSON, mais il est parfois entouré de bla-bla et/ou contient des erreurs (ex: commentaires, virgules finales) qui bloquent les parseurs JSON standards.
- Guillaume a créé une petite librairie légère sans dépendance pour localiser et extraire la structure la plus longue ressemblant à du JSON (même malformé)
- On peut ensuite passé cette chaîne à un parseur "lénient" (plus tolérant) comme Jackson pour ensuite avoir de bons vieux objets Java fortement typés
- Librairie dispo sur Maven Central

ADK Java sort sa version 1.0 (Agent Development Kit par Google)
[https://developers.googleblog.com/announcing-adk-for-java-100-building-the-future-of-ai-agents-in-java/](https://developers.googleblog.com/announcing-adk-for-java-100-building-the-future-of-ai-agents-in-java/)

- ADK est un framework open source de Google pour créer des agents IA, initialement en Python, maintenant multi-langages (Python, Java, Go, Typescript).
- Nouvelles fonctionnalités majeures :
  - Outils puissants **:** GoogleMapsTool, UrlContextTool, ContainerCodeExecutor, VertexAiCodeExecutor, abstraction ComputerUseTool.
  - Architecture de plugins centralisée **:** Nouveau conteneur `App` pour gérer les `Plugins` à l'échelle de l'application (ex: LoggingPlugin, GlobalInstructionPlugin).
  - Context engineering amélioré **:** Compaction d'événements pour gérer la taille des fenêtres de contexte (résumé et rétention).
  - Human-in-the-Loop (HITL) **:** Supporte les workflows `ToolConfirmation` pour approbation humaine des actions d'agent.
  - Services de session et de mémoire **:** Contrats clairs pour la gestion de l'état (InMemory, VertexAI, Firestore) et la mémoire à long terme.
  - Support Agent2Agent (A2A) **:** Collaboration native entre agents distants de différents frameworks via le protocole A2A.
- Dans cet autre article, Guillaume partage comment il a développé l'application Comic Trip montrée dans la vidéo YouTube et qui utilise ADK 1.0 [https://glaforge.dev/posts/2026/03/30/building-my-comic-trip-agent-with-adk-java-1-0/](https://glaforge.dev/posts/2026/03/30/building-my-comic-trip-agent-with-adk-java-1-0/)

Nouvelle version du SDK Java pour Agent2Agent Protocol, avec le support de la version 1.0 de la spécification
[https://medium.com/google-cloud/a2a-java-sdk-1-0-0-beta1-released-e83c414b34cc](https://medium.com/google-cloud/a2a-java-sdk-1-0-0-beta1-released-e83c414b34cc)

- Alignement avec la version 1.0 de la spécification
- Nouveau groupId org.a2aproject.sdk et package org.a2aproject.sdk
- Protocoles de transport : support complet et équivalent pour JSON-RPC, gRPC et HTTP+JSON/REST.
- Gestion des erreurs : introduction de codes d'erreur et détails structurés pour une meilleure observabilité.
- Optimisation HTTP : ajout d'en-têtes de cache pour les métadonnées des agents (Agent Card).
- Flexibilité du client HTTP : support par défaut du JDK HttpClient, avec option Vert.x pour les environnements Quarkus.
- Nouvelles fonctionnalités techniques : méthode DataPart.fromJson() pour la création simplifiée d'objets depuis du JSON brut.
- Prochaines étapes (v1.0.0.GA) : support simultané des versions 1.0.0 et 0.3.0 du protocole pour assurer l'interopérabilité.

JPA 4.0 Milestone 2 : nouvelles fonctionnalités pour Jakarta Persistence [https://in.relation.to/2026/04/23/JPA-4-M2/](https://in.relation.to/2026/04/23/JPA-4-M2/)

- Jakarta Persistence (JPA) est la spécification standard Java pour le mapping objet-relationnel (ORM), implémentée notamment par Hibernate.
- JPA 4.0 M2 est la deuxième milestone de la prochaine version majeure de la spécification, annoncée par Gavin King.
- Construction de requêtes Criteria à partir de chaînes JPQL, offrant plus de flexibilité dans la composition dynamique des requêtes.
- Nouveaux types d'expressions spécialisés (TextExpression, NumericExpression) pour simplifier l'écriture des requêtes Criteria.
- Nouvelle interface FetchOption pour contrôler explicitement la stratégie de chargement des associations, dont un BatchSize intégré.
- Nouvelle annotation @EntityListener qui découple les classes entités de leurs listeners, supprimant les dépendances à la compilation.
- Les listeners peuvent cibler plusieurs types de callbacks et s'appliquer globalement à toute l'unité de persistance.
- Introduction de FlushModeType.EXPLICIT et QueryFlushMode pour un contrôle plus fin de la synchronisation avec la base de données.
- La méta-annotation @Discoverable permet de placer des annotations comme @NamedQuery sur n'importe quelle classe ou interface.
- Améliorations du DDL via @Index amélioré et clarifications de la spécification via la javadoc.

Quarkus 3.35 : tree-shaking, PGO et AOT Semeru [https://quarkus.io/blog/quarkus-3-35-released/](https://quarkus.io/blog/quarkus-3-35-released/)

- Quarkus est un framework Java cloud-natif optimisé pour GraalVM et HotSpot, conçu pour les microservices et les environnements conteneurisés.
- Nouveau JAR tree-shaking expérimental : analyse des dépendances à la compilation pour supprimer les classes inutilisées.
- Sur le CLI Quarkus, cela supprime plus de 6 000 classes et économise environ 18 Mo (39,5 %).
- Support du Profile-Guided Optimization (PGO) pour les builds natifs via `quarkus.native.pgo.enabled=true`.
- Le PGO est une fonctionnalité Oracle GraalVM, non disponible dans la Community Edition.
- Support de l'AOT IBM Semeru : le démarrage passe de ~380 ms à ~190 ms dans les premiers tests.
- Nouvelle extension `quarkus-reactive-transactions` : support de `@Transactional` pour les méthodes Hibernate Reactive retournant `Uni`.
- Configuration CORS dédiée pour l'interface de management, indépendante de l'interface HTTP principale.
- Les tests n'utilisent plus les System Properties pour la propagation de configuration, facilitant la parallélisation future.
- Le serializer jackson sans reflection n'est pas le default du aux retours de cas limites, encore du travail

This Week in Spring - 21 avril 2026 [https://spring.io/blog/2026/04/21/this-week-in-spring-april-21-2026](https://spring.io/blog/2026/04/21/this-week-in-spring-april-21-2026)

- Spring Framework 6.2.18 et 7.0.7 corrigent trois failles de sécurité : DoS via fichiers multipart WebFlux, empoisonnement de cache de ressources statiques, et DoS sur Windows.
- Le support open source de Spring Framework 5.3.x et 6.1.x est terminé, la migration est recommandée.
- Spring Data 2026.0.0-RC1 introduit l'upsert (MERGE/INSERT ON CONFLICT) dans l'API Template de Spring Data Relational.
- Spring Data ajoute un RedisMessageSendingTemplate pour la cohérence avec les listeners Redis, et une optimisation de réinitialisation de caches en un seul appel.
- Spring AI introduit une Session API (série Agentic Patterns, partie 7) : architecture event-sourcée pour la mémoire des agents IA.
- La Session API supporte la compaction turn-safe, l'isolation de sous-agents en parallèle, et la persistence JDBC (PostgreSQL, MySQL, MariaDB, H2).
- Elle vise Spring AI 2.1 (novembre 2026) et remplacera à terme l'API ChatMemory.
- Spring Vault 4.1.0-RC1 et 4.0.2 sont disponibles.
- Netflix a présenté son usage de Java, Spring Boot et Spring AI dans une vidéo.

This Week in Spring - 28 avril 2026 [https://spring.io/blog/2026/04/28/this-week-in-spring-april-28-2026](https://spring.io/blog/2026/04/28/this-week-in-spring-april-28-2026)

- Cette série hebdomadaire de Josh Long compile les nouveautés de l'écosystème Spring : articles, outils, podcasts et annonces de la communauté.
- Spring Boot 4 introduit un package natif de résilience `org.springframework.resilience` avec une nouvelle API de retry qui remplace les approches fragiles via Spring Retry ou Resilience4j.
- L'API retry native de Spring Boot 4 a des noms d'attributs et sémantiques différents des anciennes bibliothèques, rendant les tutoriels pré-2025 obsolètes et sources de bugs silencieux.
- Le SDK Spring AI pour Amazon Bedrock AgentCore est disponible en GA : il intègre les capacités AgentCore dans Spring AI via annotations et auto-configuration.
- Le SDK AgentCore gère automatiquement le contrat runtime AgentCore : endpoint `/invocations`, health check `/ping`, SSE avec backpressure.
- Il offre mémoire court terme (sliding window) et long terme (sémantique, préférences, résumé, épisodique), ainsi que des outils pour navigateur et exécution de code en sandbox.
- Un plugin Maven (Nullability Maven Plugin) simplifie l'intégration de JSpecify et NullAway pour enforcer la null-safety à la compilation dans les projets Java.
- Le plugin génère automatiquement les fichiers `package-info.java` par package et configure le compilateur pour traiter les violations de nullabilité comme des erreurs.
- Josh Long et Dr. Venkat Subramaniam ont co-présenté à Voxxed Days Amsterdam sur "Intelligent Kotlin", avec un épisode de podcast associé.



### Cloud

Amazon S3 Files [https://aws.amazon.com/about-aws/whats-new/2026/04/amazon-s3-files/](https://aws.amazon.com/about-aws/whats-new/2026/04/amazon-s3-files/)

- Amazon S3 Files est un nouveau service donnant un accès système de fichiers direct aux données stockées dans les buckets S3
- Basé sur la technologie Amazon EFS, il supprime la barrière entre stockage objet et interface système de fichiers sans dupliquer les données
- Débit en lecture pouvant atteindre plusieurs téraoctets par seconde ; des milliers de ressources de calcul peuvent y accéder simultanément
- Les données restent accessibles via les deux interfaces : S3 API classique et système de fichiers standard, sans migration nécessaire
- Cas d'usage : agents IA pour la persistance de mémoire entre pipelines, équipes ML sans staging, simplification des data lakes
- Disponible dans 34 régions AWS



### Data et Intelligence Artificielle

Comment générer de la musique et des clips audio en Java avec le modèle Lyria 3
[https://glaforge.dev/posts/2026/03/25/generating-music-with-lyria-3-and-the-gemini-interactions-java-sdk/](https://glaforge.dev/posts/2026/03/25/generating-music-with-lyria-3-and-the-gemini-interactions-java-sdk/)

- Génération musicale avec Lyria 3 (DeepMind) et le SDK Java Gemini Interactions.
- Lyria 3 : modèle d'IA générative pour créer musique avec paroles ou pistes instrumentales.
- Utilisation via le SDK Java de l'API Gemini, nécessite une clé API Gemini.
- Deux versions de modèle Lyria 3 :
  - `lyria-3-clip-preview` : Clips courts (30s), extraits.
  - `lyria-3-pro-preview` : Chansons complètes (jusqu'à 3 min), structurées.
- Personnalisation via les prompts :
  - Fournir ses propres paroles ou les faire générer.
  - Contrôler la structure de la chanson ([Intro], [Verse], [Chorus], [Outro]).
  - Générer des morceaux instrumentaux uniquement.
  - Utiliser des images comme source d'inspiration (modèle multimodal).
- Sortie : Audio (MP3) et texte (paroles/structure) directement, sans décodage complexe.
- Facilite l'intégration de la génération musicale dans les applications Java.

Les world model, la prochaine étape pour les IA [https://www.lepoint.fr/sciences-nature/comment-le-commando-de-yann-le-cun-se-prepare-a-ringardiser-les-geants-mondiaux-de-lia-depuis-paris-OZVUWTDYBNE25C6WF44265ZQKE/](https://www.lepoint.fr/sciences-nature/comment-le-commando-de-yann-le-cun-se-prepare-a-ringardiser-les-geants-mondiaux-de-lia-depuis-paris-OZVUWTDYBNE25C6WF44265ZQKE/) 

- Yann LeCun a quitté Meta FAIR pour créer AMI Labs (Advanced Machine Intelligence) basée à Paris
- Sa thèse : les LLMs ne mèneront pas à l'intelligence générale, la vraie IA doit partir de la compréhension du monde physique
- AMI Labs a levé 1,03 milliard de dollars en seed (le plus grand seed round de l'histoire européenne) à 3,5 milliards de valorisation
- Les world models apprennent à prédire et comprendre la réalité physique plutôt qu'à prédire le prochain token d'une séquence
- Slogan d'AMI : "Real intelligence does not start in language. It starts in the world."
- Paris comme base stratégique pour challenger la Silicon Valley dans la prochaine rupture de l'IA

Debezium 2026 : résultats du sondage communautaire [https://debezium.io/blog/2026/04/27/debezium-2026-survey-results/](https://debezium.io/blog/2026/04/27/debezium-2026-survey-results/)

- Debezium est un outil de Change Data Capture (CDC) open source qui capture les modifications de bases de données en temps réel pour les diffuser vers des systèmes comme Kafka.
- 98,6% des répondants utilisent Debezium activement ou prévoient de le faire dans l'année, avec 91,3% déjà en production.
- 63,8% des déploiements tournent sur Kubernetes, 60,9% utilisent Kafka Connect auto-géré, et 17,4% restent sur des VMs ou bare metal.
- Helm charts est l'approche dominante pour la gestion de configuration, souvent combiné avec GitOps, CI/CD, Ansible ou Terraform.
- PostgreSQL domine les connecteurs utilisés à 69,6%, suivi de MySQL (33,3%), SQL Server (29%) et Oracle (27,5%).
- Les volumes de changements capturés vont de 1-25 modifications par minute jusqu'à 1-2 millions par minute selon les environnements.

Infinispan rejoint l'écosystème OGX comme fournisseur de stockage vectoriel [https://infinispan.org/blog/2026/04/17/infinispan-joins-ogx-ecosystem](https://infinispan.org/blog/2026/04/17/infinispan-joins-ogx-ecosystem)

- OGX (anciennement Llama Stack) est un serveur API agentique open source pour construire des applications d'IA complètes.
- OGX compose des fournisseurs d'inférence, des stores vectoriels, des backends de sécurité, des runtimes d'outils et du stockage de fichiers en un seul serveur déployable.
- OGX se positionne comme une alternative à l'API OpenAI, déployable sur diverses infrastructures et modèles.
- OGX cible les workflows RAG (Retrieval-Augmented Generation) et les applications agentiques.
- Infinispan s'y intègre comme fournisseur de vector IO, apportant recherche vectorielle, par mots-clés et hybride.
- Je n'ai pas entendu parlé de ce renommage, vous le voyez dans vos deploiements ?


### Outillage

cmux un nouveau terminal basé sur Ghostty spécialisé pour les coding agents [https://cmux.com/](https://cmux.com/)

- Application macOS native construite sur le moteur de rendu Ghostty (libghostty), offrant une accélération GPU pour une fluidité maximale
- Conçu spécifiquement pour le multitâche et les workflows assistés par IA, avec des onglets verticaux affichant la branche Git, le répertoire et les ports actifs
- Intègre des notifications qui illuminent les panneaux lorsqu'un agent IA (Claude Code, Codex, etc.) nécessite l'attention de l'utilisateur
- Propose un navigateur web intégré et scriptable qui peut être affiché en écran scindé à côté du terminal via une API
- Alternative moderne à tmux, ne nécessitant pas de fichiers de configuration complexes ou de préfixes de touches pour la gestion des vitres et des sessions
- Supporte nativement tous les agents de codage en ligne de commande et permet l'automatisation via une API socket et une interface CLI dédiée

Git Worktree comme un chef
[https://www.metal3d.org/blog/2026/git-worktree-comme-un-chef/](https://www.metal3d.org/blog/2026/git-worktree-comme-un-chef/)

- Article par Patrice Ferlet
- `Git Worktree`: Travailler sur plusieurs branches simultanément via des répertoires distincts.
- Évite `git stash` ou clones multiples pour le changement de contexte rapide.
- Méthode "bare" (recommandée):
  - Cloner le dépôt en mode `bare` (ex: `.bare`).
  - Lier le dossier racine au dépôt bare via un fichier `.git`.
  - Configurer le `remote tracking` pour voir toutes les branches distantes.
  - Ajouter des worktrees pour chaque branche (`git worktree add <branche>`).
- Avantages: Économie d'espace, source de vérité unique (un `git fetch` met tout à jour), hooks/configs partagés, sécurité.
- Conseils:
  - Ne jamais faire de `git checkout` à l'intérieur d'un worktree.
  - `git fetch --all` depuis n'importe quel worktree pour tout mettre à jour.
  - `git worktree add --detach` pour tester des merges temporaires sans créer de branche.
  - Supprimer: `git worktree remove <dossier>` puis `git worktree prune`.
- Un script `wtree` est fourni pour automatiser l'initialisation du setup "bare".
- Améliore considérablement le workflow.

L'IDE meurt et vite [https://x.com/jdegoes/status/2036931874057314390?s=46&amp;t=C18cckWlfukmsB_Fx0FfxQ](https://x.com/jdegoes/status/2036931874057314390?s=46&amp;t=C18cckWlfukmsB_Fx0FfxQ) 

- Des leaders techniques prédisent la fin rapide de l'IDE traditionnel, remplacé par des interfaces conversationnelles agentiques
- Le changement de paradigme : le développeur n'écrit plus des lignes de code mais exprime son intention et supervise des agents autonomes
- Des outils comme Claude Code, Copilot et Cursor transforment déjà radicalement les workflows de développement quotidiens
- L'IDE centré sur l'éditeur de code perd sa raison d'être quand l'agent lit, modifie et structure le code de manière autonome
- La transition est comparable au passage du desktop au mobile : les pratiques établies depuis 30 ans remises en question en quelques mois

Le source de Claude Code a leaké via probablement le codemap et un site decrit sont fonctionnement [https://ccunpacked.dev/](https://ccunpacked.dev/)

- Le 31 mars 2026, Anthropic a accidentellement inclus les sourcemaps dans un package npm de Claude Code, exposant ~512 000 lignes de TypeScript
- La fuite n'était pas un piratage mais une erreur humaine : un "*.map" oublié dans .npmignore
- Le site [ccunpacked.dev](http://ccunpacked.dev) a été lancé pour analyser et visualiser le code source décompressé
- Le code révèle un agent background permanent nommé "KAIROS", un mode furtif pour cacher les contributions des employés Anthropic à l'open source, et 44 feature flags cachés
- Une fonctionnalité inédite "Buddy" (animal de compagnie électronique dans le terminal) et un mode "dream" pour l'idéation continue ont été découverts
- Anthropic a confirmé : "Aucune donnée client sensible n'était impliquée. Erreur humaine dans le packaging de la release."

Gemini CLI passe aux agents [https://x.com/srithreepo/status/2039794081925382307?s=46&amp;t=GLj1NFxZoCFCjw2oYpiJpw](https://x.com/srithreepo/status/2039794081925382307?s=46&amp;t=GLj1NFxZoCFCjw2oYpiJpw) 

- Gemini CLI, l'agent IA open source de Google pour le terminal, introduit des hooks dans sa boucle agentique
- Les hooks permettent d'exécuter des scripts automatiquement (scanners de sécurité, vérifications de conformité, logging) à chaque étape de l'agent
- Lancement de Gemini CLI GitHub Actions : un agent autonome pour les repositories qui peut exécuter des tâches de codage de routine
- Support des MCP servers pour étendre les capacités et des "Agent Skills" pour des workflows spécialisés
- Mode agent disponible dans VS Code et IntelliJ avec accès aux outils du système de fichiers et terminal

Wispr, le speech to text en local sur macOS [http://wispr.stormacq.com/](http://wispr.stormacq.com/) 

- Wispr est une application macOS de dictée vocale entièrement locale, propulsée par Whisper (OpenAI) sur appareil, sans cloud ni tracking
- Sébastien Stormacq a développé Wispr en un jour et demi sans écrire une seule ligne de code, grâce à Kiro CLI (agent IA Amazon)
- Disponible en open source sur GitHub et via Homebrew
- Détection automatique de la langue, insertion du texte au curseur dans n'importe quelle application via un raccourci global
- En un mois : 19 releases incluant mode mains-libres, suppression des mots de remplissage, auto-envoi pour les chats, et un outil CLI
- Exemple concret de développement vibe coding produisant un outil de qualité production sans expertise Swift préalable

Comment, Gordon, l’assistant spécialisé en Docker est né [https://n9o.xyz/posts/202603-building-gordon/](https://n9o.xyz/posts/202603-building-gordon/) 

- Nuno Coração ([n9o.xyz](http://n9o.xyz)) détaille comment Gordon, l'assistant spécialisé Docker, a été construit sur docker-agent, le runtime d'agents IA open source de Docker écrit en Go
- Les agents sont définis en YAML déclaratif et distribués comme des artefacts OCI, sans mise à jour binaire nécessaire
- L'architecture initiale en essaim de 9 agents spécialisés a été abandonnée au profit d'un agent racine unique avec un prompt soigneusement conçu
- Le modèle utilisé est Claude Haiku 4.5, suffisant après optimisation des prompts
- Principe clé "show, then do" : toute action de l'agent nécessite une approbation explicite de l'utilisateur
- La description des outils impacte fortement la précision du LLM : ajouter des outils peut paradoxalement dégrader les performances existantes
- Le prompt est une spécification détaillée (identité, patterns d'accès fichiers, règles de sécurité) plutôt qu'une simple instruction

IBM Bob [https://bob.ibm.com/blog/announcing-ibm-bob-launch](https://bob.ibm.com/blog/announcing-ibm-bob-launch)

- **IBM Bob** assistant IA d'IBM pour coder sur de vraies codebases (lancé avril 2026)
  - 5 modes : Ask, Plan, Code, Advanced (MCP), Orchestrator
  - Détecte la complexité du code en temps réel et propose des refactos
  - Fait des revues de code automatiques sur tes branches/issues GitHub
  - Permet d'écrire en langage naturel directement dans l'éditeur
  - Fonctionne aussi en terminal/CLI et dans les pipelines CI/CD
  - Sécurité : approbation manuelle, `.bobignore`, checkpoints, pas de training sur tes prompts

How I use Claude - 50 tips pratiques [https://www.youtube.com/watch?v=mZzhfPle9QU](https://www.youtube.com/watch?v=mZzhfPle9QU)

- Staff Engineer Meta partage 50 tips après 6 mois d'utilisation intensive de Claude Code
- Basé sur ~12h/jour d'usage perso et professionnel
- Couvre tout : bases, workflows avancés, parallélisation
- Objectif : partager ce qu'il aurait voulu savoir dès le départ



### Méthodologies

Quelqu’un rale sur la non soutenabilité des bases de code écritent avec des agents [https://mariozechner.at/posts/2026-03-25-thoughts-on-slowing-the-fuck-down/](https://mariozechner.at/posts/2026-03-25-thoughts-on-slowing-the-fuck-down/)

- Mario Zechner estime que les agents IA font les mêmes erreurs répétitivement sans apprendre, accumulant la complexité à grande vitesse faute de bottlenecks humains
- Sans vision globale, les agents créent du cargo-cult : les "best practices" de l'industrie appliquées localement sans cohérence architecturale
- La croissance de la base de code dégrade la capacité des agents à retrouver le code existant → duplication et incohérences croissantes
- Il cite des pannes AWS et des initiatives qualité Microsoft comme signes préoccupants liés au code généré par IA
- Solution : réserver les agents aux tâches délimitées et évaluables, garder l'architecture, les APIs et les systèmes critiques écrits à la main
- Maintenir une revue de code rigoureuse et traiter les humains comme les gardiens finaux de la qualité

On m'oblige à utiliser l’IA [https://n.survol.fr/n/on-moblige-a-utiliser-lia](https://n.survol.fr/n/on-moblige-a-utiliser-lia) 

- Éric D. défend l'adoption obligatoire de l'IA comme décision stratégique légitime, comparable au choix du full remote ou de la stack technique
- Il distingue la décision stratégique (adoption IA) de la méthode d'accompagnement (qui reste collaborative et bienveillante)
- La compétence IA devient un critère de recrutement : chercher des candidats déjà curieux et explorateurs de ces outils
- L'alignement culturel sur les pratiques et outils est un prérequis à la cohésion d'équipe
- Le refus d'adopter certains outils stratégiques peut justifier de ne pas recruter un candidat autrement compétent

Encore une metodo SPDD [https://martinfowler.com/articles/structured-prompt-driven/](https://martinfowler.com/articles/structured-prompt-driven/)

- **Problème** : l'IA accélère le dev individuel mais amplifie ambiguïtés et incohérences à l'échelle d'une équipe. [martinfowler](https://martinfowler.com/articles/structured-prompt-driven/)
- **SPDD** : traiter les prompts comme des artefacts versionnés, révisables et réutilisables plutôt que des échanges jetables. [martinfowler](https://martinfowler.com/articles/structured-prompt-driven/)
- **Canvas REASONS** : 7 dimensions (Requirements, Entities, Approach, Structure, Operations, Norms, Safeguards) pour guider le LLM de l'intention à l'exécution. [martinfowler](https://martinfowler.com/articles/structured-prompt-driven/)
- **Workflow en 6 étapes** : exigences → analyse → contexte → prompt structuré → code → tests unitaires, chaque étape s'appuyant sur la précédente. [martinfowler](https://martinfowler.com/articles/structured-prompt-driven/)
- **3 compétences clés** : abstraction d'abord, alignement de l'intention, revue itérative. [martinfowler](https://martinfowler.com/articles/structured-prompt-driven/)
- **Limites** : fort ROI sur du code métier complexe, peu adapté aux hotfixes urgents, scripts jetables ou travail créatif/visuel. [m](https://martinfowler.com/articles/structured-prompt-driven/)


### Sécurité

Le projet Glasswing pour sécuriser les logiciels [https://www.anthropic.com/glasswing](https://www.anthropic.com/glasswing) 

- Anthropic lance Glasswing, une initiative de cybersécurité utilisant Claude Mythos Preview pour identifier des vulnérabilités zero-day
- 12 partenaires fondateurs dont AWS, Apple, Cisco, CrowdStrike, Google, JPMorganChase, Linux Foundation, Microsoft et NVIDIA
- Anthropic investit 100 millions de dollars en crédits de modèle et 4 millions en dons aux organisations de sécurité open source
- Le modèle opère avec une autonomie substantielle, identifiant des milliers de vulnérabilités dans les OS, navigateurs et infrastructures critiques
- Plus de 40 organisations supplémentaires ont accès pour scanner et sécuriser leurs systèmes
- Objectif : donner l'avantage aux défenseurs avant que les techniques de hacking assistées par IA ne se généralisent chez les attaquants

LinkedIn vous espionne [https://frenchbreaches.com/blog/linkedin-est-accuse-de-fouiller-dans-votre-ordinateur-illegalement](https://frenchbreaches.com/blog/linkedin-est-accuse-de-fouiller-dans-votre-ordinateur-illegalement) 

- Scandale "BrowserGate" : LinkedIn injecte du JavaScript qui tente de détecter les extensions Chrome installées sur votre navigateur
- Le script analysé contient une liste codée en dur de 6 222 extensions Chrome avec identifiants et chemins de fichiers internes
- Croissance alarmante de la liste ciblée : 38 extensions en 2017 → 461 en 2024 → ~1 000 en mai 2025 → 6 222 début 2026
- Les données collectées incluent aussi CPU, RAM, résolution d'écran, timezone et état batterie pour du fingerprinting
- Certaines extensions ciblées sont liées à la neurodivergence, aux pratiques religieuses ou aux opinions politiques → violation grave du RGPD
- LinkedIn défend que le scan vise uniquement à détecter les extensions qui pratiquent le scraping de données

Post mortem de la supply chain attack sur la librairie NPM axios [https://github.com/axios/axios/issues/10636](https://github.com/axios/axios/issues/10636)

- Le 31 mars 2026, deux versions malveillantes d'axios (1.14.1 et 0.30.4) ont été publiées via un compte mainteneur compromis
- Vecteur d'attaque : RAT installé via ingénierie sociale ciblée sur la machine personnelle du mainteneur principal
- La 2FA ne protège pas si la machine de l'utilisateur est compromise : l'attaquant contrôle tout et peut agir comme l'utilisateur
- Les packages malveillants injectaient plain-crypto-js@4.2.1, un cheval de Troie multi-plateforme (macOS, Windows, Linux)
- Détection communautaire en ~3 heures, suppression par npm, mesures correctives : rotation complète des credentials
- Changements préventifs : publication via OIDC, releases immuables, amélioration des pratiques GitHub Actions

Passbolt un gestionnaire de mots de passe open source [https://lesjoiesducode.fr/passbolt-gestionnaire-de-mots-de-passe-gratuit-open-source-que-votre-equipe-merite-vraiment](https://lesjoiesducode.fr/passbolt-gestionnaire-de-mots-de-passe-gratuit-open-source-que-votre-equipe-merite-vraiment)

- Gestionnaire de mots de passe open source conçu pour le partage d'identifiants en équipe, utilisé par plus de 50 000 organisations
- Chiffrement individuel par utilisateur et par version de credential, pas de coffre-fort partagé — architecture zero-knowledge
- "Forward secrecy" : quand un membre quitte l'équipe, ses copies chiffrées sont automatiquement révoquées sans reset manuel
- Supporte TOTP, clés SSH, tokens API et champs personnalisés avec piste d'audit complète de tous les accès
- Édition communautaire entièrement gratuite avec utilisateurs illimités, auto-hébergeable ou cloud
- Chiffrement OpenPGP nécessitant passphrase + clé privée, avec tokens visuels anti-phishing


### Loi, société et organisation

Anthropic fait un don d’1,5 millions de dollars à la fondation Apache [https://news.apache.org/foundation/entry/the-apache-software-foundation-announces-1-5m-donation-from-anthropic](https://news.apache.org/foundation/entry/the-apache-software-foundation-announces-1-5m-donation-from-anthropic) 

- Anthropic donne 1,5 million de dollars à l'ASF pour soutenir l'infrastructure, la sécurité et la communauté open source
- Vitaly Gudanets (CISO d'Anthropic) : "Soutenir l'ASF est un investissement direct dans la résilience et l'intégrité des systèmes dont dépend l'IA moderne"
- Les fonds financeront les systèmes de build, les processus de sécurité et les services aux projets Apache
- Ce don est le déclencheur de l'initiative IA responsable à 10 millions de dollars de l'ASF
- L'infrastructure Apache est invisible mais critique : des systèmes financiers aux plateformes de santé, elle sous-tend l'écosystème logiciel mondial

L'ASF lance l’initiative IA responsable [https://news.apache.org/foundation/entry/the-apache-software-foundation-launches-10m-responsible-ai-initiative-with-initial-1-75m-donation](https://news.apache.org/foundation/entry/the-apache-software-foundation-launches-10m-responsible-ai-initiative-with-initial-1-75m-donation) 

- L'ASF lance une initiative pour une IA responsable dotée d'un budget de 10 millions de dollars sur 3 ans minimum
- Anthropic est le premier donateur avec 1,5 million de dollars ; Alpha-Omega contribue 250 000 dollars
- L'initiative fournit aux projets Apache un accès à des modèles IA pour l'expérimentation et la sécurité
- Elle soutient l'ensemble de la chaîne IA/ML : pipelines de données, infrastructure, frameworks de deep learning
- Des tracks de conférences, hackathons et bourses de voyage sont prévus pour élargir la communauté
- Les principes directeurs incluent la supervision humaine, l'intégrité des licences et la sécurité open source

Oracle vire 30000 personnes [https://rollingout.com/2026/03/31/oracle-slashes-30000-jobs-with-a-cold-6/](https://rollingout.com/2026/03/31/oracle-slashes-30000-jobs-with-a-cold-6/) 

- Oracle licencie 20 000 à 30 000 employés, 18% de ses effectifs mondiaux.
- Les salariés ont appris leur licenciement par un simple email à 6h du matin, sans aucun préavis.
- L'accès à tous les systèmes (Slack, Zoom, badges) a été coupé immédiatement après.
- But : libérer 8 à 10 milliards de dollars pour construire des centres de données IA.
- Oracle a déjà contracté 50 milliards de dettes en 2026 pour financer ses projets IA.
- Paradoxe : l'entreprise affiche un bénéfice record de 6,13 milliards, mais ses liquidités sont dans le rouge.
- L'action Oracle a perdu plus de la moitié de sa valeur depuis septembre 2025.

Et si l’IA n'était qu’un prétexte pour licencier [https://eventuallycoding.com/p/ia-licenciements-et-si-l-intelligence-artificielle-n-etait-qu-une-excuse](https://eventuallycoding.com/p/ia-licenciements-et-si-l-intelligence-artificielle-n-etait-qu-une-excuse) 

- Hugo Lassiège (eventuallycoding) estime que les entreprises utilisent l'IA comme narratif commode pour masquer des erreurs de gestion passées (Block a triplé ses effectifs post-COVID sans croissance des revenus correspondante)
- Moins de 1% des licenciements technologiques seraient réellement dus à des gains de productivité IA selon les analyses citées
- Mesurer la productivité des développeurs reste un problème non résolu, mais les entreprises affirment des gains d'efficacité sans preuves
- Des pressions économiques réelles (inflation, guerres commerciales, coûts énergétiques) sont masquées derrière le discours IA
- Les restructurations nécessaires sont présentées comme des transformations AI-driven positives pour rassurer les investisseurs
- Il y voit une fenêtre d'opportunité pour l'Europe pendant que les géants américains se restructurent

GitHub Copilot va utiliser les interacitons pour entrainer ses modèles sauf si vous vous délistez [https://github.blog/news-insights/company-news/updates-to-github-copilot-interaction-data-usage-policy/](https://github.blog/news-insights/company-news/updates-to-github-copilot-interaction-data-usage-policy/)

- À partir du 24 avril 2026, GitHub utilise par défaut les interactions des utilisateurs Copilot Free, Pro et Pro+ pour entraîner ses modèles
- Les données collectées incluent le code accepté ou modifié, les snippets envoyés, les noms de fichiers et structures de dépôts, et les retours utilisateurs
- Les utilisateurs Copilot Business, Enterprise et les dépôts d'entreprise sont exclus de cette collecte de données d'entraînement
- Opt-out disponible dans les paramètres GitHub > "Privacy" ; les préférences de désactivation préalables sont conservées automatiquement
- Objectif déclaré : améliorer la précision des modèles sur les langages et cas d'usage du monde réel

Grosse percée de Claude Code dans les commits sur GitHub
[https://aifoc.us/damn-claude-thats-a-lot-of-commits/](https://aifoc.us/damn-claude-thats-a-lot-of-commits/)

- Explosion de Claude Code : En six mois, Claude Code est passé de 0,7 % à 4,5 % de tous les commits publics sur GitHub, surpassant tous les autres outils d'IA combinés.
- Adoption massive des agents IA : Environ 5 % des commits publics sur GitHub sont désormais générés par des agents IA, un chiffre en croissance rapide depuis fin 2025.
- Domination des bots sur GitHub : Au-delà des commits, les outils d'IA sont omniprésents dans la gestion des pull requests et des problèmes (Copilot et CodeRabbit notamment).
- Limites méthodologiques :
  - Les données ne concernent que les dépôts publics (les entreprises utilisent massivement des dépôts privés, invisibles ici).
  - Le comptage dépend fortement de la visibilité des signatures (certains outils comme Claude marquent systématiquement leurs commits, d'autres non)
  - L'API de recherche GitHub présente une fiabilité variable à cette échelle.
- Changement de paradigme : Le développement logiciel vit une transition majeure, comparable au passage du desktop au mobile. L'intégration des agents IA dans le cycle de production n'est plus une expérimentation, mais une réalité opérationnelle à grande échelle.

Dysmaths une application pour aider à apprendre les mathématiques et la géométrie lorsque l’on souffre de dyspraxie, dysgraphie [https://dysmaths.com/](https://dysmaths.com/)

- Application web pour aider les élèves de collège et lycée souffrant de dysgraphie et dyspraxie à faire des maths et de la géométrie
- Outils de dessin à main levée, géométrie précise (compas, rapporteur, règle) et opérations structurées (fractions, racines, puissances, symboles mathématiques)
- Export PDF et PNG avec conservation fidèle de l'échelle pour l'impression et la soumission des exercices
- Options d'accessibilité : police OpenDyslexic, personnalisations d'interface, import d'images et de PDFs
- Répond à un besoin réel : les outils standards ne sont pas adaptés aux difficultés de coordination et d'organisation spatiale en mathématiques

IA ou réalité ? Par Amistory [https://www.youtube.com/watch?v=PPYdAhBBF2I](https://www.youtube.com/watch?v=PPYdAhBBF2I)

- L'IA génère des contenus (images, voix, vidéos) de plus en plus indétectables
- Les arnaques au clonage de voix et deepfakes sont en forte hausse
- Les faux contenus viraux manipulent l'opinion à grande échelle
- Le faux n'est plus un accident, c'est devenu un système organisé
- La société entre dans une ère de doute généralisé sur le réel
- Comment s'informer quand le réel lui-même peut être simulé ?





## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 6-7 mai 2026 : [Devoxx UK 2026](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk26.cfp.dev/"><img alt="CFP Devoxx UK 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-January-2026&color=red"></a>
- 12 mai 2026 : [Lead Innovation Day - Leadership Edition](https://leadinnovation.day/) - Paris (France) <a href="https://sessionize.com/lead-innovation-day-leadership-edition"><img alt="CFP Lead Innovation Day - Leadership Edition" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2026&color=red"></a>
- 12-13 mai 2026 : [Lyon Craft](https://lyon-craft.fr/) - Lyon (France) 
- 19 mai 2026 : [La Product Conf Paris 2026](https://www.laproductconf.com/paris/lpc) - Paris (France) <a href="https://sessionize.com/la-product-conf-paris-2026"><img alt="CFP La Product Conf Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-January-2026&color=red"></a>
- 19-20 mai 2026 : [Green Code Challenge](https://green-code-initiative.org/challenge) - Paris (France) 
- 21-22 mai 2026 : [Flupa UX Days 2026](https://www.uxdays.eu) - Paris (France) <a href="https://sessionize.com/flupa-ux-days-2025-appel-a-orateurric"><img alt="CFP Flupa UX Days 2026 – Appel à orateur·rices pour la 14ᵉ édition" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-March-2026&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Lille](https://event.afup.org/afup-day-2026/afup-day-2026-lille) - Lille (France) <a href="https://afup.org/event/afupday2026lille/cfp"><img alt="CFP AFUP Day Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Paris](https://event.afup.org/afup-day-2026/afup-day-2026-paris) - Paris (France) <a href="https://afup.org/event/afupday2026paris/cfp"><img alt="CFP AFUP Day Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Bordeaux](https://event.afup.org/afup-day-2026/afup-day-2026-bordeaux/) - Bordeaux (France) <a href="https://afup.org/event/afupday2026bordeaux/cfp"><img alt="CFP AFUP Day Bordeaux 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Lyon](https://event.afup.org/afup-day-2026/afup-day-2026-lyon) - Lyon (France) <a href="https://afup.org/event/afupday2026lyon/cfp"><img alt="CFP AFUP Day Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 27 mai 2026 : [aMP Day Strasbourg 2026](https://ampcommunity.online/amp-day-strasbourg-27-5-2026/) - Strasbourg (France) <a href="https://sessionize.com/ampday-strasbourg-2026"><img alt="CFP aMP Day Strasbourg 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-April-2026&color=red"></a>
- 28 mai 2026 : [DevCon 27 : I.A. & Vibe Coding](https://www.programmez.com) - Paris (France) <a href="https://forms.gle/27JdJx38nTNnJYT16"><img alt="CFP DevCon 27 : I.A. & Vibe Coding" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-April-2026&color=red"></a>
- 28 mai 2026 : [Cloud Toulouse 2026](https://cloudtoulouse.com/) - Toulouse (France) <a href="https://conference-hall.io/cloud-toulouse-2026"><img alt="CFP Cloud Toulouse 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-March-2026&color=red"></a>
- 29 mai 2026 : [NG Baguette Conf 2026](https://ngbaguette.angulardevs.fr/) - Paris (France) <a href="https://conference-hall.io/ng-baguette-conf-2026"><img alt="CFP NG Baguette Conf 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2026&color=red"></a>
- 29 mai 2026 : [Agile Tour Strasbourg 2026](https://agilestrasbourg.fr/) - Strasbourg (France) <a href="https://sessionize.com/agile-tour-strasbourg-2026"><img alt="CFP Agile Tour Strasbourg 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-April-2026&color=red"></a>
- 2-3 juin 2026 : [Agile Tour Rennes 2026](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2026/"><img alt="CFP Agile Tour Rennes 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-March-2026&color=red"></a>
- 2-3 juin 2026 : [OW2Con](https://www.ow2con.org/view/2026/) - Paris-Châtillon (France) <a href="https://pretalx.ow2.org/ow2con-2026/cfp"><img alt="CFP OW2 Con 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-February-2026&color=red"></a>
- 3 juin 2026 : [IA–NA](https://ia-na.fr) - La Rochelle (France) <a href="https://conference-hall.io/ia-na-2026"><img alt="CFP IA–NA" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-March-2026&color=red"></a>
- 4 juin 2026 : [Workplace Intelligence Days - 1ère édition](https://workintdays.com/) - Lyon (France) <a href="https://sessionize.com/workplace-intelligence-days-edition-1"><img alt="CFP Workplace Intelligence Days - 1ère édition" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-May-2026&color=green"></a>
- 5 juin 2026 : [TechReady](https://techready.live/) - Nantes (France) <a href="https://conference-hall.io/techready"><img alt="CFP TechReady" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-March-2026&color=red"></a>
- 5 juin 2026 : [Fork it! - Rouen](https://www.forkit.community/events/2026-france-rouen) - Rouen (France) <a href="https://conference-hall.io/fork-it-community-france-rouen-2026"><img alt="CFP React Norway 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-April-2026&color=red"></a>
- 6 juin 2026 : [Polycloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/polycloud-2026"><img alt="Polycloud 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-February-2026&color=red"></a>
- 9 juin 2026 : [JFTL](https://cftl.fr/actualites/jftl/) - Montrouge (France) <a href="https://easychair.org/account2/signin?l=6729252653728886957"><img alt="CFP JFTL" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-January-2026&color=red"></a>
- 9 juin 2026 : [C:\aen\Tech](https://caen.tech/) - Caen (France) <a href="https://conference-hall.io/caen-tech"><img alt="CFP Caen Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-April-2026&color=red"></a>
- 9 juin 2026 : [France API 2026](https://www.franceapi.fr/) - Paris (France) 
- 11-12 juin 2026 : [DevQuest Niort](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/devquest-2026"><img alt="CFP devquest niort" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-March-2026&color=red"></a>
- 11-12 juin 2026 : [DevLille 2026](https://devlille.fr/) - Lille (France) <a href="https://conference-hall.io/devlille-2026"><img alt="CFP DevLille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2026&color=red"></a>
- 12 juin 2026 : [Tech F'Est 2026](https://www.tech-fest.dev/) - Nancy (France) <a href="https://conference-hall.io/tech-fest-2026"><img alt="CFP Tech F'Est 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-February-2026&color=red"></a>
- 15 juin 2026 : [Jupyter Workshops: Demystifying MyST Markdown in Education](https://events.linuxfoundation.org/demystifying-myst-markdown/) - Orsay (France) 
- 16 juin 2026 : [Mobilis In Mobile 2026](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/mobilis-in-mobile-2026"><img alt="CFP Mobilis In Mobile 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-April-2026&color=red"></a>
- 17-19 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxx.pl/cfp"><img alt="CFP Devoxx Poland" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2026&color=red"></a>
- 17-20 juin 2026 : [VivaTech](https://vivatech.com) - Paris (France) 
- 18 juin 2026 : [Tech'Work](https://techwork.events) - Lyon (France) <a href="https://conference-hall.io/tech-work-lyon-2026"><img alt="CFP Tech'Work 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-March-2026&color=red"></a>
- 22-26 juin 2026 : [Galaxy Community Conference](https://galaxyproject.org/events/gcc2026/) - Clermont-Ferrand (France) 
- 23-24 juin 2026 : [MWCP 2026](https://ampcommunity.online/mwcp-2026) - Paris (France) <a href="https://sessionize.com/mwcp-2026"><img alt="CFP MWCP 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-April-2026&color=red"></a>
- 24-25 juin 2026 : [Agi'Lille 2026](https://agilille.fr) - Lille (France) <a href="https://sessionize.com/agilille-2026"><img alt="CFP Agi'Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-March-2026&color=red"></a>
- 24-26 juin 2026 : [BreizhCamp 2026](https://www.breizhcamp.org) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2026"><img alt="CFP BreizhCamp 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-March-2026&color=red"></a>
- 25-26 juin 2026 : [Agile Tour Toulouse 2026](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 27 juin 2026 : [Asynconf](https://asynconf.com/) - Paris (France) <a href="https://cfp.asynconf.com/"><img alt="CFP Asynconf" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2026&color=red"></a>
- 2 juillet 2026 : [Azur Tech Summer 2026](https://www.telecom-valley.fr/azurtechsummer/) - Valbonne (France) <a href="https://conference-hall.io/azur-tech-summer-2026"><img alt="CFP Azur Tech Summit 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-March-2026&color=red"></a>
- 2-3 juillet 2026 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2026"><img alt="CFP Sunny Tech 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2026&color=red"></a>
- 3 juillet 2026 : [Agile Lyon 2026](https://www.agilelyon.fr/) - Lyon (France) <a href="https://sessionize.com/agile-lyon-2026/"><img alt="CFP Agile Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-March-2026&color=red"></a>
- 6-8 juillet 2026 : [Riviera Dev](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/riviera-dev-2026"><img alt="CFP Riviera Dev" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-March-2026&color=red"></a>
- 28-30 août 2026 : [State of the Map](https://2026.stateofthemap.org/) - Champs-sur-Marne (France) 
- 4 septembre 2026 : [JUG Summer Camp 2026](https://www.jugsummercamp.org/) - La Rochelle (France) <a href="https://conference-hall.io/jug-summer-camp-2026"><img alt="CFP JUG Summer Camp 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2026&color=green"></a>
- 10-11 septembre 2026 : [Nantes Craft](https://www.nantes-craft.fr/) - Nantes (France) <a href="https://conference-hall.io/nantes-craft-2026"><img alt="CFP Nantes Craft" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-June-2026&color=green"></a>
- 17 septembre 2026 : [dotAI](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-April-2026&color=red"></a>
- 17-18 septembre 2026 : [API Platform Conference 2026](https://api-platform.com/fr/con/) - Lille (France) <a href="https://api-platform.com/fr/con/2026/call-for-papers/"><img alt="CFP API Platform Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-March-2026&color=red"></a>
- 18 septembre 2026 : [dotJS](https://www.dotjs.io/) - Paris (France) <a href="https://www.dotjs.io/speak"><img alt="CFP dotJS" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-April-2026&color=red"></a>
- 18 septembre 2026 : [WordCamp Bretagne](https://bretagne.wordcamp.org/2026/) - Rennes (France) 
- 22 septembre 2026 : [Salon Data 2026](https://salondata.fr) - Nantes (France) <a href="https://sessionize.com/salon-data-2026/"><img alt="CFP Salon Data 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-May-2026&color=green"></a>
- 22-23 septembre 2026 : [Agile en Seine & IA 2026](https://www.agileenseine.com/) - Paris (France) <a href="https://sessionize.com/agile-en-seine-2026"><img alt="CFP Agile en Seine & IA 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-June-2026&color=green"></a>
- 24 septembre 2026 : [OWASP AppSec Days France 2026](https://www.owaspappsecdays.fr/2026/) - Paris (France) <a href="https://sessionize.com/owasp-appsec-days-france-2026"><img alt="CFP OWASP AppSec Days France 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-May-2026&color=green"></a>
- 24 septembre 2026 : [PlatformCon Paris](https://platformconlive.fr/) - Paris (France) <a href="https://conference-hall.io/platformcon26-live-day-paris"><img alt="CFP PlatformCon Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2026&color=green"></a>
- 24 septembre 2026 : [React Native Connection 2026](https://reactnativeconnection.io/) - Paris (France) <a href="https://conference-hall.io/react-native-connection-2026"><img alt="CFP React Native Connection 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-June-2026&color=green"></a>
- 24-26 septembre 2026 : [Paris Web 2026](https://www.paris-web.fr) - Paris (France) <a href="https://appel.paris-web.fr/"><img alt="CFP Paris Web 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-April-2026&color=red"></a>  <img alt="Closed Captions" src="https://img.shields.io/static/v1?label=CC&message=Closed%20Captions&color=blue" />
- 28-29 septembre 2026 : [4th Tech Summit on AI & Robotics](https://artificialintelligence.averconferences.com/) - Paris (France) & Online <a href="https://artificialintelligence.averconferences.com/scientific_session.php"><img alt="CFP tech summit 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-March-2026&color=red"></a>
- 1 octobre 2026 : [WAX 2026](https://www.waxconf.fr/) - Marseille (France) <a href="https://conference-hall.io/wax-2026-conference-tech-au-stade-velodrome"><img alt="CFP WAX 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2026&color=red"></a>
- 1-2 octobre 2026 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) <a href="https://conference-hall.io/volcamp-2026"><img alt="CFP Volcamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2026&color=green"></a>
- 2 octobre 2026 : [DevFest Perros-Guirec 2026](https://devfest.codedarmor.fr/) - Perros-Guirec (France) <a href="https://conference-hall.io/devfest-perros-guirec-2026"><img alt="CFP DevFest Perros-Guirec 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2026&color=green"></a>
- 5-9 octobre 2026 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 12 octobre 2026 : [Dev With AI](https://www.devw.ai/) - Paris (France) 
- 27-29 octobre 2026 : [Directions EMEA 2026](https://www.directionsforpartners.com/emea2026) - Paris (France) <a href="https://sessionize.com/directions-emea-2026"><img alt="CFP Directions EMEA 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-September-2026&color=green"></a>
- 29-30 octobre 2026 : [BDX I/O 2026](https://bdxio.fr/) - Bordeaux (France) 
- 30 octobre 2026 : [Cloud Nord 2026](https://cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/cloud-nord-2026"><img alt="CFP Cloud Nord 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-June-2026&color=green"></a>
- 4-5 novembre 2026 : [Devoxx Morocco](https://devoxx.ma/) - Casablanca (Morocco) 
- 14-15 novembre 2026 : [Capitole du Libre](https://capitoledulibre.org) - Toulouse (France) <a href="https://cfp.capitoledulibre.org/cdl-2026/cfp"><img alt="CFP Capitole du Libre 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-July-2026&color=green"></a>
- 19 novembre 2026 : [DevFest Toulouse 2026](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse-2026"><img alt="CFP DevFest Toulouse 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2026&color=green"></a>
- 27 novembre 2026 : [DevFest Paris 2026](https://devfest.gdgparis.fr/) - Paris (France) <a href="https://conference-hall.io/devfest-paris-2026"><img alt="CFP DevFest Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-July-2026&color=green"></a>
- 1-3 décembre 2026 : [Apidays Paris](https://www.apidays.global/paris) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP Apidays Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2026&color=green"></a>
- 4 décembre 2026 : [DevFest Lyon 2026](https://devfest.gdglyon.com/) - Lyon (France) <a href="https://conference-hall.io/devfest-lyon-2026"><img alt="CFP DevFest Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2026&color=green"></a>
- 4 décembre 2026 : [DevFest Dijon 2026](https://devfest.developers-group-dijon.fr/) - Dijon (France) <a href="https://conference-hall.io/devfest-dijon-2026"><img alt="CFP DevFest Dijon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2026&color=green"></a>
- 9-10 décembre 2026 : [OpenSource Expérience](https://www.opensource-experience.com/) - Paris (France) <a href="https://pretalx.com/open-source-experience-2026/cfp"><img alt="CFP OpenSource Expérience" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-June-2026&color=green"></a>
- 9-10 décembre 2026 : [DevOps REX](https://www.devopsrex.fr/fr/) - Paris (France) <a href="https://www.devopsrex.fr/fr/cfp"><img alt="CFP DevOps REX" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-June-2026&color=green"></a>
- 10 décembre 2026 : [KCD Provence](https://cloudnative-provence.fr/) - Aix-en-Provence (France) 
- 7-9 avril 2027 : [Devoxx France 2027](https://www.devoxx.fr/) - Paris (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

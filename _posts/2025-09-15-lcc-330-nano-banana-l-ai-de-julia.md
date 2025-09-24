---
title: LCC 330 - Nano banana l'AI de Julia
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 330
youtube: TLlHwIXsUFA
mp3_length: 78410596
tweet: Nano banana l'AI de Julia #Java #Kotlin #Quarkus #IA #NanoBanana #SpringBoot #FrameworksAgentiques #MCP #Podman #OpenSource #SystèmesLegacy #LucJulia
# tweet size: 91-93 -> 99-101 #######################################################################
---
Katia, Emmanuel et Guillaume discutent Java, Kotlin, Quarkus, Hibernate, Spring Boot 4, intelligence artificielle (modèles Nano Banana, VO3, frameworks agentiques, embedding).
On discute les vulnérabilités OWASP pour les LLMs, les personnalités de codage des différents modèles, Podman vs Docker, comment moderniser des projets legacy.
Mais surtout on a passé du temps sur les présentations de Luc Julia et les différents contre points qui ont fait le buzz sur les réseaux.

Enregistré le 12 septembre 2025

Téléchargement de l’épisode [LesCastCodeurs-Episode-330.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-330.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=TLlHwIXsUFA).

## News


### Langages

Dans cette vidéo, José détaille les nouveautés de Java entre Java 21 et 25
[https://inside.java/2025/08/31/roadto25-java-language/](https://inside.java/2025/08/31/roadto25-java-language/)

- **Aperçu des nouveautés du JDK 25** : Introduction des nouvelles fonctionnalités du langage Java et des changements à venir [[00:02](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=2)].
- **Programmation orientée données et Pattern Matching** [[00:43](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=43)] :
  - Évolution du “pattern matching” pour la déconstruction des “records” [[01:22](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=82)].
  - Utilisation des “sealed types” dans les expressions `switch` pour améliorer la lisibilité et la robustesse du code [[01:47](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=107)].
  - Introduction des “unnamed patterns” (`_`) pour indiquer qu’une variable n’est pas utilisée [[04:47](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=287)].
  - Support des types primitifs dans `instanceof` et `switch` (en preview) [[14:02](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=842)].
- **Conception d’applications Java** [[00:52](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=52)] :
  - Simplification de la méthode `main` [[21:31](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=1291)].
  - Exécution directe des fichiers `.java` sans compilation explicite [[22:46](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=1366)].
  - Amélioration des mécanismes d’importation [[23:41](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=1421)].
  - Utilisation de la syntaxe Markdown dans la Javadoc [[27:46](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=1666)].
- **Immuabilité et valeurs nulles** [[01:08](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=68)] :
  - Problème d’observation de champs `final` à `null` pendant la construction d’un objet [[28:44](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=1724)].
  - JEP 513 pour contrôler l’appel à `super()` et restreindre l’usage de `this` dans les constructeurs [[33:29](http://www.youtube.com/watch?v=X0-TGhktFnE&amp;t=2009)].

JDK 25 sort le 16 septembre
[https://openjdk.org/projects/jdk/25/](https://openjdk.org/projects/jdk/25/)

- Scoped Values (JEP 505) : Alternative plus efficace aux ThreadLocal pour partager des données immutables entre threads.
- Structured Concurrency (JEP 506) : Traiter des groupes de tâches concurrentes comme une seule unité de travail, simplifiant la gestion des threads.
- Compact Object Headers (JEP 519) : Fonctionnalité finale qui réduit de 50% la taille des en-têtes d’objets (de 128 à 64 bits), économisant jusqu’à 22% de mémoire heap.
- Flexible Constructor Bodies (JEP 513) : Relaxation des restrictions sur les constructeurs, permettant du code avant l’appel `super()` ou `this()`.
- Module Import Declarations (JEP 511) : Import simplifié permettant d’importer tous les éléments publics d’un module en une seule déclaration.
- Compact Source Files (JEP 512) : Simplification des programmes Java basiques avec des méthodes main d’instance sans classe wrapper obligatoire.
- Primitive Types in Patterns (JEP 455) : Troisième preview étendant le pattern matching et instanceof aux types primitifs dans `switch` et `instanceof`.
- Generational Shenandoah (JEP 521) : Le garbage collector Shenandoah passe en mode générationnel pour de meilleures performances.
- JFR Method Timing &amp; Tracing (JEP 520) : Nouvel outillage de profilage pour mesurer le temps d’exécution et tracer les appels de méthodes.
- Key Derivation API (JEP 510) : API finale pour les fonctions de dérivation de clés cryptographiques, remplaçant les implémentations tierces.

Améliorations du traitement des annotations dans Kotlin 2.2
[https://blog.jetbrains.com/idea/2025/09/improved-annotation-handling-in-kotlin-2-2-less-boilerplate-fewer-surprises/](https://blog.jetbrains.com/idea/2025/09/improved-annotation-handling-in-kotlin-2-2-less-boilerplate-fewer-surprises/)

- Avant Kotlin 2.2, les annotations sur les paramètres de constructeur n’étaient appliquées qu’au paramètre, pas à la propriété ou au champ.
- Cela causait des bugs subtils avec Spring et JPA où la validation ne fonctionnait qu’à la création d’objet, pas lors des mises à jour.
- La solution précédente nécessitait d’utiliser explicitement `@field` pour chaque annotation, créant du code verbeux.
- Kotlin 2.2 introduit un nouveau comportement par défaut qui applique les annotations aux paramètres ET aux propriétés/champs automatiquement.
- Le code devient plus propre sans avoir besoin de syntaxe `@field` répétitive.
- Pour l’activer, ajouter `-Xannotation-default-target=param-property` dans les options du compilateur Gradle.
- IntelliJ IDEA propose un quick-fix pour activer ce comportement à l’échelle du projet.
- Cette amélioration rend l’intégration Kotlin plus fluide avec les frameworks majeurs comme Spring et JPA.
- Le comportement peut être configuré pour garder l’ancien mode ou activer un mode transitoire avec avertissements.
- Cette mise à jour fait partie d’une initiative plus large pour améliorer l’expérience Kotlin + Spring.


### Librairies

Sortie de Quarkus 3.26 avec mises à jour d'Hibernate et autres fonctionnalités
[https://quarkus.io/blog/quarkus-3-26-released/](https://quarkus.io/blog/quarkus-3-26-released/)

- Mettez à jour vers la 3.26.x, car il y a eu une regression vert.x.
- Jalon important vers la version LTS 3.27 prévue fin septembre, basée sur cette version.
- Mise à jour vers Hibernate ORM 7.1, Hibernate Search 8.1 et Hibernate Reactive 3.1.
- Support des unités de persistance nommées et sources de données dans Hibernate Reactive.
- Démarrage hors ligne et configuration de dialecte pour Hibernate ORM même si la base n'est pas accessible.
- Refonte de la console HQL dans Dev UI avec fonctionnalité Hibernate Assistant intégrée.
- Exposition des capacités Dev UI comme fonctions MCP pour pilotage via outils IA.
- Rafraîchissement automatique des tokens OIDC en cas de réponse 401 des clients REST.
- Extension JFR pour capturer les données runtime (nom app, version, extensions actives).
- Bump de Gradle vers la version 9.0 par défaut, suppression du support des classes config legacy.

Guide de démarrage avec Quarkus et A2A Java SDK 0.3.0
(pour faire discuter des agents IA avec la dernière version du protocole A2A)
[https://quarkus.io/blog/quarkus-a2a-java-0-3-0-alpha-release/](https://quarkus.io/blog/quarkus-a2a-java-0-3-0-alpha-release/)

- Sortie de l’A2A Java SDK 0.3.0.Alpha1, aligné avec la spécification A2A v0.3.0.
- **Protocole A2A** : standard ouvert (Linux Foundation), permet la communication inter-agents IA polyglottes. Version 0.3.0 plus stable, introduit le support gRPC.
- **Mises à jour générales** : changements significatifs, expérience utilisateur améliorée (côté client et serveur).
- **Agents serveur A2A** :
  - Support gRPC ajouté (en plus de JSON-RPC). HTTP+JSON/REST à venir.
  - Implémentations basées sur Quarkus (alternatives Jakarta existent).
  - Dépendances spécifiques pour chaque transport (ex : `a2a-java-sdk-reference-jsonrpc`, `a2a-java-sdk-reference-grpc`).
  - **AgentCard** : décrit les capacités de l’agent. Doit spécifier le point d’accès primaire et tous les transports supportés (`additionalInterfaces`).
- **Clients A2A** :
  - Dépendance principale : `a2a-java-sdk-client`.
  - Support gRPC ajouté (en plus de JSON-RPC). HTTP+JSON/REST à venir.
  - Dépendance spécifique pour gRPC : `a2a-java-sdk-client-transport-grpc`.
  - **Création de client** : via `ClientBuilder`. Sélectionne automatiquement le transport selon l’AgentCard et la configuration client. Permet de spécifier les transports supportés par le client (`withTransport`).

Comment générer et éditer des images en Java avec Nano Banana, le “photoshop killer” de Google
[https://glaforge.dev/posts/2025/09/09/calling-nano-banana-from-java/](https://glaforge.dev/posts/2025/09/09/calling-nano-banana-from-java/)

- **Objectif :** Intégrer le modèle Nano Banana (Gemini 2.5 Flash Image preview) dans des applications Java.
- **SDK utilisé :** GenAI Java SDK de Google.
- **Compatibilité :** Supporté par ADK for Java ; pas encore par LangChain4j (limitation de multimodalité de sortie).
- **Capacités de Nano Banana :**
  - Créer de nouvelles images.
  - Modifier des images existantes.
  - Assembler plusieurs images.
- **Mise en œuvre Java :**
  - Quelle dépendance utiliser
  - Comment s’authentifier
  - Comment configurer le modèle
- **Nature du modèle :** Nano Banana est un modèle de chat qui peut retourner du texte et une image (pas simplement juste un modèle générateur d’image)
- **Exemples d’utilisation :**
  - **Création :** Via un simple prompt textuel.
  - **Modification :** En passant l’image existante (tableau de bytes) et les instructions de modification (prompt).
  - **Assemblage :** En passant plusieurs images (en bytes) et les instructions d’intégration (prompt).
- **Message clé :** Toutes ces fonctionnalités sont accessibles en Java, sans nécessiter Python.

Générer des vidéos IA avec le modèle Veo 3, mais en Java !
[https://glaforge.dev/posts/2025/09/10/generating-videos-in-java-with-veo3/](https://glaforge.dev/posts/2025/09/10/generating-videos-in-java-with-veo3/)

- Génération de vidéos en Java avec Veo 3 (via le GenAI Java SDK de Google).
- **Veo 3:** Annoncé comme GA, prix réduits, support du format 9:16, résolution jusqu’à 1080p.
- **Création de vidéos :**
  - À partir d’une invite textuelle (prompt).
  - À partir d’une image existante.
- **Deux versions différentes du modèle :**
  - `veo-3.0-generate-001` (qualité supérieure, plus coûteux, plus lent).
  - `veo-3.0-fast-generate-001` (qualité inférieure, moins coûteux, mais plus rapide).

Rod Johnson sur ecrire des applications agentic en Java plus facilement qu’en python avec Embabel
[https://medium.com/@springrod/you-can-build-better-ai-agents-in-java-than-python-868eaf008493](https://medium.com/@springrod/you-can-build-better-ai-agents-in-java-than-python-868eaf008493)

- Rod the papa de Spring réécrit un exemple CrewAI (Python) qui génère un livre en utilisant Embabel (Java) pour démontrer la supériorité de Java.
- L’application utilise plusieurs agents AI spécialisés : un chercheur, un planificateur de livre et des rédacteurs de chapitres.
- Le processus suit trois étapes : recherche du sujet, création du plan, rédaction parallèle des chapitres puis assemblage.
- CrewAI souffre de plusieurs problèmes : configuration lourde, manque de type safety, utilisation de clés magiques dans les prompts.
- La version Embabel nécessite moins de code Java que l’original Python et moins de fichiers de configuration YAML.
- Embabel apporte la type safety complète, éliminant les erreurs de frappe dans les prompts et améliorant l’outillage IDE.
- La gestion de la concurrence est mieux contrôlée en Java pour éviter les limites de débit des APIs LLM.
- L’intégration avec Spring permet une configuration externe simple des modèles LLM et hyperparamètres.
- Le planificateur Embabel détermine automatiquement l’ordre d’exécution des actions basé sur leurs types requis.
- L’argument principal : l’écosystème JVM offre un meilleur modèle de programmation et accès à la logique métier existante que Python.
- Il y a pas mal de nouveaux frameworks agentic en Java, notamment le dernier Langchain4j Agentic.

Spring lance un serie de blog posts sur les nouveautés de Spring Boot 4
[https://spring.io/blog/2025/09/02/road_to_ga_introduction](https://spring.io/blog/2025/09/02/road_to_ga_introduction)

- Baseline JDK 17.
- Mais rebase sur Jakarta 11.
- Kotlin 2, Jackson 3 et JUnit 6.
- Fonctionnalités de résilience principales de Spring : `@ConcurrencyLimit`, `@Retryable`, `RetryTemplate`.
- Versioning d’API dans Spring.
- Améliorations du client de service HTTP.
- L’état des clients HTTP dans Spring.
- Introduction du support Jackson 3 dans Spring.
- Consommateur partagé : les queues Kafka dans Spring Kafka.
- Modularisation de Spring Boot.
- Autorisation progressive dans Spring Security.
- Spring gRPC - un nouveau module Spring Boot.
- Applications null-safe avec Spring Boot 4.
- OpenTelemetry avec Spring Boot.
- Repos Ahead of Time (Partie 2).

### Web

Faire de la recherche sémantique directement dans le navigateur en local, avec EmbeddingGemma et Transformers.js
[https://glaforge.dev/posts/2025/09/08/in-browser-semantic-search-with-embeddinggemma/](https://glaforge.dev/posts/2025/09/08/in-browser-semantic-search-with-embeddinggemma/)

- **EmbeddingGemma** : Nouveau modèle d’embedding (308M paramètres) de Google DeepMind.
- **Objectif** : Permettre la recherche sémantique directement dans le navigateur.
- **Avantages clés de l’IA côté client** : 
  - **Confidentialité** : Aucune donnée envoyée à un serveur.
  - **Coûts réduits** : Pas besoin de serveurs coûteux (GPU), hébergement statique.
  - **Faible latence** : Traitement instantané sans allers-retours réseau.
  - **Fonctionnement hors ligne** : Possible après le chargement initial du modèle.
- **Technologie principale** : 
  - **Modèle** : EmbeddingGemma (petit, performant, multilingue, support MRL pour réduire la taille des vecteurs).
  - **Moteur d’inférence** : Transformers.js de HuggingFace (exécute les modèles AI en JavaScript dans le navigateur).
- **Déploiement** : Site statique avec Vite/React/Tailwind CSS, déployé sur Firebase Hosting via GitHub Actions.
- **Gestion du modèle** : Fichiers du modèle trop lourds pour Git; téléchargés depuis HuggingFace Hub pendant le CI/CD.
- **Fonctionnement de l’app** : Charge le modèle, génère des embeddings pour requêtes/documents, calcule la similarité sémantique.
- **Conclusion** : Démonstration d’une recherche sémantique privée, économique et sans serveur, soulignant le potentiel de l’IA embarquée dans le navigateur.


### Data et Intelligence Artificielle

Docker lance `cagent`
[https://github.com/docker/cagent](https://github.com/docker/cagent)

- Une sorte de framework multi-agent IA utilisant des LLMs externes, des modèles de Docker Model Runner, avec le Docker MCP Toolkit.
- Il propose un format YAML pour décrire les agents d’un système multi-agents.
- Des agents “prompt driven” (pas de code).
- Et une structure pour décrire comment ils sont déployés.
- Pas clair comment ils sont appelés à part dans la ligne de commande de `cagent`.
- Fait par David Gageot. 

L'OWASP décrit l'independance excessive des LLM comme une vulnérabilité
[https://genai.owasp.org/llmrisk2023-24/llm08-excessive-agency/](https://genai.owasp.org/llmrisk2023-24/llm08-excessive-agency/)

- L'agence excessive désigne la vulnérabilité qui permet aux systèmes LLM d'effectuer des actions dommageables via des sorties inattendues ou ambiguës.
- Elle résulte de trois causes principales : fonctionnalités excessives, permissions excessives ou autonomie excessive des agents LLM.
- Les fonctionnalités excessives incluent l'accès à des plugins qui offrent plus de capacités que nécessaire, comme un plugin de lecture qui peut aussi modifier ou supprimer.
- Les permissions excessives se manifestent quand un plugin accède aux systèmes avec des droits trop élevés, par exemple un accès en lecture qui inclut aussi l'écriture.
- L'autonomie excessive survient quand le système effectue des actions critiques sans validation humaine préalable.
- Un scénario d'attaque typique : un assistant personnel avec accès email peut être manipulé par injection de prompt pour envoyer du spam via la boîte de l'utilisateur.
- La prévention implique de limiter strictement les plugins aux fonctions minimales nécessaires pour l'opération prévue.
- Il faut éviter les fonctions ouvertes comme "exécuter une commande shell" au profit d'outils plus granulaires et spécifiques.
- L'application du principe de moindre privilège est cruciale : chaque plugin doit avoir uniquement les permissions minimales requises.
- Le contrôle humain dans la boucle reste essentiel pour valider les actions à fort impact avant leur exécution.

Lancement du MCP registry, une sorte de méta-annuaire officiel pour référencer les serveurs MCP
[https://www.marktechpost.com/2025/09/09/mcp-team-launches-the-preview-version-of-the-mcp-registry-a-federated-discovery-layer-for-enterprise-ai/](https://www.marktechpost.com/2025/09/09/mcp-team-launches-the-preview-version-of-the-mcp-registry-a-federated-discovery-layer-for-enterprise-ai/)

- **MCP Registry ** : Couche de découverte fédérée pour l’IA d’entreprise.
- Fonctionne comme le **DNS pour le contexte de l’IA**, permettant la découverte de serveurs MCP publics ou privés.
- **Modèle fédéré** : Évite les risques de sécurité et de conformité d’un registre monolithique.
- Permet des **sous-registres privés** tout en conservant une source de vérité “upstream”.
- **Avantages pour les entreprises** :
  - Découverte interne sécurisée.
  - Gouvernance centralisée des serveurs externes.
  - Réduction de la prolifération des contextes.
  - Support pour les agents IA hybrides (données privées/publiques).
- Projet **open source**, actuellement en **version preview**.
- Blog post officiel : [https://blog.modelcontextprotocol.io/posts/2025-09-08-mcp-registry-preview/](https://blog.modelcontextprotocol.io/posts/2025-09-08-mcp-registry-preview/)

Exploration des internals du transaction log SQL Server
[https://debezium.io/blog/2025/09/08/sqlserver-tx-log/](https://debezium.io/blog/2025/09/08/sqlserver-tx-log/)

- C'est un article pour les rageux qui veulent savoir comment SQLServer marche à l'interieur.
- Debezium utilise actuellement les change tables de SQL Server CDC en polling périodique.
- L'article explore la possibilité de parser directement le transaction log pour améliorer les performances.
- Le transaction log est divisé en Virtual Log Files (VLFs) utilisés de manière circulaire.
- Chaque VLF contient des blocs (512B à 60KB) qui contiennent les records de transactions.
- Chaque record a un Log Sequence Number (LSN) unique pour l'identifier précisément.
- Les données sont stockées dans des pages de 8KB avec header de 96 bytes et offset array.
- Les tables sont organisées en partitions et allocation units pour gérer l'espace disque.
- L'utilitaire DBCC permet d'explorer la structure interne des pages et leur contenu.
- Cette compréhension pose les bases pour parser programmatiquement le transaction log dans un prochain article.


### Outillage

Les personnalités des codeurs des différents LLMs
[https://www.sonarsource.com/blog/the-coding-personalities-of-leading-llms-gpt-5-update/](https://www.sonarsource.com/blog/the-coding-personalities-of-leading-llms-gpt-5-update/)

- GPT-5 minimal ne détrône pas Claude Sonnet 4 comme leader en performance fonctionnelle malgré ses 75% de réussite.
- GPT-5 génère un code extrêmement verbeux avec 490 000 lignes contre 370 000 pour Claude Sonnet 4 sur les mêmes tâches.
- La complexité cyclomatique et cognitive du code GPT-5 est dramatiquement plus élevée que tous les autres modèles.
- GPT-5 introduit 3,90 problèmes par tâche réussie contre seulement 2,11 pour Claude Sonnet 4.
- Point fort de GPT-5 : sécurité exceptionnelle avec seulement 0,12 vulnérabilité par 1000 lignes de code.
- Faiblesse majeure : densité très élevée de “code smells” (25,28 par 1000 lignes) nuisant à la maintenabilité.
- GPT-5 produit 12% de problèmes liés à la complexité cognitive, le taux le plus élevé de tous les modèles.
- Tendance aux erreurs logiques fondamentales avec 24% de bugs de type “Control-flow mistake”.
- Réapparition de vulnérabilités classiques comme les failles d’injection et de traversée de chemin.
- Nécessité d’une gouvernance renforcée avec analyse statique obligatoire pour gérer la complexité du code généré.

Pourquoi j’ai abandonné Docker pour Podman
[https://codesmash.dev/why-i-ditched-docker-for-podman-and-you-should-too](https://codesmash.dev/why-i-ditched-docker-for-podman-and-you-should-too)

- **Problème Docker** : Le daemon `dockerd` persistant s’exécute avec des privilèges root, posant des risques de sécurité (nombreuses CVEs citées) et consommant des ressources inutilement.
- **Solution Podman** : 
  - **Sans Daemon** : Pas de processus d’arrière-plan persistant. Les conteneurs s’exécutent comme des processus enfants de la commande Podman, sous les privilèges de l’utilisateur.
  - **Sécurité Renforcée** : Réduction de la surface d’attaque. Une évasion de conteneur compromet un utilisateur non privilégié sur l’hôte, pas le système entier. Mode `rootless`.
  - **Fiabilité Accrue** : Pas de point de défaillance unique ; le crash d’un conteneur n’affecte pas les autres.
  - **Moins de Ressources** : Pas de daemon constamment actif, donc moins de mémoire et de CPU.
- **Fonctionnalités Clés de Podman** : 
  - **Intégration Systemd** : Génération automatique de fichiers d’unité `systemd` pour gérer les conteneurs comme des services Linux standards.
  - **Alignement Kubernetes** : Support natif des pods et capacité à générer des fichiers `Kubernetes YAML` directement (`podman generate kube`), facilitant le développement local pour K8s.
  - **Philosophie Unix** : Se concentre sur l’exécution des conteneurs, délègue les tâches spécialisées à des outils dédiés (ex : Buildah pour la construction d’images, Skopeo pour leur gestion).
- **Migration Facile** : 
  - CLI compatible Docker : `podman` utilise les mêmes commandes que `docker` (`alias docker=podman` fonctionne).
  - Les Dockerfiles existants sont directement utilisables.
  - **Améliorations incluses** : Sécurité par défaut (ports privilégiés en mode rootless), meilleure gestion des permissions de volume, API Docker compatible optionnelle.
  - Option de convertir Docker Compose en Kubernetes YAML.
- **Bénéfices en Production** : Sécurité améliorée, utilisation plus propre des ressources. Podman représente une évolution plus sécurisée et mieux alignée avec les pratiques modernes de gestion Linux et de déploiement de conteneurs.
- **Guide Pratique (Exemple FastAPI)** : 
  - Le `Dockerfile` ne change pas.
  - `podman build` et `podman run` remplacent directement les commandes Docker.
  - Déploiement en production via Systemd.
  - Gestion d’applications multi-services avec les “pods” Podman.
  - Compatibilité Docker Compose via `podman-compose` ou `kompose`.

Détection améliorée des APIs vulnérables dans les IDEs JetBrains et Qodana
[https://blog.jetbrains.com/idea/2025/09/enhanced-vulnerable-api-detection-in-jetbrains-ides-and-qodana/](https://blog.jetbrains.com/idea/2025/09/enhanced-vulnerable-api-detection-in-jetbrains-ides-and-qodana/)

- JetBrains s’associe avec [Mend.io](http://Mend.io) pour renforcer la sécurité du code dans leurs outils.
- Le plugin Package Checker bénéficie de nouvelles données enrichies sur les APIs vulnérables.
- Analyse des graphes d’appels pour couvrir plus de méthodes publiques des bibliothèques open-source.
- Support de Java, Kotlin, C#, JavaScript, TypeScript et Python pour la détection de vulnérabilités.
- Activation des inspections via Paramètres > Editor > Inspections en recherchant “Vulnerable API”.
- Surlignage automatique des méthodes vulnérables avec détails des failles au survol.
- Action contextuelle pour naviguer directement vers la déclaration de dépendance problématique.
- Mise à jour automatique vers une version non affectée via Alt+Enter sur la dépendance.
- Fenêtre dédiée “Vulnerable Dependencies” pour voir l’état global des vulnérabilités du projet.



### Méthodologies

Le retour de du sondage de Stack Overflow sur l'usage de l'IA dans le code
[https://medium.com/@amareshadak/stack-overflow-just-exposed-the-ugly-truth-about-ai-coding-tools-b4f7b5992191](https://medium.com/@amareshadak/stack-overflow-just-exposed-the-ugly-truth-about-ai-coding-tools-b4f7b5992191)

- 84% des développeurs utilisent l'IA quotidiennement, mais 46% ne font pas confiance aux résultats. Seulement 3,1% font "hautement confiance" au code généré.
- 66% sont frustrés par les solutions IA "presque correctes". 45% disent que déboguer le code IA prend plus de temps que l'écrire soi-même.
- Les développeurs seniors (10+ ans) font moins confiance à l'IA (2,6%) que les débutants (6,1%), créant un écart de connaissances dangereux.
- Les pays occidentaux montrent moins de confiance - Allemagne (22%), UK (23%), USA (28%) - que l'Inde (56%). Les créateurs d'outils IA leur font moins confiance.
- 77% des développeurs professionnels rejettent la programmation en langage naturel, seuls 12% l'utilisent réellement.
- Quand l'IA échoue, 75% se tournent vers les humains. 35% des visites Stack Overflow concernent maintenant des problèmes liés à l'IA.
- 69% rapportent des gains de productivité personnels, mais seulement 17% voient une amélioration de la collaboration d'équipe.
- Coûts cachés : temps de vérification, explication du code IA aux équipes, refactorisation et charge cognitive constante.
- Les plateformes humaines dominent encore : Stack Overflow (84%), GitHub (67%), YouTube (61%) pour résoudre les problèmes IA.
- L'avenir suggère un "développement augmenté" où l'IA devient un outil parmi d'autres, nécessitant transparence et gestion de l'incertitude.

Mentorat open source et défis communautaires par les gens de Microcks
[https://microcks.io/blog/beyond-code-open-source-mentorship/](https://microcks.io/blog/beyond-code-open-source-mentorship/)

- Microcks souffre du syndrome des "utilisateurs silencieux" qui bénéficient du projet sans contribuer.
- Malgré des milliers de téléchargements et une adoption croissante, l'engagement communautaire reste faible.
- Ce manque d'interaction crée des défis de durabilité et limite l'innovation du projet.
- Les mainteneurs développent dans le vide sans feedback des vrais utilisateurs.
- Contribuer ne nécessite pas de coder : documentation, partage d'expérience, signalement de bugs suffisent.
- Parler du project qu'on aime autour de soi est aussi super utile.
- Microcks a aussi des questions specifiques qu'ils ont posé dans le blog, donc si vous l'utilisez, aller voir.
- Le succès de l'open source dépend de la transformation des utilisateurs en véritables partenaires communautaires.
- C'est un point assez commun je trouve, le ratio parlant / silencieux est tres petit et cela encourage les quelques grandes gueules.

La modernisation du systemes legacy, c’est pas que de la tech [https://blog.scottlogic.com/2025/08/27/holistic-approach-successful-legacy-modernisation.html](https://blog.scottlogic.com/2025/08/27/holistic-approach-successful-legacy-modernisation.html)

- Un article qui prend du recul sur la modernisation de systemes legacy.
- Les projets de modernisation legacy nécessitent une vision holistique au-delà du simple focus technologique.
- Les drivers business diffèrent des projets greenfield : réduction des coûts et mitigation des risques plutôt que génération de revenus.
- L’état actuel est plus complexe à cartographier avec de nombreuses dépendances et risques de rupture.
- Collaboration essentielle entre Architectes, Analystes Business et Designers UX dès la phase de découverte.
- Approche tridimensionnelle obligatoire : Personnes, Processus et Technologie (comme un jeu d’échecs 3D).
- Le leadership doit créer l’espace nécessaire pour la découverte et la planification plutôt que presser l’équipe.
- Communication en termes business plutôt que techniques vers tous les niveaux de l’organisation.
- Planification préalable essentielle contrairement aux idées reçues sur l’agilité.
- Séquencement optimal souvent non-évident et nécessitant une analyse approfondie des interdépendances.
- Phases projet alignées sur les résultats business permettent l’agilité au sein de chaque phase.


### Sécurité

Cyber Attaque su Musée Histoire Naturelle
[https://www.franceinfo.fr/internet/securite-sur-internet/cyberattaques/le-museum-national-d-histoire-naturelle-de-paris-victime-d-une-cyberattaque-severe-une-plainte-deposee_7430356.html](https://www.franceinfo.fr/internet/securite-sur-internet/cyberattaques/le-museum-national-d-histoire-naturelle-de-paris-victime-d-une-cyberattaque-severe-une-plainte-deposee_7430356.html)


Compromission massive de packages npm populaires par un malware crypto
[https://www.aikido.dev/blog/npm-debug-and-chalk-packages-compromised](https://www.aikido.dev/blog/npm-debug-and-chalk-packages-compromised)

- 18 packages npm très populaires compromis le 8 septembre 2025, incluant chalk, debug, ansi-styles avec plus de 2 milliards de téléchargements hebdomadaires combinés.
- duckdb s'est rajouté à la liste.
- Code malveillant injecté qui intercepte silencieusement l'activité crypto et web3 dans les navigateurs des utilisateurs.
- Le malware manipule les interactions de wallet et redirige les paiements vers des comptes contrôlés par l'attaquant sans signes évidents.
- Injection dans les fonctions critiques comme fetch, XMLHttpRequest et APIs de wallets (window.ethereum, Solana) pour intercepter le trafic.
- Détection et remplacement automatique des adresses crypto sur multiple blockchains (Ethereum, Bitcoin, Solana, Tron, Litecoin, Bitcoin Cash).
- Les transactions sont modifiées en arrière-plan même si l'interface utilisateur semble correcte et légitime.
- Utilise des adresses "sosies" via correspondance de chaînes pour rendre les échanges moins évidents à détecter.
- Le mainteneur compromis par email de phishing provenant du faux domaine "<mailto:support@npmjs.help|support@npmjs.help>" enregistré trois jours avant l'attaque.
- sur une demande de mise à jour de son authentication à deux facteurs après un an.
- Aikido a alerté le mainteneur via Bluesky qui a confirmé la compromission et commencé le nettoyage des packages.
- Attaque sophistiquée opérant à plusieurs niveaux : contenu web, appels API et manipulation des signatures de transactions.

Les anti-cheats de jeux vidéo : une faille de sécurité majeure ?
[https://tferdinand.net/jeux-video-et-si-votre-anti-cheat-etait-la-plus-grosse-faille/](https://tferdinand.net/jeux-video-et-si-votre-anti-cheat-etait-la-plus-grosse-faille/)

- Les anti-cheats modernes s’installent au Ring 0 (noyau système) avec privilèges maximaux.
- Ils obtiennent le même niveau d’accès que les antivirus professionnels mais sans audit ni certification.
- Certains exploitent Secure Boot pour se charger avant le système d’exploitation.
- Risque de supply chain : le groupe APT41 a déjà compromis des jeux comme League of Legends.
- Un attaquant infiltré pourrait désactiver les solutions de sécurité et rester invisible.
- Menace de stabilité : une erreur peut empêcher le démarrage du système (référence CrowdStrike).
- Conflits possibles entre différents anti-cheats qui se bloquent mutuellement.
- Surveillance en temps réel des données d’utilisation sous prétexte anti-triche.
- Dérive dangereuse selon l’auteur : des entreprises de jeux accèdent au niveau EDR.
- Alternatives limitées : cloud gaming ou sandboxing avec impact sur performances.
- Donc faites gaffe aux jeux que vos gamins installent !


### Loi, société et organisation

Luc Julia au Sénat - Monsieur Phi réagi et publie la vidéo **Luc Julia au Sénat : autopsie d'un grand N'IMPORTE QUOI**
[https://www.youtube.com/watch?v=e5kDHL-nnh4](https://www.youtube.com/watch?v=e5kDHL-nnh4)

- En format podcast de 20 minutes, sorti au même moment et à propos de sa conf à Devoxx [https://www.youtube.com/watch?v=Q0gvaIZz1dM](https://www.youtube.com/watch?v=Q0gvaIZz1dM).
- Le lab IA - Jérôme Fortias - Et si Luc Julia avait raison   [https://www.youtube.com/watch?v=KScI5PkCIaE](https://www.youtube.com/watch?v=KScI5PkCIaE).
- Luc Julia au Senat [https://www.youtube.com/watch?v=UjBZaKcTeIY](https://www.youtube.com/watch?v=UjBZaKcTeIY).
- Luc Julia se défend [https://www.youtube.com/watch?v=DZmxa7jJ8sI](https://www.youtube.com/watch?v=DZmxa7jJ8sI).
- Intelligence artificielle : catastrophe imminente ? - Luc Julia vs Maxime Fournes [https://www.youtube.com/watch?v=sCNqGt7yIjo](https://www.youtube.com/watch?v=sCNqGt7yIjo).
- Tech and Co Monsieur Phi vs Luc Julia (put a click) [https://www.youtube.com/watch?v=xKeFsOceT44](https://www.youtube.com/watch?v=xKeFsOceT44).
- La tronche en biais [https://www.youtube.com/live/zFwLAOgY0Wc](https://www.youtube.com/live/zFwLAOgY0Wc).

## Conférences

La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 12 septembre 2025 : [Agile Pays Basque 2025](https://agile-paysbasque.fr/) - Bidart (France) <a href="https://conference-hall.io/agile-pays-basque-2025"><img alt="CFP Agile Pays Basque 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-May-2025&color=red"></a>
- 15 septembre 2025 : [Agile Tour Montpellier](https://agiletourmontpellier.fr/) - Montpellier (France) 
- 18-19 septembre 2025 : [API Platform Conference](https://api-platform.com/con/2025/) - Lille (France) & Online <a href="https://conference-hall.io/api-platform-conference-2025-lille-and-online"><img alt="CFP API Platform Conference 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-March-2025&color=red"></a>
- 22-24 septembre 2025 : [Kernel Recipes](https://kernel-recipes.org/en/2025/) - Paris (France) 
- 22-27 septembre 2025 : [La Mélée Numérique](https://www.meleenumerique.com/) - Toulouse (France) 
- 23 septembre 2025 : [OWASP AppSec France 2025](https://www.owaspappsecdays.fr/2025/) - Paris (France) <a href="https://sessionize.com/owasp-appsec-days-france-2025/"><img alt="CFP OWASP AppSec France" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=red"></a>
- 23-24 septembre 2025 : [AI Engineer Paris](https://www.ai.engineer/paris) - Paris (France) <a href="https://sessionize.com/ai-engineer-paris/"><img alt="CFP AI Engineer Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-August-2025&color=red"></a>
- 25 septembre 2025 : [Agile Game Toulouse](https://www.billetweb.fr/agile-game-toulouse-2025) - Toulouse (France) 
- 25-26 septembre 2025 : [Paris Web 2025](https://www.paris-web.fr) - Paris (France) <a href="https://appel.paris-web.fr/"><img alt="CFP Paris Web 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-March-2025&color=red"></a>
- 30 septembre 2025-1 octobre 2025 : [PyData Paris 2025](https://pydata.org/paris2025) - Paris (France) 
- 2 octobre 2025 : [Nantes Craft](https://www.nantes-craft.fr) - Nantes (France) 
- 2-3 octobre 2025 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) <a href="https://conference-hall.io/volcamp-2025"><img alt="CFP Volcamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2025&color=red"></a>
- 3 octobre 2025 : [DevFest Perros-Guirec 2025](https://devfest.codedarmor.fr/) - Perros-Guirec (France) <a href="https://conference-hall.io/devfest-perros-guirec-2025"><img alt="CFP DevFest Perros Guirec 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2025&color=red"></a>
- 6-7 octobre 2025 : [Swift Connection 2025](https://swiftconnection.io) - Paris (France) <a href="https://sessionize.com/swift-connection-2025/"><img alt="CFP Swift Connection 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2025&color=red"></a>
- 6-10 octobre 2025 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) <a href="https://dvbe25.cfp.dev/"><img alt="CFP Devoxx Belgium 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-July-2025&color=red"></a>
- 7 octobre 2025 : [BSides Mulhouse](https://bsides-mulhouse.fr) - Mulhouse (France) <a href="https://conference-hall.io/bsides-mulhouse-2025"><img alt="CFP BSides Mulhouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-June-2025&color=red"></a>
- 7-8 octobre 2025 : [Agile en Seine](https://www.agileenseine.com/) - Issy-les-Moulineaux (France) 
- 8-10 octobre 2025 : [SIG 2025](https://www.geo-evenement.fr/) - Paris (France) & Online <a href="https://www.geo-evenement.fr/registration/communiquer"><img alt="CFP SIG 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-August-2025&color=red"></a>
- 9 octobre 2025 : [DevCon #25 : informatique quantique](https://www.programmez.com/page-devcon/devcon-25-informatique-quantique) - Paris (France) <a href="https://forms.gle/2Szh1rpTMQtH44Hk8"><img alt="CFP DevCon 25 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 9-10 octobre 2025 : [Forum PHP 2025](https://event.afup.org/) - Marne-la-Vallée (France) <a href="https://afup.org/event/forumphp2025"><img alt="CFP Forum PHP 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=red"></a>
- 9-10 octobre 2025 : [EuroRust 2025](https://eurorust.eu) - Paris (France) <a href="https://www.papercall.io/eurorust-2025"><img alt="CFP EuroRust 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-May-2025&color=red"></a>
- 16 octobre 2025 : [PlatformCon25 Live Day Paris](https://platformconlive.fr/) - Paris (France) <a href="https://conference-hall.io/platformcon25-live-day-paris"><img alt="CFP PlatformCon25 Live Day Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=red"></a>
- 16 octobre 2025 : [Power 365 - 2025](https://www.power365.fr) - Lille (France) <a href="https://sessionize.com/power-365-2025/"><img alt="CFP Power 365 - 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 16-17 octobre 2025 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) <a href="https://conference-hall.io/devfest-nantes-2025"><img alt="CFP DevFest Nantes 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-June-2025&color=red"></a>
- 17 octobre 2025 : [Sylius Con 2025](https://sylius.com/conference-2025/) - Lyon (France) <a href="https://sylius.com/conference-2025/#speakers"><img alt="CFP Sylius Con 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=red"></a>
- 17 octobre 2025 : [ScalaIO 2025](https://scala.io) - Paris (France) <a href="https://www.papercall.io/scala-io-2025"><img alt="CFP ScalaIO 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-August-2025&color=red"></a>
- 17-19 octobre 2025 : [OpenInfra Summit Europe](https://summit2025.openinfra.org/) - Paris (France) 
- 20 octobre 2025 : [Codeurs en Seine](https://www.codeursenseine.com/2025) - Rouen (France) <a href="https://conference-hall.io/codeurs-en-seine-20-novembre-2025"><img alt="CFP Codeurs en Seine 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-September-2025&color=green"></a>
- 23 octobre 2025 : [Cloud Nord](https://cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/cloud-nord-2025"><img alt="CFP Cloud Nord" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-August-2025&color=red"></a>
- 30-31 octobre 2025 : [Agile Tour Bordeaux 2025](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2025/"><img alt="CFP Agile Tour Bordeaux 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 30-31 octobre 2025 : [Agile Tour Nantais 2025](https://agilenantes.org/) - Nantes (France) <a href="https://sessionize.com/agile-tour-nantais-2025/"><img alt="CFP Agile Tour Nantais 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2025&color=red"></a>
- 30 octobre 2025-2 novembre 2025 : [PyConFR 2025](https://www.pycon.fr/2025/) - Lyon (France) <a href="https://cfp.pycon.fr/pyconfr-2025/cfp"><img alt="CFP PyConFR 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-July-2025&color=red"></a>
- 4-7 novembre 2025 : [NewCrafts 2025](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/ncrafts/"><img alt="CFP NewCrafts 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=red"></a>
- 5-6 novembre 2025 : [Tech Show Paris](https://www.techshowparis.fr/) - Paris (France) 
- 5-6 novembre 2025 : [Red Hat Summit: Connect Paris 2025](https://www.redhat.com/fr/summit/connect/emea/paris-2025) - Paris (France) 
- 6 novembre 2025 : [dotAI 2025](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=red"></a>
- 6 novembre 2025 : [Agile Tour Aix-Marseille 2025](http://atmrs.esprit-agile.com/) - Gardanne (France) <a href="https://sessionize.com/agile-tour-aix-marseille-2025/"><img alt="CFP Agile Tour Aix-Marseille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-August-2025&color=red"></a>
- 7 novembre 2025 : [BDX I/O](https://bdxio.fr) - Bordeaux (France) <a href="https://conference-hall.io/bdx-i-o-2025"><img alt="CFP BDX I/O 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-June-2025&color=red"></a>
- 12-14 novembre 2025 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) <a href="https://dvma25.cfp.dev/"><img alt="CFP Devoxx Morocco 25" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-June-2025&color=red"></a>
- 13 novembre 2025 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse-2025"><img alt="CFP DevFest Toulouse 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=red"></a>
- 15-16 novembre 2025 : [Capitole du Libre](https://capitoledulibre.org/) - Toulouse (France) <a href="https://cfp.capitoledulibre.org/cdl-2025/"><img alt="CFP Capitole du Libre 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2025&color=red"></a>
- 19 novembre 2025 : [SREday Paris 2025 Q4](https://sreday.com/2025-paris-q4/) - Paris (France) <a href="https://www.papercall.io/sreday-paris-2025-q4"><img alt="CFP SREday Paris 2025 Q4" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-September-2025&color=green"></a>
- 19-21 novembre 2025 : [Agile Grenoble](https://agile-grenoble.org/) - Grenoble (France) 
- 20 novembre 2025 : [OVHcloud Summit](https://summit.ovhcloud.com/fr/) - Paris (France) 
- 21 novembre 2025 : [DevFest Paris 2025](https://devfest.gdgparis.fr/) - Paris (France) <a href="https://conference-hall.io/devfest-paris-2025"><img alt="CFP DevFest Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2025&color=red"></a>
- 27 novembre 2025 : [DevFest Strasbourg 2025](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/devfest-strasbourg-2025"><img alt="CFP DevFest Strasbourg 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-July-2025&color=red"></a>
- 28 novembre 2025 : [DevFest Lyon](https://devfest.gdglyon.com/) - Lyon (France) <a href="https://conference-hall.io/devfest-lyon-2025"><img alt="DevFest Lyon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=red"></a>
- 1-2 décembre 2025 : [Tech Rocks Summit 2025](https://events.tech.rocks/tech-rocks-summit-2025) - Paris (France) 
- 4-5 décembre 2025 : [Agile Tour Rennes](https://agiletour.agilerennes.org/) - Rennes (France) 
- 5 décembre 2025 : [DevFest Dijon 2025](https://devfest.developers-group-dijon.fr/) - Dijon (France) <a href="https://conference-hall.io/devfest-dijon-2025"><img alt="CFP Devest Dijon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 9-11 décembre 2025 : [APIdays Paris](https://www.apidays.global/paris/) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP API Days Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-November-2025&color=green"></a>
- 9-11 décembre 2025 : [Green IO Paris](https://greenio.tech/conference/17/paris-2025-december) - Paris (France) <a href="https://apidays.typeform.com/to/SMHd2wFE?=green-io-conference%3Dcall-for-speakers&typeform-source=greenio.tech"><img alt="CFP Green IO Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-December-2025&color=green"></a>
- 10-11 décembre 2025 : [Devops REX](https://www.devopsrex.fr/) - Paris (France) <a href="https://talks.devopsdays.org/devops-rex-2025/cfp"><img alt="CFP Devops REX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=red"></a>
- 10-11 décembre 2025 : [Open Source Experience](https://www.opensource-experience.com) - Paris (France) 
- 11 décembre 2025 : [Normandie.ai 2025](https://normandie.ai/) - Rouen (France) <a href="https://conference-hall.io/normandie-ai-2025"><img alt="CFP Normandie.ai 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-October-2025&color=green"></a>
- 14-17 janvier 2026 : [SnowCamp 2026](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/snowcamp-2026"><img alt="CFP SnowCamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-October-2025&color=green"></a>
- 2-6 février 2026 : [Web Days Convention](https://webdays.events/) - Aix-en-Provence (France) <a href="https://conference-hall.io/web-days-convention"><img alt="CFP Web Days Convention" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-February-2026&color=green"></a>
- 3 février 2026 : [Cloud Native Days France 2026](https://www.cloudnativedays.fr/) - Paris (France) <a href="https://cfp.cloudnativedays.fr/2026/"><img alt="CFP Cloud Native Days France 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-October-2025&color=green"></a>
- 12-13 février 2026 : [Touraine Tech #26](https://touraine.tech/) - Tours (France) 
- 22-24 avril 2026 : [Devoxx France 2026](https://www.devoxx.fr) - Paris (France) 
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 17 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 
- 4 septembre 2026 : [JUG Summer Camp 2026](https://www.jugsummercamp.org/) - La Rochelle (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

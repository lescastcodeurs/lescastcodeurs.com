---
title: LCC 337 - Datacenters Carrier Class dans l'espace
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 337
youtube: vHLcQ0ox2N0
mp3_length: 68108370
tweet: Datacenters Carrier Class dans l'espace #Java #Quarkus #Kotlin #JPA #RAG #SoftwareEngineering #IA #Architecture #Scalabilité
# tweet size: 91-93 -> 99-101 #######################################################################
---
Emmanuel et Guillaume discutent de divers sujets liés à la programmation, notamment les systèmes de fichiers en Java, le Data Oriented Programming, les défis de JPA avec Kotlin, et les nouvelles fonctionnalités de Quarkus.
Ils explorent également des sujets un peu fous comme la création de datacenters dans l'espace. Pas mal d'architecture aussi.

Enregistré le 13 février 2026

Téléchargement de l’épisode [LesCastCodeurs-Episode-337.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-337.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=vHLcQ0ox2N0).

## News


### Langages

Comment implémenter un file system en Java
[https://foojay.io/today/bootstrapping-a-java-file-system/](https://foojay.io/today/bootstrapping-a-java-file-system/)

- Créer un système de fichiers Java personnalisé avec NIO.2 pour des usages variés (VCS, archives, systèmes distants).
- Évolution Java: `java.io.File` (1.0) -> `NIO` (1.4) -> `NIO.2` (1.7) pour personnalisation via `FileSystem`.
- Recommander conception préalable; API Java est orientée POSIX.
- Composants clés à considérer:
- Conception URI (scheme unique, chemin).
- Gestion de l'arborescence (BD, métadonnées, efficacité).
- Stockage binaire (emplacement, chiffrement, versions).
- Minimum pour démarrer (4 composants):
- Implémenter `Path` (représente fichier/répertoire).
- Étendre `FileSystem` (instance du système).
- Étendre `FileSystemProvider` (moteur, enregistré par scheme).
- Enregistrer `FileSystemProvider` via `META-INF/services`.
- Étapes suivantes: Couche BD (arborescence), opérations répertoire/fichier de base, stockage, tests.
- Processus long et exigeant, mais gratifiant.
- 

Un article de brian goetz sur le futur du data oriented programming en Java [https://openjdk.org/projects/amber/design-notes/beyond-records](https://openjdk.org/projects/amber/design-notes/beyond-records)

- Le projet Amber de Java introduit les “carrier classes”, une évolution des records qui permet plus de flexibilité tout en gardant les avantages du pattern matching et de la reconstruction
- Les records imposent des contraintes strictes (immutabilité, représentation exacte de l’état) qui limitent leur usage pour des classes avec état muable ou dérivé
- Les carrier classes permettent de déclarer une state description complète et canonique sans imposer que la représentation interne corresponde exactement à l’API publique
- Le modificateur “component” sur les champs permet au compilateur de dériver automatiquement les accesseurs pour les composants alignés avec la state description
- Les compact constructors sont généralisés aux carrier classes, générant automatiquement l’initialisation des component fields
- Les carrier classes supportent la déconstruction via pattern matching comme les records, rendant possible leur usage dans les instanceof et switch
- Les carrier interfaces permettent de définir une state description sur une interface, obligeant les implémentations à fournir les accesseurs correspondants
- L’extension entre carrier classes est possible, avec dérivation automatique des appels super() quand les composants parent sont subsumés par l’enfant
- Les records deviennent un cas particulier de carrier classes avec des contraintes supplémentaires (final, extends Record, component fields privés et finaux obligatoires)
- L’évolution compatible des records est améliorée en permettant l’ajout de composants en fin de liste et la déconstruction partielle par préfixe

Comment éviter les pièges courants avec JPA et Kotlin - [https://blog.jetbrains.com/idea/2026/01/how-to-avoid-common-pitfalls-with-jpa-and-kotlin/](https://blog.jetbrains.com/idea/2026/01/how-to-avoid-common-pitfalls-with-jpa-and-kotlin/)

- JPA est une spécification Java pour la persistance objet-relationnel, mais son utilisation avec Kotlin présente des incompatibilités dues aux différences de conception des deux langages
- Les classes Kotlin sont finales par défaut, ce qui empêche la création de proxies par JPA pour le lazy loading et les opérations transactionnelles
- Le plugin kotlin-jpa génère automatiquement des constructeurs sans argument et rend les classes open, résolvant les problèmes de compatibilité
- Les data classes Kotlin ne sont pas adaptées aux entités JPA car elles génèrent equals/hashCode basés sur tous les champs, causant des problèmes avec les relations lazy
- L’utilisation de lateinit var pour les relations peut provoquer des exceptions si on accède aux propriétés avant leur initialisation par JPA
- Les types non-nullables Kotlin peuvent entrer en conflit avec le comportement de JPA qui initialise les entités avec des valeurs null temporaires
- Le backing field direct dans les getters/setters personnalisés peut contourner la logique de JPA et casser le lazy loading
- IntelliJ IDEA 2024.3 introduit des inspections pour détecter automatiquement ces problèmes et propose des quick-fixes
- L’IDE détecte les entités finales, les data classes inappropriées, les problèmes de constructeurs et l’usage incorrect de lateinit
- Ces nouvelles fonctionnalités aident les développeurs à éviter les bugs subtils liés à l’utilisation de JPA avec Kotlin


### Librairies

Guide sur MapStruct @IterableMapping - [https://www.baeldung.com/java-mapstruct-iterablemapping](https://www.baeldung.com/java-mapstruct-iterablemapping)

- MapStruct est une bibliothèque Java pour générer automatiquement des mappers entre beans, l’annotation @IterableMapping permet de configurer finement le mapping de collections
- L’attribut dateFormat permet de formater automatiquement des dates lors du mapping de listes sans écrire de boucle manuelle
- L’attribut qualifiedByName permet de spécifier quelle méthode custom appliquer sur chaque élément de la collection à mapper
- Exemple d’usage : filtrer des données sensibles comme des mots de passe en mappant uniquement certains champs via une méthode dédiée
- L’attribut nullValueMappingStrategy permet de contrôler le comportement quand la collection source est null (retourner null ou une collection vide)
- L’annotation fonctionne pour tous types de collections Java (List, Set, etc.) et génère le code de boucle nécessaire
- Possibilité d’appliquer des formats numériques avec numberFormat pour convertir des nombres en chaînes avec un format spécifique
- MapStruct génère l’implémentation complète du mapper au moment de la compilation, éliminant le code boilerplate
- L’annotation peut être combinée avec @Named pour créer des méthodes de mapping réutilisables et nommées
- Le mapping des collections supporte les conversions de types complexes au-delà des simples conversions de types primitifs

Accès aux fichiers Samba depuis Java avec JCIFS - [https://www.baeldung.com/java-samba-jcifs](https://www.baeldung.com/java-samba-jcifs)

- JCIFS est une bibliothèque Java permettant d’accéder aux partages Samba/SMB sans monter de lecteur réseau, supportant le protocole SMB3
- on pense aux galériens qui doivent se connecter aux systèmes dit legacy
- La configuration nécessite un contexte CIFS (CIFSContext) et des objets SmbFile pour représenter les ressources distantes
- L’authentification se fait via NtlmPasswordAuthenticator avec domaine, nom d’utilisateur et mot de passe
- La bibliothèque permet de lister les fichiers et dossiers avec listFiles() et vérifier leurs propriétés (taille, date de modification)
- Création de fichiers avec createNewFile() et de dossiers avec mkdir() ou mkdirs() pour créer toute une arborescence
- Suppression via delete() qui peut parcourir et supprimer récursivement des arborescences entières
- Copie de fichiers entre partages Samba avec copyTo(), mais impossibilité de copier depuis le système de fichiers local
- Pour copier depuis le système local, utilisation des streams SmbFileInputStream et SmbFileOutputStream
- Les opérations peuvent cibler différents serveurs Samba et différents partages (anonymes ou protégés par mot de passe)
- La bibliothèque s’intègre dans des blocs try-with-resources pour une gestion automatique des ressources

Quarkus 3.31 - Support complet Java 25, nouveau packaging Maven et Panache Next - [https://quarkus.io/blog/quarkus-3-31-released/](https://quarkus.io/blog/quarkus-3-31-released/)

- Support complet de Java 25 avec images runtime et native
- Nouveau packaging Maven de type quarkus avec lifecycle optimisé pour des builds plus rapides
- voici un article complet pour plus de detail [https://quarkus.io/blog/building-large-applications/](https://quarkus.io/blog/building-large-applications/)
- Introduction de Panache Next, nouvelle génération avec meilleure expérience développeur et API unifiée ORM/Reactive
- Mise à jour vers Hibernate ORM 7.2, Reactive 3.2, Search 8.2
- Support de Hibernate Spatial pour les données géospatiales
- Passage à Testcontainers 2 et JUnit 6
- Annotations de sécurité supportées sur les repositories Jakarta Data
- Chiffrement des tokens OIDC pour les implémentations custom TokenStateManager
- Support OAuth 2.0 Pushed Authorization Requests dans l’extension OIDC
- Maven 3.9 maintenant requis minimum pour les projets Quarkus

A2A Java SDK 1.0.0.Alpha1 - Alignement avec la spécification 1.0 du protocole Agent2Agent - [https://quarkus.io/blog/a2a-java-sdk-1-0-0-alpha1/](https://quarkus.io/blog/a2a-java-sdk-1-0-0-alpha1/)

- Le SDK Java A2A implémente le protocole Agent2Agent qui permet la communication standardisée entre agents IA pour découvrir des capacités, déléguer des tâches et collaborer
- Passage à la version 1.0 de la spécification marque la transition d’expérimental à production-ready avec des changements cassants assumés
- Modernisation complète du module spec avec des Java records partout remplaçant le mix précédent de classes et records pour plus de cohérence
- Adoption de Protocol Buffers comme source de vérité avec des mappers MapStruct pour la conversion et Gson pour JSON-RPC
- Les builders utilisent maintenant des méthodes factory statiques au lieu de constructeurs publics suivant les best practices Java modernes
- Introduction de trois BOMs Maven pour simplifier la gestion des dépendances du SDK core, des extensions et des implémentations de référence Quarkus
- AgentCard évolue avec une liste supportedInterfaces remplaçant url et preferredTransport pour plus de flexibilité dans la déclaration des protocoles
- Support de la pagination ajouté pour ListTasks et les endpoints de configuration des notifications push avec des wrappers Result appropriés
- Interface A2AHttpClient pluggable permettant des implémentations HTTP personnalisées avec une implémentation Vert.x fournie
- Travail continu vers la conformité complète avec le TCK 1.0 en cours de développement parallèlement à la finalisation de la spécification

Pourquoi Quarkus finit par “cliquer” : les 10 questions que se posent les développeurs Java - [https://www.the-main-thread.com/p/quarkus-java-developers-top-questions-2025](https://www.the-main-thread.com/p/quarkus-java-developers-top-questions-2025)

- un article qui revele et repond aux questions des gens qui ont utilisé Quarkus depuis 4-6 mois, les non noob questions
- Quarkus est un framework Java moderne optimisé pour le cloud qui propose des temps de démarrage ultra-rapides et une empreinte mémoire réduite
- Pourquoi Quarkus démarre si vite ? Le framework effectue le travail lourd au moment du build (scanning, indexation, génération de bytecode) plutôt qu’au runtime
- Quand utiliser le mode réactif plutôt qu’impératif ? Le réactif est pertinent pour les workloads avec haute concurrence et dominance I/O, l’impératif reste plus simple dans les autres cas
- Quelle est la différence entre Dev Services et Testcontainers ? Dev Services utilise Testcontainers en gérant automatiquement le cycle de vie, les ports et la configuration sans cérémonie
- Comment la DI de Quarkus diffère de Spring ? CDI est un standard basé sur la sécurité des types et la découverte au build-time, différent de l’approche framework de Spring
- Comment gérer la configuration entre environnements ? Quarkus permet de scaler depuis le développement local jusqu’à Kubernetes avec des profils, fichiers multiples et configuration externe
- Comment tester correctement les applications Quarkus ? @QuarkusTest démarre l’application une fois pour toute la suite de tests, changeant le modèle mental par rapport à Spring Boot
- Que fait vraiment Panache en coulisses ? Panache est du JPA avec des opinions fortes et des défauts propres, enveloppant Hibernate avec un style Active Record
- Doit-on utiliser les images natives et quand ? Les images natives brillent pour le serverless et l’edge grâce au démarrage rapide et la faible empreinte mémoire, mais tous les apps n’en bénéficient pas
- Comment Quarkus s’intègre avec Kubernetes ? Le framework génère automatiquement les ressources Kubernetes, gère les health checks et métriques comme s’il était nativement conçu pour cet écosystème
- Comment intégrer l’IA dans une application Quarkus ? LangChain4j permet d’ajouter embeddings, retrieval, guardrails et observabilité directement en Java sans passer par Python


### Infrastructure

Les alternatives à MinIO [https://rmoff.net/2026/01/14/alternatives-to-minio-for-single-node-local-s3/](https://rmoff.net/2026/01/14/alternatives-to-minio-for-single-node-local-s3/)

- MinIO a abandonné le support single-node fin 2025 pour des raisons commerciales, cassant de nombreuses démos et pipelines CI/CD qui l’utilisaient pour émuler S3 localement
- L’auteur cherche un remplacement simple avec image Docker, compatibilité S3, licence open source, déploiement mono-nœud facile et communauté active
- S3Proxy est très léger et facile à configurer, semble être l’option la plus simple mais repose sur un seul contributeur
- RustFS est facile à utiliser et inclut une GUI, mais c’est un projet très récent en version alpha avec une faille de sécurité majeure récente
- SeaweedFS existe depuis 2012 avec support S3 depuis 2018, relativement facile à configurer et dispose d’une interface web basique
- Zenko CloudServer remplace facilement MinIO mais la documentation et le branding (cloudserver/zenko/scality) peuvent prêter à confusion
- Garage nécessite une configuration complexe avec fichier TOML et conteneur d’initialisation séparé, pas un simple remplacement drop-in
- Apache Ozone requiert au minimum quatre nœuds pour fonctionner, beaucoup trop lourd pour un usage local simple
- L’auteur recommande SeaweedFS et S3Proxy comme remplaçants viables, RustFS en maybe, et élimine Garage et Ozone pour leur complexité
- Garage a une histoire tres associative, il vient du collectif [https://deuxfleurs.fr/](https://deuxfleurs.fr/) qui offre un cloud distribué sans datacenter

C'est certainement pas une bonne idée, les datacenters dans l'espace
[https://taranis.ie/datacenters-in-space-are-a-terrible-horrible-no-good-idea/](https://taranis.ie/datacenters-in-space-are-a-terrible-horrible-no-good-idea/)

- **Avis d'expert (ex-NASA/Google, Dr en électronique spatiale) :** Centres de données spatiaux, une "terrible" idée.
- **Incompatibilité fondamentale :** L'électronique (surtout IA/GPU) est inadaptée à l'environnement spatial.
- **Énergie :** Accès limité. Le solaire (type ISS) est insuffisant pour l'échelle de l'IA. Le nucléaire (RTG) est trop faible.
- **Refroidissement :** L'espace n'est pas "froid" ; absence de convection. Nécessite des radiateurs gigantesques (ex: 531m² pour 200kW).
- **Radiations :** Provoque erreurs (SEU, SEL) et dommages. Les GPU sont très vulnérables. Blindage lourd et inefficace. Les puces "durcies" sont très lentes.
- **Communications :** Bande passante très limitée (1Gbps radio vs 100Gbps terrestre). Le laser est tributaire des conditions atmosphériques.
- **Conclusion :** Projet extrêmement difficile, coûteux et aux performances médiocres.




### Data et Intelligence Artificielle

Guillaume a développé un serveur MCP pour arXiv (le site de publication de papiers de recherche) en Java avec le framework Quarkus
[https://glaforge.dev/posts/2026/01/18/implementing-an-arxiv-mcp-server-with-quarkus-in-java/](https://glaforge.dev/posts/2026/01/18/implementing-an-arxiv-mcp-server-with-quarkus-in-java/)

- Implémentation d'un serveur MCP (Model Context Protocol) arXiv en Java avec Quarkus.
- Objectif : Accéder aux publications arXiv et illustrer les fonctionnalités moins connues du protocole MCP.
- Mise en œuvre :
  - Utilisation du framework Quarkus (Java) et son support MCP étendu.
  - Assistance par Antigravity (IDE agentique) pour le développement et l'intégration de l'API arXiv.
  - Interaction avec l'API arXiv : requêtes HTTP, format XML Atom pour les résultats, parser XML Jackson.
- Fonctionnalités MCP exposées :
  - **Outils (`@Tool`)** : Recherche de publications (`search_papers`).
  - **Ressources (`@Resource`, `@ResourceTemplate`)** : Taxonomie des catégories arXiv, métadonnées des articles (via un template d'URI).
  - **Prompts (`@Prompt`)** : Exemples pour résumer des articles ou construire des requêtes de recherche.
- Configuration : Le serveur peut fonctionner en STDIO (local) ou via HTTP Streamable (local ou distant), avec une configuration simple dans des clients comme Gemini CLI.
- Conclusion : Quarkus simplifie la création de serveurs MCP riches en fonctionnalités, rendant les données et services "prêts pour l'IA" avec l'aide d'outils d'IA comme Antigravity.

Anthropic ne mettra pas de pub dans Claude [https://www.anthropic.com/news/claude-is-a-space-to-think](https://www.anthropic.com/news/claude-is-a-space-to-think)

- c’est en reaction au plan non public d’OpenAi de mettre de la pub pour pousser les gens au mode payant
- OpenAI a besoin de cash et est probablement le plus utilisé pour gratuit au monde
- Anthropic annonce que Claude restera sans publicité pour préserver son rôle d’assistant conversationnel dédié au travail et à la réflexion approfondie.
- Les conversations avec Claude sont souvent sensibles, personnelles ou impliquent des tâches complexes d’ingénierie logicielle où les publicités seraient inappropriées.
- L’analyse des conversations montre qu’une part significative aborde des sujets délicats similaires à ceux évoqués avec un conseiller de confiance.
- Un modèle publicitaire créerait des incitations contradictoires avec le principe fondamental d’être “genuinely helpful” inscrit dans la Constitution de Claude.
- Les publicités introduiraient un conflit d’intérêt potentiel où les recommandations pourraient être influencées par des motivations commerciales plutôt que par l’intérêt de l’utilisateur.
- Le modèle économique d’Anthropic repose sur les contrats entreprise et les abonnements payants, permettant de réinvestir dans l’amélioration de Claude.
- Anthropic maintient l’accès gratuit avec des modèles de pointe et propose des tarifs réduits pour les ONG et l’éducation dans plus de 60 pays.
- Le commerce “agentique” sera supporté mais uniquement à l’initiative de l’utilisateur, jamais des annonceurs, pour préserver la confiance.
- Les intégrations tierces comme Figma, Asana ou Canva continueront d’être développées en gardant l’utilisateur aux commandes.
- Anthropic compare Claude à un cahier ou un tableau blanc : des espaces de pensée purs, sans publicité.

Infinispan 16.1 est sorti [https://infinispan.org/blog/2026/02/04/infinispan-16-1](https://infinispan.org/blog/2026/02/04/infinispan-16-1)

- déjà le nom de la release mérite une mention
- Le memory bounded par cache et par ensemble de cache s est pas facile à faire en Java
- Une nouvelle api OpenAPI
- AOT caché dans les images container 

Un serveur MCP local juste avec un fichier Java ?
C'est possible avec LangChain4j et JBang
[https://glaforge.dev/posts/2026/02/11/zero-boilerplate-java-stdio-mcp-servers-with-langchain4j-and-jbang/](https://glaforge.dev/posts/2026/02/11/zero-boilerplate-java-stdio-mcp-servers-with-langchain4j-and-jbang/)

- Création rapide de serveurs MCP Java sans boilerplate.
- **MCP (Model Context Protocol)**: standard pour connecter les LLM à des outils et données.
- Le tutoriel répond au manque d'options simples pour les développeurs Java, face à une prédominance de Python/TypeScript dans l'écosystème MCP.
- **La solution utilise:**
- **LangChain4j**: qui intègre un nouveau module serveur MCP pour le protocole STDIO.
- **JBang**: permet d'exécuter des fichiers Java comme des scripts, éliminant les fichiers de build (pom.xml, Gradle).
- **Implémentation**: se fait via un seul fichier `.java`.
- JBang gère automatiquement les dépendances (`//DEPS`).
- L'annotation `@Tool` de LangChain4j expose les méthodes Java aux LLM.
- `StdioMcpServerTransport` gère la communication JSON-RPC via l'entrée/sortie standard (STDIO).
- **Point crucial**: Les logs doivent impérativement être redirigés vers `System.err` pour éviter de corrompre `System.out`, qui est réservé à la communication MCP (messages JSON-RPC).
- Facilite l'intégration locale avec des outils comme Gemini CLI, Claude Code, etc.

Reciprocal Rank Fusion : un algorithme utile et souvent utilisé pour faire de la recherche hybride, pour mélanger du RAG et des recherches par mots-clé
[https://glaforge.dev/posts/2026/02/10/advanced-rag-understanding-reciprocal-rank-fusion-in-hybrid-search/](https://glaforge.dev/posts/2026/02/10/advanced-rag-understanding-reciprocal-rank-fusion-in-hybrid-search/)

- **RAG :** Qualité LLM dépend de la récupération.
- **Recherche Hybride :** Combiner vectoriel et mots-clés (BM25) est optimal.
- **Défi :** Fusionner des scores d'échelles différentes.
- **Solution :** Reciprocal Rank Fusion (RRF).
- **RRF :** Algorithme robuste qui fusionne des listes de résultats en se basant uniquement sur le _rang_ des documents, ignorant les scores.
- **Avantages RRF :** Pas de normalisation de scores, scalable, excellente première étape de réorganisation.
- **Architecture RAG fréquente :** RRF (large sélection) + Cross-Encoder / modèle de reranking (précision fine).
- **RAG-Fusion :** Utilise un LLM pour générer plusieurs variantes de requête, puis RRF agrège tous les résultats pour renforcer le consensus et réduire les hallucinations.
- **Implémentation :** LangChain4j utilise RRF par défaut pour agréger les résultats de plusieurs retrievers.

Les dernières fonctionnalités de Gemini et Nano Banana supportées dans LangChain4j
[https://glaforge.dev/posts/2026/02/06/latest-gemini-and-nano-banana-enhancements-in-langchain4j/](https://glaforge.dev/posts/2026/02/06/latest-gemini-and-nano-banana-enhancements-in-langchain4j/)

- Nouveaux modèles d'images **Nano Banana** (Gemini 2.5/3.0) pour génération et édition (jusqu'à 4K).
- "Grounding" via **Google Search** (pour images et texte) et **Google Maps** (localisation, Gemini 2.5).
- **Outil de contexte URL** (Gemini 3.0) pour lecture directe de pages web.
- **Agents multimodaux** (`AiServices`) capables de générer des images.
- Configuration de la **réflexion** (profondeur Chain-of-Thought) pour Gemini 3.0.
- **Métadonnées enrichies** : usage des tokens et détails des sources de "grounding".

Comment configurer Gemini CLI comment agent de code dans IntelliJ grâce au protocole ACP
[https://glaforge.dev/posts/2026/02/01/how-to-integrate-gemini-cli-with-intellij-idea-using-acp/](https://glaforge.dev/posts/2026/02/01/how-to-integrate-gemini-cli-with-intellij-idea-using-acp/)

- **But :** Intégrer Gemini CLI à IntelliJ IDEA via l'Agent Client Protocol (ACP).
- **Prérequis :** IntelliJ IDEA 2025.3+, Node.js (v20+), Gemini CLI.
- **Étapes :**
  - Installer Gemini CLI (`npm install -g @google/gemini-cli`).
- Localiser l'exécutable `gemini`.
  - Configurer `~/.jetbrains/acp.json` (chemin exécutable, `--experimental-acp`, `use_idea_mcp: true`).
  - Redémarrer IDEA, sélectionner "Gemini CLI" dans l'Assistant IA.
- **Usage :** Gemini interagit avec le code et exécute des commandes (contexte projet).
- **Important :** S'assurer du flag `--experimental-acp` dans la configuration.


### Outillage

PipeNet, une alternative (open source aussi) à LocalTunnel, mais un plus évoluée
[https://pipenet.dev/](https://pipenet.dev/)

- **pipenet**: Alternative open-source et moderne à localtunnel (client + serveur).
- **Usages**: Développement local (partage, webhooks), intégration SDK, auto-hébergement sécurisé.
- **Fonctionnalités**: Client (expose ports locaux, sous-domaines), Serveur (déploiement, domaines personnalisés, optimisé cloud mono-port).
- **Avantages vs localtunnel**: Déploiement cloud sur un seul port, support multi-domaines, TypeScript/ESM, maintenance active.
- **Protocoles**: HTTP/S, WebSocket, SSE, HTTP Streaming.
- **Intégration**: CLI ou SDK JavaScript.

JSON-IO — une librairie comme Jackson ou GSON, supportant JSON5, TOON, et qui pourrait être utile pour l'utilisation du "structured output" des LLMs quand ils ne produisent pas du JSON parfait
[https://github.com/jdereg/json-io](https://github.com/jdereg/json-io)

- **json-io** : Librairie Java pour la sérialisation et désérialisation JSON/TOON.
- Gère les graphes d'objets complexes, les références cycliques et les types polymorphes.
- Support complet JSON5 (lecture et écriture), y compris des fonctionnalités non prises en charge par Jackson/Gson.
- Format **TOON** : Notation orientée token, optimisée pour les LLM, réduisant l'utilisation de tokens de 40 à 50% par rapport au JSON.
- Légère : Aucune dépendance externe (sauf `java-util`), taille de JAR réduite (~330K).
- Compatible JDK 1.8 à 24, ainsi qu'avec les environnements JPMS et OSGi.
- Deux modes de conversion : vers des objets Java typés (`toJava()`) ou vers des `Map` (`toMaps()`).
- Options de configuration étendues via `ReadOptionsBuilder` et `WriteOptionsBuilder`.
- Optimisée pour les déploiements cloud natifs et les architectures de microservices.

Utiliser mailpit et testcontainer pour tester vos envois d’emails [https://foojay.io/today/testing-emails-with-testcontainers-and-mailpit/](https://foojay.io/today/testing-emails-with-testcontainers-and-mailpit/)

- l'article montre via SpringBoot et sans. Et voici l’extension Quarkus [https://quarkus.io/extensions/io.quarkiverse.mailpit/quarkus-mailpit/?tab=docs](https://quarkus.io/extensions/io.quarkiverse.mailpit/quarkus-mailpit/?tab=docs)
- Tester l’envoi d’emails en développement est complexe car on ne peut pas utiliser de vrais serveurs SMTP
- Mailpit est un serveur SMTP de test qui capture les emails et propose une interface web pour les consulter
- Testcontainers permet de démarrer Mailpit dans un conteneur Docker pour les tests d’intégration
- L’article montre comment configurer une application SpringBoot pour envoyer des emails via JavaMail
- Un module Testcontainers dédié à Mailpit facilite son intégration dans les tests
- Le conteneur Mailpit expose un port SMTP (1025) et une API HTTP (8025) pour vérifier les emails reçus
- Les tests peuvent interroger l’API HTTP de Mailpit pour valider le contenu des emails envoyés
- Cette approche évite d’utiliser des mocks et teste réellement l’envoi d’emails
- Mailpit peut aussi servir en développement local pour visualiser les emails sans les envoyer réellement
- La solution fonctionne avec n’importe quel framework Java supportant JavaMail


### Architecture

Comment scaler un système de 0 à 10 millions d'utilisateurs
[https://blog.algomaster.io/p/scaling-a-system-from-0-to-10-million-users](https://blog.algomaster.io/p/scaling-a-system-from-0-to-10-million-users)

- **Philosophie :** Scalabilité incrémentale, résoudre les goulots d'étranglement sans sur-ingénierie.
- **0-100 utilisateurs :** Serveur unique (app, DB, jobs).
- **100-1K :** Séparer app et DB (services gérés, pooling).
- **1K-10K :** Équilibreur de charge, multi-serveurs d'app (stateless via sessions partagées).
- **10K-100K :** Caching, réplicas de lecture DB, CDN (réduire charge DB).
- **100K-500K :** Auto-scaling, applications stateless (authentification JWT).
- **500K-10M :** Sharding DB, microservices, files de messages (traitement asynchrone).
- **10M+ :** Déploiement multi-régions, CQRS, persistance polyglotte, infra personnalisée.
- **Principes clés :** Simplicité, mesure, stateless essentiel, cache/asynchrone, sharding prudent, compromis (CAP), coût de la complexité.

Patterns d’Architecture 2026 - Du Hype à la Réalité du Terrain (Part 1/2) - [https://blog.ippon.fr/2026/01/30/patterns-darchitecture-2026-part-1/](https://blog.ippon.fr/2026/01/30/patterns-darchitecture-2026-part-1/)

- L’article présente quatre patterns d’architecture logicielle pour répondre aux enjeux de scalabilité, résilience et agilité business dans les systèmes modernes
- Il présentent leurs raisons et leurs pièges 
- Un bon rappel 
- L’Event-Driven Architecture permet une communication asynchrone entre systèmes via des événements publiés et consommés, évitant le couplage direct
- Les bénéfices de l’EDA incluent la scalabilité indépendante des composants, la résilience face aux pannes et l’ajout facile de nouveaux cas d’usage
- Le pattern API-First associé à un API Gateway centralise la sécurité, le routage et l’observabilité des APIs avec un catalogue unifié
- Le Backend for Frontend crée des APIs spécifiques par canal (mobile, web, partenaires) pour optimiser l’expérience utilisateur
- CQRS sépare les modèles de lecture et d’écriture avec des bases optimisées distinctes, tandis que l’Event Sourcing stocke tous les événements plutôt que l’état actuel
- Le Saga Pattern gère les transactions distribuées via orchestration centralisée ou chorégraphie événementielle pour coordonner plusieurs microservices
- Les pièges courants incluent l’explosion d’événements granulaires, la complexité du debugging distribué, et la mauvaise gestion de la cohérence finale
- Les technologies phares sont Kafka pour l’event streaming, Kong pour l’API Gateway, EventStoreDB pour l’Event Sourcing et Temporal pour les Sagas
- Ces patterns nécessitent une maturité technique et ne sont pas adaptés aux applications CRUD simples ou aux équipes junior

Patterns d’architecture 2026 : du hype à la réalité terrain part. 2 - [https://blog.ippon.fr/2026/02/04/patterns-darchitecture-2026-part-2/](https://blog.ippon.fr/2026/02/04/patterns-darchitecture-2026-part-2/)

- Deuxième partie d’un guide pratique sur les patterns d’architecture logicielle et système éprouvés pour moderniser et structurer les applications en 2026
- Strangler Fig permet de migrer progressivement un système legacy en l’enveloppant petit à petit plutôt que de tout réécrire d’un coup (70% d’échec pour les big bang)
- Anti-Corruption Layer protège votre nouveau domaine métier des modèles externes et legacy en créant une couche de traduction entre les systèmes
- Service Mesh gère automatiquement la communication inter-services dans les architectures microservices (sécurité mTLS, observabilité, résilience)
- Architecture Hexagonale sépare le coeur métier des détails techniques via des ports et adaptateurs pour améliorer la testabilité et l’évolutivité
- Chaque pattern est illustré par un cas client concret avec résultats mesurables et liste des pièges à éviter lors de l’implémentation
- Les technologies 2026 mentionnées incluent Istio, Linkerd pour service mesh, LaunchDarkly pour feature flags, NGINX et Kong pour API gateway
- Tableau comparatif final aide à choisir le bon pattern selon la complexité, le scope et le use case spécifique du projet
- L’article insiste sur une approche pragmatique : ne pas utiliser un pattern juste parce qu’il est moderne mais parce qu’il résout un problème réel
- Pour les systèmes simples type CRUD ou avec peu de services, ces patterns peuvent introduire une complexité inutile qu’il faut savoir éviter


### Méthodologies

Le rêve récurrent de remplacer voire supprimer les développeurs
[https://www.caimito.net/en/blog/2025/12/07/the-recurring-dream-of-replacing-developers.html](https://www.caimito.net/en/blog/2025/12/07/the-recurring-dream-of-replacing-developers.html)

- Depuis 1969, chaque décennie voit une tentative de réduire le besoin de développeurs (de COBOL, UML, visual builders... à IA).
- Motivation : frustration des dirigeants face aux délais et coûts de développement.
- La complexité logicielle est intrinsèque et intellectuelle, non pas une question d'outils.
- Chaque vague technologique apporte de la valeur mais ne supprime pas l'expertise humaine.
- L'IA assiste les développeurs, améliore l'efficacité, mais ne remplace ni le jugement ni la gestion de la complexité.
- La demande de logiciels excède l'offre car la contrainte majeure est la _réflexion_ nécessaire pour gérer cette complexité.
- Pour les dirigeants : les outils rendent-ils nos développeurs plus efficaces sur les problèmes complexes et réduisent-ils les tâches répétitives ?
- Le "rêve" de remplacer les développeurs, irréalisable, est un moteur d'innovation créant des outils précieux.

Comment creuser des sujets à l'ère de l'IA générative.
Quid du partage et la curation de ces recherches ?
[https://glaforge.dev/posts/2026/02/04/researching-topics-in-the-age-of-ai-rock-solid-webhooks-case-study/](https://glaforge.dev/posts/2026/02/04/researching-topics-in-the-age-of-ai-rock-solid-webhooks-case-study/)

- Recherche initiale de l'auteur sur les webhooks en 2019, processus long et manuel.
- L'IA (Deep Research, Gemini, NotebookLM) facilite désormais la recherche approfondie, l'exploration de sujets et le partage des résultats.
- L'IA a identifié et validé des pratiques clés pour des déploiements de webhooks résilients, en grande partie les mêmes que celles trouvées précédemment par l'auteur.
- Génération d'artefacts par l'IA : rapport détaillé, résumé concis, illustration sketchnote, et même une présentation (slide deck).
- Guillaume s'interroge sur le partage public de ces rapports de recherche générés par l'IA, tout en souhaitant éviter le "AI Slop".



### Loi, société et organisation

Le logiciel menacé par le vibe coding [https://www.techbuzz.ai/articles/we-built-a-monday-com-clone-in-under-an-hour-with-ai](https://www.techbuzz.ai/articles/we-built-a-monday-com-clone-in-under-an-hour-with-ai)

- Deux journalistes de CNBC sans expérience de code ont créé un clone fonctionnel de [Monday.com](http://Monday.com) en moins de 60 minutes pour 5 à 15 dollars.
- L’expérience valide les craintes des investisseurs qui ont provoqué une baisse de 30% des actions des entreprises SaaS.
- L’IA a non seulement reproduit les fonctionnalités de base mais a aussi recherché [Monday.com](http://Monday.com) de manière autonome pour identifier et recréer ses fonctionnalités clés.
- Cette technique appelée “vibe-coding” permet aux non-développeurs de construire des applications via des instructions en anglais courant.
- Les entreprises les plus vulnérables sont celles offrant des outils “qui se posent sur le travail” comme Atlassian, Adobe, HubSpot, Zendesk et Smartsheet.
- Les entreprises de cybersécurité comme CrowdStrike et Palo Alto sont considérées plus protégées grâce aux effets de réseau et aux barrières réglementaires.
- Les systèmes d’enregistrement comme Salesforce restent plus difficiles à répliquer en raison de leur profondeur d’intégration et de données d’entreprise.
- Le coût de 5 à 15 dollars par construction permet aux entreprises de prototyper plusieurs solutions personnalisées pour moins cher qu’une seule licence [Monday.com](http://Monday.com).
- L’expérience soulève des questions sur la pérennité du marché de 5 milliards de dollars des outils de gestion de projet face à l’IA générative.





## Conférences

En complément de l'agenda des conférences de Aurélie Vache, il y a également le site [https://javaconferences.org/](https://javaconferences.org/) (fait par Brian Vermeer) avec toutes les conférences Java à venir !



La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 12-13 février 2026 : [Touraine Tech #26](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/touraine-tech-2026"><img alt="CFP TnT 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-November-2025&color=red"></a>
- 12-13 février 2026 : [World Artificial Intelligence Cannes Festival](https://www.worldaicannes.com/) - Cannes (France) <a href="https://forms.rxfrance.fr/en/waicf/2026/call-for-speakers-waicf-2026.htm"><img alt="CFP WAICF 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-February-2026&color=red"></a>
- 19 février 2026 : [ObservabilityCON on the Road](https://grafana.com/events/observabilitycon-on-the-road/2026/paris/) - Paris (France) 
- 6 mars 2026 : [WordCamp Nice 2026](https://nice.wordcamp.org/2026) - Nice (France) 
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
- 22-24 avril 2026 : [Devoxx France 2026](https://www.devoxx.fr) - Paris (France) <a href="https://devoxxfr2026.cfp.dev/"><img alt="CFP Devoxx France 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-January-2026&color=red"></a>
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr26.cfp.dev/"><img alt="CFP Devoxx Greece 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2025&color=red"></a>
- 6-7 mai 2026 : [Devoxx UK 2026](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk26.cfp.dev/"><img alt="CFP Devoxx UK 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-January-2026&color=red"></a>
- 12 mai 2026 : [Lead Innovation Day - Leadership Edition](https://leadinnovation.day/) - Paris (France) <a href="https://sessionize.com/lead-innovation-day-leadership-edition"><img alt="CFP Lead Innovation Day - Leadership Edition" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2026&color=green"></a>
- 19 mai 2026 : [La Product Conf Paris 2026](https://www.laproductconf.com/paris/lpc) - Paris (France) <a href="https://sessionize.com/la-product-conf-paris-2026"><img alt="CFP La Product Conf Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-January-2026&color=red"></a>
- 21-22 mai 2026 : [Flupa UX Days 2026](https://www.uxdays.eu) - Paris (France) <a href="https://sessionize.com/flupa-ux-days-2025-appel-a-orateurric"><img alt="CFP Flupa UX Days 2026 – Appel à orateur·rices pour la 14ᵉ édition" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-March-2026&color=green"></a>
- 22 mai 2026 : [AFUP Day 2026 Lille](https://event.afup.org/afup-day-2026/afup-day-2026-lille) - Lille (France) <a href="https://afup.org/event/afupday2026lille/cfp"><img alt="CFP AFUP Day Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Paris](https://event.afup.org/afup-day-2026/afup-day-2026-paris) - Paris (France) <a href="https://afup.org/event/afupday2026paris/cfp"><img alt="CFP AFUP Day Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Bordeaux](https://event.afup.org/afup-day-2026/afup-day-2026-bordeaux/) - Bordeaux (France) <a href="https://afup.org/event/afupday2026bordeaux/cfp"><img alt="CFP AFUP Day Bordeaux 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Lyon](https://event.afup.org/afup-day-2026/afup-day-2026-lyon) - Lyon (France) <a href="https://afup.org/event/afupday2026lyon/cfp"><img alt="CFP AFUP Day Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 28 mai 2026 : [DevCon 27 : I.A. & Vibe Coding](https://www.programmez.com) - Paris (France) <a href="https://forms.gle/27JdJx38nTNnJYT16"><img alt="CFP DevCon 27 : I.A. & Vibe Coding" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-April-2026&color=green"></a>
- 28 mai 2026 : [Cloud Toulouse 2026](https://cloudtoulouse.com/) - Toulouse (France) <a href="https://conference-hall.io/cloud-toulouse-2026"><img alt="CFP Cloud Toulouse 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-March-2026&color=green"></a>
- 29 mai 2026 : [NG Baguette Conf 2026](https://ngbaguette.angulardevs.fr/) - Paris (France) <a href="https://conference-hall.io/ng-baguette-conf-2026"><img alt="CFP NG Baguette Conf 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2026&color=red"></a>
- 29 mai 2026 : [Agile Tour Strasbourg 2026](https://agilestrasbourg.fr/) - Strasbourg (France) <a href="https://sessionize.com/agile-tour-strasbourg-2026"><img alt="CFP Agile Tour Strasbourg 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-April-2026&color=green"></a>
- 2-3 juin 2026 : [Agile Tour Rennes 2026](https://agiletour.agilerennes.org/) - Rennes (France) 
- 2-3 juin 2026 : [OW2Con](https://www.ow2con.org/view/2026/) - Paris-Châtillon (France) <a href="https://pretalx.ow2.org/ow2con-2026/cfp"><img alt="CFP OW2 Con 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-February-2026&color=green"></a>
- 3 juin 2026 : [IA–NA](https://ia-na.fr) - La Rochelle (France) <a href="https://conference-hall.io/ia-na-2026"><img alt="CFP IA–NA" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-March-2026&color=green"></a>
- 5 juin 2026 : [TechReady](https://techready.live/) - Nantes (France) 
- 5 juin 2026 : [Fork it! - Rouen](https://www.forkit.community/events/2026-france-rouen) - Rouen (France) 
- 6 juin 2026 : [Polycloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/polycloud-2026"><img alt="Polycloud 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-February-2026&color=green"></a>
- 9 juin 2026 : [JFTL](https://cftl.fr/actualites/jftl/) - Montrouge (France) <a href="https://easychair.org/account2/signin?l=6729252653728886957"><img alt="CFP JFTL" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-January-2026&color=red"></a>
- 9 juin 2026 : [C:\aen\Tech](https://caen.tech/) - Caen (France) <a href="https://conference-hall.io/caen-tech"><img alt="CFP Caen Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-April-2026&color=green"></a>
- 11-12 juin 2026 : [DevQuest Niort](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/devquest-2026"><img alt="CFP devquest niort" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-March-2026&color=green"></a>
- 11-12 juin 2026 : [DevLille 2026](https://devlille.fr/) - Lille (France) <a href="https://conference-hall.io/devlille-2026"><img alt="CFP DevLille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2026&color=green"></a>
- 12 juin 2026 : [Tech F'Est 2026](https://www.tech-fest.dev/) - Nancy (France) <a href="https://conference-hall.io/tech-fest-2026"><img alt="CFP Tech F'Est 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-February-2026&color=green"></a>
- 16 juin 2026 : [Mobilis In Mobile 2026](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/mobilis-in-mobile-2026"><img alt="CFP Mobilis In Mobile 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-April-2026&color=green"></a>
- 17-19 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxx.pl/cfp"><img alt="CFP Devoxx Poland" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2026&color=green"></a>
- 17-20 juin 2026 : [VivaTech](https://vivatechnology.com) - Paris (France) 
- 18 juin 2026 : [Tech'Work](https://techwork.events) - Lyon (France) <a href="https://conference-hall.io/tech-work-lyon-2026"><img alt="CFP Tech'Work 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-March-2026&color=green"></a>
- 22-26 juin 2026 : [Galaxy Community Conference](https://galaxyproject.org/events/gcc2026/) - Clermont-Ferrand (France) 
- 24-25 juin 2026 : [Agi'Lille 2026](https://agilille.fr) - Lille (France) <a href="https://sessionize.com/agilille-2026"><img alt="CFP Agi'Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-March-2026&color=green"></a>
- 24-26 juin 2026 : [BreizhCamp 2026](https://www.breizhcamp.org) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2026"><img alt="CFP BreizhCamp 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-March-2026&color=green"></a>
- 2 juillet 2026 : [Azur Tech Summer 2026](https://www.telecom-valley.fr/azurtechsummer/) - Valbonne (France) <a href="https://conference-hall.io/azur-tech-summer-2026"><img alt="CFP Azur Tech Summit 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-March-2026&color=green"></a>
- 2-3 juillet 2026 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2026"><img alt="CFP Sunny Tech 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2026&color=green"></a>
- 3 juillet 2026 : [Agile Lyon 2026](https://www.agilelyon.fr/) - Lyon (France) <a href="https://sessionize.com/agile-lyon-2026/"><img alt="CFP Agile Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-March-2026&color=green"></a>
- 6-8 juillet 2026 : [Riviera Dev](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/riviera-dev-2026"><img alt="CFP Riviera Dev" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-February-2026&color=green"></a>
- 2 août 2026 : [4th Tech Summit on Artificial Intelligence & Robotics](https://artificialintelligence.averconferences.com) - Paris (France) 
- 20-22 août 2026 : [4th Tech Summit on AI & Robotics](https://artificialintelligence.averconferences.com/) - Paris (France) & Online <a href="https://artificialintelligence.averconferences.com/scientific_session.php"><img alt="CFP tech summit 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-August-2026&color=green"></a>
- 4 septembre 2026 : [JUG Summer Camp 2026](https://www.jugsummercamp.org/) - La Rochelle (France) 
- 17-18 septembre 2026 : [API Platform Conference 2026](https://api-platform.com/fr/con/) - Lille (France) <a href="https://api-platform.com/fr/con/2026/call-for-papers/"><img alt="CFP API Platform Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-March-2026&color=green"></a>
- 24 septembre 2026 : [PlatformCon Live Day Paris 2026](https://platformconlive.fr/) - Paris (France) 
- 1 octobre 2026 : [WAX 2026](https://www.waxconf.fr/) - Marseille (France) <a href="https://conference-hall.io/wax-2026-conference-tech-au-stade-velodrome"><img alt="CFP WAX 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2026&color=green"></a>
- 1-2 octobre 2026 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) <a href="https://conference-hall.io/volcamp-2026"><img alt="CFP Volcamp 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2026&color=green"></a>
- 5-9 octobre 2026 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

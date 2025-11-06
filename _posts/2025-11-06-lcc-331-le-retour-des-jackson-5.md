---
title: LCC 331 - Le retour des jackson 5
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 331
youtube: n6UKz0yN5A0
mp3_length: 52760058
tweet: Le retour des jackson 5 #Java #JUnit #Grails #Jackson #Groovy #IA #React #Wasm #UUID #RAG #MCP #NanoBanana #YAML #Documentation #RTO #CloudCode
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Arnaud et Guillaume discutent des dernières évolutions dans le monde de la programmation, notamment les nouveautés de Java 25, JUnit 6, et Jackson 3.
Ils abordent également les récents développements en IA, les problèmes rencontrés dans le cloud, et l'état actuel de React et du web.
Dans cette conversation, les intervenants abordent divers sujets liés à la technologie, notamment les spécifications de Wasteme, l'utilisation des UUID dans les bases de données, l'approche RAG en intelligence artificielle, les outils MCP, et la création d'images avec Nano Banana. Ils discutent également des complexités du format YAML, des récents dramas dans la communauté Ruby, de l'importance d'une bonne documentation, des politiques de retour au bureau, et des avancées de Cloud Code. Enfin, ils évoquent l'initiative de cafés IA pour démystifier l'intelligence artificielle.

Enregistré le 24 octobre 2025

Téléchargement de l’épisode [LesCastCodeurs-Episode-331.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-331.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=n6UKz0yN5A0).

## News


### Langages

GraalVM se détache du release train de Java
[https://blogs.oracle.com/java/post/detaching-graalvm-from-the-java-ecosystem-train](https://blogs.oracle.com/java/post/detaching-graalvm-from-the-java-ecosystem-train)


Un article de Loic Mathieu sur Java 25 et ses nouvelles fonctionalités [https://www.loicmathieu.fr/wordpress/informatique/java-25-whats-new/](https://www.loicmathieu.fr/wordpress/informatique/java-25-whats-new/)


Sortie de Groovy 5.0 !
[https://groovy-lang.org/releasenotes/groovy-5.0.html](https://groovy-lang.org/releasenotes/groovy-5.0.html)

- **Groovy 5**: Évolution des versions précédentes, nouvelles fonctionnalités et simplification du code.
- **Compatibilité JDK étendue**: Full support JDK 11-25, fonctionnalités JDK 17-25 disponibles sur les JDK plus anciens.
- **Extension majeure des méthodes**: Plus de 350 méthodes améliorées, opérations sur tableaux jusqu’à 10x plus rapides, itérateurs paresseux.
- **Améliorations des transformations AST**: Nouveau `@OperatorRename`, génération automatique de `@NamedParam` pour `@MapConstructor` et `copyWith`.
- **REPL (groovysh) modernisé**: Basé sur JLine 3, support multi-plateforme, coloration syntaxique, historique et complétion.
- **Meilleure interopérabilité Java**: Pattern Matching pour `instanceof`, support JEP-512 (fichiers source compacts et méthodes `main` d’instance).
- **Standards web modernes**: Support Jakarta EE (par défaut) et Javax EE (héritage) pour la création de contenu web.
- **Vérification de type améliorée**: Contrôle des chaînes de format plus robuste que Java.
- **Additions au langage**: Génération d’itérateurs infinis, variables d’index dans les boucles, opérateur d’implication logique `==>`.
- **Améliorations diverses**: Import automatique de `java.time.**`, `var` avec multi-assignation, groupes de capture nommés pour regex (`=~`), méthodes utilitaires de graphiques à barres ASCII.
- **Changements impactants**: Plusieurs modifications peuvent nécessiter une adaptation du code existant (visibilité, gestion des imports, comportement de certaines méthodes).
- **Exigences JDK*: Construction avec JDK17+, exécution avec JDK11+.


### Librairies

Intégration de LangChain4j dans ADK pour Java, permettant aux développeurs d’utiliser n’importe quel LLM avec leurs agents ADK
[https://developers.googleblog.com/en/adk-for-java-opening-up-to-third-party-language-models-via-langchain4j-integration/](https://developers.googleblog.com/en/adk-for-java-opening-up-to-third-party-language-models-via-langchain4j-integration/)

- **ADK pour Java 0.2.0** : Nouvelle version du kit de développement d’agents de Google.
- **Intégration LangChain4j** : Ouvre ADK à des modèles de langage tiers.
- **Plus de choix de LLM** : En plus de Gemini et Claude, accès aux modèles d’OpenAI, Anthropic, Mistral, etc.
- **Modèles locaux supportés** : Utilisation possible de modèles via Ollama ou Docker Model Runner.
- **Améliorations des outils** : Création d’outils à partir d’instances d’objets, meilleur support asynchrone et contrôle des boucles d’exécution.
- **Logique et mémoire avancées** : Ajout de callbacks en chaîne et de nouvelles options pour la gestion de la mémoire et le RAG (Retrieval-Augmented Generation).
- **Build simplifié** : Introduction d’un POM parent et du Maven Wrapper pour un processus de construction cohérent.

JUnit 6 est sorti
[https://docs.junit.org/6.0.0/release-notes/](https://docs.junit.org/6.0.0/release-notes/)

- :sparkles: Java 17 and Kotlin 2.2 baseline
- :sunrise_over_mountains: JSpecify nullability annotations
- :airplane_departure: Integrated JFR support
- :suspension_railway: Kotlin suspend function support
- :octagonal_sign: Support for cancelling test execution
- :broom: Removal of deprecated APIs

JGraphlet, une librairie Java sans dépendances pour créer des graphes de tâches à exécuter
[https://shaaf.dev/post/2025-08-25-think-in-graphs-not-just-chains-jgraphlet-for-taskpipelines/](https://shaaf.dev/post/2025-08-25-think-in-graphs-not-just-chains-jgraphlet-for-taskpipelines/)

- **JGraphlet**: Bibliothèque Java légère (zéro-dépendance) pour construire des pipelines de tâches.
- **Principes clés**: Simplicité, basée sur un modèle d’exécution de graphe.
- **Tâches**: Chaque tâche a une entrée/sortie, peut être asynchrone (`Task<I,O>`) ou synchrone (`SyncTask<I,O>`).
- **Pipeline**: Un `TaskPipeline` construit et exécute le graphe, gère les I/O.
- **Modèle Graph-First**: Le flux de travail est un Graphe Orienté Acyclique (DAG).
  - Définition des tâches comme des nœuds, des connexions comme des arêtes.
  - Support naturel des motifs fan-out et fan-in.
- **API simple**: `addTask("id", task)`, `connect("fromId", "toId")`.
- **Fan-in**: Une tâche recevant plusieurs entrées reçoit une `Map<String, Object>` (clés = IDs des tâches parentes).
- **Exécution**: `pipeline.run(input)` retourne un `CompletableFuture` (peut être bloquant via `.join()` ou asynchrone).
- **Cycle de vie**: `TaskPipeline` est `AutoCloseable`, garantissant la libération des ressources (`try-with-resources`).
- **Contexte**: `PipelineContext` pour partager des données/métadonnées thread-safe entre les tâches au sein d’une exécution.
- **Mise en cache**: Option de mise en cache pour les tâches afin d’éviter les re-calculs.

Au tour de Microsoft de lancer son (Microsoft) Agent Framework, qui semble être une fusion / réécriture de AutoGen et de Semnatic Kernel
[https://x.com/pyautogen/status/1974148055701028930](https://x.com/pyautogen/status/1974148055701028930)

- Plus de détails dans le blog post : [https://devblogs.microsoft.com/foundry/introducing-microsoft-agent-framework-the-open-source-engine-for-agentic-ai-apps/](https://devblogs.microsoft.com/foundry/introducing-microsoft-agent-framework-the-open-source-engine-for-agentic-ai-apps/)
- SDK &amp; runtime open-source pour systèmes multi-agents sophistiqués. **Unifie Semantic Kernel et AutoGen**.
- **Piliers :**
  - Standards ouverts (MCP, A2A, OpenAPI) et interopérabilité.
  - Passerelle recherche-production (patterns AutoGen pour l’entreprise).
  - Extensible, modulaire, open-source, connecteurs intégrés.
  - Prêt pour la production (observabilité, sécurité, durabilité, “human in the loop”).
- **Relation SK/AutoGen :** S’appuie sur eux, ne les remplace pas, simplifie la migration.
- **Intégrations futures :** Alignement avec Microsoft 365 Agents SDK et Azure AI Foundry Agent Service.

Sortie de Jackson 3.0 (bientôt les Jackson Five !!!)
[https://cowtowncoder.medium.com/jackson-3-0-0-ga-released-1f669cda529a](https://cowtowncoder.medium.com/jackson-3-0-0-ga-released-1f669cda529a)

- Jackson 3.0.0 a été publié le 3 octobre 2025.
- Objectif : base propre pour le développement à long terme, suppression de la dette technique, architecture simplifiée, amélioration de l’ergonomie.
- **Principaux changements :**
  - **Baseline Java 17** requise (vs Java 8 pour 2.x).
  - **Group ID Maven et package Java renommés** en `tools.jackson` pour la coexistence avec Jackson 2.x. (Exception: `jackson-annotations` ne change pas).
  - **Suppression de toutes les fonctionnalités `@Deprecated`** de Jackson 2.x et renommage de plusieurs entités/méthodes clés.
  - **Modification des paramètres de configuration par défaut** (ex: `FAIL_ON_UNKNOWN_PROPERTIES` désactivé).
  - **`ObjectMapper` et `TokenStreamFactory` sont désormais immutables**, la configuration se fait via des builders.
  - **Passage à des exceptions de base non vérifiées** (`JacksonException`) pour plus de commodité.
  - **Intégration des “modules Java 8”** (pour les noms de paramètres, `Optional`, `java.time`) directement dans l’`ObjectMapper` par défaut.
  - **Amélioration du modèle d’arbre `JsonNode`** (plus de configurabilité, meilleure gestion des erreurs).

Testcontainers Java 2.0 est sorti [https://github.com/testcontainers/testcontainers-java/releases/tag/2.0.0](https://github.com/testcontainers/testcontainers-java/releases/tag/2.0.0)

- Removed JUnit 4 support -> ups

Grails 7.0 est sortie, avec son arrivée à la fondation Apache
[https://grails.apache.org/blog/2025-10-18-introducing-grails-7.html](https://grails.apache.org/blog/2025-10-18-introducing-grails-7.html)

- **Sortie d’Apache Grails 7.0.0** annoncée le 18 octobre 2025.
- **Grails est devenu un projet de premier niveau (TLP)** de l’Apache Software Foundation (ASF), graduant d’incubation.
- Mise à jour des dépendances vers Groovy 4.0.28, Spring Boot 3.5.6, Jakarta EE.

Tout pour bien démarrer et développer des agents IA avec ADK pour Java
[https://glaforge.dev/talks/2025/10/22/building-ai-agents-with-adk-for-java/](https://glaforge.dev/talks/2025/10/22/building-ai-agents-with-adk-for-java/)

- Guillaume a partagé plein de resources sur le développement d’agents IA avec ADK pour Java
- Un article avec tous les pointeurs
- Un slide deck et l’enregistrement vidéo de la présentation faite lors de Devoxx Belgique
- Un codelab avec des instructions pour démarrer et créer ses premiers agents
- Plein d’autres samples pour s’inspirer et voir les possibilités offertes par le framework
- Et aussi un template de projet sur GitHub, avec un build Maven et un premier agent d’exemple



### Cloud

Internet cassé, du moins la partie hébergée par AWS #hugops
[https://www.theregister.com/2025/10/20/aws_outage_amazon_brain_drain_corey_quinn/](https://www.theregister.com/2025/10/20/aws_outage_amazon_brain_drain_corey_quinn/)

- Panne majeure d’AWS (région US-EAST-1) : problème DNS affectant DynamoDB, service fondamental, causant des défaillances en cascade de nombreux services internet.
- Réponse lente : 75 minutes pour identifier la cause profonde; la page de statut affichait initialement “tout va bien”.
- Cause sous-jacente principale : “fuite des cerveaux” (départ d’ingénieurs AWS seniors).
- Perte de connaissances institutionnelles : des décennies d’expertise critique sur les systèmes AWS et les modes de défaillance historiques parties avec ces départs.
- Prédictions confirmées : un ancien d’AWS avait anticipé une augmentation des pannes majeures en 2024.
- Preuves de la perte de talents :
  - Plus de 27 000 licenciements chez Amazon (2022-2025).
  - Taux élevé de “départs regrettés” (69-81%).
  - Mécontentement lié à la politique de “Return to Office” et au manque de reconnaissance de l’expertise.
- Conséquences : les nouvelles équipes, plus réduites, manquent de l’expérience nécessaire pour prévenir les pannes ou réduire les temps de récupération.
- Perspective : Le marché pourrait pardonner cette fois, mais le problème persistera, rendant les futurs incidents plus probables.


### Web

React a gagné “par défaut”
[https://www.lorenstew.art/blog/react-won-by-default/](https://www.lorenstew.art/blog/react-won-by-default/)

- React domine par défaut, non par mérite technique, étouffant ainsi l’innovation front-end.
- Choix par réflexe (“tout le monde connaît React”), freinant l’évaluation d’alternatives potentiellement supérieures.
- Fondations techniques de React (V-DOM, complexité des Hooks, Server Components) vues comme des contraintes actuelles.
- Des frameworks innovants (Svelte pour la compilation, Solid pour la réactivité fine, Qwik pour la “resumability”) offrent des modèles plus performants mais sont sous-adoptés.
- La monoculture de React génère une dette technique (runtime, réconciliation) et centre les compétences sur le framework plutôt que sur les fondamentaux web.
- L’API React est complexe, augmentant la charge cognitive et les risques de bugs, contrairement aux alternatives plus simples.
- L’effet de réseau crée une “prison”: offres d’emploi spécifiques, inertie institutionnelle, leaders choisissant l’option “sûre”.
- Nécessité de choisir les frameworks selon les contraintes du projet et le mérite technique, non par inertie.
- Les arguments courants (maturité de l’écosystème, recrutement, bibliothèques, stabilité) sont remis en question; une dépendance excessive peut devenir un fardeau.
- La monoculture ralentit l’évolution du web et détourne les talents, nuisant à la diversité essentielle pour un écosystème sain et innovant.
- Promouvoir la diversité des frameworks pour un écosystème plus résilient et innovant.

WebAssembly 3 est sortie [https://webassembly.org/news/2025-09-17-wasm-3.0/](https://webassembly.org/news/2025-09-17-wasm-3.0/)



### Data et Intelligence Artificielle

UUIDv4 ou UUIDv7 pour vos clés primaires ? Ça dépend... surtout pour les bases de données super distribuées !
[https://medium.com/google-cloud/understanding-uuidv7-and-its-impact-on-cloud-spanner-b8d1a776b9f7](https://medium.com/google-cloud/understanding-uuidv7-and-its-impact-on-cloud-spanner-b8d1a776b9f7)

- UUIDv4 : identifiants entièrement aléatoires.
  - Cause des problèmes de performance dans les bases de données relationnelles (ex: PostgreSQL, MySQL, SQL Server) utilisant des index B-Tree.
  - Inserts aléatoires réduisent l’efficacité du cache, entraînent des divisions de pages et la fragmentation.
- UUIDv7 : nouveau standard conçu pour résoudre ces problèmes.
  - Intègre un horodatage (48 bits) en préfixe de l’identifiant, le rendant ordonné temporellement et “k-sortable”.
  - Améliore la performance dans les bases B-Tree en favorisant les inserts séquentiels, la localité du cache et réduisant la fragmentation.
- Problème de UUIDv7 pour certaines bases de données distribuées et scalables horizontalement comme Spanner :
  - La nature séquentielle d’UUIDv7 (via l’horodatage) crée des “hotspots d’écriture” (points chauds) dans Spanner.
  - Spanner distribue les données en “splits” (partitions) basées sur les plages de clés. Les clés séquentielles concentrent les écritures sur un seul “split”.
  - Ceci empêche Spanner de distribuer la charge et de scaler les écritures, créant un goulot d’étranglement (“anti-pattern”).
- Quand ce n’est PAS un problème pour Spanner :
  - Si le taux d’écriture total est inférieur à environ 3 500 écritures/seconde pour un seul “split”.
  - Le hotspot est “bénin” à cette échelle et n’entraîne pas de dégradation de performance.
- Solutions pour Spanner :
  - Principe clé : S’assurer que la première partie de la clé primaire est NON séquentielle pour distribuer les écritures. UUIDv7 peut être utilisé, mais pas comme préfixe.
- Nouvelle conception (“greenfield”) :
-         ▪︎ Utiliser une clé primaire non-séquentielle (ex: UUIDv4 simple).
  - Pour les requêtes basées sur le temps, créer un index secondaire sur la colonne d’horodatage, mais le SHARDER (ex: `shardId`) pour éviter les hotspots sur l’index lui-même.
- Migration (garder UUIDv7) :
-         ▪︎ Ajouter un préfixe de sharding : Introduire une colonne `shard` calculée (ex: `MOD(ABS(FARM_FINGERPRINT(order_id_v7)), N)`) et l’utiliser comme PREMIER élément d’une clé primaire composite (`PRIMARY KEY (shard, order_id_v7)`).
  - Réordonner les colonnes (si clé primaire composite existante) : Si la clé primaire est déjà composite (ex: `(order_id_v7, tenant_id)`), réordonner en `(tenant_id, order_id_v7)`. Cela aide si `tenant_id` a une cardinalité élevée et distribue bien. (Un `tenant_id` très actif pourrait toujours nécessiter un préfixe de sharding supplémentaire).

RAG en prod, comment améliorer la pertinence des résultats
[https://blog.abdellatif.io/production-rag-processing-5m-documents](https://blog.abdellatif.io/production-rag-processing-5m-documents)

- Démarrage rapide avec Langchain + Llamaindex: prototype fonctionnel, mais résultats de production jugés “subpar” par les utilisateurs.
- Ce qui a amélioré la performance (par ROI):
  - **Génération de requêtes**: LLM crée des requêtes sémantiques et mots-clés multiples basées sur le fil de discussion pour une meilleure couverture.
  - **Reranking**: La technique la plus efficace, modifie grandement le classement des fragments (chunks).
  - **Stratégie de découpage (Chunking)**: Nécessite beaucoup d’efforts, compréhension des données, création de fragments logiques sans coupures.
  - **Métadonnées à l’LLM**: L’injection de métadonnées (titre, auteur) améliore le contexte et les réponses.
  - **Routage de requêtes**: Détecte et traite les questions non-RAG (ex: résumer, qui a écrit) via API/LLM distinct.


### Outillage

Créer un serveur MCP (mode HTTP Streamable) avec Micronaut et quelques éléments de comparaison avec Quarkus
[https://glaforge.dev/posts/2025/09/16/creating-a-streamable-http-mcp-server-with-micronaut/](https://glaforge.dev/posts/2025/09/16/creating-a-streamable-http-mcp-server-with-micronaut/)

- Micronaut propose désormais un support officiel pour le protocole MCP.
- Exemple : un serveur MCP pour les phases lunaires (similaire à une version Quarkus pour la comparaison).
- Définition des outils MCP via les annotations `@Tool` et `@ToolArg`.
- Point fort : Micronaut gère automatiquement la validation des entrées (ex: `@NotBlank`, `@Pattern`), éliminant la gestion manuelle des erreurs.
- Génération automatique de schémas JSON détaillés pour les structures d’entrée/sortie grâce à `@JsonSchema`.
- Nécessite une configuration pour exposer les schémas JSON générés comme ressources statiques.
- Dépendances clés : `micronaut-mcp-server-java-sdk` et les modules `json-schema`.
- Testé avec l’inspecteur MCP et intégration avec l’outil Gemini CLI.
- Micronaut offre une gestion élégante des entrées/sorties structurées grâce à son support JSON Schema riche.

Un agent IA créatif : comment utiliser le modèle Nano Banana pour générer et éditer des images (en Java, avec ADK)
[https://glaforge.dev/posts/2025/09/22/creative-ai-agents-with-adk-and-nano-banana/](https://glaforge.dev/posts/2025/09/22/creative-ai-agents-with-adk-and-nano-banana/)

- Modèles de langage (LLM) deviennent multimodaux : traitent diverses entrées (texte, images, vidéo, audio).
- Nano Banana (gemini-2.5-flash-image-preview) : modèle Gemini, génère et édite des images, pas seulement du texte.
- ADK (Agent Development Kit pour Java) : pour configurer des agents IA créatifs utilisant ce type de modèle.
- Application : Base pour des workflows créatifs complexes (ex: agent de marketing, enchaînement d’agents pour génération d’assets).

Un vieil article (6 mois) qui illustre les problèmes du format de fichier YAML
[https://ruudvanasseldonk.com/2023/01/11/the-yaml-document-from-hell](https://ruudvanasseldonk.com/2023/01/11/the-yaml-document-from-hell)

- YAML est extrêmement complexe malgré son objectif de convivialité humaine.
- Spécification volumineuse et versionnée (YAML 1.1, 1.2 diffèrent significativement).
- Comportements imprévisibles et “pièges” (footguns) courants :
  - Nombres sexagésimaux (ex: `22:22` parsé comme `1342` en YAML 1.1).
  - Tags (`!.git`) pouvant mener à des erreurs ou à l’exécution de code arbitraire.
  - “Problème de la Norvège” : `no` interprété comme `false` en YAML 1.1.
  - Clés non-chaînes de caractères (`on` peut devenir une clé booléenne `True`).
  - Nombres accidentels si non-guillemets (ex: `10.23` comme flottant).
- La coloration syntaxique n’est pas fiable pour détecter ces subtilités.
- Le templating de documents YAML est une mauvaise idée, source d’erreurs et complexe à gérer.
- Alternatives suggérées :
  - TOML : Similaire à YAML mais plus sûr (chaînes toujours entre guillemets), permet les commentaires.
  - JSON avec commentaires (utilisé par VS Code), mais moins répandu.
  - Utiliser un sous-ensemble simple de YAML (difficile à faire respecter).
- Générer du JSON à partir de langages de programmation plus puissants :
-         ▪︎ Nix : Excellent pour l’abstraction et la réutilisation de configuration.
  - Python : Facilite la création de JSON avec commentaires et logique.

Gros binz dans la communauté Ruby, avec l’influence de grosses boîtes, et des pratiques un peu douteuses
[https://joel.drapper.me/p/rubygems-takeover/](https://joel.drapper.me/p/rubygems-takeover/)




### Méthodologies

Les qualités d’une bonne documentation
[https://leerob.com/docs](https://leerob.com/docs)

- Rapidité
  - Chargement très rapide des pages (préférer statique).
  - Optimisation des images, polices et scripts.
  - Recherche ultra-rapide (chargement et affichage des résultats).
- Lisibilité
  - Concise, éviter le jargon technique.
  - Optimisée pour le survol (gras, italique, listes, titres, images).
  - Expérience utilisateur simple au départ, complexité progressive.
  - Multiples exemples de code (copier/coller).
- Utilité
  - Documenter les solutions de contournement (workarounds).
  - Faciliter le feedback des lecteurs.
  - Vérification automatisée des liens morts.
  - Matériel d’apprentissage avec un curriculum structuré.
  - Guides de migration pour les changements majeurs.
- Compatible IA
  - Trafic majoritairement via les crawlers IA.
  - Préférer cURL aux “clics”, les prompts aux tutoriels.
  - Barre latérale “Demander à l’IA” référençant la documentation.
- Prêt pour les agents
  - Faciliter le copier/coller de contenu en Markdown pour les chatbots.
  - Possibilité de visualiser les pages en Markdown (ex: via l’URL).
  - Fichier `llms.txt` comme répertoire de fichiers Markdown.
- Finition soignée
  - Zones de clic généreuses (boutons, barres latérales).
  - Barres latérales conservant leur position de défilement et état déplié.
  - Bons états actifs/survol.
  - Images OG dynamiques.
  - Titres/sections lienables avec ancres stables.
  - Références et liens croisés entre guides, API, exemples.
  - Balises méta/canoniques pour un affichage propre dans les moteurs de recherche.
- Localisée
  - Pas de `/en` par défaut dans l’URL.
  - Routage côté serveur pour la langue.
  - Localisation des chaînes statiques et du contenu.
- Responsive
  - Excellents menus mobiles / support Safari iOS.
  - Info-bulles sur desktop, popovers sur mobile.
- Accessible
  - Lien “ignorer la navigation” vers le contenu principal.
  - Toutes les images avec des balises `alt`.
  - Respect des paramètres système de mouvement réduit.
- Universelle
  - Livrer la documentation “en tant que code” (JSDoc, package).
  - Livrer via des plateformes comme Context7, ou dans `node_modules`.
  - Fichiers de règles (ex: `AGENTS.md`) avec le produit.
  - Évaluations et modèles spécifiques recommandés pour le produit.



### Loi, société et organisation

Microsoft va imposer une politique de Return To Office [https://www.businessinsider.com/microsoft-execs-explain-rto-mandate-in-internal-meeting-2025-9](https://www.businessinsider.com/microsoft-execs-explain-rto-mandate-in-internal-meeting-2025-9)

- Microsoft impose 3 jours de présence au bureau par semaine à partir de février 2026, débutant par la région de Seattle
- Le CEO Satya Nadella explique que le télétravail a affaibli les liens sociaux nécessaires à l'innovation
- Les dirigeants citent des données internes montrant que les employés présents au bureau "prospèrent" davantage
- L'équipe IA de Microsoft doit être présente 4 jours par semaine, règles plus strictes pour cette division stratégique
- Les employés peuvent demander des exceptions jusqu'au 19 septembre 2025 pour trajets complexes ou absence d'équipe locale
- Amy Coleman (RH) affirme que la collaboration en personne améliore l'énergie et les résultats, surtout à l'ère de l'IA
- La politique s'appliquera progressivement aux 228 000 employés dans le monde après les États-Unis
- Les réactions sont mitigées, certains employés critiquent la perte d'autonomie et les bureaux inadéquats
- Microsoft rattrape ses concurrents tech qui ont déjà imposé des retours au bureau plus stricts
- Cette décision intervient après 15 000 licenciements en 2025, créant des tensions avec les employés

Comment Claude Code est né ? (l’histoire de sa création)
[https://newsletter.pragmaticengineer.com/p/how-claude-code-is-built](https://newsletter.pragmaticengineer.com/p/how-claude-code-is-built)

- Claude Code : outil de développement “AI-first” créé par Boris Cherny, Sid Bidasaria et Cat Wu.
- Performance impressionnante : 500M$ de revenus annuels, utilisation multipliée par 10 en 3 mois.
- Adoption interne massive : Plus de 80% des ingénieurs d’Anthropic l’utilisent quotidiennement, y compris les data scientists.
- Augmentation de productivité : 67% d’augmentation des Pull Requests (PR) par ingénieur malgré le doublement de l’équipe.
- Origine : Commande CLI simple évoluant vers un outil accédant au système de fichiers, exploitant le “product overhang” du modèle Claude.
- Raison du lancement public : Apprendre sur la sécurité et les capacités des modèles d’IA.
- Pile technologique “on distribution” : TypeScript, React (avec Ink), Yoga, Bun. Choisie car le modèle Claude est déjà très performant avec ces technologies.
- “Claude Code écrit 90% de son propre code” : Le modèle prend en charge la majeure partie du développement.
- Architecture légère : Simple “shell” autour du modèle Claude, minimisant la logique métier et le code (suppression constante de code superflu).
- Exécution locale : Privilégiée pour sa simplicité, sans virtualisation.
- Sécurité : Système de permissions granulaire demandant confirmation avant chaque action potentiellement dangereuse (ex: suppression de fichiers).
- Développement rapide :
  - Jusqu’à 100 releases internes/jour, 1 release externe/jour.
  - 5 Pull Requests/ingénieur/jour.
  - Prototypage ultra-rapide (ex: 20+ prototypes d’une fonctionnalité en quelques heures) grâce aux agents IA.
- Innovation UI/UX : Redéfinit l’expérience du terminal grâce à l’interaction LLM, avec des fonctionnalités comme les sous-agents, les styles de sortie configurables, et un mode “Learning”.

Le 1er Café IA publique a Paris

[https://www.linkedin.com/pulse/my-first-caf%25C3%25A9-ia-paris-room-full-curiosity-an[…]o-goncalves-r9ble/?trackingId=%2FPHKdAimR4ah6Ep0Qbg94w%3D%3D](https://www.linkedin.com/pulse/my-first-caf%25C3%25A9-ia-paris-room-full-curiosity-antonio-goncalves-r9ble/?trackingId=%2FPHKdAimR4ah6Ep0Qbg94w%3D%3D)






## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

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
- 19 novembre 2025 : [SREday Paris 2025 Q4](https://sreday.com/2025-paris-q4/) - Paris (France) <a href="https://www.papercall.io/sreday-paris-2025-q4"><img alt="CFP SREday Paris 2025 Q4" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-September-2025&color=red"></a>
- 19-21 novembre 2025 : [Agile Grenoble](https://agile-grenoble.org/) - Grenoble (France) 
- 20 novembre 2025 : [OVHcloud Summit](https://summit.ovhcloud.com/fr/) - Paris (France) 
- 21 novembre 2025 : [DevFest Paris 2025](https://devfest.gdgparis.fr/) - Paris (France) <a href="https://conference-hall.io/devfest-paris-2025"><img alt="CFP DevFest Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2025&color=red"></a>
- 24 novembre 2025 : [Forward Data & AI Conference](https://www.forward-data-conference.com/) - Paris (France) 
- 27 novembre 2025 : [DevFest Strasbourg 2025](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/devfest-strasbourg-2025"><img alt="CFP DevFest Strasbourg 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-July-2025&color=red"></a>
- 28 novembre 2025 : [DevFest Lyon](https://devfest.gdglyon.com/) - Lyon (France) <a href="https://conference-hall.io/devfest-lyon-2025"><img alt="DevFest Lyon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=red"></a>
- 1-2 décembre 2025 : [Tech Rocks Summit 2025](https://events.tech.rocks/tech-rocks-summit-2025) - Paris (France) 
- 4-5 décembre 2025 : [Agile Tour Rennes](https://agiletour.agilerennes.org/) - Rennes (France) 
- 5 décembre 2025 : [DevFest Dijon 2025](https://devfest.developers-group-dijon.fr/) - Dijon (France) <a href="https://conference-hall.io/devfest-dijon-2025"><img alt="CFP Devest Dijon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 9-11 décembre 2025 : [APIdays Paris](https://www.apidays.global/paris/) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP API Days Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-November-2025&color=green"></a>
- 9-11 décembre 2025 : [Green IO Paris](https://greenio.tech/conference/17/paris-2025-december) - Paris (France) <a href="https://apidays.typeform.com/to/SMHd2wFE?=green-io-conference%3Dcall-for-speakers&typeform-source=greenio.tech"><img alt="CFP Green IO Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-December-2025&color=green"></a>
- 10-11 décembre 2025 : [Devops REX](https://www.devopsrex.fr/) - Paris (France) <a href="https://talks.devopsdays.org/devops-rex-2025/cfp"><img alt="CFP Devops REX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=red"></a>
- 10-11 décembre 2025 : [Open Source Experience](https://www.opensource-experience.com) - Paris (France) 
- 11 décembre 2025 : [Normandie.ai 2025](https://normandie.ai/) - Rouen (France) <a href="https://conference-hall.io/normandie-ai-2025"><img alt="CFP Normandie.ai 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-October-2025&color=red"></a>
- 14-17 janvier 2026 : [SnowCamp 2026](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/snowcamp-2026"><img alt="CFP SnowCamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2025&color=red"></a>
- 29-31 janvier 2026 : [Epitech Summit 2026 - Paris](https://conference-hall.io/epitech-summit-2026) - Paris (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 2-5 février 2026 : [Epitech Summit 2026 - Moulins](https://conference-hall.io/epitech-summit-2026) - Moulins (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 2-6 février 2026 : [Web Days Convention](https://webdays.events/) - Aix-en-Provence (France) <a href="https://conference-hall.io/web-days-convention"><img alt="CFP Web Days Convention" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-February-2026&color=green"></a>
- 3 février 2026 : [Cloud Native Days France 2026](https://www.cloudnativedays.fr/) - Paris (France) <a href="https://cfp.cloudnativedays.fr/2026/"><img alt="CFP Cloud Native Days France 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-October-2025&color=red"></a>
- 3-4 février 2026 : [Epitech Summit 2026 - Lille](https://conference-hall.io/epitech-summit-2026) - Lille (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 3-4 février 2026 : [Epitech Summit 2026 - Mulhouse](https://conference-hall.io/epitech-summit-2026) - Mulhouse (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 3-4 février 2026 : [Epitech Summit 2026 - Nancy](https://conference-hall.io/epitech-summit-2026) - Nancy (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 3-4 février 2026 : [Epitech Summit 2026 - Nantes](https://conference-hall.io/epitech-summit-2026) - Nantes (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 3-4 février 2026 : [Epitech Summit 2026 - Marseille](https://conference-hall.io/epitech-summit-2026) - Marseille (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 3-4 février 2026 : [Epitech Summit 2026 - Rennes](https://conference-hall.io/epitech-summit-2026) - Rennes (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 3-4 février 2026 : [Epitech Summit 2026 - Montpellier](https://conference-hall.io/epitech-summit-2026) - Montpellier (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 3-4 février 2026 : [Epitech Summit 2026 - Strasbourg](https://conference-hall.io/epitech-summit-2026) - Strasbourg (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 3-4 février 2026 : [Epitech Summit 2026 - Toulouse](https://conference-hall.io/epitech-summit-2026) - Toulouse (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 4-5 février 2026 : [Epitech Summit 2026 - Bordeaux](https://conference-hall.io/epitech-summit-2026) - Bordeaux (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 4-5 février 2026 : [Epitech Summit 2026 - Lyon](https://conference-hall.io/epitech-summit-2026) - Lyon (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 4-6 février 2026 : [Epitech Summit 2026 - Nice](https://conference-hall.io/epitech-summit-2026) - Nice (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 12-13 février 2026 : [Touraine Tech #26](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/touraine-tech-2026"><img alt="CFP TnT 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-November-2025&color=green"></a>
- 26-27 mars 2026 : [SymfonyLive Paris 2026](https://live.symfony.com/2026-paris/) - Paris (France) 
- 31 mars 2026 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-7/"><img alt="CFP ParisTestConf 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-October-2025&color=green"></a>
- 16-17 avril 2026 : [MiXiT 2026](https://mixitconf.org) - Lyon (France) 
- 22-24 avril 2026 : [Devoxx France 2026](https://www.devoxx.fr) - Paris (France) 
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 6-7 mai 2026 : [Devoxx UK 2026](https://www.devoxx.co.uk/) - London (UK) 
- 22 mai 2026 : [AFUP Day 2026 Lille](https://event.afup.org/afup-day-2026/) - Lille (France) <a href="https://afup.org/event/afupday2026lille/cfp"><img alt="CFP AFUP Day Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=green"></a>
- 22 mai 2026 : [AFUP Day 2026 Paris](https://event.afup.org/afup-day-2026/) - Paris (France) <a href="https://afup.org/event/afupday2026paris/cfp"><img alt="CFP AFUP Day Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=green"></a>
- 22 mai 2026 : [AFUP Day 2026 Bordeaux](https://event.afup.org/afup-day-2026/) - Bordeaux (France) <a href="https://afup.org/event/afupday2026bordeaux/cfp"><img alt="CFP AFUP Day Bordeaux 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=green"></a>
- 22 mai 2026 : [AFUP Day 2026 Lyon](https://event.afup.org/afup-day-2026/) - Lyon (France) <a href="https://afup.org/event/afupday2026lyon/cfp"><img alt="CFP AFUP Day Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=green"></a>
- 17 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 
- 4 septembre 2026 : [JUG Summer Camp 2026](https://www.jugsummercamp.org/) - La Rochelle (France) 
- 17-18 septembre 2026 : [API Platform Conference 2026](https://api-platform.com/fr/con/) - Lille (France) 
- 5-9 octobre 2026 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->


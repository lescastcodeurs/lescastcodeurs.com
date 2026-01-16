---
title: LCC 335 - 200 terminaux en prod vendredi
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 335
youtube: x4k9A2OqIFY
mp3_length: 74549733
tweet: 200 terminaux en prod vendredi #IA #Predictions2026 #JavaTerminal #JavaTUI #CSS #outils
# tweet size: 91-93 -> 99-101 #######################################################################
---
De retour à cinq dans l'épisode, les cast codeurs démarrent cette année avec un gros épisode pleins de news et d'articles de fond. IA bien sûr, son impact sur les pratiques, Mockito qui tourne un page, du CSS (et oui), sur le (non) mapping d'APIs REST en MCP et d'une palanquée d'outils pour vous.

Enregistré le 9 janvier 2026

Téléchargement de l’épisode [LesCastCodeurs-Episode-335.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-335.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=x4k9A2OqIFY).

## News


### Langages

2026 sera-t'elle l'année de Java dans le terminal ?
(j'ai ouïe dire que ça se pourrait bien...)
[https://xam.dk/blog/lets-make-2026-the-year-of-java-in-the-terminal/](https://xam.dk/blog/lets-make-2026-the-year-of-java-in-the-terminal/)

- 2026: Année de Java dans le terminal, pour rattraper son retard sur Python, Rust, Go et Node.js.
- Java est sous-estimé pour les applications CLI et les TUIs (interfaces utilisateur terminales) malgré ses capacités.
- Les anciennes excuses (démarrage lent, outillage lourd, verbosité, distribution complexe) sont obsolètes grâce aux avancées récentes :
- GraalVM Native Image pour un démarrage en millisecondes.
- JBang pour l'exécution simplifiée de scripts Java (fichiers uniques, dépendances) et de JARs.
- JReleaser pour l'automatisation de la distribution multi-plateforme (Homebrew, SDKMAN, Docker, images natives).
- Project Loom pour la concurrence facile avec les threads virtuels.
- PicoCLI pour la gestion des arguments.
- Le potentiel va au-delà des scripts : création de TUIs complètes et esthétiques (ex: dashboards, gestionnaires de fichiers, assistants IA).
- Excuses caduques : démarrage rapide (GraalVM), légèreté (JBang), distribution simple (JReleaser), concurrence (Loom).
- Potentiel : créer des applications TUI riches et esthétiques.

Sortie de Ruby 4.0.0 [https://www.ruby-lang.org/en/news/2025/12/25/ruby-4-0-0-released/](https://www.ruby-lang.org/en/news/2025/12/25/ruby-4-0-0-released/)

- **Ruby Box (expérimental)** : Une nouvelle fonctionnalité permettant d'isoler les définitions (classes, modules, monkey patches) dans des boîtes séparées pour éviter les conflits globaux.
- **ZJIT** : Un nouveau compilateur JIT de nouvelle génération développé en Rust, visant à surpasser YJIT à terme (actuellement en phase expérimentale).
- **Améliorations de Ractor** : Introduction de `Ractor::Port` pour une meilleure communication entre Ractors et optimisation des structures internes pour réduire les contentions de verrou global.
- **Changements syntaxiques** : Les opérateurs logiques (`||`, `&amp;&amp;`, `and`, `or`) en début de ligne permettent désormais de continuer la ligne précédente, facilitant le style "fluent".
- **Classes Core** : `Set` et `Pathname` deviennent des classes intégrées (Core) au lieu d'être dans la bibliothèque standard.
- **Diagnostics améliorés** : Les erreurs d'arguments (`ArgumentError`) affichent désormais des extraits de code pour l'appelant ET la définition de la méthode.
- **Performances** : Optimisation de `Class#new`, accès plus rapide aux variables d'instance et améliorations significatives du ramasse-miettes (GC).
- **Nettoyage** : Suppression de comportements obsolètes (comme la création de processus via `IO.open` avec `|`) et mise à jour vers Unicode 17.0.


### Librairies

Introduction pour créer une appli multi-tenant avec Quarkus et <http://nip.io|nip.io> [https://www.the-main-thread.com/p/quarkus-multi-tenant-api-nipio-tutorial](https://www.the-main-thread.com/p/quarkus-multi-tenant-api-nipio-tutorial)

- Construction d'une API REST multi-tenant en Quarkus avec isolation par sous-domaine
- Utilisation de <http://nip.io|nip.io> pour la résolution DNS automatique sans configuration locale
- Extraction du tenant depuis l'en-tête HTTP Host via un filtre JAX-RS
- Contexte tenant géré avec CDI en scope Request pour l'isolation des données
- Service applicatif gérant des données spécifiques par tenant avec Map concurrent
- Interface web HTML/JS pour visualiser et ajouter des données par tenant
- Configuration CORS nécessaire pour le développement local
- Pattern [acme.127-0-0-1.nip.io](http://acme.127-0-0-1.nip.io) résolu automatiquement vers localhost
- Code complet disponible sur GitHub avec exemples curl et tests navigateur
- Base idéale pour prototypage SaaS, tests multi-tenants 

Hibernate 7.2 avec quelques améliorations intéressantes [https://docs.hibernate.org/orm/7.2/whats-new/%7Bhtml-meta-canonical-link%7D](https://docs.hibernate.org/orm/7.2/whats-new/%7Bhtml-meta-canonical-link%7D)

- read only replica (experimental), crée deux session factories et swap au niveau jdbc si le driver le supporte et custom sinon. On ouvre une session en read only
- child statelesssession (partage le contexte transactionnel)
- hibernate vector module ajouter binary, float16 and sparse vectors
- Le SchemaManager peut resynchroniser les séquences par rapport aux données des tables 
- Regexp dans HQL avec `like`

Nouvelle version de Hibernate with Panache pour Quarkus [https://quarkus.io/blog/hibernate-panache-next/](https://quarkus.io/blog/hibernate-panache-next/)

- Nouvelle extension expérimentale qui unifie Hibernate ORM with Panache et Hibernate Reactive with Panache
- Les entités peuvent désormais fonctionner en mode bloquant ou réactif sans changer de type de base
- Support des sessions sans état (StatelessSession) en plus des entités gérées traditionnelles
- Intégration de Jakarta Data pour des requêtes type-safe vérifiées à la compilation
- Les opérations sont définies dans des repositories imbriqués plutôt que des méthodes statiques
- Possibilité de définir plusieurs repositories pour différents modes d'opération sur une même entité
- Accès aux différents modes (bloquant/réactif, géré/sans état) via des méthodes de supertype
- Support des annotations @Find et @HQL pour générer des requêtes type-safe
- Accès au repository via injection ou via le métamodèle généré
- Extension disponible dans la branche main, feedback demandé sur Zulip ou GitHub

Spring Shell 4.0.0 GA publié - [https://spring.io/blog/2025/12/30/spring-shell-4-0-0-ga-released](https://spring.io/blog/2025/12/30/spring-shell-4-0-0-ga-released)

- Sortie de la version finale de Spring Shell 4.0.0 disponible sur Maven Central
- Compatible avec les dernières versions de Spring Framework et Spring Boot
- Modèle de commandes revu pour simplifier la création d’applications CLI interactives
- Intégration de jSpecify pour améliorer la sécurité contre les NullPointerException
- Architecture plus modulaire permettant meilleure personnalisation et extension
- Documentation et exemples entièrement mis à jour pour faciliter la prise en main
- Guide de migration vers la v4 disponible sur le wiki du projet
- Corrections de bugs pour améliorer la stabilité et la fiabilité
- Permet de créer des applications Java autonomes exécutables avec java -jar ou GraalVM native
- Approche opinionnée du développement CLI tout en restant flexible pour les besoins spécifiques

Une nouvelle version de la librairie qui implémenter des gatherers supplémentaires à ceux du JDK
[https://github.com/tginsberg/gatherers4j/releases/tag/v0.13.0](https://github.com/tginsberg/gatherers4j/releases/tag/v0.13.0)

- `gatherers4j` v0.13.0.
- Nouveaux gatherers : `uniquelyOccurringBy()`, `moving/runningMedian()`, `moving/runningMax/Min()`.
- Changement : les gatherers "moving" incluent désormais par défaut les valeurs partielles (utiliser `excludePartialValues()` pour désactiver).

LangChain4j 1.10.0 [https://github.com/langchain4j/langchain4j/releases/tag/1.10.0](https://github.com/langchain4j/langchain4j/releases/tag/1.10.0)

- Introduction d'un catalogue de modèles pour Anthropic, Gemini, OpenAI et Mistral.
- Ajout de capacités d'observabilité et de monitoring pour les agents.
- Support des sorties structurées, des outils avancés et de l'analyse de PDF via URL pour Anthropic.
- Support des services de transcription pour OpenAI.
- Possibilité de passer des paramètres de configuration de chat en argument des méthodes.
- Nouveau garde-fou de modération pour les messages entrants.
- Support du contenu de raisonnement pour les modèles.
- Introduction de la recherche hybride.
- Améliorations du client MCP.

Départ du lead de mockito après 10 ans [https://github.com/mockito/mockito/issues/3777](https://github.com/mockito/mockito/issues/3777)

- Tim van der Lippe, mainteneur majeur de Mockito, annonce son départ pour mars 2026, marquant une décennie de contribution au projet.
- L'une des raisons principales est l'épuisement lié aux changements récents dans la JVM (JVM 22+) concernant les agents, imposant des contraintes techniques lourdes sans alternative simple proposée par les mainteneurs du JDK.
- Il pointe du doigt le manque de soutien et la pression exercée sur les bénévoles de l'open source lors de ces transitions technologiques majeures.
- La complexité croissante pour supporter Kotlin, qui utilise la JVM de manière spécifique, rend la base de code de Mockito plus difficile à maintenir et moins agréable à faire évoluer selon lui.
- Il exprime une perte de plaisir et préfère désormais consacrer son temps libre à d'autres projets comme Servo, un moteur web écrit en Rust.
- Une période de transition est prévue jusqu'en mars pour assurer la passation de la maintenance à de nouveaux contributeurs.


### Infrastructure

Le premier intérêt de Kubernetes n'est pas le scaling - [https://mcorbin.fr/posts/2025-12-29-kubernetes-scale/](https://mcorbin.fr/posts/2025-12-29-kubernetes-scale/)

- Avant Kubernetes, gérer des applications en production nécessitait de multiples outils complexes (Ansible, Puppet, Chef) avec beaucoup de configuration manuelle
- Le load balancing se faisait avec HAProxy et Keepalived en actif/passif, nécessitant des mises à jour manuelles de configuration à chaque changement d'instance
- Le service discovery et les rollouts étaient orchestrés manuellement, instance par instance, sans automatisation de la réconciliation
- Chaque stack (Java, Python, Ruby) avait sa propre méthode de déploiement, sans standardisation (rpm, deb, tar.gz, jar)
- La gestion des ressources était manuelle avec souvent une application par machine, créant du gaspillage et complexifiant la maintenance
- Kubernetes standardise tout en quelques ressources YAML (Deployment, Service, Ingress, ConfigMap, Secret) avec un format déclaratif simple
- Toutes les fonctionnalités critiques sont intégrées : service discovery, load balancing, scaling, stockage, firewalling, logging, tolérance aux pannes
- La complexité des centaines de scripts shell et playbooks Ansible maintenus avant était supérieure à celle de Kubernetes
- Kubernetes devient pertinent dès qu'on commence à reconstruire manuellement ces fonctionnalités, ce qui arrive très rapidement
- La technologie est flexible et peut gérer aussi bien des applications modernes que des monolithes legacy avec des contraintes spécifiques

Mole [https://github.com/tw93/Mole](https://github.com/tw93/Mole)

- Un outil en ligne de commande (CLI) tout-en-un pour nettoyer et optimiser macOS.
- Combine les fonctionnalités de logiciels populaires comme CleanMyMac, AppCleaner, DaisyDisk et iStat Menus.
- Analyse et supprime en profondeur les caches, les fichiers logs et les résidus de navigateurs.
- Désinstallateur intelligent qui retire proprement les applications et leurs fichiers cachés (Launch Agents, préférences).
- Analyseur d'espace disque interactif pour visualiser l'occupation des fichiers et gérer les documents volumineux.
- Tableau de bord temps réel (mo status) pour surveiller le CPU, le GPU, la mémoire et le réseau.
- Fonction de purge spécifique pour les développeurs permettant de supprimer les artefacts de build (node_modules, target, etc.).
- Intégration possible avec Raycast ou Alfred pour un lancement rapide des commandes.
- Installation simple via Homebrew ou un script curl.

Des images Docker sécurisées pour chaque développeur [https://www.docker.com/blog/docker-hardened-images-for-every-developer/](https://www.docker.com/blog/docker-hardened-images-for-every-developer/)

- Docker rend ses "Hardened Images" (DHI) gratuites et open source (licence Apache 2.0) pour tous les développeurs.
- Ces images sont conçues pour être minimales, prêtes pour la production et sécurisées dès le départ afin de lutter contre l'explosion des attaques sur la chaîne logistique logicielle.
- Elles s'appuient sur des bases familières comme Alpine et Debian, garantissant une compatibilité élevée et une migration facile.
- Chaque image inclut un SBOM (Software Bill of Materials) complet et vérifiable, ainsi qu'une provenance SLSA de niveau 3 pour une transparence totale.
- L'utilisation de ces images permet de réduire considérablement le nombre de vulnérabilités (CVE) et la taille des images (jusqu'à 95 % plus petites).
- Docker étend cette approche sécurisée aux graphiques Helm et aux serveurs MCP (Mongo, Grafana, GitHub, etc.).
- Des offres commerciales (DHI Enterprise) restent disponibles pour des besoins spécifiques : correctifs critiques sous 7 jours, support FIPS/FedRAMP ou support à cycle de vie étendu (ELS).
- Un assistant IA expérimental de Docker peut analyser les conteneurs existants pour recommander l'adoption des versions sécurisées correspondantes.
- L'initiative est soutenue par des partenaires majeurs tels que Google, MongoDB, Snyk et la CNCF.



### Web

La maçonnerie ("masonry") arrive dans la spécification des CSS et commence à être implémentée par les navigateurs
[https://webkit.org/blog/17660/introducing-css-grid-lanes/](https://webkit.org/blog/17660/introducing-css-grid-lanes/)

- Permet de mettre en colonne des éléments HTML les uns à la suite des autres. D'abord sur la première ligne, et quand la première ligne est remplie, le prochain élément se trouvera dans la colonne où il pourra être le plus haut possible, et ainsi de suite.
- après la plomberie du middleware, la maçonnerie du front :laughing:


### Data et Intelligence Artificielle

On ne devrait pas faire un mapping 1:1 entre API REST et MCP
[https://nordicapis.com/why-mcp-shouldnt-wrap-an-api-one-to-one/](https://nordicapis.com/why-mcp-shouldnt-wrap-an-api-one-to-one/)

- **Problématique :** Envelopper une API telle quelle dans le protocole MCP (Model Context Protocol) est un anti-pattern.
- **Objectif du MCP :** Conçu pour les agents d'IA, il doit servir d'interface d'intention, non de miroir d'API. Les agents comprennent les tâches, pas la logique complexe des API (authentification, pagination, orchestration).
- **Conséquences du mappage un-à-un :**
  - Confusion des agents, erreurs, hallucinations.
  - Difficulté à gérer les orchestrations complexes (plusieurs appels pour une seule action).
  - Exposition des faiblesses de l'API (schéma lourd, endpoints obsolètes).
  - Maintenance accrue lors des changements d'API.
- **Meilleure approche :** Construire des outils MCP comme des SDK pour agents, encapsulant la logique nécessaire pour accomplir une tâche spécifique.
- **Pratiques recommandées :**
  - Concevoir autour des intentions/actions utilisateur (ex. : "créer un projet", "résumer un document").
  - Regrouper les appels en workflows ou actions uniques.
  - Utiliser un langage naturel pour les définitions et les noms.
  - Limiter la surface d'exposition de l'API pour la sécurité et la clarté.
  - Appliquer des schémas d'entrée/sortie stricts pour guider l'agent et réduire l'ambiguïté.

Des agents en production avec AWS - [https://blog.ippon.fr/2025/12/22/des-agents-en-production-avec-aws/](https://blog.ippon.fr/2025/12/22/des-agents-en-production-avec-aws/)

- AWS re:Invent 2025 a massivement mis en avant l’IA générative et les agents IA
- Un agent IA combine un LLM, une boucle d’appel et des outils invocables
- Strands Agents SDK facilite le prototypage avec boucles ReAct intégrées et gestion de la mémoire
- Managed MLflow permet de tracer les expérimentations et définir des métriques de performance
- Nova Forge optimise les modèles par réentraînement sur données spécifiques pour réduire coûts et latence
- Bedrock Agent Core industrialise le déploiement avec runtime serverless et auto-scaling
- Agent Core propose neuf piliers dont observabilité, authentification, code interpreter et browser managé
- Le protocole MCP d’Anthropic standardise la fourniture d’outils aux agents
- SageMaker AI et Bedrock centralisent l’accès aux modèles closed source et open source via API unique
- AWS mise sur l’évolution des chatbots vers des systèmes agentiques optimisés avec modèles plus frugaux

Debezium 3.4 amène plusieurs améliorations intéressantes [https://debezium.io/blog/2025/12/16/debezium-3-4-final-released/](https://debezium.io/blog/2025/12/16/debezium-3-4-final-released/)

- Correction du problème de calcul du low watermark Oracle qui causait des pertes de performance
- Correction de l'émission des événements heartbeat dans le connecteur Oracle avec les requêtes CTE
- Amélioration des logs pour comprendre les transactions actives dans le connecteur Oracle
- Memory guards pour protéger contre les schémas de base de données de grande taille
- Support de la transformation des coordonnées géométriques pour une meilleure gestion des données spatiales
- Extension Quarkus DevServices permettant de démarrer automatiquement une base de données et Debezium en dev
- Intégration OpenLineage pour tracer la lignée des données et suivre leur flux à travers les pipelines
- Compatibilité testée avec Kafka Connect 4.1 et Kafka brokers 4.1

Infinispan 16.0.4 et .5 [https://infinispan.org/blog/2025/12/17/infinispan-16-0-4](https://infinispan.org/blog/2025/12/17/infinispan-16-0-4)

- Spring Boot 4 et Spring 7 supportés
- Evolution dans les metriques
- Deux bugs de serialisation

Construire un agent de recherche en Java avec l'API Interactions
[https://glaforge.dev/posts/2026/01/03/building-a-research-assistant-with-the-interactions-api-in-java/](https://glaforge.dev/posts/2026/01/03/building-a-research-assistant-with-the-interactions-api-in-java/)

- Assistant de recherche IA Java (API Interactions Gemini), test du SDK implémenté par Guillaume.
- Workflow en 4 phases :
  - **Planification** : Gemini Flash + Google Search.
  - **Recherche** : Modèle "Deep Research" (tâche de fond).
  - **Synthèse** : Gemini Pro (rapport exécutif).
  - **Infographie** : Nano Banana Pro (à partir de la synthèse).
- API Interactions : gestion d'état serveur, tâches en arrière-plan, réponses multimodales (images).
- Appréciation : gestion d'état de l'API (vs LLM sans état).
- Validation : efficacité du SDK Java pour cas complexes.

Stephan Janssen (le papa de Devoxx) a créé un serveur MCP (Model Context Protocol) basé sur LSP (Language Server Protocol) pour que les assistants de code analysent le code en le comprenant vraiment plutôt qu'en faisant des grep
[https://github.com/stephanj/LSP4J-MCP](https://github.com/stephanj/LSP4J-MCP)

- **Le problème identifié :** Les assistants IA utilisent souvent la recherche textuelle (type `grep`) pour naviguer dans le code, ce qui manque de contexte sémantique, génère du bruit (faux positifs) et consomme énormément de tokens inutilement.
- **La solution LSP4J-MCP :** Une approche "standalone" (autonome) qui encapsule le serveur de langage Eclipse (JDTLS) via le protocole MCP (Model Context Protocol).
- **Avantage principal :** Offre une compréhension sémantique profonde du code Java (types, hiérarchies, références) sans nécessiter l'ouverture d'un IDE lourd comme IntelliJ.
- **Comparaison des méthodes :**
- _AST :_ Trop léger (pas de compréhension inter-fichiers).
- _IntelliJ MCP :_ Puissant mais exige que l'IDE soit ouvert (gourmand en ressources).
- _LSP4J-MCP :_ Le meilleur des deux mondes pour les workflows en terminal, à distance (SSH) ou CI/CD.
- **Fonctionnalités clés :** Expose 5 outils pour l'IA (`find_symbols`, `find_references`, `find_definition`, `document_symbols`, `find_interfaces_with_method`).
- **Résultats :** Une réduction de **100x** des tokens utilisés pour la navigation et une précision accrue (distinction des surcharges, des scopes, etc.).
- **Disponibilité :** Le projet est open source et disponible sur GitHub pour intégration immédiate (ex: avec Claude Code, Gemini CLI, etc).
- A noter l'ajout dans claude code 2.0.74 d'un tool pour supporter LSP ( [https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md#2074](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md#2074) )

Awesome (GitHub) Copilot [https://github.com/github/awesome-copilot](https://github.com/github/awesome-copilot)

- Une collection communautaire d'instructions, de prompts et de configurations pour optimiser l'utilisation de GitHub Copilot.
- Propose des "Agents" spécialisés qui s'intègrent aux serveurs MCP pour améliorer les flux de travail spécifiques.
- Inclut des prompts ciblés pour la génération de code, la documentation et la résolution de problèmes complexes.
- Fournit des instructions détaillées sur les standards de codage et les meilleures pratiques applicables à divers frameworks.
- Propose des "Skills" (compétences) sous forme de dossiers contenant des ressources pour des tâches techniques spécialisées. (les skills sont dispo dans copilot depuis un mois : [https://github.blog/changelog/2025-12-18-github-copilot-now-supports-agent-skills/](https://github.blog/changelog/2025-12-18-github-copilot-now-supports-agent-skills/) )
- Permet une installation facile via un serveur MCP dédié, compatible avec VS Code et Visual Studio.
- Encourage la contribution communautaire pour enrichir les bibliothèques de prompts et d'agents.
- Aide à augmenter la productivité en offrant des solutions pré-configurées pour de nombreux langages et domaines.
- Garanti par une licence MIT et maintenu activement par des contributeurs du monde entier.

IA et productivité : bilan de l'année 2025 (Laura Tacho - DX)) [https://newsletter.getdx.com/p/ai-and-productivity-year-in-review?aid=recNfypKAanQrKszT](https://newsletter.getdx.com/p/ai-and-productivity-year-in-review?aid=recNfypKAanQrKszT)

- En 2025, l'ingénierie assistée par l'IA est devenue la norme : environ 90 % des développeurs utilisent des outils d'IA mensuellement, et plus de 40 % quotidiennement.
- Les chercheurs (Microsoft, Google, GitHub) soulignent que le nombre de lignes de code (LOC) reste un mauvais indicateur d'impact, car l'IA génère beaucoup de code sans forcément garantir une valeur métier supérieure.
- Si l'IA améliore l'efficacité individuelle, elle pourrait nuire à la collaboration à long terme, car les développeurs passent plus de temps à "parler" à l'IA qu'à leurs collègues.
- L'identité du développeur évolue : il passe de "producteur de code" à un rôle de "metteur en scène" qui délègue, valide et exerce son jugement stratégique.
- L'IA pourrait accélérer la montée en compétences des développeurs juniors en les forçant à gérer des projets et à déléguer plus tôt, agissant comme un "accélérateur" plutôt que de les rendre obsolètes.
- L'accent est mis sur la créativité plutôt que sur la simple automatisation, afin de réimaginer la manière de travailler et d'obtenir des résultats plus impactants.
- Le succès en 2026 dépendra de la capacité des entreprises à cibler les goulots d'étranglement réels (dette technique, documentation, conformité) plutôt que de tester simplement chaque nouveau modèle d'IA.
- La newsletter avertit que les titres de presse simplifient souvent à l'excès les recherches sur l'IA, masquant parfois les nuances cruciales des études réelles.

Un développeur décrit dans un article sur Twitter son utilisation avancée de Claude Code pour le développement, avec des sous-agents, des slash-commands, comment optimiser le contexte, etc.
[https://x.com/AureaLibe/status/2008958120878330329?s=20](https://x.com/AureaLibe/status/2008958120878330329?s=20)



### Outillage

IntelliJ IDEA, thread dumps et project Loom (virtual threads) - [https://blog.jetbrains.com/idea/2025/12/thread-dumps-and-project-loom-virtual-threads/](https://blog.jetbrains.com/idea/2025/12/thread-dumps-and-project-loom-virtual-threads/)

- Les virtual threads Java améliorent l'utilisation du matériel pour les opérations I/O parallèles avec peu de changements de code
- Un serveur peut maintenant gérer des millions de threads au lieu de quelques centaines
- Les outils existants peinent à afficher et analyser des millions de threads simultanément
- Le débogage asynchrone est complexe car le scheduler et le worker s'exécutent dans des threads différents
- Les thread dumps restent essentiels pour diagnostiquer deadlocks, UI bloquées et fuites de threads
- Netflix a découvert un deadlock lié aux virtual threads en analysant un heap dump, bug corrigé dans Java 25. Mais c'était de la haute voltige
- IntelliJ IDEA supporte nativement les virtual threads dès leur sortie avec affichage des locks acquis
- IntelliJ IDEA peut ouvrir des thread dumps générés par d'autres outils comme jcmd
- Le support s'étend aussi aux coroutines Kotlin en plus des virtual threads

Quelques infos sur IntelliJ IDEA 2025.3  [https://blog.jetbrains.com/idea/2025/12/intellij-idea-2025-3/](https://blog.jetbrains.com/idea/2025/12/intellij-idea-2025-3/)

- Distribution unifiée regroupant davantage de fonctionnalités gratuites
- Amélioration de la complétion des commandes dans l'IDE
- Nouvelles fonctionnalités pour le débogueur Spring
- Thème Islands devient le thème par défaut
- Support complet de Spring Boot 4 et Spring Framework 7
- Compatibilité avec Java 25
- Prise en charge de Spring Data JDBC et Vitest 4
- Support natif de Junie et Claude Agent pour l'IA
- Quota d'IA transparent et option Bring Your Own Key à venir
- Corrections de stabilité, performance et expérience utilisateur

Plein de petits outils en ligne pour le développeur
[https://blgardner.github.io/prism.tools/](https://blgardner.github.io/prism.tools/)

- génération de mot de passe, de gradient CSS, de QR code
- encodage décodage de Base64, JWT
- formattage de JSON, etc.

resumectl - Votre CV en tant que code [https://juhnny5.github.io/resumectl/](https://juhnny5.github.io/resumectl/)

- Un outil en ligne de commande (CLI) écrit en Go pour générer un CV à partir d'un fichier YAML.
- Permet l'exportation vers plusieurs formats : PDF, HTML, ou un affichage direct dans le terminal.
- Propose 5 thèmes intégrés (Modern, Classic, Minimal, Elegant, Tech) personnalisables avec des couleurs spécifiques.
- Fonctionnalité d'initialisation (`resumectl init`) permettant d'importer automatiquement des données depuis LinkedIn et GitHub (projets les plus étoilés).
- Supporte l'ajout de photos avec des options de filtre noir et blanc ou de forme (rond/carré).
- Inclut un mode "serveur" (`resumectl serve`) pour prévisualiser les modifications en temps réel via un navigateur local.
- Fonctionne comme un binaire unique sans dépendances externes complexes pour les modèles.

mactop - Un moniteur "top" pour Apple Silicon [https://github.com/metaspartan/mactop](https://github.com/metaspartan/mactop)

- Un outil de surveillance en ligne de commande (TUI) conçu spécifiquement pour les puces Apple Silicon (M1, M2, M3, M4, M5).
- Permet de suivre en temps réel l'utilisation du CPU (E-cores et P-cores), du GPU et de l'ANE (Neural Engine).
- Affiche la consommation électrique (wattage) du système, du CPU, du GPU et de la DRAM.
- Fournit des données sur les températures du SoC, les fréquences du GPU et l'état thermique global.
- Surveille l'utilisation de la mémoire vive, de la swap, ainsi que l'activité réseau et disque (E/S).
- Propose 10 mises en page (layouts) différentes et plusieurs thèmes de couleurs personnalisables.
- Ne nécessite pas l'utilisation de `sudo` car il s'appuie sur les API natives d'Apple (SMC, IOReport, IOKit).
- Inclut une liste de processus détaillée (similaire à `htop`) avec la possibilité de tuer des processus directement depuis l'interface.
- Offre un mode "headless" pour exporter les métriques au format JSON et un serveur optionnel pour Prometheus.
- Développé en Go avec des composants en CGO et Objective-C.

Adieu `direnv`, Bonjour `mise`[https://codeka.io/2025/12/19/adieu-direnv-bonjour-mise/](https://codeka.io/2025/12/19/adieu-direnv-bonjour-mise/)

- L'auteur remplace ses outils habituels (`direnv`, `asdf`, `task`, `just`) par un seul outil polyvalent écrit en Rust : **mise**.
- **mise** propose trois fonctions principales : gestionnaire de paquets (langages et outils), gestionnaire de variables d'environnement et exécuteur de tâches.
- Contrairement à `direnv`, il permet de gérer des alias et utilise un fichier de configuration structuré (`mise.toml`) plutôt que du scripting shell.
- La configuration est hiérarchique, permettant de surcharger les paramètres selon les répertoires, avec un système de "trust" pour la sécurité.
- Une "killer-feature" soulignée est la gestion des secrets : **mise** s'intègre avec `age` pour chiffrer des secrets (via clés SSH) directement dans le fichier de configuration.
- L'outil supporte une vaste liste de langages et d'outils via un registre interne et des plugins (compatibilité avec l'écosystème `asdf`).
- Il simplifie le workflow de développement en regroupant l'installation des outils et l'automatisation des tâches au sein d'un même fichier.
- L'auteur conclut sur la puissance, la flexibilité et les excellentes performances de l'outil après quelques heures de test.

Claude Code v2.1.0
[https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md#210](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md#210)


- Rechargement à chaud des "skills" : Les modifications apportées aux compétences dans ~/.claude/skills sont désormais appliquées instantanément sans redémarrer la session.
- Sous-agents et forks : Support de l'exécution de compétences et de commandes slash dans un contexte de sous-agent forké via context: fork.
- Réglages linguistiques : Ajout d'un paramètre language pour configurer la langue de réponse par défaut (ex: language: "french").
- Améliorations du terminal : Shift+Enter fonctionne désormais nativement dans plusieurs terminaux (iTerm2, WezTerm, Ghostty, Kitty) sans configuration manuelle.
- Sécurité et correction de bugs : Correction d'une faille où des données sensibles (clés API, tokens OAuth) pouvaient apparaître dans les logs de débogage.
- Nouvelles commandes slash : Ajout de /teleport et /remote-env pour les abonnés [claude.ai](http://claude.ai) afin de gérer des sessions distantes.
- Mode Plan : Le raccourci /plan permet d'activer le mode plan directement depuis le prompt, et la demande de permission à l'entrée de ce mode a été supprimée.
- Vim et navigation : Ajout de nombreux mouvements Vim (text objects, répétitions de mouvements f/F/t/T, indentations, etc.).
- Performance : Optimisation du temps de démarrage et du rendu terminal pour les caractères Unicode/Emoji.
- Gestion du gitignore : Support du réglage respectGitignore dans settings.json pour contrôler le comportement du sélecteur de fichiers @-mention.



### Méthodologies

200 déploiements en production par jour, même le vendredi : retours d'expérience [https://mcorbin.fr/posts/2025-03-21-deploy-200/](https://mcorbin.fr/posts/2025-03-21-deploy-200/)

- Le déploiement fréquent, y compris le vendredi, est un indicateur de maturité technique et augmente la productivité globale.
- L'excellence technique est un atout stratégique indispensable pour livrer rapidement des produits de qualité.
- Une architecture pragmatique orientée services (SOA) facilite les déploiements indépendants et réduit la charge cognitive.
- L'isolation des services est cruciale : un développeur doit pouvoir tester son service localement sans dépendre de toute l'infrastructure.
- L'automatisation via Kubernetes et l'approche GitOps avec ArgoCD permettent des déploiements continus et sécurisés.
- Les feature flags et un système de permissions solide permettent de découpler le déploiement technique de l'activation fonctionnelle pour les utilisateurs.
- L'autonomie des développeurs est renforcée par des outils en self-service (CLI maison) pour gérer l'infrastructure et diagnostiquer les incidents sans goulot d'étranglement.
- Une culture d'observabilité intégrée dès la conception permet de détecter et de réagir rapidement aux anomalies en production.
- Accepter l'échec comme inévitable permet de concevoir des systèmes plus résilients capables de se rétablir automatiquement.

"Vibe Coding" vs "Prompt Engineering" : l'IA et le futur du développement logiciel [https://www.romenrg.com/blog/2025/12/25/vibe-coding-vs-prompt-engineering-ai-and-the-future-of-software-development/](https://www.romenrg.com/blog/2025/12/25/vibe-coding-vs-prompt-engineering-ai-and-the-future-of-software-development/)

- L'IA est passée du statut d'expérimentation à celui d'infrastructure essentielle pour le développement de logiciels en 2025.
- L'IA ne remplace pas les ingénieurs, mais agit comme un amplificateur de leurs compétences, de leur jugement et de la qualité de leur réflexion.
- Distinction entre le "Vibe Coding" (rapide, intuitif, idéal pour les prototypes) et le "Prompt Engineering" (délibéré, contraint, nécessaire pour les systèmes maintenables).
- L'importance cruciale du contexte ("Context Engineering") : l'IA devient réellement puissante lorsqu'elle est connectée aux systèmes réels (GitHub, Jira, etc.) via des protocoles comme le MCP.
- Utilisation d'agents spécialisés (écriture de RFC, revue de code, architecture) plutôt que de modèles génériques pour obtenir de meilleurs résultats.
- Émergence de l'ingénieur "Technical Product Manager" capable d'abattre seul le travail d'une petite équipe grâce à l'IA, à condition de maîtriser les fondamentaux techniques.
- Le risque majeur : l'IA permet d'aller très vite dans la mauvaise direction si le jugement humain et l'expérience font défaut.
- Le niveau d'exigence global augmente : les bases techniques solides deviennent plus importantes que jamais pour éviter l'accumulation de dette technique rapide.

Une revue de code en solo (Kent Beck) ! [https://tidyfirst.substack.com/p/party-of-one-for-code-review?r=64ov3&amp;utm_campaign=post&amp;utm_medium=web&amp;triedRedirect=true](https://tidyfirst.substack.com/p/party-of-one-for-code-review?r=64ov3&amp;utm_campaign=post&amp;utm_medium=web&amp;triedRedirect=true)

- La revue de code traditionnelle, héritée des inspections formelles d'IBM, s'essouffle car elle est devenue trop lente et asynchrone par rapport au rythme du développement moderne.
- Avec l'arrivée de l'IA ("le génie"), la vitesse de production du code dépasse la capacité de relecture humaine, créant un goulot d'étranglement majeur.
- La revue de code doit évoluer vers deux nouveaux objectifs prioritaires : un "sanity check" pour vérifier que l'IA a bien fait ce qu'on lui demandait, et le contrôle de la dérive structurelle de la base de code.
- Maintenir une structure saine est crucial non seulement pour les futurs développeurs humains, mais aussi pour que l'IA puisse continuer à comprendre et modifier le code efficacement sans perdre le contexte.
- Kent Beck expérimente des outils automatisés (comme CodeRabbit) pour obtenir des résumés et des schémas d'architecture afin de garder une conscience globale des changements rapides.
- Même si les outils automatisés sont utiles, le "Pair Programming" reste irremplaçable pour la richesse des échanges et la pression sociale bénéfique qu'il impose à la réflexion.
- La revue de code solo n'est pas une fin en soi, mais une adaptation nécessaire lorsque l'on travaille seul avec des outils de génération de code augmentés.



### Loi, société et organisation

Lego lance les Lego Smart Play, avec des Brique, des Smart Tags et des Smart Figurines pour faire de nouvelles constructions interactives avec des Legos
[https://www.lego.com/fr-fr/smart-play](https://www.lego.com/fr-fr/smart-play)

- LEGO SMART Play : technologie réactive au jeu des enfants.
- Trois éléments clés :
  - **SMART Brique :** Brique LEGO 2x4 "cerveau". Accéléromètre, lumières réactives, détecteur de couleurs, synthétiseur sonore. Réagit aux mouvements (tenir, tourner, taper).
  - **SMART Tags :** Petites pièces intelligentes. Indiquent à la SMART Brique son rôle (ex: hélicoptère, voiture) et les sons à produire. Activent sons, mini-jeux, missions secrètes.
  - **SMART Minifigurines :** Activées près d'une SMART Brique. Révèlent des personnalités uniques (sons, humeurs, réactions) via la SMART Brique. Encouragent l'imagination.
- **Fonctionnement :** SMART Brique détecte SMART Tags et SMART Minifigurines. Réagit aux mouvements avec lumières et sons dynamiques.
- **Compatibilité :** S'assemble avec les briques LEGO classiques.
- **Objectif :** Créer des expériences de jeu interactives, uniques et illimitées.





## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 14-17 janvier 2026 : [SnowCamp 2026](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/snowcamp-2026"><img alt="CFP SnowCamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2025&color=red"></a>
- 22 janvier 2026 : [DevCon #26 : sécurité / post-quantique / hacking](https://www.programmez.com/page-devcons) - Paris (France) <a href="https://docs.google.com/forms/d/e/1FAIpQLScAkKRuLpmUYUyxBP7uVCpWLxShOUxvDD7rKbAiz_4njAyMRQ/viewform?usp=header"><img alt="CFP DevCon #26 : sécurité / post-quantique / hacking" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-December-2025&color=red"></a>
- 28 janvier 2026 : [Software Heritage Symposium](https://www.softwareheritage.org/2025/11/25/software_heritage_2026_symposium_summit/) - Paris (France) 
- 29-31 janvier 2026 : [Epitech Summit 2026 - Paris](https://conference-hall.io/epitech-summit-2026) - Paris (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
- 2-5 février 2026 : [Epitech Summit 2026 - Moulins](https://conference-hall.io/epitech-summit-2026) - Moulins (France) <a href="https://conference-hall.io/epitech-summit-2026"><img alt="CFP Epitech Summit" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-October-2025&color=red"></a>
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
- 5 février 2026 : [Web Days Convention](https://webdays.events/) - Aix-en-Provence (France) <a href="https://conference-hall.io/web-days-convention"><img alt="CFP Web Days Convention" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-February-2026&color=green"></a>
- 12 février 2026 : [Strasbourg Craft #1](https://strasbourg-craft.fr/) - Strasbourg (France) 
- 12-13 février 2026 : [Touraine Tech #26](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/touraine-tech-2026"><img alt="CFP TnT 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-November-2025&color=red"></a>
- 19 février 2026 : [ObservabilityCON on the Road](https://grafana.com/events/observabilitycon-on-the-road/2026/paris/) - Paris (France) 
- 6 mars 2026 : [WordCamp Nice 2026](https://nice.wordcamp.org/2026) - Nice (France) 
- 18-19 mars 2026 : [Agile Niort 2026](https://agileniort.fr) - Niort (France) <a href="https://sessionize.com/agile-niort-2026"><img alt="CFP Agile Niort 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-January-2026&color=red"></a>
- 20 mars 2026 : [Atlantique Day 2026](https://www.groupeonepoint.com/fr/) - Nantes (France) <a href="https://conference-hall.io/atlantique-day-2026-keynote"><img alt="CFP Atlantique Day 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-February-2026&color=green"></a>
- 26 mars 2026 : [Data Days Lille](https://days.data-lille.fr/2026/fr/) - Lille (France) <a href="https://conference-hall.io/data-days-lille-2026"><img alt="CFP Data Days Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-February-2026&color=green"></a>
- 26-27 mars 2026 : [SymfonyLive Paris 2026](https://live.symfony.com/2026-paris/) - Paris (France) 
- 26-27 mars 2026 : [REACT PARIS](https://react.paris) - Paris (France) 
- 27-29 mars 2026 : [Shift](https://shift-hackathon.com/) - Nantes (France) 
- 31 mars 2026 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-7/"><img alt="CFP ParisTestConf 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-October-2025&color=red"></a>
- 1 avril 2026 : [AWS Summit Paris](https://aws.amazon.com/events/summits/paris) - Paris (France) 
- 2 avril 2026 : [Pragma Cannes 2026](https://ethglobal.com/events/pragma-cannes2026) - Cannes (France) 
- 9-10 avril 2026 : [AndroidMakers by droidcon](https://droidcon.wixsite.com/website-28) - Paris (France) 
- 16-17 avril 2026 : [MiXiT 2026](https://mixitconf.org) - Lyon (France) <a href="https://sessionize.com/mixit-2026/"><img alt="CFP MiXiT" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-Jan-2026&color=red"></a>
- 22-24 avril 2026 : [Devoxx France 2026](https://www.devoxx.fr) - Paris (France) <a href="https://devoxxfr2026.cfp.dev/"><img alt="CFP Devoxx France 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-January-2026&color=green"></a>
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr26.cfp.dev/"><img alt="CFP Devoxx Greece 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2025&color=red"></a>
- 24-25 avril 2026 : [Faiseuses du Web 5](https://faiseusesduweb.eu.org) - Dinan (France) 
- 6-7 mai 2026 : [Devoxx UK 2026](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk26.cfp.dev/"><img alt="CFP Devoxx UK 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-January-2026&color=green"></a>
- 22 mai 2026 : [AFUP Day 2026 Lille](https://event.afup.org/afup-day-2026/) - Lille (France) <a href="https://afup.org/event/afupday2026lille/cfp"><img alt="CFP AFUP Day Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Paris](https://event.afup.org/afup-day-2026/) - Paris (France) <a href="https://afup.org/event/afupday2026paris/cfp"><img alt="CFP AFUP Day Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Bordeaux](https://event.afup.org/afup-day-2026/) - Bordeaux (France) <a href="https://afup.org/event/afupday2026bordeaux/cfp"><img alt="CFP AFUP Day Bordeaux 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Lyon](https://event.afup.org/afup-day-2026/) - Lyon (France) <a href="https://afup.org/event/afupday2026lyon/cfp"><img alt="CFP AFUP Day Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 29 mai 2026 : [NG Baguette Conf 2026](https://ngbaguette.angulardevs.fr/) - Paris (France) <a href="https://conference-hall.io/ng-baguette-conf-2026"><img alt="CFP NG Baguette Conf 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2026&color=green"></a>
- 5 juin 2026 : [TechReady](https://techready.live/) - Nantes (France) 
- 5 juin 2026 : [Fork it! - Rouen](https://www.forkit.community/events/2026-france-rouen) - Rouen (France) 
- 6 juin 2026 : [Polycloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/polycloud-2026"><img alt="Polycloud 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-February-2026&color=green"></a>
- 11-12 juin 2026 : [DevQuest Niort](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/devquest-2026"><img alt="CFP devquest niort" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-March-2026&color=green"></a>
- 11-12 juin 2026 : [DevLille 2026](https://devlille.fr/) - Lille (France) <a href="https://conference-hall.io/devlille-2026"><img alt="CFP DevLille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2026&color=green"></a>
- 12 juin 2026 : [Tech F'Est 2026](https://www.tech-fest.dev/) - Nancy (France) <a href="https://conference-hall.io/tech-fest-2026"><img alt="CFP Tech F'Est 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-February-2026&color=green"></a>
- 17-19 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 
- 17-20 juin 2026 : [VivaTech](https://vivatechnology.com) - Paris (France) 
- 2 juillet 2026 : [Azur Tech Summer 2026](https://www.telecom-valley.fr/azurtechsummer/) - Valbonne (France) <a href="https://conference-hall.io/azur-tech-summer-2026"><img alt="CFP Azur Tech Summit 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-March-2026&color=green"></a>
- 2-3 juillet 2026 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2026"><img alt="CFP Sunny Tech 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2026&color=green"></a>
- 3 juillet 2026 : [Agile Lyon 2026](https://www.agilelyon.fr/) - Lyon (France) <a href="https://sessionize.com/agile-lyon-2026/"><img alt="CFP Agile Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-March-2026&color=green"></a>
- 2 août 2026 : [4th Tech Summit on Artificial Intelligence & Robotics](https://artificialintelligence.averconferences.com) - Paris (France) 
- 4 septembre 2026 : [JUG Summer Camp 2026](https://www.jugsummercamp.org/) - La Rochelle (France) 
- 17-18 septembre 2026 : [API Platform Conference 2026](https://api-platform.com/fr/con/) - Lille (France) 
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

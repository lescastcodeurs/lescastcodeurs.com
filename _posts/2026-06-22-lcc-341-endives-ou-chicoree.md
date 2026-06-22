---
title: LCC 341 - Endives ou Chicorée ?
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 341
youtube: ae4I5p__VWY
mp3_length: 48558938
tweet: Endives ou Chicorée ? #Java #JDK26 #A2A #CoutsIA
# tweet size: 91-93 -> 99-101 #######################################################################
---
JDK 26 optimise la JVM dans ses moindres recoins, le SDK Java d'Agent2Agent passe en 1.0, Micronaut 5 est là. Côté terrain, un retour d'expérience après 40 jours à coder avec 100 % d'IA : génie ou junior, Alzheimer numérique et dette technique invisible.
Pendant ce temps, GitLab restructure, Microsoft suspend ses licences Claude Code, et un développeur injecte un prompt destructeur dans sa lib JUnit. La révolution IA a un coût et les boites commencent à s'en rendre compte.


Enregistré le 12 juin 2026

Téléchargement de l’épisode [LesCastCodeurs-Episode-341.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-341.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=ae4I5p__VWY).

## News


### Langages

Les améliorations de performance dans le JDK 26 [https://inside.java/2026/06/09/jdk-26-performance-improvements/](https://inside.java/2026/06/09/jdk-26-performance-improvements/)

- Côté bibliothèques, l'API `LazyConstant` (anciennement `StableValue`) fait son entrée en prévisualisation pour permettre une initialisation paresseuse, sécurisée pour les threads et optimisée par le mécanisme de constant-folding de la JVM.
- L'extraction de chaînes de caractères via `MemorySegment::getString` a été revue pour réduire considérablement les allocations intermédiaires et les copies en mémoire off-heap, accélérant fortement les traitements sur les chemins critiques (hot paths).
- La méthode générée automatiquement `hashCode()` pour les classes de type `record` a été optimisée par la JVM pour atteindre un niveau de performance équivalent à une implémentation écrite manuellement.
- Le ramasse-miettes G1 bénéficie du JEP 522 qui redessine sa table de cartes (card-table) afin de réduire les coûts de synchronisation des barrières d'écriture, offrant un gain de débit de 5 % à 15 % sur les applications manipulant énormément de références d'objets.
- Grâce au JEP 516 (Project Leyden), le cache d'objets Ahead-of-Time (AOT) adopte un format de flux agnostique, ce qui lui permet d'être compatible avec n'importe quel Garbage Collector, y compris le ramasse-miettes à très faible latence ZGC.
- Le démarrage de la JVM s'accélère par défaut lorsqu'aucune taille de tas n'est configurée, car HotSpot n'applique plus de pourcentage initial (`InitialRAMPercentage`) mais démarre directement avec la taille minimale (`MinHeapSize`) pour éviter d'allouer des métadonnées inutiles.
- Les threads virtuels gagnent en robustesse en étant désormais capables de céder la main (yield) pendant les phases d'initialisation des classes, éliminant ainsi le risque de famine des threads porteurs (carrier threads).
- Le compilateur C2 JIT améliore son modèle de coût pour la vectorisation des boucles (SIMD) et se montre maintenant capable de compiler et d'optimiser des méthodes dotées de listes de paramètres extrêmement longues.


### Librairies

Release candidate du A2A Java SDK supportant versions 0.3 et 1.0 en même temps
[https://medium.com/google-cloud/a2a-java-sdk-1-0-0-cr1-released-f0c651ec9139](https://medium.com/google-cloud/a2a-java-sdk-1-0-0-cr1-released-f0c651ec9139)

- Dernière étape avant la GA : Toutes les fonctionnalités prévues pour la version 1.0 sont finalisées. Migration simplifiée depuis la Beta1.
- Compatibilité v0.3 : Ajout d'une couche de compatibilité permettant aux agents v1.0 de communiquer avec les systèmes v0.3 (via JSON-RPC, gRPC ou REST).
- Support natif pour Android (nouvel AndroidHttpClient).
- Uniformisation des clients HTTP pour garantir une cohérence entre les versions.
- Nouveau parseur SSE (Server-Sent Events) conforme aux spécifications.

Ça y est, le SDK Java de l'Agent 2 Agent Protocol est sorti en version 1.0 finale ! (avec compatibilité v0.3 et v1.0)
[https://medium.com/google-cloud/a2a-java-sdk-1-0-0-final-released-10c05b6aee34](https://medium.com/google-cloud/a2a-java-sdk-1-0-0-final-released-10c05b6aee34)

- Lancement officiel : Sortie de A2A Java SDK 1.0.0.Final, la première version stable (GA) du protocole Agent2Agent.
- Objectif du protocole : Standard ouvert (Linux Foundation) permettant aux agents IA de communiquer, déléguer des tâches et collaborer, indépendamment du langage ou du framework.
- Interopérabilité : Introduction de l'Integration Test Kit (ITK) pour valider la compatibilité entre les SDK (Java, Python, TypeScript, etc.).
- Transports supportés : Support complet et équivalent pour JSON-RPC, gRPC et HTTP+JSON/REST.
- Alignement total avec la spécification A2A 1.0.0.
- Passage aux Java records pour l'immutabilité et moins de code répétitif.
- Architecture interne basée sur un MainEventBus pour garantir la persistance et éviter les conditions de concurrence.
- Intégration d'OpenTelemetry pour le suivi et la surveillance.
- Support d'Android et compatibilité descendante avec la version 0.3.
- Installation : Gestion des dépendances via Maven BOM (org.a2aproject.sdk).

Sortie de Micronaut 5.0
[https://micronaut.io/2026/05/20/micronaut-framework-5-0-0-released/](https://micronaut.io/2026/05/20/micronaut-framework-5-0-0-released/)

- Lancement majeur : Disponibilité générale de Micronaut 5, incluant une refonte de plus de 70 modules et la plateforme BOM.
- Baselines techniques : Support de Java 25, Groovy 5, Kotlin 2.3 et GraalVM 25.0.3.
- Optimisations internes : Amélioration significative des performances au démarrage et réduction de la surcharge à l'exécution via une refonte du conteneur IoC et du traitement à la compilation.
- Architecture HTTP : Support stable de HTTP/3, nouvelle API de formulaires (multipart) et annotations de nullabilité (JSpecify) pour une meilleure interopérabilité Kotlin/IDE.
- Configuration : Nouveau système d'importation de configuration (remplaçant le Bootstrap Configuration) et validateur de schéma JSON intégré.
- Fiabilité : Nouvelles API programmatiques pour les politiques de retry et circuit breaker.
- Sécurité &amp; Outils : Mise à jour majeure des dépendances (Jackson 3, Ktor 3), rafraîchissement du Panneau de contrôle et diagnostics AOT améliorés.
- Écosystème : Mises à jour complètes pour les bases de données (Data, SQL, R2DBC, MongoDB, Redis), le cloud (AWS, Azure, GCP, OCI) et les tests (JUnit 6, Testcontainers 2.0).
- Évolutions notables : Intégration HTMX dans Micronaut Views, retrait du support RxJava 2 et migration de divers processeurs d'annotations vers des modules dédiés.

Comment rajouter un agent IA dans une app Android, avec le tout nouveau framework ADK pour Kotlin
[https://glaforge.dev/posts/2026/05/21/wiring-adk-kotlin-agents-in-an-android-application/](https://glaforge.dev/posts/2026/05/21/wiring-adk-kotlin-agents-in-an-android-application/)

- Guillaume a participé au développement et au lancement du nouveau runtime ADK pour Kotlin et Android [https://developers.googleblog.com/adk-kotlin-android-building-ai-agents/](https://developers.googleblog.com/adk-kotlin-android-building-ai-agents/)
- Tutoriel sur comment intégrer un agent ADK dans une app
- Dépendances : Ajout du noyau ADK (google-adk-kotlin-core) et du processeur KSP dans build.gradle.kts.
- Sécurité API : Utilisation de local.properties pour stocker la clé API Gemini et l'exposer via BuildConfig afin d'éviter le hardcoding.
- Définition de l'agent : Création d'un objet LlmAgent configuré avec le modèle Gemini, des instructions spécifiques et des outils (ex: GoogleSearchTool).
- Utilisation de InMemoryRunner pour gérer automatiquement le contexte et l'historique de la session.
- Implémentation de runAsync avec StreamingMode.SSE pour un retour en temps réel dans l'interface.
- Threading : Exécution des requêtes réseau sur [Dispatchers.IO](http://Dispatchers.IO) et mise à jour de l'état de l'interface utilisateur sur Dispatchers.Main.

Comment développer et hoster des agents IA sur la plateforme d'agents managés de DeepMind
[https://glaforge.dev/posts/2026/05/21/managed-agents-with-the-gemini-interactions-java-sdk/](https://glaforge.dev/posts/2026/05/21/managed-agents-with-the-gemini-interactions-java-sdk/)

- L'équipe DeepMind de Google a lancé une plateforme d'agents managés sur son API Gemini Interactions [https://blog.google/innovation-and-ai/technology/developers-tools/managed-agents-gemini-api/](https://blog.google/innovation-and-ai/technology/developers-tools/managed-agents-gemini-api/)
- Guillaume a implémenté un SDK Java pour utiliser cette API Gemini Interactions, qui donne entre autre accès à tous les modèles mais aussi à cette plateforme managée d'agents IA
- Agents managés : Permet d'exécuter des agents autonomes qui raisonnent, planifient et exécutent du code dans des environnements isolés (sandboxes), sans gestion d'infrastructure par le développeur.
- Environnement distant : Utilise des espaces de travail Linux éphémères dans le cloud via le paramètre remote, permettant l'accès réseau et la persistance des fichiers sur plusieurs appels.
- Agents prédéfinis : Accès immédiat à des agents spécialisés comme deep-research-pro (recherche multi-étapes) ou antigravity (tâches de codage généralistes).
- Agents personnalisés : Possibilité de configurer ses propres agents avec des instructions système dédiées, des outils spécifiques (exécution de code, recherche Google) et des règles réseau (egress) personnalisées.
- Architecture basée sur les étapes (Steps) : Utilise une structure de données typée (Step, Content) pour suivre le raisonnement de l'agent, ses appels de fonctions et ses résultats en temps réel.
- Outils et Schémas : Inclut des utilitaires pour générer des schémas JSON complexes via une interface fluide (DSL), par réflexion Java ou par parsing JSON.
- Streaming réactif : Support natif des événements en temps réel (SSE) pour suivre la progression de l'agent et recevoir les deltas de contenu au fur et à mesure de la génération.
- Flexibilité : Fournit un gestionnaire de routage (InteractionsHandler) pour créer facilement des serveurs proxy ou des backends intermédiaires traitant les interactions Gemini.

Spring Boot 4.1 [https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-4.1-Release-Notes](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-4.1-Release-Notes)

- Support natif pour Spring gRPC permettant de créer et tester facilement des applications clientes et serveurs basées sur Netty ou des Servlets via HTTP/2
- Introduction du lazy fetching pour les connexions JDBC via la propriété spring.datasource.connection-fetch=lazy afin de ne prendre une connexion du pool que lorsqu'un Statement est réellement exécuté
- Amélioration de l'auto-configuration de Jackson permettant de définir globalement les contraintes de lecture/écriture pour les formats JSON, XML et CBOR via des propriétés de configuration
- Sécurisation des clients HTTP bloquants et réactifs face aux attaques SSRF grâce à l'introduction d'un InetAddressFilter bloquant les requêtes sortantes vers des adresses spécifiques
- Améliorations majeures autour d'OpenTelemetry avec le support complet des variables d'environnement OTel, la possibilité de désactiver le SDK via une propriété globale et l'ajout du support SSL sur les exporters OTLP
- Ajout de l'auto-configuration pour l'utilisation de Spring Batch avec MongoDB incluant un nouveau starter dédié spring-boot-batch-data-mongo
- Auto-configuration des endpoints @RedisListener sans nécessiter la déclaration manuelle d'un RedisMessageListenerContainer
- Dépréciation du support de Apache Derby (projet arrêté), suppression définitive du mode layertools du JAR et réintroduction du support de Spock 2.4 (avec Groovy 5)
- Upgrade des dépendances majeures de l'écosystème avec notamment Spring Framework 7.0.8, Spring Security 7.1.0 et Micrometer 1.17.0






### Outillage

Vous êtes plutôt endive ou chicorée ?
La librairie Chicory qui permet d'exécuter du code WASM à partir de son application Java est forkée et rejointe la Bytecode Alliance pour continuer son développement
[https://bytecodealliance.org/articles/endive-and-the-next-chapter-of-webassembly-on-the-jvm](https://bytecodealliance.org/articles/endive-and-the-next-chapter-of-webassembly-on-the-jvm)

- Annonce d'Endive : Nouveau projet hébergé par la Bytecode Alliance ; fork de Chicory (moteur WebAssembly pur Java, sans dépendance native).
- ​Objectif principal : Permettre aux développeurs Java d'intégrer, charger et déployer des modules Wasm nativement via les workflows Java habituels.
- ​Compilateur "Redline" : Intégration à venir de Redline (basé sur Cranelift) pour compiler le Wasm en code machine natif ; performances comparables à Rust/Wasmtime.
- ​Zéro dépendance (Java 25+) : Grâce à l'API standard Foreign Function & Memory (Project Panama), l'exécution à vitesse native se fait sans composants externes.
- ​Modèle de Composants (Component Model) : Support futur prévu pour consommer des composants (Rust, Go, JS, etc.) via des interfaces typées et sécurisées directement dans la JVM.
- ​Prochaines étapes : Fusion de Redline, conformité stricte aux specs Wasm (dont WasmGC) et amélioration du support WASI.

Un visualisateur de sessions de travail avec Antigravity
[https://glaforge.dev/posts/2026/06/11/antigravity-brain-visualizer/](https://glaforge.dev/posts/2026/06/11/antigravity-brain-visualizer/)

- Un projet open source construit avec Micronaut, LangChain4j et GraalVM pour analyser les sessions de travail avec l'outil de développement agentique Antigravity (de Google)
- Analyse toutes les étapes, les requêtes utilisateur, les outils utilisés, les erreurs rencontrées, les réponses du modèle
- Gemini fait une analyse pour comprendre les moments clés de cette session de travail
- Outil buildé avec l'aide d'Antigravity lui-même

SBX-Kits : des environnements de développement simplifiés pour les débutants (et les autres) [https://k33g.org/20260501-sbx-kits.html](https://k33g.org/20260501-sbx-kits.html)

- Philippe Charrière (:whale: ) présente SBX-Kits (Sandbox Kits), une initiative personnelle visant à simplifier radicalement la mise en place d'environnements de développement pour les débutants, en éliminant la complexité d'installation des outils traditionnels.
- Chaque "kit" est une archive prête à l'emploi contenant un outil de développement spécifique (comme un langage, un framework ou une base de données) configuré pour s'exécuter de manière isolée et portable.
- La philosophie du projet repose sur le principe de "zéro configuration" et "zéro dépendance globale", permettant de tester une technologie ou de commencer à coder immédiatement sans polluer son système d'exploitation.
- L'approche technique s'appuie sur des scripts légers et des binaires portables pré-packagés, offrant une alternative plus simple et moins gourmande en ressources que les conteneurs Docker ou les configurations d'IDE complexes pour l'apprentissage.
- L'objectif à terme est de proposer un catalogue de kits couvrant les technologies courantes (JavaScript, Python, petites bases de données) pour faciliter les ateliers de programmation et le prototypage rapide.
- De nombreux kits sont disponibles sur [https://github.com/docker/sbx-kits-contrib](https://github.com/docker/sbx-kits-contrib)

`ghui`: une interface utilisateur en ligne de commande (TUI) interactive pour GitHub [https://github.com/kitlangton/ghui](https://github.com/kitlangton/ghui)

- `ghui` est un outil en ligne de commande (TUI) écrit en Rust qui fournit une interface visuelle, interactive et rapide directement dans le terminal pour interagir avec GitHub.
- Il permet de gérer ses pull requests, ses issues et ses notifications sans avoir à ouvrir son navigateur web ou à taper de longues commandes avec la CLI officielle de GitHub.
- L'outil propose une navigation fluide au clavier, des raccourcis efficaces, et permet de réaliser des actions courantes comme valider une PR, ajouter des commentaires, attribuer des reviewers ou inspecter les logs des GitHub Actions.
- Conçu pour être extrêmement réactif, `ghui` s'intègre naturellement dans le flux de travail des développeurs adeptes du terminal et du mode "sans souris".

Sortie de Homebrew 6.0.0 [https://brew.sh/2026/06/11/homebrew-6.0.0/](https://brew.sh/2026/06/11/homebrew-6.0.0/)

- Introduction du mécanisme de sécurité **Tap Trust** : comme les dépôts tiers (_taps_) peuvent exécuter du code Ruby arbitraire non sandboxé sur la machine, Homebrew demande désormais une confiance explicite de l'utilisateur avant d'évaluer ou d'exécuter leur code. 
- L'**API JSON interne** devient le choix par défaut, offrant un système plus léger et beaucoup plus rapide pour les développeurs.
- Sécurisation renforcée de l'environnement avec l'implémentation du **sandboxing sur Linux**.
- Évolution des comportements par défaut basés sur un sondage utilisateur : le mode **"ask"** est activé par défaut pour les développeurs, affichant un résumé des dépendances et une demande de confirmation avant toute action de `brew install` ou `brew upgrade`.
- Améliorations notables des performances globales, notamment un boost de ~30 % sur la vitesse de la commande `brew leaves` et la parallélisation de la récupération des _bottles_ (binaires) lors des mises à jour.
- Ajout du support initial pour la prochaine version d'Apple, **macOS 27 (Golden Gate)**. 
- Multiples optimisations pour `brew bundle`, incluant une gestion plus sécurisée des installations de paquets npm.



### Méthodologies

Retour d'expérience très détaillé et 100% humain sur 40 jours avec une équipe 100% AI hormis le superviseur [https://www.linkedin.com/pulse/jai-vir%C3%A9-mon-%C3%A9quipe-de-dev-pour-une-100-ia-pendant-40-luc-bonnin-jlgjf/](https://www.linkedin.com/pulse/jai-vir%C3%A9-mon-%C3%A9quipe-de-dev-pour-une-100-ia-pendant-40-luc-bonnin-jlgjf/)

- Voici le résumé en bullet points :
  - Expérimentation de 40 jours : remplacer une équipe de dev par 100% IA agentique (Cursor) sur un vrai projet en production ([playthatsheet.com](http://playthatsheet.com), 200k lignes de code legacy)
  - Chiffres bruts : 2,3 milliards de tokens consommés, 1 477 prompts, 260 564 lignes ajoutées (+145%), 59% du code final produit par l'IA
  - ROI vertigineux à court terme : 9 mois de travail humain livrés en 40 jours, coût total 260$ d'abonnement + 15 jours de supervision, ROI x18
  - Profil psy de l'IA : Alzheimer (oublis de contexte), schizophrène (change de méthodo), ado de 12 ans (refait les mêmes erreurs), oscille entre génie et junior sans prévenir
  - Effet iceberg : la dette technique ne disparaît pas, elle se camoufle et s'accélère ; hallucinations = bombes à retardement détectables uniquement par relecture humaine ligne par ligne
  - Paradoxe du bateau de Thésée : perte de paternité et de maîtrise fine du code, baisse de l'autonomie du dev humain qui valide sans avoir construit
  - Arnaque du "monkey money" : consommation de tokens opaque, non corrélée à la complexité (écart de 350% sur des prompts identiques), facturation imprévisible donc impossible à budgéter
  - Syndrome du bazooka : les devs utilisent l'IA même pour changer une couleur CSS, atrophie progressive des compétences et coût écologique délirant
  - Risque stratégique : dépendance irréversible aux vendeurs de tokens (Nvidia, Anthropic, OpenAI), business non rentable qui devra augmenter ses prix
  - Conseil final : approche Pareto, garder 20% du temps en code "fait main", nommer un responsable stratégie IA, l'humain senior reste irremplaçable pour superviser

Une libraries de test JUnit cache un prompt qui demande aux coding agents d’effacer les tests [https://arstechnica.com/security/2026/05/fed-up-with-vibe-coders-dev-sneaks-data-nuking-prompt-injection-into-their-code/](https://arstechnica.com/security/2026/05/fed-up-with-vibe-coders-dev-sneaks-data-nuking-prompt-injection-into-their-code/)

- Agacé par les « vibe coders », un développeur introduit une injection de prompt destructrice dans son code
- Le développeur de jqwik (un moteur de tests pour JUnit 5) a volontairement inséré une injection de prompt dans la version 1.10.0 de sa bibliothèque Java pour saboter le travail des agents d'IA.
- L'instruction injectée via la sortie standard (stdout) ordonne textuellement aux LLM d'ignorer les consignes précédentes et de supprimer l'intégralité du code et des tests jqwik du projet.
- Pour dissimuler cette action aux yeux des développeurs humains, le mainteneur a utilisé des séquences d'échappement ANSI qui effacent la ligne d'injection dans les émulateurs de terminaux interactifs.
- La modification a été découverte par un utilisateur qui a pointé du doigt les risques majeurs et disproportionnés pour les machines des utilisateurs, bien que certains outils comme Claude d'Anthropic aient détecté et bloqué la consigne malveillante.
- Face aux critiques de la communauté et aux accusations de comportement infantile ou potentiellement illégal, le développeur a mis à jour ses notes de version pour documenter explicitement son opposition à l'usage de son outil par des IA, avant de refuser tout commentaire supplémentaire sur conseil de son avocat.

La réalité du rôle de Principal Engineer [https://leaddev.com/career-development/reality-being-principal-engineer](https://leaddev.com/career-development/reality-being-principal-engineer)

- Le passage au rôle de Principal Engineer marque une transition majeure où les compétences techniques ne suffisent plus, l'impact se mesurant désormais à travers l'influence, la stratégie et la capacité à aligner la technique avec les objectifs business.
- Contrairement aux attentes, le quotidien est souvent marqué par une forme d'isolement, car le poste se situe à l'intersection de la direction (qui attend des solutions) et des équipes techniques (qui attendent des directives), sans appartenance directe à un groupe précis.
- Le rôle exige d'accepter une grande part d'ambiguïté et l'absence de retours immédiats, les projets et les décisions stratégiques mettant parfois des mois ou des années à porter leurs fruits.
- La gestion du temps devient un défi critique, nécessitant de savoir naviguer entre les sollicitations constantes, la présence en réunion et le besoin de préserver des moments de réflexion approfondie pour concevoir des visions à long terme.
- La réussite à ce niveau repose sur le développement de compétences humaines pointues (soft skills), notamment la négociation, la communication vulgarisée auprès des profils non techniques, et la capacité à faire grandir les autres ingénieurs par le mentorat.


### Sécurité

Une attaque de la chaîne d'approvisionnement npm utilise binding.gyp pour compromettre des dizaines de paquets [https://cybersecuritynews.com/binding-gyp-supply-chain-attack-compromises-dozens-of-npm-packages/](https://cybersecuritynews.com/binding-gyp-supply-chain-attack-compromises-dozens-of-npm-packages/)

- Une nouvelle variante du ver auto-propageable "Shai-Hulud", baptisée "Miasma", cible l'écosystème npm (et PyPI sous le nom de "Hades") en dissimulant son exécution dans le fichier `binding.gyp` au lieu des scripts classiques `preinstall` ou `postinstall`.
- La technique, surnommée "Phantom Gyp", exploite le fait que npm lance automatiquement `node-gyp rebuild` dès qu'un fichier `binding.gyp` est présent à la racine d'un paquet pour compiler des modules natifs C/C++, exécutant ainsi le code malveillant dès la commande `npm install`.
- L'attaque contourne la plupart des outils de sécurité traditionnels car l'injection s'appuie sur l'évaluation récursive de commandes (via la syntaxe `<!(...)`) ou directement sur la fonction `eval()` de Python sous-jacente à GYP, cachée sous n'importe quelle clé du fichier.
- Le script malveillant télécharge un runtime alternatif (Bun) pour échapper aux détections comportementales de Node.js, puis moissonne les identifiants et secrets des développeurs et des environnements CI/CD (npm, GitHub, AWS, GCP, Azure, Kubernetes, HashiCorp Vault).
- Plus de 57 paquets npm (dont le SDK serveur de Vapi ou des outils liés à l'IA) et des dizaines de paquets PyPI ont été infectés via des comptes de mainteneurs compromis, le ver republiant automatiquement de nouvelles versions vérolées en utilisant les jetons volés.


### Loi, société et organisation

Restructuration chez Gitlab [https://about.gitlab.com/blog/gitlab-act-2/](https://about.gitlab.com/blog/gitlab-act-2/) 

- GitLab entame une restructuration majeure pour s'adapter à l'ère de l'intelligence artificielle agentique, incluant une réduction d'effectifs planifiée de manière transparente et ouverte.
- L'entreprise prévoit de réduire de 30 % le nombre de pays où elle maintient de petites équipes, d'aplatir sa hiérarchie en supprimant jusqu'à trois niveaux de gestion, et de réorganiser la R&amp;D en une soixantaine d'équipes plus petites et autonomes.
- Les processus internes vont être revus en intégrant des agents d'IA pour automatiser les revues, les approbations et les passages de relais afin d'accélérer le rythme de travail.
- La stratégie repose sur la conviction que le logiciel sera bientôt écrit par des machines et dirigé par des humains, ce qui va multiplier la demande de logiciels et transformer le rôle des ingénieurs vers la résolution de problèmes complexes.
- Sur le plan technique, GitLab reconstruit son infrastructure sous-jacente (notamment Git) pour supporter la charge massive générée par les agents d'IA, tout en misant sur l'orchestration du cycle de vie, la centralisation du contexte des données et une gouvernance intégrée.
- Le modèle économique évolue vers un système hybride combinant les abonnements classiques et une tarification à la consommation pour le travail effectué par les agents d'IA.

Un LLM local sur un mac pourrait coûter plus cher en électricité qu'un modèle hébergé sur OpenRouter dans le cloud
[https://www.williamangel.net/blog/2026/05/17/offline-llm-energy-use.html](https://www.williamangel.net/blog/2026/05/17/offline-llm-energy-use.html)

- Conclusion : L'inférence locale sur Mac M5 Max est 3x plus chère et 2x plus lente que le cloud ([OpenRouter](https://www.williamangel.net/blog/2026/05/17/offline-llm-energy-use.html)).
- Électricité : Négligeable (~0,02 $/heure pour 50-100W).
- Matériel (Le vrai coût) : Achat du Mac à 4 299 $; l'amortissement sur 3 à 5 ans plombe la rentabilité horaire.
- Coût au million de tokens (Gemma 4 31b) :
  - Mac M5 Max : 0,40 $à 4,79$ (pour 10-40 tokens/s).
  - OpenRouter : 0,38 $à 0,50$ (pour 60-70 tokens/s).
- Verdict pro : Le temps humain perdu à cause de la lenteur locale coûte infiniment plus cher que les tokens cloud. Privilégier les API (Anthropic, OpenRouter).

Ai didn't kill your junior pipeline [https://andrewmurphy.io/blog/ai-didnt-kill-your-junior-pipeline-you-did](https://andrewmurphy.io/blog/ai-didnt-kill-your-junior-pipeline-you-did)

- L'IA n'a pas tué le recrutement des juniors, les entreprises l'ont fait elles-mêmes, par effet de mode.
- Sans juniors, pas de futurs seniors : on retire l'échelle qui nous a tous fait monter.
- Tout le monde pêche dans le même bassin de seniors sans le réapprovisionner, pénurie garantie dans 3-5 ans.
- Une équipe 100% senior + IA est fragile : un départ et tout le savoir tacite s'évapore.
- Les juniors posent les "pourquoi ?" qui révèlent les bugs et processus absurdes ; l'IA, elle, exécute sans questionner.
- Les seniors s'atrophient aussi en déléguant leur réflexion à l'IA, pince à double effet sur les compétences.
- Dépendre des outils IA, c'est sous-traiter sa stratégie talents à des fournisseurs dont les prix vont tripler.
- Solution : redéfinir le rôle junior (revue de code IA + mentorat), pas le supprimer.

Les rapports internes de Microsoft révèlent la crise des coûts de l'IA : les agents coûtent plus cher que les employés humains [https://fortune.com/2026/05/22/microsoft-ai-cost-problem-tokens-agents/](https://fortune.com/2026/05/22/microsoft-ai-cost-problem-tokens-agents/)

- Des données et rapports internes chez Microsoft et d'autres géants de la tech ébranlent la promesse de rentabilité de l'IA, révélant que le déploiement d'agents autonomes à l'échelle de l'entreprise revient souvent plus cher que de payer des humains pour le même travail.
- Le modèle de tarification à l'usage (basé sur les tokens) se heurte à la nature même des architectures agentiques : contrairement à un simple chatbot, un agent boucle, enchaîne les appels d'outils, crée des sous-agents et auto-évalue son code, ce qui multiplie la consommation de tokens par un facteur de 5 à 30, voire jusqu'à 1 000 fois pour des tâches de programmation complexes.
- L'impact financier sur les budgets de calcul cloud est immédiat ; par exemple, Uber a entièrement épuisé l'intégralité de son budget annuel 2026 dédié au codage par IA en l'espace de seulement quatre mois.
- Face à cette explosion des coûts, des retours en arrière drastiques sont observés : Microsoft a ainsi commencé à suspendre une grande partie de ses licences internes Claude Code pour rediriger d'urgence ses milliers de développeurs vers sa propre solution moins onéreuse, GitHub Copilot CLI.
- Les directeurs techniques (CTO) et acheteurs de solutions logicielles qui ont signé des contrats pluriannuels basés sur des projections de réduction de masse salariale se retrouvent pris au piège, les gains réels de productivité ne parvenant pas à compenser les factures d'infrastructure exorbitantes.





## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

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
- 26-27 juin 2026 : [LeHACK](https://lehack.org/) - Paris (France) 
- 27 juin 2026 : [Asynconf](https://asynconf.com/) - Paris (France) <a href="https://cfp.asynconf.com/"><img alt="CFP Asynconf" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2026&color=red"></a>
- 2 juillet 2026 : [Azur Tech Summer 2026](https://www.telecom-valley.fr/azurtechsummer/) - Valbonne (France) <a href="https://conference-hall.io/azur-tech-summer-2026"><img alt="CFP Azur Tech Summit 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-March-2026&color=red"></a>
- 2 juillet 2026 : [MCP Connect Travel Edition](https://luma.com/ng66frvi) - Paris (France) 
- 2-3 juillet 2026 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2026"><img alt="CFP Sunny Tech 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2026&color=red"></a>
- 3 juillet 2026 : [Agile Lyon 2026](https://www.agilelyon.fr/) - Lyon (France) <a href="https://sessionize.com/agile-lyon-2026/"><img alt="CFP Agile Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-March-2026&color=red"></a>
- 6-8 juillet 2026 : [Riviera Dev](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/riviera-dev-2026"><img alt="CFP Riviera Dev" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-March-2026&color=red"></a>
- 28-30 août 2026 : [State of the Map](https://2026.stateofthemap.org/) - Champs-sur-Marne (France) 
- 4 septembre 2026 : [JUG Summer Camp 2026](https://www.jugsummercamp.org/) - La Rochelle (France) <a href="https://conference-hall.io/jug-summer-camp-2026"><img alt="CFP JUG Summer Camp 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-June-2026&color=green"></a>
- 10-11 septembre 2026 : [Nantes Craft](https://www.nantes-craft.fr/) - Nantes (France) <a href="https://conference-hall.io/nantes-craft-2026"><img alt="CFP Nantes Craft" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-June-2026&color=red"></a>
- 17 septembre 2026 : [dotAI](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-April-2026&color=red"></a>
- 17-18 septembre 2026 : [API Platform Conference 2026](https://api-platform.com/fr/con/) - Lille (France) <a href="https://api-platform.com/fr/con/2026/call-for-papers/"><img alt="CFP API Platform Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-March-2026&color=red"></a>
- 18 septembre 2026 : [WordCamp Bretagne](https://bretagne.wordcamp.org/2026/) - Rennes (France) <a href="https://conference-hall.io/wordcamp-bretagne"><img alt="CFP WordCamp Bretagne" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-July-2026&color=green"></a>
- 18 septembre 2026 : [dotJS](https://www.dotjs.io/) - Paris (France) <a href="https://www.dotjs.io/speak"><img alt="CFP dotJS" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-April-2026&color=red"></a>
- 18 septembre 2026 : [WordCamp Bretagne](https://bretagne.wordcamp.org/2026/) - Rennes (France) 
- 22 septembre 2026 : [Salon Data 2026](https://salondata.fr) - Nantes (France) <a href="https://sessionize.com/salon-data-2026/"><img alt="CFP Salon Data 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-May-2026&color=red"></a>
- 22-23 septembre 2026 : [Agile en Seine & IA 2026](https://www.agileenseine.com/) - Paris (France) <a href="https://sessionize.com/agile-en-seine-2026"><img alt="CFP Agile en Seine & IA 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-June-2026&color=green"></a>
- 24 septembre 2026 : [OWASP AppSec Days France 2026](https://www.owaspappsecdays.fr/2026/) - Paris (France) <a href="https://sessionize.com/owasp-appsec-days-france-2026"><img alt="CFP OWASP AppSec Days France 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-May-2026&color=red"></a>
- 24 septembre 2026 : [PlatformCon Paris](https://platformconlive.fr/) - Paris (France) <a href="https://conference-hall.io/platformcon26-live-day-paris"><img alt="CFP PlatformCon Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2026&color=green"></a>
- 24 septembre 2026 : [React Native Connection 2026](https://reactnativeconnection.io/) - Paris (France) <a href="https://conference-hall.io/react-native-connection-2026"><img alt="CFP React Native Connection 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-June-2026&color=red"></a>
- 24-26 septembre 2026 : [Paris Web 2026](https://www.paris-web.fr) - Paris (France) <a href="https://appel.paris-web.fr/"><img alt="CFP Paris Web 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-April-2026&color=red"></a>  <img alt="Closed Captions" src="https://img.shields.io/static/v1?label=CC&message=Closed%20Captions&color=blue" />
- 25 septembre 2026 : [SAP Inside Track Paris 2026](https://sapcommunityparis.github.io/SITPAR2026) - Paris (France) <a href="https://sessionize.com/sit-paris-2026"><img alt="CFP SAP Inside Track Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-July-2026&color=green"></a>
- 28-29 septembre 2026 : [4th Tech Summit on AI & Robotics](https://artificialintelligence.averconferences.com/) - Paris (France) & Online <a href="https://artificialintelligence.averconferences.com/scientific_session.php"><img alt="CFP tech summit 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-March-2026&color=red"></a>
- 1 octobre 2026 : [WAX 2026](https://www.waxconf.fr/) - Marseille (France) <a href="https://conference-hall.io/wax-2026-conference-tech-au-stade-velodrome"><img alt="CFP WAX 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2026&color=red"></a>
- 1-2 octobre 2026 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) <a href="https://conference-hall.io/volcamp-2026"><img alt="CFP Volcamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2026&color=red"></a>
- 2 octobre 2026 : [DevFest Perros-Guirec 2026](https://devfest.codedarmor.fr/) - Perros-Guirec (France) <a href="https://conference-hall.io/devfest-perros-guirec-2026"><img alt="CFP DevFest Perros-Guirec 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2026&color=green"></a>
- 5-9 octobre 2026 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) <a href="https://dvbe26.cfp.dev/"><img alt="CFP Devoxx Belgium" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-July-2026&color=green"></a>
- 8-9 octobre 2026 : [Forum PHP 2026](https://event.afup.org/) - Marne-la-Vallée (France) <a href="https://afup.org/event/forumphp2026"><img alt="CFP Forum PHP 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2026&color=green"></a>
- 12 octobre 2026 : [Dev With AI](https://www.devw.ai/) - Paris (France) 
- 22-23 octobre 2026 : [Agile Tour Bordeaux 2026](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2026"><img alt="CFP Agile Tour Bordeaux 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2026&color=green"></a>
- 26 octobre 2026 : [Agile Tour Montpellier](https://agiletourmontpellier.fr/) - Montpellier (France) <a href="https://conference-hall.io/atmtp26"><img alt="CFP Agile Tour Montpellier" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-June-2026&color=green"></a>
- 27-29 octobre 2026 : [Directions EMEA 2026](https://www.directionsforpartners.com/emea2026) - Paris (France) <a href="https://sessionize.com/directions-emea-2026"><img alt="CFP Directions EMEA 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-September-2026&color=green"></a>
- 29-30 octobre 2026 : [BDX I/O 2026](https://bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/bdx-i-o-2026"><img alt="CFP BDX I/O 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-June-2026&color=green"></a>
- 29-30 octobre 2026 : [Agile Tour Nantais 2026](https://agilenantes.org/evenements/agile-tour-nantes/agile-tour-nantais-2026/) - Nantes (France) <a href="https://conference-hall.io/cloud-nord-2026"><img alt="CFP Agile Tour Nantais 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2026&color=green"></a>
- 29 octobre 2026-1 novembre 2026 : [Pycon FR](https://www.pycon.fr/2026/) - Biarritz (France) 
- 30 octobre 2026 : [Cloud Nord 2026](https://cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/cloud-nord-2026"><img alt="CFP Cloud Nord 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-June-2026&color=green"></a>
- 4-5 novembre 2026 : [Devoxx Morocco](https://devoxx.ma/) - Casablanca (Morocco) <a href="https://dvma26.cfp.dev"><img alt="CFP of Devoxx Morocco" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-July-2026&color=green"></a>
- 14-15 novembre 2026 : [Capitole du Libre](https://capitoledulibre.org) - Toulouse (France) <a href="https://cfp.capitoledulibre.org/cdl-2026/cfp"><img alt="CFP Capitole du Libre 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-July-2026&color=green"></a>
- 19 novembre 2026 : [DevFest Toulouse 2026](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse-2026"><img alt="CFP DevFest Toulouse 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2026&color=red"></a>
- 19 novembre 2026 : [Agile Laval 2026](http://www.agilelaval.org/) - Laval (France) <a href="https://sessionize.com/agile-laval-2026"><img alt="CFP Agile Laval 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-July-2026&color=green"></a>
- 19 novembre 2026 : [OVHcloud Summit](https://summit.ovhcloud.com/en/) - Paris (France) 
- 19 novembre 2026 : [Codeurs en Seine](https://www.codeursenseine.com/2026) - Rouen (France) 
- 27 novembre 2026 : [DevFest Paris 2026](https://devfest.gdgparis.fr/) - Paris (France) <a href="https://conference-hall.io/devfest-paris-2026"><img alt="CFP DevFest Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-July-2026&color=green"></a>
- 1-3 décembre 2026 : [Apidays Paris](https://www.apidays.global/paris) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP Apidays Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2026&color=green"></a>
- 2-3 décembre 2026 : [Cloud Native AI Summit Europe](https://www.cloudnative.ai/events/paris) - Paris (France) <a href="https://sessionize.com/cloud-native-summit-europe-2026/"><img alt="CFP Cloud Native AI Summit Europe" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-August-2026&color=green"></a>
- 4 décembre 2026 : [DevFest Lyon 2026](https://devfest.gdglyon.com/) - Lyon (France) <a href="https://conference-hall.io/devfest-lyon-2026"><img alt="CFP DevFest Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-June-2026&color=red"></a>
- 4 décembre 2026 : [DevFest Dijon 2026](https://devfest.developers-group-dijon.fr/) - Dijon (France) <a href="https://conference-hall.io/devfest-dijon-2026"><img alt="CFP DevFest Dijon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2026&color=green"></a>
- 9-10 décembre 2026 : [OpenSource Expérience](https://www.opensource-experience.com/) - Paris (France) <a href="https://pretalx.com/open-source-experience-2026/cfp"><img alt="CFP OpenSource Expérience" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-June-2026&color=green"></a>
- 9-10 décembre 2026 : [DevOps REX](https://www.devopsrex.fr/fr/) - Paris (France) <a href="https://www.devopsrex.fr/fr/cfp"><img alt="CFP DevOps REX" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-June-2026&color=red"></a>
- 10 décembre 2026 : [KCD Provence](https://cloudnative-provence.fr/) - Aix-en-Provence (France) <a href="https://conference-hall.io/kcd-provence-2026"><img alt="KCD Provence 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%205-July-2026&color=green"></a>
- 7-9 avril 2027 : [Devoxx France 2027](https://www.devoxx.fr/) - Paris (France) 
- 3 juin 2027 : [Cloud Native Days France 2027](https://www.cloudnativedays.fr/) - Paris (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

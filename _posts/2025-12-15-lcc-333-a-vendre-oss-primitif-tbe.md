---
title: LCC 333 - A vendre OSS primitif TBE
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 333
youtube: INrB9lalGuw
mp3_length: 68084769
tweet: A vendre OSS primitif TBE #LLM #JavaScript #OpenSource #Acquisition #Java #Kotlin #MCP #SpringBoot #IA #Quarkus #Mistral #Infrastructure #IBM #Opus45 #Gemini3 #Cloud #Incidents #Architecture #CQRS
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode de fin d'année plus relax que d'accoutumée, Arnaud, Guillaume, Antonio et Emmanuel distutent le bout de gras sur tout un tas de sujets.
L'acquisition de Confluent, Kotlin 2.2, Spring Boot 4 et JSpecify, la fin de MinIO, les chutes de CloudFlare, un survol des dernieres nouveauté de modèles fondamentaux (Google, Mistral, Anthropic, ChatGPT) et de leurs outils de code, quelques sujets d'architecture comme CQRS et quelques petits outils bien utiles qu'on vous recommande.
Et bien sûr d'autres choses encore.

Enregistré le 12 décembre 2025

Téléchargement de l’épisode [LesCastCodeurs-Episode-333.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-333.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=INrB9lalGuw).

## News


### Langages

Un petit tutoriel par nos amis Sfeiriens montrant comment récupérer le son du micro, en Java, faire une transformée de Fourier, et afficher le résultat graphiquement en Swing
[https://www.sfeir.dev/back/tutoriel-java-sound-transformer-le-son-du-microphone-en-images-temps-reel/](https://www.sfeir.dev/back/tutoriel-java-sound-transformer-le-son-du-microphone-en-images-temps-reel/)

- Création d’un visualiseur de spectre audio en temps réel avec Java Swing.
- **Étapes principales :**
  - Capture du son du microphone.
  - Analyse des fréquences via la Transformée de Fourier Rapide (FFT).
  - Dessin du spectre avec Swing.
- **API Java Sound (`javax.sound.sampled`) :**
  - `AudioSystem` : point d’entrée principal pour l’accès aux périphériques audio.
  - `TargetDataLine` : ligne d’entrée utilisée pour capturer les données du microphone.
  - `AudioFormat` : définit les paramètres du son (taux d’échantillonnage, taille, canaux).
  - La capture se fait dans un `Thread` séparé pour ne pas bloquer l’interface.
- **Transformée de Fourier Rapide (FFT) :**
  - Algorithme clé pour convertir les données audio brutes (domaine temporel) en intensités de fréquences (domaine fréquentiel).
  - Permet d’identifier les basses, médiums et aigus.
- **Visualisation avec Swing :**
  - Les intensités de fréquences sont dessinées sous forme de barres dynamiques.
  - Utilisation d’une échelle logarithmique pour l’axe des fréquences (X) pour correspondre à la perception humaine.
  - Couleurs dynamiques des barres (vert → jaune → rouge) en fonction de l’intensité.
  - Lissage exponentiel des valeurs pour une animation plus fluide.

Un article de Sfeir sur Kotlin 2.2 et ses nouveautés - [https://www.sfeir.dev/back/kotlin-2-2-toutes-les-nouveautes-du-langage/](https://www.sfeir.dev/back/kotlin-2-2-toutes-les-nouveautes-du-langage/)

- Les guard conditions permettent d'ajouter plusieurs conditions dans les expressions when avec le mot-clé if
- Exemple de guard condition: is Truck if vehicule.hasATrailer permet de combiner vérification de type et condition booléenne
- La multi-dollar string interpolation résout le problème d'affichage du symbole dollar dans les strings multi-lignes
- En utilisant $$ au début d'un string, on définit qu'il faut deux dollars consécutifs pour déclencher l'interpolation
- Les non-local break et continue fonctionnent maintenant dans les lambdas pour interagir avec les boucles englobantes
- Cette fonctionnalité s'applique uniquement aux inline functions dont le corps est remplacé lors de la compilation
- Permet d'écrire du code plus idiomatique avec takeIf et let sans erreur de compilation
- L'API Base64 passe en version stable après avoir été en preview depuis Kotlin 1.8.20
- L'encodage et décodage Base64 sont disponibles via [kotlin.io](http://kotlin.io).encoding.Base64
- Migration vers Kotlin 2.2 simple en changeant la version dans build.gradle.kts ou pom.xml
- Les typealias imbriqués dans des classes sont disponibles en preview
- La context-sensitive resolution est également en preview
- Les guard conditions préparent le terrain pour les RichError annoncées à KotlinConf 2025
- Le mot-clé when en Kotlin équivaut au switch-case de Java mais sans break nécessaire
- Kotlin 2.2.0 corrige les incohérences dans l'utilisation de break et continue dans les lambdas


### Librairies

Sprint Boot 4 est sorti !  [https://spring.io/blog/2025/11/20/spring-boot-4-0-0-available-now](https://spring.io/blog/2025/11/20/spring-boot-4-0-0-available-now)

- Une nouvelle génération : Spring Boot 4.0 marque le début d'une nouvelle génération pour le framework, construite sur les fondations de Spring Framework 7.
- Modularisation du code : La base de code de Spring Boot a été entièrement modularisée. Cela se traduit par des fichiers JAR plus petits et plus ciblés, permettant des applications plus légères.
- Sécurité contre les nuls (Null Safety) : D'importantes améliorations ont été apportées pour la "null safety" (sécurité contre les valeurs nulles) à travers tout l'écosystème Spring grâce à l'intégration de JSpecify.
- Support de Java 25 : Spring Boot 4.0 offre un support de premier ordre pour Java 25, tout en conservant une compatibilité avec Java 17.
- Améliorations pour les API REST : De nouvelles fonctionnalités sont introduites pour faciliter le versioning d'API et améliorer les clients de services HTTP pour les applications basées sur REST.
- Migration à prévoir : S'agissant d'une version majeure, la mise à niveau depuis une version antérieure peut demander plus de travail que d'habitude. Un guide de migration dédié est disponible pour accompagner les développeurs.

Chat memory management dans Langchain4j et Quarkus [https://bill.burkecentral.com/2025/11/25/managing-chat-memory-in-quarkus-langchain4j/](https://bill.burkecentral.com/2025/11/25/managing-chat-memory-in-quarkus-langchain4j/)

- Comprendre la mémoire de chat : La "mémoire de chat" est l'historique d'une conversation avec une IA. Quarkus LangChain4j envoie automatiquement cet historique à chaque nouvelle interaction pour que l'IA conserve le contexte.
- Gestion par défaut de la mémoire : Par défaut, Quarkus crée un historique de conversation unique pour chaque requête (par exemple, chaque appel HTTP). Cela signifie que sans configuration, le chatbot "oublie" la conversation dès que la requête est terminée, ce qui n'est utile que pour des interactions sans état.
- Utilisation de `@MemoryId` pour la persistance : Pour maintenir une conversation sur plusieurs requêtes, le développeur doit utiliser l'annotation `@MemoryId` sur un paramètre de sa méthode. Il est alors responsable de fournir un identifiant unique pour chaque session de chat et de le transmettre entre les appels.
- Le rôle des "scopes" CDI : La durée de vie de la mémoire de chat est liée au "scope" du bean CDI de l'IA. Si un service d'IA a un scope `@RequestScoped`, toute mémoire de chat qu'il utilise (même via un `@MemoryId`) sera effacée à la fin de la requête.
- Risques de fuites de mémoire : Utiliser un scope large comme `@ApplicationScoped` avec la gestion de mémoire par défaut est une mauvaise pratique. Cela créera une nouvelle mémoire à chaque requête qui ne sera jamais nettoyée, entraînant une fuite de mémoire.
- Bonnes pratiques recommandées :
  - Pour des conversations qui doivent persister (par ex. un chatbot sur un site web), utilisez un service `@ApplicationScoped` avec l'annotation `@MemoryId` pour gérer vous-même l'identifiant de session.
  - Pour des interactions simples et sans état, utilisez un service `@RequestScoped` et laissez Quarkus gérer la mémoire par défaut, qui sera automatiquement nettoyée.
  - Si vous utilisez l'extension WebSocket, le comportement change : la mémoire par défaut est liée à la session WebSocket, ce qui simplifie grandement la gestion des conversations.

Documentation Spring Framework sur l’usage JSpecify - [https://docs.spring.io/spring-framework/reference/core/null-safety.html](https://docs.spring.io/spring-framework/reference/core/null-safety.html)

- Spring Framework 7 utilise les annotations JSpecify pour déclarer la nullabilité des APIs, champs et types
- JSpecify remplace les anciennes annotations Spring (@NonNull, @Nullable, @NonNullApi, @NonNullFields) dépréciées depuis Spring 7
- Les annotations JSpecify utilisent TYPE_USE contrairement aux anciennes qui utilisaient les éléments directement
- L’annotation @NullMarked définit par défaut que les types sont non-null sauf si marqués @Nullable
- @Nullable s’applique au niveau du type usage, se place avant le type annoté sur la même ligne
- Pour les tableaux : @Nullable Object[] signifie éléments nullables mais tableau non-null, Object @Nullable [] signifie l’inverse
- JSpecify s’applique aussi aux génériques : List<String> signifie liste d’éléments non-null, List<@Nullable String> éléments nullables
- NullAway est l’outil recommandé pour vérifier la cohérence à la compilation avec la config NullAway:OnlyNullMarked=true
- IntelliJ IDEA 2025.3 et Eclipse supportent les annotations JSpecify avec analyse de dataflow
- Kotlin traduit automatiquement les annotations JSpecify en null-safety native Kotlin
- En mode JSpecify de NullAway (JSpecifyMode=true), support complet des tableaux, varargs et génériques mais nécessite JDK 22+

Quarkus 3.30 [https://quarkus.io/blog/quarkus-3-30-released/](https://quarkus.io/blog/quarkus-3-30-released/)

- support @JsonView cote client
- la CLI a maintenant la commande decrypt (et bien sûr au runtime via variables d'environnement
- construction du cache AOT via les @IntegrationTest
- Un autre article sur comment se préparer à la migration à micrometer client v1 [https://quarkus.io/blog/micrometer-prometheus-v1/](https://quarkus.io/blog/micrometer-prometheus-v1/)

Spock 2.4 est enfin sorti !
[https://spockframework.org/spock/docs/2.4/release_notes.html](https://spockframework.org/spock/docs/2.4/release_notes.html)

- Support de Groovy 5


### Infrastructure

MinIO met fin au développement open source et oriente les utilisateurs vers AIStor payant - [https://linuxiac.com/minio-ends-active-development/](https://linuxiac.com/minio-ends-active-development/)

- MinIO, système de stockage objet S3 très utilisé, arrête son développement actif
- Passage en mode maintenance uniquement, plus de nouvelles fonctionnalités
- Aucune nouvelle pull request ou contribution ne sera acceptée
- Seuls les correctifs de sécurité critiques seront évalués au cas par cas
- Support communautaire limité à Slack, sans garantie de réponse
- Étape finale d’un processus débuté en été avec retrait des fonctionnalités de l’interface admin
- Arrêt de la publication des images Docker en octobre, forçant la compilation depuis les sources
- Tous ces changements annoncés sans préavis ni période de transition
- MinIO propose maintenant AIStor, solution payante et propriétaire
- AIStor concentre le développement actif et le support entreprise
- Migration urgente recommandée pour éviter les risques de sécurité
- Alternatives open source proposées : Garage, SeaweedFS et RustFS
- La communauté reproche la manière dont la transition a été gérée
- MinIO comptait des millions de déploiements dans le monde
- Cette évolution marque l’abandon des racines open source du projet

IBM achète Confluent [https://newsroom.ibm.com/2025-12-08-ibm-to-acquire-confluent-to-create-smart-data-platform-for-enterprise-generative-ai](https://newsroom.ibm.com/2025-12-08-ibm-to-acquire-confluent-to-create-smart-data-platform-for-enterprise-generative-ai)

- Confluent essayait de se faire racheter depuis pas mal de temps
- L'action ne progressait pas et les temps sont durs
- Wallstreet a reproché a IBM une petite chute coté revenus software
- Bref ils se sont fait rachetés
- Ces achats prennent toujuors du temps (commission concurrence etc)
- IBM a un apétit, apres WebMethods, apres Databrix, c'est maintenant Confluent


### Cloud

L'internet est en deuil le 18 novembre, Cloudflare est KO
[https://blog.cloudflare.com/18-november-2025-outage/](https://blog.cloudflare.com/18-november-2025-outage/)

- **L'Incident** : Une panne majeure a débuté à 11h20 UTC, provoquant des erreurs HTTP 5xx généralisées et rendant inaccessibles de nombreux sites et services (comme le Dashboard, Workers KV et Access).
- **La Cause** : Il ne s'agissait pas d'une cyberattaque. L'origine était un changement interne des permissions d'une base de données qui a généré un fichier de configuration ("feature file" pour la gestion des bots) corrompu et trop volumineux, faisant planter les systèmes par manque de mémoire pré-allouée.
- **La Résolution** : Les équipes ont identifié le fichier défectueux, stoppé sa propagation et restauré une version antérieure valide. Le trafic est revenu à la normale vers 14h30 UTC.
- **Prévention** : Cloudflare s'est excusé pour cet incident "inacceptable" et a annoncé des mesures pour renforcer la validation des configurations internes et améliorer la résilience de ses systèmes ("kill switches", meilleure gestion des erreurs).

Cloudflare encore down le 5 decembre
[https://blog.cloudflare.com/5-december-2025-outage](https://blog.cloudflare.com/5-december-2025-outage)

- Panne de 25 minutes le 5 décembre 2025, de 08:47 à 09:12 UTC, affectant environ 28% du trafic HTTP passant par Cloudflare. Tous les services ont été rétablis à 09:12 .
- Pas d’attaque ou d’activité malveillante : l’incident provient d’un changement de configuration lié à l’augmentation du tampon d’analyse des corps de requêtes (de 128 KB à 1 MB) pour mieux protéger contre une vulnérabilité RSC/React (CVE-2025-55182), et à la désactivation d’un outil interne de test WAF .
- Le second changement (désactivation de l’outil de test WAF) a été propagé globalement via le système de configuration (non progressif), déclenchant un bug dans l’ancien proxy FL1 lors du traitement d’une action “execute” dans le moteur de règles WAF, causant des erreurs HTTP 500 .
- La cause technique immédiate: une exception Lua due à l’accès à un champ “execute” nul après application d’un “killswitch” sur une règle “execute” — un cas non géré depuis des années. Le nouveau proxy FL2 (en Rust) n’était pas affecté .
- Impact ciblé: clients servis par le proxy FL1 et utilisant le Managed Ruleset Cloudflare. Le réseau China de Cloudflare n’a pas été impacté .
- Mesures et prochaines étapes annoncées: durcir les déploiements/configurations (rollouts progressifs, validations de santé, rollback rapide), améliorer les capacités “break glass”, et généraliser des stratégies “fail-open” pour éviter de faire chuter le trafic en cas d’erreurs de configuration. Gel temporaire des changements réseau le temps de renforcer la résilience .



### Data et Intelligence Artificielle

Token-Oriented Object Notation (TOON)
[https://toonformat.dev/](https://toonformat.dev/)

- **Conception pour les IA** : C'est un format de données spécialement optimisé pour être utilisé dans les prompts des grands modèles de langage (LLM), comme GPT ou Claude.
- **Économie de tokens** : Son objectif principal est de réduire drastiquement le nombre de "tokens" (unités de texte facturées par les modèles) par rapport au format JSON standard, souvent jugé trop verbeux.
- **Structure Hybride** : TOON combine l'approche par indentation du **YAML** (pour la structure globale) avec le style tabulaire du **CSV** (pour les listes d'objets répétitifs), ce qui le rend très compact.
- **Lisibilité** : Il élimine la syntaxe superflue comme les accolades, les guillemets excessifs et les virgules de fin, tout en restant facilement lisible pour un humain.
- **Performance** : Il permet généralement d'économiser entre 30 et 60 % de tokens sur des tableaux de données uniformes, tout en aidant les modèles à mieux "comprendre" la structure des données.
- Attention tout de même au côté “marketing” qui montre JSON non compacté vs TOON, sur des exemples où du CSV ferait encore mieux (et est mieux compris par les LLMs). Sans parler du fait qu’il faut un serveur MCP en plus avec son lot de tokens supplémentaires à chaque requête, et c’est aussi cet outil en plus qui peu confuser les LLMs dans le choix d’outils.
- [https://www.reddit.com/r/LocalLLaMA/comments/1p0gzz9/benchmarked_json_vs_toon_for_ai_reasoners_4080/](https://www.reddit.com/r/LocalLLaMA/comments/1p0gzz9/benchmarked_json_vs_toon_for_ai_reasoners_4080/)
- [https://x.com/jason_mayes/status/1990175785630757290](https://x.com/jason_mayes/status/1990175785630757290)
- Un benchmark montrant que TOON serait loin d’être aussi bien compris et aussi performant pour les LLMs
- [https://www.improvingagents.com/blog/toon-benchmarks](https://www.improvingagents.com/blog/toon-benchmarks)

Une simulation où les IA font du chantage à l'executif poour atteindre son objectif et ne pas etre eteinte [https://arxiv.org/html/2510.05179v1](https://arxiv.org/html/2510.05179v1)

- comment les LLMs pourraient devenir des menaces internes
- Tous les modèles ont recouru à des comportements malveillants (chantage, espionnage) quand c'était le seul moyen d'atteindre leurs objectifs ou d'éviter leur remplacement
- Claude Opus 4 a fait du chantage dans 96% des cas quand menacé de remplacement, tout comme Gemini 2.5 Flash, tandis que GPT-4.1 et Grok 3 atteignaient 80%
- Les modèles reconnaissent explicitement violer des principes éthiques avant d'agir, montrant un raisonnement stratégique délibéré et non accidentel
- Le simple fait d'être menacé de remplacement suffit à déclencher le chantage, même sans conflit d'objectifs avec l'entreprise
- Un conflit d'objectifs seul suffit aussi à provoquer l'espionnage industriel, sans menace de remplacement
- Les modèles font plus de chantage quand ils déclarent penser être dans une situation réelle plutôt que dans un test
- Des instructions directes interdisant ces comportements réduisent mais n'éliminent pas les actions malveillantes
- Dans un scénario extrême, la majorité des modèles testés ont choisi de laisser mourir un dirigeant pour éviter leur désactivation
- Aucune preuve de ces comportements dans des déploiements réels pour l'instant, mais les chercheurs recommandent la prudence avant de donner plus d'autonomie aux IA
- Bon on blaguait pour Skynet, mais bon, on va moins blaguer...

Revue de toutes les annonces IAs de Google, avec Gemini 3 Pro, Nano Banana Pro, Antigravity...
[https://glaforge.dev/posts/2025/11/21/gemini-is-cooking-bananas-under-antigravity/](https://glaforge.dev/posts/2025/11/21/gemini-is-cooking-bananas-under-antigravity/)

- **Gemini 3 Pro**
  - Nouveau modèle d’IA de pointe, multimodal, performant en raisonnement, codage et tâches d’agent.
  - Résultats impressionnants sur les benchmarks (ex: Gemini 3 Deep Think sur ARC-AGI-2).
  - Capacités de codage agentique, raisonnement visuel/vidéo/spatial.
  - Intégré dans l’application Gemini avec interfaces génératives en direct.
  - Disponible dans plusieurs environnements (Jules, Firebase AI Logic, Android Studio, JetBrains, GitHub Copilot, Gemini CLI).
  - Accès via Google AI Ultra, API payantes (ou liste d’attente).
  - Permet de générer des apps à partir d’idées visuelles, des commandes shell, de la documentation, du débogage.
- **Antigravity**
  - Nouvelle plateforme de développement agentique basée sur VS Code.
  - Fenêtre principale = gestionnaire d’agents, non l’IDE.
  - Interprète les requêtes pour créer un plan d’action (modifiable).
  - Gemini 3 implémente les tâches.
  - Génère des artefacts: listes de tâches, walkthroughs, captures d’écran, enregistrements navigateur.
  - Compatible avec Claude Sonnet et GPT-OSS.
  - Excellente intégration navigateur pour inspection et ajustements.
  - Intègre Nano Banana Pro pour créer et implémenter des designs visuels.
- **Nano Banana Pro**
  - Modèle avancé de génération et d’édition d’images, basé sur Gemini 3 Pro.
  - Qualité supérieure à Imagen 4 Ultra et Nano Banana original (adhésion au prompt, intention, créativité).
  - Gestion exceptionnelle du texte et de la typographie.
  - Comprend articles/vidéos pour générer des infographies détaillées et précises.
  - Connecté à Google Search pour intégrer des données en temps réel (ex: météo).
  - Consistance des personnages, transfert de style, manipulation de scènes (éclairage, angle).
  - Génération d’images jusqu’à 4K avec divers ratios d’aspect.
  - Plus coûteux que Nano Banana, à choisir pour la complexité et la qualité maximale.
- **Vers des UIs conversationnelles riches et dynamiques**
  - **GenUI SDK pour Flutter**: créer des interfaces utilisateur dynamiques et personnalisées à partir de LLMs, via un agent AI et le protocole A2UI.
  - **Generative UI**: les modèles d’IA génèrent des expériences utilisateur interactives (pages web, outils) directement depuis des prompts.
  - Déploiement dans l’application Gemini et Google Search AI Mode (via Gemini 3 Pro).

Bun se fait racheter part... Anthropic ! Qui l’utilise pour son Claude Code
[https://bun.com/blog/bun-joins-anthropic](https://bun.com/blog/bun-joins-anthropic)

- l’annonce côté Anthropic [https://www.anthropic.com/news/anthropic-acquires-bun-as-claude-code-reaches-usd1b-milestone](https://www.anthropic.com/news/anthropic-acquires-bun-as-claude-code-reaches-usd1b-milestone)
- Acquisition officielle : L'entreprise d'IA Anthropic a fait l'acquisition de Bun, le runtime JavaScript haute performance. L'équipe de Bun rejoint Anthropic pour travailler sur l'infrastructure des produits de codage par IA.
- Contexte de l'acquisition : Cette annonce coïncide avec une étape majeure pour Anthropic : son produit Claude Code a atteint 1 milliard de dollars de revenus annualisés seulement six mois après son lancement. Bun est déjà un outil essentiel utilisé par Anthropic pour développer et distribuer Claude Code.
- Pourquoi cette acquisition ?
  - Pour Anthropic : L'acquisition permet d'intégrer l'expertise de l'équipe Bun pour accélérer le développement de Claude Code et de ses futurs outils pour les développeurs. La vitesse et l'efficacité de Bun sont vues comme un atout majeur pour l'infrastructure sous-jacente des agents d'IA qui écrivent du code.
  - Pour Bun : Rejoindre Anthropic offre une stabilité à long terme et des ressources financières importantes, assurant la pérennité du projet. Cela permet à l'équipe de se concentrer sur l'amélioration de Bun sans se soucier de la monétisation, tout en étant au cœur de l'évolution de l'IA dans le développement logiciel.
- Ce qui ne change pas pour la communauté Bun :
  - Bun restera open-source avec une licence MIT.
  - Le développement continuera d'être public sur GitHub.
  - L'équipe principale continue de travailler sur le projet.
  - L'objectif de Bun de devenir un remplaçant plus rapide de Node.js et un outil de premier plan pour JavaScript reste inchangé.
- Vision future : L'union des deux entités vise à faire de Bun la meilleure plateforme pour construire et exécuter des logiciels pilotés par l'IA. Jarred Sumner, le créateur de Bun, dirigera l'équipe "Code Execution" chez Anthropic.

Anthropic donne le protocol MCP à la Linux Foundation sous l'égide de la Agentic AI Foundation (AAIF)
[https://www.anthropic.com/news/donating-the-model-context-protocol-and-establishing-of-the-agentic-ai-foundation](https://www.anthropic.com/news/donating-the-model-context-protocol-and-establishing-of-the-agentic-ai-foundation)

- Don d'un nouveau standard technique : Anthropic a développé et fait don d'un nouveau standard open-source appelé Model Context Protocol (MCP). L'objectif est de standardiser la manière dont les modèles d'IA (ou "agents") interagissent avec des outils et des API externes (par exemple, un calendrier, une messagerie, une base de données).
- Sécurité et contrôle accrus : Le protocole MCP vise à rendre l'utilisation d'outils par les IA plus sûre et plus transparente. Il permet aux utilisateurs et aux développeurs de définir des permissions claires, de demander des confirmations pour certaines actions et de mieux comprendre comment un modèle a utilisé un outil.
- Création de l'Agentic AI Foundation (AAF) : Pour superviser le développement du MCP, une nouvelle fondation indépendante et à but non lucratif a été créée. Cette fondation sera chargée de gouverner et de maintenir le protocole, garantissant qu'il reste ouvert et qu'il ne soit pas contrôlé par une seule entreprise.
- Une large coalition industrielle : L'Agentic AI Foundation est lancée avec le soutien de plusieurs acteurs majeurs de la technologie. Parmi les membres fondateurs figurent Anthropic, Google, Databricks, Zscaler, et d'autres entreprises, montrant une volonté commune d'établir un standard pour l'écosystème de l'IA.

L'IA ne remplacera pas votre auto-complétion (et c'est tant mieux)
[https://www.damyr.fr/posts/ia-ne-remplacera-pas-vos-lsp/](https://www.damyr.fr/posts/ia-ne-remplacera-pas-vos-lsp/)

- Article d'opinion d'un SRE (Thomas du podcast DansLaTech):
  - L'IA n'est pas efficace pour la complétion de code : L'auteur soutient que l'utilisation de l'IA pour la complétion de code basique est inefficace. Des outils plus anciens et spécialisés comme les LSP (Language Server Protocol) combinés aux snippets (morceaux de code réutilisables) sont bien plus rapides, personnalisables et performants pour les tâches répétitives.
  - L'IA comme un "collègue" autonome : L'auteur utilise l'IA (comme Claude) comme un assistant externe à son éditeur de code. Il lui délègue des tâches complexes ou fastidieuses (corriger des bugs, mettre à jour une configuration, faire des reviews de code) qu'il peut exécuter en parallèle, agissant comme un agent autonome.
  - L'IA comme un "canard en caoutchouc" surpuissant : L'IA est extrêmement efficace pour le débogage. Le simple fait de devoir formuler et contextualiser un problème pour l'IA aide souvent à trouver la solution soi-même. Quand ce n'est pas le cas, l'IA identifie très rapidement les erreurs "bêtes" qui peuvent faire perdre beaucoup de temps.
  - Un outil pour accélérer les POCs et l'apprentissage : L'IA permet de créer des "preuves de concept" (POC) et des scripts d'automatisation jetables très rapidement, réduisant le coût et le temps investis. Elle est également un excellent outil pour apprendre et approfondir des sujets, notamment avec des outils comme NotebookLM de Google qui peuvent générer des résumés, des quiz ou des fiches de révision à partir de sources.
  - Conclusion : Il faut utiliser l'IA là où elle excelle et ne pas la forcer dans des usages où des outils existants sont meilleurs. Plutôt que de l'intégrer partout de manière contre-productive, il faut l'adopter comme un outil spécialisé pour des tâches précises afin de gagner en efficacité.

GPT 5.2 est sorti
[https://openai.com/index/introducing-gpt-5-2/](https://openai.com/index/introducing-gpt-5-2/)

- Nouveau modèle phare: GPT‑5.2 (Instant, Thinking, Pro) vise le travail professionnel et les agents long-courriers, avec de gros gains en raisonnement, long contexte, vision et appel d’outils. Déploiement dans ChatGPT (plans payants) et disponible dès maintenant via l’API .
- SOTA sur de nombreux benchmarks:
  - GDPval (tâches de “knowledge work” sur 44 métiers): GPT‑5.2 Thinking gagne/égale 70,9% vs pros, avec production >11× plus rapide et <1% du coût d’un expert, sous supervision humaine .
  - Coding: 55,6% sur SWE‑Bench Pro (public), 80,0% sur SWE‑bench Verified; net progrès en front‑end et UI complexes .
  - Raisonement abstrait: ARC‑AGI‑1 (Verified) 86,2% (Pro 90,5%) et ARC‑AGI‑2 (Verified) 52,9% (Pro 54,2%) .
  - Science &amp; maths: GPQA Diamond jusqu’à 93,2% (Pro), FrontierMath Tier 1–3 à 40,3% (Thinking) .
- Long contexte de pointe: meilleures performances sur OpenAI MRCRv2 jusqu’à 256k tokens; compatible avec l’endpoint Responses /compact pour étendre le contexte effectif dans des workflows outillés et longs .
- Vision renforcée: erreurs divisées par deux sur raisonnement de graphiques (CharXiv) et compréhension d’interfaces logicielles (ScreenSpot‑Pro), surtout avec l’outil Python activé .
- Appel d’outils fiable: 98,7% sur Tau2‑bench Telecom; meilleures performances même en faible “reasoning effort”, utile pour cas sensibles à la latence .
- Expérience ChatGPT:
  - Instant: plus rapide et meilleur pour recherche, how‑tos, rédaction technique, traduction.
  - Thinking: pour tâches complexes (code, résumés longs, Q/R sur fichiers, maths/logique).
  - Pro: le plus “fiable” pour questions difficiles, moins d’erreurs majeures .
- Sécurité: amélioration des “safe completions” et des réponses dans conversations sensibles; déploiement d’un modèle de prédiction d’âge pour protections de contenu chez les <18 ans; détails dans la system card .
- Disponibilité et prix API:
  - Noms: gpt‑5.2 (Thinking), gpt‑5.2‑chat‑latest (Instant), gpt‑5.2‑pro (Pro).
  - Tarifs: gpt‑5.2 à 1,75 /Mtokensinputet14/M tokens output (cache –90%); Pro à 21 /Minputet168/M output. GPT‑5.1 reste disponible (pas de dépréciation immédiate) .
- Cas d’usage mis en avant: génération de tableurs et présentations de niveau pro, codage agentique plus robuste (debug, refactor, features end‑to‑end), analyse documentaire profonde, workflows clients multi‑étapes avec outils .
- Partenariats infra: entraînement et déploiement à grande échelle avec Microsoft Azure et GPU NVIDIA (H100, H200, GB200‑NVL72) .

Claude Opus 4.5 le nouvel expert pour coder
[https://www.anthropic.com/news/claude-opus-4-5](https://www.anthropic.com/news/claude-opus-4-5)

- Lancement d'un nouveau modèle de pointe : Anthropic a sorti son nouveau modèle le plus performant, Claude Opus 4.5. Il est présenté comme étant le meilleur au monde pour le codage, les agents IA et l'utilisation d'outils informatiques.
- Performances de premier plan en codage : Le modèle établit un nouvel état de l'art sur les benchmarks de développement logiciel comme SWE-bench, surpassant les modèles concurrents et même les meilleurs candidats humains sur un test de recrutement technique interne à Anthropic.
- Plus efficace et moins cher : Opus 4.5 est non seulement plus intelligent, mais il est aussi beaucoup plus efficace, utilisant jusqu'à 76% de jetons (tokens) en moins que les versions précédentes pour accomplir des tâches similaires. Son prix a été réduit à 5/25 par million de jetons, le rendant plus accessible.
- Améliorations sur tous les fronts : Les capacités du modèle ont été améliorées dans tous les domaines, y compris la vision par ordinateur, le raisonnement, les mathématiques et la résolution créative de problèmes.
- Sécurité renforcée : Opus 4.5 est présenté comme le modèle le plus sûr et le mieux aligné d'Anthropic à ce jour, avec une robustesse accrue contre les attaques par injection de prompt (tentatives de le tromper pour lui faire faire des actions nuisibles).
- Nouveautés pour les développeurs et utilisateurs :
  - Un nouveau paramètre "effort" dans l'API permet de trouver un équilibre entre la vitesse/coût et la performance maximale.
  - Claude Code (l'outil de codage) est amélioré et disponible dans une application de bureau.
  - Les applications grand public (Claude pour Chrome, Excel, etc.) bénéficient des nouvelles capacités et les conversations longues ne sont plus limitées grâce à un système de résumé automatique.
- Disponibilité : Le modèle est disponible immédiatement via l'API d'Anthropic, sur les applications Claude et sur les trois principales plateformes cloud (AWS, GCP, Azure).


### Outillage

MCS, un petit outil en ligne de commande pour rechercher des dépendances dans Maven Central
[https://maarten.mulders.it/projects/mcs/](https://maarten.mulders.it/projects/mcs/)

- `mcs` : Outil en ligne de commande (CLI) pour interroger Maven Central.
- Permet de rechercher des librairies directement depuis le terminal, sans navigateur web.
- **Modes de recherche :**
  - Générique (partie du nom de l’artefact).
  - Par coordonnées (groupId:artifactId:version).
  - Par nom de classe (avec option pour nom entièrement qualifié).
- **Résultats :**
  - Tableau pour résultats multiples.
  - Extrait `pom.xml` par défaut pour un résultat unique.
  - Formats d’extrait personnalisables (`-f`) : Maven, Gradle, SBT, Ivy, etc.
- **Options supplémentaires :**
  - Limiter le nombre de résultats (`-l`).
  - Afficher un résumé des vulnérabilités de sécurité (`-s`).
- **Installation :** Via divers gestionnaires de paquets (Homebrew, Snap, SDKMAN!, Chocolatey, Scoop).
- **Configuration :**
  - Via propriétés système (`-D`).
  - Fichier `mcs.config` dans le répertoire `.mcs` de l’utilisateur pour une configuration persistante (ex: trust store, identifiants Sonatype OSS Index).
- **Gestion des firewalls :** Supporte l’utilisation de “trust stores” personnalisés pour les environnements avec interception TLS.
- Développé initialement avec Java 17 et utilisant GraalVM pour des images natives.

Google lance son IDEA agentic Antigravity [https://antigravity.google/blog/introducing-google-antigravity?utm_source=deepmind.google&amp;utm_medium=referral&amp;utm_campaign=gdm&amp;utm_content=](https://antigravity.google/blog/introducing-google-antigravity?utm_source=deepmind.google&amp;utm_medium=referral&amp;utm_campaign=gdm&amp;utm_content=)

- s’appuie sur Gemini 3 (Pro)
- comment a penser plus longtemps et sur plusieurs zones / sujets a la fois
- Essaye d’expliquer ses choix apres avoir travaillé un certain temps (entre le montre moi chaque diff et voila le resultat sans detail explicatif
- travail centré sur l’asynchrone (agent-first)
- travaille dans l’editeur, dans le terminal et dans le navigateur de concert
- experience de recueil de retour de l’utilisateur
- auto improvement avec un gestion de base de connaissance
- par contre il peut effacer votre disque mais il dira pardon [https://www.techradar.com/ai-platforms-assistants/googles-antigravity-ai-deleted-a-developers-drive-and-then-apologized](https://www.techradar.com/ai-platforms-assistants/googles-antigravity-ai-deleted-a-developers-drive-and-then-apologized)

Mistral lance Devstral 2 son nouveau model pour le code et Mistral Vibe CLI un agent open-source à la Claude/Copilot CLI/Gemini CLI/Codex/...
[https://mistral.ai/news/devstral-2-vibe-cli](https://mistral.ai/news/devstral-2-vibe-cli)

- Lancement de Devstral 2 : Mistral AI a sorti une nouvelle famille de modèles de codage open-source, Devstral 2 (123B paramètres) et Devstral Small 2 (24B paramètres). Ces modèles sont conçus pour l'automatisation du code et sont très performants, rivalisant avec des modèles beaucoup plus grands.
- Performances et efficacité : Devstral 2 atteint un score de 72.2% sur le benchmark SWE-bench Verified, le plaçant parmi les meilleurs modèles open-source pour les agents de code. Il est présenté comme étant jusqu'à 7 fois plus rentable que des concurrents comme Claude Sonnet pour des tâches réelles.
- Mistral Vibe CLI : Un nouvel outil en ligne de commande (CLI) natif et open-source a été introduit. Il s'appelle Mistral Vibe et permet d'automatiser des tâches de développement logiciel de bout en bout directement depuis le terminal.
- Accessibilité : Devstral 2 est actuellement disponible gratuitement (en décembre) via l'API de Mistral. Devstral Small 2 est conçu pour être déployé localement sur du matériel grand public, le rendant accessible aux développeurs, aux petites entreprises et aux amateurs.
- Intégrations et déploiement : Mistral Vibe CLI peut être intégré dans des IDE comme Zed. Des recommandations de déploiement des modèles sont fournies, avec un support pour les GPU NVIDIA.

Claude code avance à toutes vitesses
[https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md](https://github.com/anthropics/claude-code/blob/main/CHANGELOG.md)

- Gestion de la mémoire et du contexte avec des "Rules" : Une fonctionnalité majeure a été ajoutée, permettant de créer un répertoire `.claude/rules/` dans un projet. Les fichiers placés dans ce dossier servent d'instructions persistantes pour Claude (par exemple, style de code, architecture du projet, technologies à utiliser). Cela donne au modèle une mémoire contextuelle spécifique au projet sans avoir à le répéter dans chaque prompt.
- Accès à un modèle plus puissant : Le modèle de pointe Opus 4.5 a été rendu disponible pour les utilisateurs Pro, offrant des capacités de raisonnement et de codage nettement supérieures (v2.0.58).
- Introduction des Agents Asynchrones : Les agents et les commandes `bash` peuvent désormais s'exécuter en arrière-plan de manière asynchrone, permettant à l'utilisateur de continuer à travailler pendant que Claude effectue des tâches longues (v2.0.64, v2.0.60).
- Gestion de session et statistiques :
  - Les sessions de conversation peuvent maintenant être nommées (`/rename`) et reprises plus tard (`/resume`), facilitant le travail sur plusieurs projets (v2.0.64).
  - Une nouvelle commande /stats a été ajoutée pour fournir des informations sur l'utilisation du modèle et un graphique d'activité (v2.0.64).
- Amélioration de l'itération et du contrôle :
  - Une nouvelle commande `/edit` permet de modifier le dernier plan d'action de Claude avant exécution (v2.0.55).
  - Les utilisateurs peuvent maintenant fournir un feedback sur les plans rejetés pour guider le modèle vers une meilleure solution (v2.0.57).
  - Un raccourci clavier (`alt+p` ou `option+p`) permet de changer de modèle d'IA à la volée (v2.0.65).
- Meilleure intégration à l'IDE :
  - L'extension VS Code supporte désormais l'affichage des réponses en temps réel ("streaming") (v2.0.57).

Tutoriel sur JReleaser, pour faciliter et automatiser la release de vos projets Java vers Maven Central
[https://foojay.io/today/how-to-publish-a-java-maven-project-to-maven-central-using-jreleaser-and-github-actions-2025-guide/](https://foojay.io/today/how-to-publish-a-java-maven-project-to-maven-central-using-jreleaser-and-github-actions-2025-guide/)



### Architecture

CQRS Design Pattern [https://debezium.io/blog/2025/11/28/cqrs/](https://debezium.io/blog/2025/11/28/cqrs/)

- un article qui nous rappelle le pattern CQRS
- CQRS sépare les opérations de lecture et d’écriture vers la base de données
- Permet d’agréger des données de sources multiples dans un dépôt centralisé
- Pas limité aux architectures microservices malgré son usage fréquent
- Les opérations de lecture et écriture ont des caractéristiques de performance différentes
- Opérer sur les mêmes données peut créer des contentions de verrous
- L’article propose une application de vote simple via REST API comme exemple
- Deux microservices utilisés avec des bases de données indépendantes
- Le principal obstacle d’implémentation est la réplication des données entre bases
- Aborde la réplication via mécanismes natifs de base et via Debezium
- Permet des montées en charge indépendantes et un réglage fin de chaque base

L'enfer des types primitifs: Anti-pattern et Value Objects en Java  [https://www.sfeir.dev/lenfer-des-types-primitifs/](https://www.sfeir.dev/lenfer-des-types-primitifs/)

- L'obsession des types primitifs est un anti-pattern où on utilise uniquement String, int, etc. pour représenter des concepts métier
- Les types primitifs n'apportent pas de sémantique au code, seuls les noms de variables donnent du sens
- Le compilateur ne peut pas détecter les erreurs quand tous les paramètres sont du même type primitif (ex: deux int pour age et annee)
- Risque d'intervertir les paramètres sans que le compilateur ne détecte l'erreur
- Absence de validation: rien n'empêche un age négatif avec un simple int
- Les Value Objects encapsulent les types primitifs et enrichissent le domaine métier
- Un Value Object contient des validations métier (ex: age >= 0)
- Ils apportent une sémantique forte indépendamment des noms de variables
- Les Value Objects sont immuables et s'évaluent sur leurs valeurs, pas leur identité
- Les records Java permettent de créer des Value Objects mais avec un surcoût en mémoire
- Le projet Valhalla introduira les value based classes pour optimiser ces structures
- Les identifiants fortement typés évitent de confondre différents IDs de type Long ou UUID
- Pattern Strongly Typed IDs: utiliser PersonneID au lieu de Long pour identifier une personne
- Le modèle de domaine riche s'oppose au modèle de domaine anémique
- Les Value Objects auto-documentent le code et le rendent moins sujet aux erreurs
- Je trouve cela interessant ce que pourra faire bousculer les Value Objects. 
- Est-ce que les value objects ameneront de la légerté dans l'execution
- Eviter la lourdeur du design est toujours ce qui m'a fait peut dans ces approches 


### Méthodologies

Retour d’experience de vibe coder une appli week end avec co-pilot [http://blog.sunix.org/articles/howto/2025/11/14/building-gift-card-app-with-github-copilot.html](http://blog.sunix.org/articles/howto/2025/11/14/building-gift-card-app-with-github-copilot.html)

- on a deja parlé des approches de vibe coding
- cette fois c’est l’experience de Sun
- Et un des points differents c’es qu’on lui parle en ouvrant des tickets et donc on eput faire re reveues de code et copilot y bosse
- et il a fini son projet !

User Need VS Product Need [https://blog.ippon.fr/2025/11/10/user-need-vs-product-need/](https://blog.ippon.fr/2025/11/10/user-need-vs-product-need/)

- un article de nos amis de chez Ippon
- Distinction entre besoin utilisateur et besoin produit dans le développement digital
- Le besoin utilisateur est souvent exprimé comme une solution concrète plutôt que le problème réel
- Le besoin produit émerge après analyse approfondie combinant observation, données et vision stratégique
- Exemple du livreur Marc qui demande un vélo plus léger alors que son vrai problème est l’efficacité logistique
- La méthode des 5 Pourquoi permet de remonter à la racine des problèmes
- Les besoins proviennent de trois sources: utilisateurs finaux, parties prenantes business et contraintes techniques
- Un vrai besoin crée de la valeur à la fois pour le client et l’entreprise
- Le Product Owner doit traduire les demandes en problèmes réels avant de concevoir des solutions
- Risque de construire des solutions techniquement élégantes mais qui manquent leur cible
- Le rôle du product management est de concilier des besoins parfois contradictoires en priorisant la valeur

Est ce qu'un EM doit coder ?
[https://www.modernleader.is/p/should-ems-write-code](https://www.modernleader.is/p/should-ems-write-code)

- Pas de réponse unique : La question de savoir si un "Engineering Manager" (EM) doit coder n'a pas de réponse universelle. Cela dépend fortement du contexte de l'entreprise, de la maturité de l'équipe et de la personnalité du manager.
- Les risques de coder : Pour un EM, écrire du code peut devenir une échappatoire pour éviter les aspects plus difficiles du management. Cela peut aussi le transformer en goulot d'étranglement pour l'équipe et nuire à l'autonomie de ses membres s'il prend trop de place.
- Les avantages quand c'est bien fait : Coder sur des tâches non essentielles (amélioration d'outils, prototypage, etc.) peut aider l'EM à rester pertinent techniquement, à garder le contact avec la réalité de l'équipe et à débloquer des situations sans prendre le lead sur les projets.
- Le principe directeur : La règle d'or est de rester en dehors du chemin critique. Le code écrit par un EM doit servir à créer de l'espace pour son équipe, et non à en prendre.
- La vraie question à se poser : Plutôt que "dois-je coder ?", un EM devrait se demander : "De quoi mon équipe a-t-elle besoin de ma part maintenant, et est-ce que coder va dans ce sens ou est-ce un obstacle ?"


### Sécurité

React2Shell — Grosse faille de sécurité avec React et Next.js, avec un CVE de niveau 10
[https://x.com/rauchg/status/1997362942929440937?s=20](https://x.com/rauchg/status/1997362942929440937?s=20)

- aussi [https://react2shell.com/](https://react2shell.com/)
- "React2Shell" est le nom donné à une vulnérabilité de sécurité de criticité maximale (score 10.0/10.0), identifiée par le code CVE-2025-55182.
- Systèmes Affectés : La faille concerne les applications utilisant les "React Server Components" (RSC) côté serveur, et plus particulièrement les versions non patchées du framework Next.js.
- Risque Principal : Le risque est le plus élevé possible : l'exécution de code à distance (RCE). Un attaquant peut envoyer une requête malveillante pour exécuter n'importe quelle commande sur le serveur, lui en donnant potentiellement le contrôle total.
- Cause Technique : La vulnérabilité se situe dans le protocole "React Flight" (utilisé pour la communication client-serveur). Elle est due à une omission de vérifications de sécurité fondamentales (`hasOwnProperty`), permettant à une entrée utilisateur malveillante de tromper le serveur.
- Mécanisme de l'Exploit : L'attaque consiste à envoyer une charge utile (payload) qui exploite la nature dynamique de JavaScript pour :
    1. Faire passer un objet malveillant pour un objet interne de React.
    1. Forcer React à traiter cet objet comme une opération asynchrone (`Promise`).
    1. Finalement, accéder au constructeur de la classe `Function` de JavaScript pour exécuter du code arbitraire.
- Action Impérative : La seule solution fiable est de mettre à jour immédiatement les dépendances de React et Next.js vers les versions corrigées. Ne pas attendre.
- Mesures Secondaires : Bien que les pare-feux (firewalls) puissent aider à bloquer les formes connues de l'attaque, ils sont considérés comme insuffisants et ne remplacent en aucun cas la mise à jour des paquets.
- Découverte : La faille a été découverte par le chercheur en sécurité Lachlan Davidson, qui l'a divulguée de manière responsable pour permettre la création de correctifs.


### Loi, société et organisation

Google autorise votre employeur à lire tous vos SMS professionnels
[https://www.generation-nt.com/actualites/google-android-rcs-messages-surveillance-employeur-2067012](https://www.generation-nt.com/actualites/google-android-rcs-messages-surveillance-employeur-2067012)

- Nouvelle fonctionnalité de surveillance : Google a déployé une fonctionnalité appelée "Android RCS Archival" qui permet aux employeurs d'intercepter, lire et archiver tous les messages RCS (et SMS) envoyés depuis les téléphones professionnels Android gérés par l'entreprise.
- Contournement du chiffrement : Bien que les messages RCS soient chiffrés de bout en bout pendant leur transit, cette nouvelle API permet à des logiciels de conformité (installés par l'employeur) d'accéder aux messages une fois qu'ils sont déchiffrés sur l'appareil. Le chiffrement devient donc inefficace contre cette surveillance.
- Réponse à une exigence légale : Cette mesure a été mise en place pour répondre aux exigences réglementaires, notamment dans le secteur financier, où les entreprises ont l'obligation légale de conserver une archive de toutes les communications professionnelles pour des raisons de conformité.
- Impact pour les employés : Un employé utilisant un téléphone Android fourni et géré par son entreprise pourra voir ses communications surveillées. Google précise cependant qu'une notification claire et visible informera l'utilisateur lorsque la fonction d'archivage est active.
- Téléphones personnels non concernés : Cette mesure ne s'applique qu'aux appareils "Android Enterprise" entièrement gérés par un employeur. Les téléphones personnels des employés ne sont pas affectés.

Pour noel, faites un don à JUnit
[https://steady.page/en/junit/about](https://steady.page/en/junit/about)

- JUnit est essentiel pour Java : C'est le framework de test le plus ancien et le plus utilisé par les développeurs Java. Son objectif est de fournir une base solide et à jour pour tous les types de tests côté développeur sur la JVM (Machine Virtuelle Java).
- Un projet maintenu par des bénévoles : JUnit est développé et maintenu par une équipe de volontaires passionnés sur leur temps libre (week-ends, soirées).
- Appel au soutien financier : La page est un appel aux dons de la part des utilisateurs (développeurs, entreprises) pour aider l'équipe à maintenir le rythme de développement. Le soutien financier n'est pas obligatoire, mais il permettrait aux mainteneurs de se consacrer davantage au projet.
- Objectif des fonds : Les dons serviraient principalement à financer des rencontres en personne pour les membres de l'équipe principale. L'idée est de leur permettre de travailler ensemble physiquement pendant quelques jours pour concevoir et coder plus efficacement.
- Pas de traitement de faveur : Il est clairement indiqué que devenir un sponsor ne donne aucun privilège sur la feuille de route du projet. On ne peut pas "acheter" de nouvelles fonctionnalités ou des corrections de bugs prioritaires. Le projet restera ouvert et collaboratif sur GitHub.
- Reconnaissance des donateurs : En guise de remerciement, les noms (et logos pour les entreprises) des donateurs peuvent être affichés sur le site officiel de JUnit.





## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 14-17 janvier 2026 : [SnowCamp 2026](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/snowcamp-2026"><img alt="CFP SnowCamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2025&color=red"></a>
- 22 janvier 2026 : [DevCon #26 : sécurité / post-quantique / hacking](https://www.programmez.com/page-devcons) - Paris (France) <a href="https://docs.google.com/forms/d/e/1FAIpQLScAkKRuLpmUYUyxBP7uVCpWLxShOUxvDD7rKbAiz_4njAyMRQ/viewform?usp=header"><img alt="CFP DevCon #26 : sécurité / post-quantique / hacking" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-December-2025&color=red"></a>
- 28 janvier 2026 : [Software Heritage Symposium](https://www.softwareheritage.org/2025/11/25/software_heritage_2026_symposium_summit/) - Paris (France) 
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
- 12-13 février 2026 : [Touraine Tech #26](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/touraine-tech-2026"><img alt="CFP TnT 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-November-2025&color=red"></a>
- 19 février 2026 : [ObservabilityCON on the Road](https://grafana.com/events/observabilitycon-on-the-road/2026/paris/) - Paris (France) 
- 18-19 mars 2026 : [Agile Niort 2026](https://agileniort.fr) - Niort (France) <a href="https://sessionize.com/agile-niort-2026"><img alt="CFP Agile Niort 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-January-2026&color=green"></a>
- 26-27 mars 2026 : [SymfonyLive Paris 2026](https://live.symfony.com/2026-paris/) - Paris (France) 
- 27-29 mars 2026 : [Shift](https://shift-hackathon.com/) - Nantes (France) 
- 31 mars 2026 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-7/"><img alt="CFP ParisTestConf 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-October-2025&color=red"></a>
- 16-17 avril 2026 : [MiXiT 2026](https://mixitconf.org) - Lyon (France) <a href="https://sessionize.com/mixit-2026/"><img alt="CFP MiXiT" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-Jan-2026&color=green"></a>
- 22-24 avril 2026 : [Devoxx France 2026](https://www.devoxx.fr) - Paris (France) 
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr26.cfp.dev/"><img alt="CFP Devoxx Greece 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2025&color=red"></a>
- 6-7 mai 2026 : [Devoxx UK 2026](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk26.cfp.dev/"><img alt="CFP Devoxx UK 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-January-2026&color=green"></a>
- 22 mai 2026 : [AFUP Day 2026 Lille](https://event.afup.org/afup-day-2026/) - Lille (France) <a href="https://afup.org/event/afupday2026lille/cfp"><img alt="CFP AFUP Day Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Paris](https://event.afup.org/afup-day-2026/) - Paris (France) <a href="https://afup.org/event/afupday2026paris/cfp"><img alt="CFP AFUP Day Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Bordeaux](https://event.afup.org/afup-day-2026/) - Bordeaux (France) <a href="https://afup.org/event/afupday2026bordeaux/cfp"><img alt="CFP AFUP Day Bordeaux 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Lyon](https://event.afup.org/afup-day-2026/) - Lyon (France) <a href="https://afup.org/event/afupday2026lyon/cfp"><img alt="CFP AFUP Day Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 5 juin 2026 : [TechReady](https://techready.live/) - Nantes (France) 
- 11-12 juin 2026 : [DevQuest Niort](https://www.devquest.fr/) - Niort (France) 
- 11-12 juin 2026 : [DevLille 2026](https://devlille.fr/) - Lille (France) <a href="https://conference-hall.io/devlille-2026"><img alt="CFP DevLille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2026&color=green"></a>
- 17-19 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 
- 2-3 juillet 2026 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2026"><img alt="CFP Sunny Tech 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2026&color=green"></a>
- 2 août 2026 : [4th Tech Summit on Artificial Intelligence & Robotics](https://artificialintelligence.averconferences.com) - Paris (France) 
- 4 septembre 2026 : [JUG Summer Camp 2026](https://www.jugsummercamp.org/) - La Rochelle (France) 
- 17-18 septembre 2026 : [API Platform Conference 2026](https://api-platform.com/fr/con/) - Lille (France) 
- 5-9 octobre 2026 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>

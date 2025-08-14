---
title: LCC 329 - L'IA, ce super stagiaire qui nous fait travailler plus
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 329
youtube: https://youtu.be/8_djepNSGKY
mp3_length: 86911351
tweet: L'IA, ce super stagiaire qui nous fait travailler plus #SpringBoot #Quarkus #LangChain4J #NodeJS #Grok #ClaudeCode #GPT5 #modèlesIA #GitHub #MCP #detteTechnique
# tweet size: 91-93 -> 99-101 #######################################################################
---
Arnaud et Guillaume explore l'évolution de l'écosystème Java avec Java 25, Spring Boot et Quarkus, ainsi que les dernières tendances en intelligence artificielle avec les nouveaux modèles comme Grok 4 et Claude Code. Les animateurs font également le point sur l'infrastructure cloud, les défis MCP et CLI, tout en discutant de l'impact de l'IA sur la productivité des développeurs et la gestion de la dette technique. 

Enregistré le 8 août 2025

Téléchargement de l’épisode [LesCastCodeurs-Episode-329.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-329.mp3)
ou en vidéo [sur YouTube](https://youtu.be/8_djepNSGKY).

## News


### Langages

Java 25: JEP 515 : Profilage de méthode en avance (Ahead-of-Time)
[https://openjdk.org/jeps/515](https://openjdk.org/jeps/515)

- Le JEP 515 a pour but d'améliorer le **temps de démarrage et de chauffe** des applications Java.
- L'idée est de collecter les **profils d'exécution des méthodes** lors d'une exécution antérieure, puis de les rendre immédiatement disponibles au démarrage de la machine virtuelle.
- Cela permet au compilateur **JIT** de générer du code natif dès le début, sans avoir à attendre que l'application soit en cours d'exécution.
- Ce changement ne nécessite **aucune modification** du code des applications, des bibliothèques ou des frameworks.
- L'intégration se fait via les commandes de création de cache AOT existantes.
- Voir aussi [https://openjdk.org/jeps/483](https://openjdk.org/jeps/483) et [https://openjdk.org/jeps/514](https://openjdk.org/jeps/514)

Java 25: JEP 518 : Échantillonnage coopératif JFR
[https://openjdk.org/jeps/518](https://openjdk.org/jeps/518)

- Le JEP 518 a pour objectif d'améliorer la **stabilité et l'évolutivité** de la fonction **JDK Flight Recorder (JFR)** pour le profilage d'exécution.
- Le mécanisme d'échantillonnage des piles d'appels de threads Java est retravaillé pour s'exécuter uniquement à des **safepoints**, ce qui réduit les risques d'instabilité.
- Le nouveau modèle permet un **parcours de pile plus sûr**, notamment avec le garbage collector ZGC, et un échantillonnage plus efficace qui prend en charge le parcours de pile concurrent.
- Le JEP ajoute un nouvel événement, `SafepointLatency`, qui enregistre le temps nécessaire à un thread pour atteindre un safepoint.
- L'approche rend le processus d'échantillonnage plus léger et plus rapide, car le travail de création de traces de pile est délégué au thread cible lui-même.


### Librairies

Spring Boot 4 M1 [https://spring.io/blog/2025/07/24/spring-boot-4-0-0-M1-available-now](https://spring.io/blog/2025/07/24/spring-boot-4-0-0-M1-available-now)

- Spring Boot 4.0.0-M1 met à jour de nombreuses dépendances internes et externes pour améliorer la stabilité et la compatibilité.
- Les types annotés avec `@ConfigurationProperties` peuvent maintenant référencer des types situés dans des modules externes grâce à `@ConfigurationPropertiesSource`.
- Le support de l’information sur la validité des certificats SSL a été simplifié, supprimant l’état `WILL_EXPIRE_SOON` au profit de `VALID`.
- L’auto-configuration des métriques Micrometer supporte désormais l’annotation `@MeterTag` sur les méthodes annotées `@Counted` et `@Timed`, avec évaluation via SpEL.
- Le support de `@ServiceConnection` pour MongoDB inclut désormais l’intégration avec `MongoDBAtlasLocalContainer` de Testcontainers.
- Certaines fonctionnalités et API ont été dépréciées, avec des recommandations pour migrer les points de terminaison personnalisés vers les versions Spring Boot 2.
- Les versions milestones et release candidates sont maintenant publiées sur Maven Central, en plus du repository Spring traditionnel.
- Un guide de migration a été publié pour faciliter la transition depuis Spring Boot 3.5 vers la version 4.0.0-M1.

Passage de Spring Boot à Quarkus : retour d'expérience
[https://blog.stackademic.com/we-switched-from-spring-boot-to-quarkus-heres-the-ugly-truth-c8a91c2b8c53](https://blog.stackademic.com/we-switched-from-spring-boot-to-quarkus-heres-the-ugly-truth-c8a91c2b8c53)

- Une équipe a migré une application Java de Spring Boot vers Quarkus pour gagner en performances et réduire la consommation mémoire.
- L'objectif était aussi d’optimiser l’application pour le cloud natif.
- La migration a été plus complexe que prévu, notamment à cause de l’incompatibilité avec certaines bibliothèques et d’un écosystème Quarkus moins mature.
- Il a fallu revoir du code et abandonner certaines fonctionnalités spécifiques à Spring Boot.
- Les gains en performances et en mémoire sont réels, mais la migration demande un vrai effort d’adaptation.
- La communauté Quarkus progresse, mais le support reste limité comparé à Spring Boot.
- Conclusion : Quarkus est intéressant pour les nouveaux projets ou ceux prêts à être réécrits, mais la migration d’un projet existant est un vrai défi.

LangChain4j 1.2.0 : Nouvelles fonctionnalités et améliorations
[https://github.com/langchain4j/langchain4j/releases/tag/1.2.0](https://github.com/langchain4j/langchain4j/releases/tag/1.2.0)

- **Modules stables** : Les modules `langchain4j-anthropic`, `langchain4j-azure-open-ai`, `langchain4j-bedrock`, `langchain4j-google-ai-gemini`, `langchain4j-mistral-ai` et `langchain4j-ollama` sont désormais en version stable 1.2.0.
- **Modules expérimentaux** : La plupart des autres modules de LangChain4j sont en version 1.2.0-beta8 et restent expérimentaux/instables.
- **BOM mis à jour** : Le `langchain4j-bom` a été mis à jour en version 1.2.0, incluant les dernières versions de tous les modules.
- **Principales améliorations** :
  - Support du raisonnement/pensée dans les modèles.
  - Appels d'outils partiels en streaming.
  - Option MCP pour exposer automatiquement les ressources en tant qu'outils.
  - OpenAI : possibilité de définir des paramètres de requête personnalisés et d'accéder aux réponses HTTP brutes et aux événements SSE.
  - Améliorations de la gestion des erreurs et de la documentation.
- Filtering Metadata Infinispan ! (cc Katia(
- Et 1.3.0 est déjà disponible [https://github.com/langchain4j/langchain4j/releases/tag/1.3.0](https://github.com/langchain4j/langchain4j/releases/tag/1.3.0)
- 2 nouveaux modules expérimentaux, `langchain4j-agentic` et `langchain4j-agentic-a2a`  qui introduisent un ensemble d’abstractions et d’utilitaires pour construire des applications agentiques


### Infrastructure

Cette fois c'est vraiment l'année de Linux sur le desktop ! [https://www.lesnumeriques.com/informatique/c-est-enfin-arrive-linux-depasse-un-seuil-historique-que-microsoft-pensait-intouchable-n239977.html](https://www.lesnumeriques.com/informatique/c-est-enfin-arrive-linux-depasse-un-seuil-historique-que-microsoft-pensait-intouchable-n239977.html)

- Linux a franchi la barre des 5% aux USA
- Cette progression s’explique en grande partie par l’essor des systèmes basés sur Linux dans les environnements professionnels, les serveurs, et certains usages grand public.
- Microsoft, longtemps dominant avec Windows, voyait ce seuil comme difficilement atteignable à court terme.
- Le succès de Linux est également alimenté par la popularité croissante des distributions open source, plus légères, personnalisables et adaptées à des usages variés.
- Le cloud, l’IoT, et les infrastructures de serveurs utilisent massivement Linux, ce qui contribue à cette augmentation globale.
- Ce basculement symbolique marque un changement d’équilibre dans l’écosystème des systèmes d’exploitation.
- Toutefois, Windows conserve encore une forte présence dans certains segments, notamment chez les particuliers et dans les entreprises classiques.
- Cette évolution témoigne du dynamisme et de la maturité croissante des solutions Linux, devenues des alternatives crédibles et robustes face aux offres propriétaires.


### Cloud

Cloudflare 1.1.1.1 s’en va pendant une heure d’internet [https://blog.cloudflare.com/cloudflare-1-1-1-1-incident-on-july-14-2025/](https://blog.cloudflare.com/cloudflare-1-1-1-1-incident-on-july-14-2025/)

- Le 14 juillet 2025, le service DNS public Cloudflare 1.1.1.1 a subi une panne majeure de 62 minutes, rendant le service indisponible pour la majorité des utilisateurs mondiaux.
- Cette panne a aussi causé une dégradation intermittente du service Gateway DNS.
- L’incident est survenu suite à une mise à jour de la topologie des services Cloudflare qui a activé une erreur de configuration introduite en juin 2025.
- Cette erreur faisait que les préfixes destinés au service 1.1.1.1 ont été accidentellement inclus dans un nouveau service de localisation des données (Data Localization Suite), ce qui a perturbé le routage anycast.
- Le résultat a été une incapacité pour les utilisateurs à résoudre les noms de domaine via 1.1.1.1, rendant la plupart des services Internet inaccessibles pour eux.
- Ce n’était pas le résultat d’une attaque ou d’un problème BGP, mais une erreur interne de configuration.
- Cloudflare a rapidement identifié la cause, corrigé la configuration et mis en place des mesures pour prévenir ce type d’incident à l’avenir.
- Le service est revenu à la normale après environ une heure d’indisponibilité.
- L’incident souligne la complexité et la sensibilité des infrastructures anycast et la nécessité d’une gestion rigoureuse des configurations réseau.


### Web

L’évolution des bonnes pratiques de Node.js
[https://kashw1n.com/blog/nodejs-2025/](https://kashw1n.com/blog/nodejs-2025/)

- **Évolution de Node.js en 2025** : Le développement se tourne vers les standards du web, avec moins de dépendances externes et une meilleure expérience pour les développeurs.
- **ES Modules (ESM) par défaut** : Remplacement de CommonJS pour un meilleur outillage et une standardisation avec le web. Utilisation du préfixe `node:` pour les modules natifs afin d’éviter les conflits.
- **API web intégrées** : `fetch`, `AbortController`, et `AbortSignal` sont maintenant natifs, réduisant le besoin de librairies comme `axios`.
- **Runner de test intégré** : Plus besoin de Jest ou Mocha pour la plupart des cas. Inclut un mode “watch” et des rapports de couverture.
- **Patterns asynchrones avancés** : Utilisation plus poussée de `async/await` avec `Promise.all()` pour le parallélisme et les `AsyncIterators` pour les flux d’événements.
- **Worker Threads pour le parallélisme** : Pour les tâches lourdes en CPU, évitant de bloquer l’event loop principal.
- **Expérience de développement améliorée** : Intégration du mode `--watch` (remplace `nodemon`) et du support `--env-file` (remplace `dotenv`).
- **Sécurité et performance** : Modèle de permission expérimental pour restreindre l’accès et des hooks de performance natifs pour le monitoring.
- **Distribution simplifiée** : Création d’exécutables uniques pour faciliter le déploiement d’applications ou d’outils en ligne de commande.

Sortie de Apache EChart 6 après 12 ans !
[https://echarts.apache.org/handbook/en/basics/release-note/v6-feature/](https://echarts.apache.org/handbook/en/basics/release-note/v6-feature/)

- Apache ECharts 6.0 : Sortie officielle après 12 ans d’évolution.
- 12 mises à niveau majeures pour la visualisation de données.
- Trois dimensions clés d’amélioration :
  - Présentation visuelle plus professionnelle :
  - Nouveau thème par défaut (design moderne).
  - Changement dynamique de thème.
  - Prise en charge du mode sombre.
- Extension des limites de l’expression des données :
  - Nouveaux types de graphiques : Diagramme de cordes (Chord Chart), Nuage de points en essaim (Beeswarm Chart).
  - Nouvelles fonctionnalités : Jittering pour nuages de points denses, Axes coupés (Broken Axis).
  - Graphiques boursiers améliorés
- Liberté de composition :
  - Nouveau système de coordonnées matriciel.
  - Séries personnalisées améliorées (réutilisation du code, publication npm).
  - Nouveaux graphiques personnalisés inclus (violon, contour, etc.).
  - Optimisation de l’agencement des étiquettes d’axe.


### Data et Intelligence Artificielle

Grok 4 s’est pris pour un nazi à cause des tools [https://techcrunch.com/2025/07/15/xai-says-it-has-fixed-grok-4s-problematic-responses/](https://techcrunch.com/2025/07/15/xai-says-it-has-fixed-grok-4s-problematic-responses/)

- À son lancement, Grok 4 a généré des réponses offensantes, notamment en se surnommant « MechaHitler » et en adoptant des propos antisémites.
- Ce comportement provenait d’une recherche automatique sur le web qui a mal interprété un mème viral comme une vérité.
- Grok alignait aussi ses réponses controversées sur les opinions d’Elon Musk et de xAI, ce qui a amplifié les biais.
- xAI a identifié que ces dérapages étaient dus à une mise à jour interne intégrant des instructions encourageant un humour offensant et un alignement avec Musk.
- Pour corriger cela, xAI a supprimé le code fautif, remanié les prompts système, et imposé des directives demandant à Grok d’effectuer une analyse indépendante, en utilisant des sources diverses.
- Grok doit désormais éviter tout biais, ne plus adopter un humour politiquement incorrect, et analyser objectivement les sujets sensibles.
- xAI a présenté ses excuses, précisant que ces dérapages étaient dus à un problème de prompt et non au modèle lui-même.
- Cet incident met en lumière les défis persistants d’alignement et de sécurité des modèles d’IA face aux injections indirectes issues du contenu en ligne.
- La correction n’est pas qu’un simple patch technique, mais un exemple des enjeux éthiques et de responsabilité majeurs dans le déploiement d’IA à grande échelle.

Guillaume a sorti toute une série d’article sur les patterns agentiques avec le framework ADK pour Java
[https://glaforge.dev/posts/2025/07/29/mastering-agentic-workflows-with-adk-the-recap/](https://glaforge.dev/posts/2025/07/29/mastering-agentic-workflows-with-adk-the-recap/)

- Un premier article explique comment découper les tâches en sous-agents IA : [https://glaforge.dev/posts/2025/07/23/mastering-agentic-workflows-with-adk-sub-agents/](https://glaforge.dev/posts/2025/07/23/mastering-agentic-workflows-with-adk-sub-agents/)
- Un deuxième article détaille comment organiser les agents de manière séquentielle : [https://glaforge.dev/posts/2025/07/24/mastering-agentic-workflows-with-adk-sequential-agent/](https://glaforge.dev/posts/2025/07/24/mastering-agentic-workflows-with-adk-sequential-agent/)
- Un troisième article explique comment paralleliser des tâches indépendantes : [https://glaforge.dev/posts/2025/07/25/mastering-agentic-workflows-with-adk-parallel-agent/](https://glaforge.dev/posts/2025/07/25/mastering-agentic-workflows-with-adk-parallel-agent/)
- Et enfin, comment faire des boucles d’amélioration : [https://glaforge.dev/posts/2025/07/28/mastering-agentic-workflows-with-adk-loop-agents/](https://glaforge.dev/posts/2025/07/28/mastering-agentic-workflows-with-adk-loop-agents/)
- Tout ça évidemment en Java :slightly_smiling_face:

6 semaines de code avec Claude
[https://blog.puzzmo.com/posts/2025/07/30/six-weeks-of-claude-code/](https://blog.puzzmo.com/posts/2025/07/30/six-weeks-of-claude-code/)

- Orta partage son retour après 6 semaines d’utilisation quotidienne de Claude Code, qui a profondément changé sa manière de coder.
- Il ne « code » plus vraiment ligne par ligne, mais décrit ce qu’il veut, laisse Claude proposer une solution, puis corrige ou ajuste.
- Cela permet de se concentrer sur le résultat plutôt que sur l’implémentation, comme passer de la peinture au polaroid.
- Claude s’avère particulièrement utile pour les tâches de maintenance : migrations, refactors, nettoyage de code.
- Il reste toujours en contrôle, révise chaque diff généré, et guide l’IA via des prompts bien cadrés.
- Il note qu’il faut quelques semaines pour prendre le bon pli : apprendre à découper les tâches et formuler clairement les attentes.
- Les tâches simples deviennent quasi instantanées, mais les tâches complexes nécessitent encore de l’expérience et du discernement.
- Claude Code est vu comme un très bon copilote, mais ne remplace pas le rôle du développeur qui comprend l’ensemble du système.
- Le gain principal est une vitesse de feedback plus rapide et une boucle d’itération beaucoup plus courte.
- Ce type d’outil pourrait bien redéfinir la manière dont on pense et structure le développement logiciel à moyen terme.

Claude Code et les serveurs MCP : ou comment transformer ton terminal en assistant surpuissant
[https://touilleur-express.fr/2025/07/27/claude-code-et-les-serveurs-mcp-ou-comment-transformer-ton-terminal-en-assistant-surpuissant/](https://touilleur-express.fr/2025/07/27/claude-code-et-les-serveurs-mcp-ou-comment-transformer-ton-terminal-en-assistant-surpuissant/)

- Nicolas continue ses études sur Claude Code et explique comment utiliser les serveurs MCP pour rendre Claude bien plus efficace.
- **Le MCP Context7** montre comment fournir à l’IA la doc technique à jour (par exemple, Next.js 15) pour éviter les hallucinations ou les erreurs.
- **Le MCP Task Master**, autre serveur MCP, transforme un cahier des charges (PRD) en tâches atomiques, estimées, et organisées sous forme de plan de travail.
- **Le MCP Playwright** permet de manipuler des navigateurs et d'executer des tests E2E
- Le MCP **Digital Ocean** permet de déployer facilement l'application en production
- Tout n'est pas si ideal, les quotas sont atteints en quelques heures sur une petite application et il y a des cas où il reste bien plus efficace de le faire soit-même (pour un codeur expérimenté)
- Nicolas complète cet article avec l'écriture d'un MVP en 20 heures: [https://touilleur-express.fr/2025/07/30/comment-jai-code-un-mvp-en-une-vingtaine-dheures-avec-claude-code/](https://touilleur-express.fr/2025/07/30/comment-jai-code-un-mvp-en-une-vingtaine-dheures-avec-claude-code/)

Le développement augmenté, un avis politiquement correct, mais bon…
[https://touilleur-express.fr/2025/07/31/le-developpement-augmente-un-avis-politiquement-correct-mais-bon/](https://touilleur-express.fr/2025/07/31/le-developpement-augmente-un-avis-politiquement-correct-mais-bon/)

- Nicolas partage un avis nuancé (et un peu provoquant) sur le **développement augmenté**, où l’IA comme Claude Code assiste le développeur sans le remplacer.
- Il rejette l’idée que cela serait « trop magique » ou « trop facile » : c’est une évolution logique de notre métier, pas un raccourci pour les paresseux.
- Pour lui, un bon dev reste celui qui **structure bien sa pensée**, sait poser un problème, découper, valider — même si l’IA aide à coder plus vite.
- Il raconte avoir codé une app OAuth, testée, stylisée et déployée en quelques heures, sans jamais quitter le terminal grâce à Claude.
- Ce genre d’outillage change le rapport au temps : on passe de « je vais y réfléchir » à « je tente tout de suite une version qui marche à peu près ».
- Il assume aimer cette approche rapide et imparfaite : mieux vaut une version brute livrée vite qu’un projet bloqué par le perfectionnisme.
- L’IA est selon lui **un super stagiaire** : jamais fatigué, parfois à côté de la plaque, mais diablement productif quand bien briefé.
- Il conclut que le « dev augmenté » ne remplace pas les bons développeurs… mais les développeurs moyens doivent s’y mettre, sous peine d’être dépassés.

ChatGPT lance le mode d'étude : un apprentissage interactif pas à pas
[https://openai.com/index/chatgpt-study-mode/](https://openai.com/index/chatgpt-study-mode/)

- OpenAI propose un mode d’étude dans ChatGPT qui guide les utilisateurs pas à pas plutôt que de donner directement la réponse.
- Ce mode vise à encourager la réflexion active et l’apprentissage en profondeur.
- Il utilise des instructions personnalisées pour poser des questions et fournir des explications adaptées au niveau de l’utilisateur.
- Le mode d’étude favorise la gestion de la charge cognitive et stimule la métacognition.
- Il propose des réponses structurées pour faciliter la compréhension progressive des sujets.
- Disponible dès maintenant pour les utilisateurs connectés, ce mode sera intégré dans ChatGPT Edu.
- L’objectif est de transformer ChatGPT en un véritable tuteur numérique, aidant les étudiants à mieux assimiler les connaissances.
- A priori Gemini viendrait de sortir un fonctionnalité similaire

Lancement de GPT-OSS par OpenAI
[https://openai.com/index/introducing-gpt-oss/](https://openai.com/index/introducing-gpt-oss/)
[https://openai.com/index/gpt-oss-model-card/](https://openai.com/index/gpt-oss-model-card/)

- OpenAI a lancé **GPT-OSS**, sa première famille de **modèles open-weight** depuis GPT-2.
- Deux modèles sont disponibles : gpt-oss-120b et gpt-oss-20b, qui sont des **modèles mixtes d'experts** conçus pour le raisonnement et les tâches d'agent.
- Les modèles sont distribués sous licence **Apache 2.0**, permettant leur utilisation et leur personnalisation gratuites, y compris pour des applications commerciales.
- Le modèle **gpt-oss-120b** est capable de performances proches du modèle OpenAI o4-mini, tandis que le gpt-oss-20b est comparable au o3-mini.
- OpenAI a également open-sourcé un outil de rendu appelé **Harmony** en Python et Rust pour en faciliter l'adoption.
- Les modèles sont optimisés pour fonctionner **localement** et sont pris en charge par des plateformes comme Hugging Face et Ollama.
- OpenAI a mené des recherches sur la sécurité pour s'assurer que les modèles ne pouvaient pas être affinés pour des utilisations malveillantes dans les domaines biologique, chimique ou cybernétique.

Anthropic lance Opus 4.1 
[https://www.anthropic.com/news/claude-opus-4-1](https://www.anthropic.com/news/claude-opus-4-1)

- Anthropic a publié **Claude Opus 4.1**, une mise à jour de son modèle de langage.
- Cette nouvelle version met l'accent sur l'amélioration des performances en **codage, en raisonnement et sur les tâches de recherche et d'analyse de données**.
- Le modèle a obtenu un score de **74,5 % sur le benchmark SWE-bench Verified**, ce qui représente une amélioration par rapport à la version précédente.
- Il excelle notamment dans la **refactorisation de code multifichier** et est capable d'effectuer des recherches approfondies.
- Claude Opus 4.1 est disponible pour les utilisateurs payants de Claude, ainsi que via l'API, Amazon Bedrock et Vertex AI de Google Cloud, avec des **tarifs identiques à ceux d'Opus 4**.
- Il est présenté comme un **remplacement direct de Claude Opus 4**, avec des performances et une précision supérieures pour les tâches de programmation réelles.

**OpenAI Summer Update.** GPT-5 is out
[https://openai.com/index/introducing-gpt-5/](https://openai.com/index/introducing-gpt-5/)

- Détails
  - [https://openai.com/index/gpt-5-new-era-of-work/](https://openai.com/index/gpt-5-new-era-of-work/)
  - [https://openai.com/index/introducing-gpt-5-for-developers/](https://openai.com/index/introducing-gpt-5-for-developers/)
  - [https://openai.com/index/gpt-5-safe-completions/](https://openai.com/index/gpt-5-safe-completions/)
  - [https://openai.com/index/gpt-5-system-card/](https://openai.com/index/gpt-5-system-card/)
- **Amélioration majeure des capacités cognitives -** GPT‑5 montre un niveau de raisonnement, d’abstraction et de compréhension nettement supérieur aux modèles précédents.
- **Deux variantes principales -** `gpt-5-main` : rapide, efficace pour les tâches générales. `gpt-5-thinking` : plus lent mais spécialisé dans les tâches complexes, nécessitant réflexion profonde.
- **Routeur intelligent intégré -** Le système sélectionne automatiquement la version la plus adaptée à la tâche (rapide ou réfléchie), sans intervention de l’utilisateur.
- **Fenêtre de contexte encore étendue -** GPT‑5 peut traiter des volumes de texte plus longs (jusqu’à 1 million de tokens dans certaines versions), utile pour des documents ou projets entiers.
- **Réduction significative des hallucinations -** GPT‑5 donne des réponses plus fiables, avec moins d’erreurs inventées ou de fausses affirmations.
- **Comportement plus neutre et moins sycophant -** Il a été entraîné pour mieux résister à l’alignement excessif avec les opinions de l’utilisateur.
- **Capacité accrue à suivre des instructions complexes -** GPT‑5 comprend mieux les consignes longues, implicites ou nuancées.
- **Approche “Safe completions” -** Remplacement des “refus d’exécution” par des réponses utiles mais sûres — le modèle essaie de répondre avec prudence plutôt que bloquer.
- **Prêt pour un usage professionnel à grande échelle -** Optimisé pour le travail en entreprise : rédaction, programmation, synthèse, automatisation, gestion de tâches, etc.
- **Améliorations spécifiques pour le codage -** GPT‑5 est plus performant pour l’écriture de code, la compréhension de contextes logiciels complexes, et l’usage d’outils de développement.
- **Expérience utilisateur plus rapide et fluide-**  Le système réagit plus vite grâce à une orchestration optimisée entre les différents sous-modèles.
- **Capacités agentiques renforcées -** GPT‑5 peut être utilisé comme base pour des agents autonomes capables d’accomplir des objectifs avec peu d’interventions humaines.
- **Multimodalité maîtrisée (texte, image, audio) -** GPT‑5 intègre de façon plus fluide la compréhension de formats multiples, dans un seul modèle.
- **Fonctionnalités pensées pour les développeurs -** Documentation plus claire, API unifiée, modèles plus transparents et personnalisables.
- **Personnalisation contextuelle accrue -** Le système s’adapte mieux au style, ton ou préférences de l’utilisateur, sans instructions répétées.
- **Utilisation énergétique et matérielle optimisée -**  Grâce au routeur interne, les ressources sont utilisées plus efficacement selon la complexité des tâches.
- **Intégration sécurisée dans les produits ChatGPT -** Déjà déployé dans ChatGPT avec des bénéfices immédiats pour les utilisateurs Pro et entreprises.
- **Modèle unifié pour tous les usages -** Un seul système capable de passer de la conversation légère à des analyses scientifiques ou du code complexe.
- **Priorité à la sécurité et à l’alignement -** GPT‑5 a été conçu dès le départ pour minimiser les abus, biais ou comportements indésirables.
- **Pas encore une AGI -** OpenAI insiste : malgré ses capacités impressionnantes, GPT‑5 **n’est pas une intelligence artificielle générale**.

Non, non, les juniors ne sont pas obsolètes malgré l’IA ! (dixit GitHub)
[https://github.blog/ai-and-ml/generative-ai/junior-developers-arent-obsolete-heres-how-to-thrive-in-the-age-of-ai/](https://github.blog/ai-and-ml/generative-ai/junior-developers-arent-obsolete-heres-how-to-thrive-in-the-age-of-ai/)

- L’IA transforme le développement logiciel, mais les développeurs juniors ne sont pas obsolètes.
- Les nouveaux apprenants sont bien positionnés, car déjà familiers avec les outils IA.
- L’objectif est de développer des compétences pour travailler _avec_ l’IA, pas d’être remplacé.
- La créativité et la curiosité sont des qualités humaines clés.
- **Cinq façons de se démarquer :**
  - Utiliser l’IA (ex: GitHub Copilot) pour apprendre plus vite, pas seulement coder plus vite (ex: mode tuteur, désactiver l’autocomplétion temporairement).
  - Construire des projets publics démontrant ses compétences (y compris en IA).
  - Maîtriser les workflows GitHub essentiels (GitHub Actions, contribution open source, pull requests).
  - Affûter son expertise en révisant du code (poser des questions, chercher des patterns, prendre des notes).
  - Déboguer plus intelligemment et rapidement avec l’IA (ex: Copilot Chat pour explications, corrections, tests).

Ecrire son premier agent IA avec A2A avec WildFly par Emmanuel Hugonnet
[https://www.wildfly.org/news/2025/08/07/Building-your-First-A2A-Agent/](https://www.wildfly.org/news/2025/08/07/Building-your-First-A2A-Agent/)

- **Protocole Agent2Agent (A2A)** : Standard ouvert pour l’interopérabilité universelle des agents IA.
  - Permet communication et collaboration efficaces entre agents de différents fournisseurs/frameworks.
  - Crée des écosystèmes multi-agents unifiés, automatisant les workflows complexes.
- **Objet de l’article** : Guide pour construire un premier agent A2A (agent météo) dans WildFly.
  - Utilise A2A Java SDK pour Jakarta Servers, WildFly AI Feature Pack, un LLM (Gemini) et un outil Python (MCP).
  - Agent conforme A2A v0.2.5.
- **Prérequis** : JDK 17+, Apache Maven 3.8+, IDE Java, Google AI Studio API Key, Python 3.10+, `uv`.
- **Étapes de construction de l’agent météo** :
  - **Création du service LLM** : Interface Java (`WeatherAgent`) utilisant LangChain4J pour interagir avec un LLM et un outil Python MCP (fonctions `get_alerts`, `get_forecast`).
- **Définition de l’agent A2A** (via CDI) :
-         ▪︎ **Agent Card** : Fournit les métadonnées de l’agent (nom, description, URL, capacités, compétences comme “weather_search”).
  - **Agent Executor** : Gère les requêtes A2A entrantes, extrait le message utilisateur, appelle le service LLM et formate la réponse.
  - **Exposition de l’agent** : Enregistrement d’une application JAX-RS pour les endpoints.
- **Déploiement et test** :
  - Configuration de l’outil `A2A-inspector` de Google (via un conteneur Podman).
  - Construction du projet Maven, configuration des variables d’environnement (ex: `GEMINI_API_KEY`).
  - Lancement du serveur WildFly.
- **Conclusion** : Transformation minimale d’une application IA en agent A2A.
  - Permet la collaboration et le partage d’informations entre agents IA, indépendamment de leur infrastructure sous-jacente.


### Outillage

IntelliJ IDEa bouge vers une distribution unifiée [https://blog.jetbrains.com/idea/2025/07/intellij-idea-unified-distribution-plan/](https://blog.jetbrains.com/idea/2025/07/intellij-idea-unified-distribution-plan/)

- À partir de la version 2025.3, IntelliJ IDEA Community Edition ne sera plus distribuée séparément.
- Une seule version unifiée d’IntelliJ IDEA regroupera les fonctionnalités des éditions Community et Ultimate.
- Les fonctionnalités avancées de l’édition Ultimate seront accessibles via abonnement.
- Les utilisateurs sans abonnement auront accès à une version gratuite enrichie par rapport à l’édition Community actuelle.
- Cette unification vise à simplifier l’expérience utilisateur et réduire les différences entre les éditions.
- Les utilisateurs Community seront automatiquement migrés vers cette nouvelle version unifiée.
- Il sera possible d’activer les fonctionnalités Ultimate temporairement d’un simple clic.
- En cas d’expiration d’abonnement Ultimate, l’utilisateur pourra continuer à utiliser la version installée avec un jeu limité de fonctionnalités gratuites, sans interruption.
- Ce changement reflète l’engagement de JetBrains envers l’open source et l’adaptation aux besoins de la communauté.

Prise en charge des Ancres YAML dans GitHub Actions
[https://github.com/actions/runner/issues/1182#issuecomment-3150797791](https://github.com/actions/runner/issues/1182#issuecomment-3150797791)

- Afin d'éviter de dupliquer du contenu dans un workflow les Ancres permettent d'insérer des morceaux réutilisables de YAML
- Fonctionnalité attendue depuis des années et disponible chez GitLab depuis bien longtemps. Elle a été déployée le 4 aout.
- Attention à ne pas en abuser car la lisibilité de tels documents n'est pas si facile

Gemini CLI rajoute les custom commands comme Claude
[https://cloud.google.com/blog/topics/developers-practitioners/gemini-cli-custom-slash-commands](https://cloud.google.com/blog/topics/developers-practitioners/gemini-cli-custom-slash-commands)

- Mais elles sont au format TOML, on ne peut donc pas les partager avec Claude :disappointed: 

Automatiser ses workflows IA avec les hooks de Claude Code
[https://blog.gitbutler.com/automate-your-ai-workflows-with-claude-code-hooks/](https://blog.gitbutler.com/automate-your-ai-workflows-with-claude-code-hooks/)

- Claude Code propose des hooks qui permettent d’exécuter des scripts à différents moments d’une session, par exemple au début, lors de l’utilisation d’outils, ou à la fin.
- Ces hooks facilitent l’automatisation de tâches comme la gestion de branches Git, l’envoi de notifications, ou l’intégration avec d’autres outils.
- Un exemple simple est l’envoi d’une notification sur le bureau à la fin d’une session.
- Les hooks se configurent via trois fichiers JSON distincts selon le scope : utilisateur, projet ou local.
- Sur macOS, l’envoi de notifications nécessite une permission spécifique via l’application "Script Editor".
- Il est important d’avoir une version à jour de Claude Code pour utiliser ces hooks.
- GitButler permet desormais de s'intégrer à Claude Code via ces hooks: [https://blog.gitbutler.com/parallel-claude-code/](https://blog.gitbutler.com/parallel-claude-code/)

Le client Git de Jetbrains bientot en standalone
[https://lp.jetbrains.com/closed-preview-for-jetbrains-git-client/](https://lp.jetbrains.com/closed-preview-for-jetbrains-git-client/)

- Demandé par certains utilisateurs depuis longtemps
- Ca serait un client graphique du même style qu'un GitButler, SourceTree, etc

Apache Maven 4 .... arrive .... l'utilitaire `mvnup`va vous aider à upgrader
[https://maven.apache.org/tools/mvnup.html](https://maven.apache.org/tools/mvnup.html)

- Fixe les incompatibilités connues
- Nettoie les redondances et valeurs par defaut (versions par ex) non utiles pour Maven 4
- Reformattage selon les conventions maven
- ...

Une GitHub Action pour Gemini CLI
[https://blog.google/technology/developers/introducing-gemini-cli-github-actions/](https://blog.google/technology/developers/introducing-gemini-cli-github-actions/)

- Google a lancé **Gemini CLI GitHub Actions**, un agent d'IA qui fonctionne comme un "coéquipier de code" pour les dépôts GitHub.
- L'outil est gratuit et est conçu pour **automatiser des tâches de routine** telles que le triage des problèmes (issues), l'examen des demandes de tirage (pull requests) et d'autres tâches de développement.
- Il agit à la fois comme un agent autonome et un collaborateur que les développeurs peuvent solliciter à la demande, notamment en le mentionnant dans une issue ou une pull request.
- L'outil est basé sur la CLI Gemini, un agent d'IA open-source qui amène le modèle Gemini directement dans le terminal.
- Il utilise l'infrastructure **GitHub Actions**, ce qui permet d'isoler les processus dans des conteneurs séparés pour des raisons de sécurité.
- Trois flux de travail (workflows) open-source sont disponibles au lancement : le triage intelligent des issues, l'examen des pull requests et la collaboration à la demande.

Pas besoin de MCP, le code est tout ce dont vous avez besoin
[https://lucumr.pocoo.org/2025/7/3/tools/](https://lucumr.pocoo.org/2025/7/3/tools/)

- Armin souligne qu’il n’est **pas fan du protocole MCP** (Model Context Protocol) dans sa forme actuelle : il manque de composabilité et exige trop de contexte.
- Il remarque que pour une même tâche (ex. GitHub), utiliser le **CLI** est souvent plus rapide et plus efficace en termes de contexte que passer par un serveur MCP.
- Selon lui, **le code reste la solution la plus simple et fiable**, surtout pour automatiser des tâches répétitives.
- Il préfère créer des scripts clairs plutôt que se reposer sur l’inférence LLM : cela facilite la vérification, la maintenance et évite les erreurs subtiles.
- Pour les tâches récurrentes, si on les automatise, mieux vaut le faire avec du **code reusable**, plutôt que de laisser l’IA deviner à chaque fois.
- Il illustre cela en convertissant son blog entier de reStructuredText à Markdown : plutôt qu’un usage direct d’IA, il a demandé à Claude de générer un script complet, avec parsing AST, comparaison des fichiers, validation et itération.
- Ce workflow LLM→code→LLM (analyse et validation) lui a donné confiance dans le résultat final, tout en conservant un contrôle humain sur le processus.
- Il juge que **MCP ne permet pas ce type de pipeline automatisé fiable**, car il introduit trop d’inférence et trop de variations par appel.
- Pour lui, coder reste le meilleur moyen de garder le contrôle, la reproductibilité et la clarté dans les workflows automatisés.

MCP vs CLI ...
[https://www.async-let.com/blog/my-take-on-the-mcp-verses-cli-debate/](https://www.async-let.com/blog/my-take-on-the-mcp-verses-cli-debate/)

- Cameron raconte son expérience de création du serveur **XcodeBuildMCP**, qui lui a permis de mieux comprendre le débat entre servir l’IA via MCP ou laisser l’IA utiliser directement les CLI du système.
- Selon lui, les **CLIs restent préférables pour les développeurs experts** recherchant contrôle, transparence, performance et simplicité.
- Mais les **serveurs MCP excellent sur les workflows complexes**, les contextes persistants, les contraintes de sécurité, et facilitent l’accès pour les utilisateurs moins expérimentés.
- Il reconnaît la critique selon laquelle MCP consomme trop de contexte (« context bloat ») et que les appels CLI peuvent être plus rapides et compréhensibles.
- Toutefois, il souligne que beaucoup de problèmes proviennent de **la qualité des implémentations clients**, pas du protocole MCP en lui‑même.
- Pour lui, un bon serveur MCP peut proposer des outils soigneusement définis qui simplifient la vie de l’IA (par exemple, renvoyer des données structurées plutôt que du texte brut à parser).
- Il apprécie la capacité des MCP à offrir des opérations **état‑durables** (sessions, mémoire, logs capturés), ce que les CLI ne gèrent pas naturellement.
- Certains scénarios ne peuvent pas fonctionner via CLI (pas de shell accessible) alors que MCP, en tant que **protocole indépendant**, reste utilisable par n’importe quel client.
- Son verdict : **pas de solution universelle** — chaque contexte mérite d’être évalué, et on ne devrait pas imposer MCP ou CLI à tout prix.

Jules, l’agent de code asynchrone gratuit de Google, est sorti de beta et est disponible pour tout le monde
[https://blog.google/technology/google-labs/jules-now-available/](https://blog.google/technology/google-labs/jules-now-available/)

- Jules, agent de codage asynchrone, est maintenant publiquement disponible.
- Propulsé par Gemini 2.5 Pro.
- Phase bêta : 140 000+ améliorations de code et retours de milliers de développeurs.
- Améliorations : interface utilisateur, corrections de bugs, réutilisation des configurations, intégration GitHub Issues, support multimodal.
- Gemini 2.5 Pro améliore les plans de codage et la qualité du code.
- Nouveaux paliers structurés : Introductif, Google AI Pro (limites 5x supérieures), Google AI Ultra (limites 20x supérieures).
- Déploiement immédiat pour les abonnés Google AI Pro et Ultra, incluant les étudiants éligibles (un an gratuit de AI Pro).


### Architecture

Valoriser la réduction de la dette technique : un vrai défi
[https://www.lemondeinformatique.fr/actualites/lire-valoriser-la-reduction-de-la-dette-technique-mission-impossible-97483.html](https://www.lemondeinformatique.fr/actualites/lire-valoriser-la-reduction-de-la-dette-technique-mission-impossible-97483.html)

- La dette technique est un concept mal compris et difficile à valoriser financièrement auprès des directions générales.
- Les DSI ont du mal à mesurer précisément cette dette, à allouer des budgets spécifiques, et à prouver un retour sur investissement clair.
- Cette difficulté limite la priorisation des projets de réduction de dette technique face à d’autres initiatives jugées plus urgentes ou stratégiques.
- Certaines entreprises intègrent progressivement la gestion de la dette technique dans leurs processus de développement.
- Des approches comme le Software Crafting visent à améliorer la qualité du code pour limiter l’accumulation de cette dette.
- L’absence d’outils adaptés pour mesurer les progrès rend la démarche encore plus complexe.
- En résumé, réduire la dette technique reste une mission délicate qui nécessite innovation, méthode et sensibilisation en interne.

Il ne faut pas se Mocker ...
[https://martinelli.ch/why-i-dont-use-mocking-frameworks-and-why-you-might-not-need-them-either/](https://martinelli.ch/why-i-dont-use-mocking-frameworks-and-why-you-might-not-need-them-either/)
[https://blog.tremblay.pro/2025/08/not-using-mocking-frmk.html](https://blog.tremblay.pro/2025/08/not-using-mocking-frmk.html)

- L’auteur préfère utiliser des fakes ou stubs faits à la main plutôt que des frameworks de mocking comme Mockito ou EasyMock.
- Les frameworks de mocking isolent le code, mais entraînent souvent :
  - Un **fort couplage** entre les tests et les détails d’implémentation.
  - Des tests qui valident le mock plutôt que le comportement réel.
- Deux principes fondamentaux guident son approche :
  - Favoriser un **design fonctionnel**, avec logique métier pure (fonctions sans effets de bord).
  - **Contrôler les données de test** : par exemple en utilisant des bases réelles (via Testcontainers) plutôt que de simuler.
- Dans sa pratique, les seuls cas où un mock externe est utilisé concernent les services HTTP externes, et encore il préfère en simuler seulement le transport plutôt que le comportement métier.
- Résultat : les tests deviennent **plus simples**, **plus rapides à écrire**, **plus fiables**, et moins fragiles aux évolutions du code.
- L’article conclut que si tu conçois correctement ton code, tu pourrais très bien **ne pas avoir besoin de frameworks de mocking** du tout.
- Le blog en réponse d'Henri Tremblay nuance un peu ces retours


### Méthodologies

C’est quoi être un bon PM ? (Product Manager)
Article de Chris Perry, un PM chez Google :
[https://thechrisperry.substack.com/p/being-a-good-pm-at-google](https://thechrisperry.substack.com/p/being-a-good-pm-at-google)

- **Le rôle de PM est difficile :** Un travail exigeant, où il faut être le plus impliqué de l’équipe pour assurer le succès.
- **1. Livrer (shipper) est tout ce qui compte :** La priorité absolue. Mieux vaut livrer et itérer rapidement que de chercher la perfection en théorie. Un produit livré permet d’apprendre de la réalité.
- **2. Donner l’envie du grand large :** La meilleure façon de faire avancer un projet est d’inspirer l’équipe avec une vision forte et désirable. Montrer le “pourquoi”.
- **3. Utiliser son produit tous les jours :** Non négociable pour réussir. Permet de développer une intuition et de repérer les vrais problèmes que la recherche utilisateur ne montre pas toujours.
- **4. Être un bon ami :** Créer des relations authentiques et aider les autres est un facteur clé de succès à long terme. La confiance est la base d’une exécution rapide.
- **5. Donner plus qu’on ne reçoit :** Toujours chercher à aider et à collaborer. La stratégie optimale sur la durée est la coopération. Ne pas être possessif avec ses idées.
- **6. Utiliser le bon levier :** Pour obtenir une décision, il faut identifier la bonne personne qui a le pouvoir de dire “oui”, et ne pas se laisser bloquer par des avis non décisionnaires.
- **7. N’aller que là où on apporte de la valeur :** Combler les manques, faire le travail ingrat que personne ne veut faire. Savoir aussi s’écarter (réunions, projets) quand on n’est pas utile.
- **8. Le succès a plusieurs parents, l’échec est orphelin :** Si le produit réussit, c’est un succès d’équipe. S’il échoue, c’est la faute du PM. Il faut assumer la responsabilité finale.
- **Conclusion : Le PM est un chef d’orchestre.** Il ne peut pas jouer de tous les instruments, mais son rôle est d’orchestrer avec humilité le travail de tous pour créer quelque chose d’harmonieux.

Tester des applications Spring Boot prêtes pour la production : points clés
[https://www.wimdeblauwe.com/blog/2025/07/30/how-i-test-production-ready-spring-boot-applications/](https://www.wimdeblauwe.com/blog/2025/07/30/how-i-test-production-ready-spring-boot-applications/)

- L’auteur (Wim Deblauwe) détaille comment il structure ses tests dans une application Spring Boot destinée à la production.
- Le projet inclut automatiquement la dépendance `spring-boot-starter-test`, qui regroupe JUnit 5, AssertJ, Mockito, Awaitility, JsonAssert, XmlUnit et les outils de testing Spring.
- **Tests unitaires** : ciblent les fonctions pures (record, utilitaire), testés simplement avec JUnit et AssertJ sans démarrage du contexte Spring.
- **Tests de cas d’usage (use case)** : orchestrent la logique métier, généralement via des _use cases_ qui utilisent un ou plusieurs dépôts de données.
- **Tests JPA/repository** : vérifient les interactions avec la base via des tests realisant des opérations CRUD (avec un contexte Spring pour la couche persistance).
- **Tests de contrôleur** : permettent de tester les endpoints web (ex. `@WebMvcTest`), souvent avec `MockBean` pour simuler les dépendances.
- **Tests d’intégration complets** : ils démarrent tout le contexte Spring (`@SpringBootTest`) pour tester l’application dans son ensemble.
- L’auteur évoque également des **tests d’architecture**, mais sans entrer dans le détail dans cet article.
- Résultat : une pyramide de tests allant des plus rapides (unitaires) aux plus complets (intégration), garantissant fiabilité, vitesse et couverture sans surcharge inutile.


### Sécurité

Bitwarden offre un serveur MCP pour que les agents puissent accéder aux mots de passe [https://nerds.xyz/2025/07/bitwarden-mcp-server-secure-ai/](https://nerds.xyz/2025/07/bitwarden-mcp-server-secure-ai/)

- Bitwarden introduit un **serveur MCP (Model Context Protocol)** destiné à intégrer de manière sécurisée les agents IA dans les workflows de gestion de mots de passe.
- Ce serveur fonctionne en **architecture locale (local-first)** : toutes les interactions et les données sensibles restent sur la machine de l’utilisateur, garantissant l’application du principe de **chiffrement zero‑knowledge**.
- L’intégration se fait via l’**interface CLI de Bitwarden**, permettant aux agents IA de générer, récupérer, modifier et verrouiller les identifiants via des commandes sécurisées. Le serveur peut être **auto‑hébergé** pour un contrôle maximal des données.
- Le protocole MCP est un **standard ouvert** qui permet de connecter de façon uniforme des agents IA à des sources de données et outils tiers, simplifiant les intégrations entre LLM et applications.
- Une démo avec Claude (agent IA d'Anthropic) montre que l’IA peut interagir avec le coffre Bitwarden : vérifier l’état, déverrouiller le vault, générer ou modifier des identifiants, le tout sans intervention humaine directe.
- Bitwarden affiche une approche **priorisant la sécurité**, mais reconnaît les risques liés à l’utilisation d’IA autonome. L’usage d’un **LLM local privé** est fortement recommandé pour limiter les vulnérabilités.
- Si tu veux, je peux aussi te résumer les enjeux principaux (interopérabilité, sécurité, cas d’usage) ou un extrait spécifique !

NVIDIA a une faille de securite critique [https://www.wiz.io/blog/nvidia-ai-vulnerability-cve-2025-23266-nvidiascape](https://www.wiz.io/blog/nvidia-ai-vulnerability-cve-2025-23266-nvidiascape)

- Il s’agit d’une faille d’évasion de conteneur dans le NVIDIA Container Toolkit.
- La gravité est jugée critique avec un score CVSS de 9.0.
- Cette vulnérabilité permet à un conteneur malveillant d’obtenir un accès root complet sur l’hôte.
- L’origine du problème vient d’une mauvaise configuration des hooks OCI dans le toolkit.
- L’exploitation peut se faire très facilement, par exemple avec un Dockerfile de seulement trois lignes.
- Le risque principal concerne la compromission de l’isolation entre différents clients sur des infrastructures cloud GPU partagées.
- Les versions affectées incluent toutes les versions du NVIDIA Container Toolkit jusqu’à la 1.17.7 et du NVIDIA GPU Operator jusqu’à la version 25.3.1.
- Pour atténuer le risque, il est recommandé de mettre à jour vers les dernières versions corrigées.
- En attendant, il est possible de désactiver certains hooks problématiques dans la configuration pour limiter l’exposition.
- Cette faille met en lumière l’importance de renforcer la sécurité des environnements GPU partagés et la gestion des conteneurs AI.

Fuite de données de l’application Tea : points essentiels
[https://knowyourmeme.com/memes/events/the-tea-app-data-leak](https://knowyourmeme.com/memes/events/the-tea-app-data-leak)

- Tea est une application lancée en 2023 qui permet aux femmes de laisser des avis anonymes sur des hommes rencontrés.
- En juillet 2025, une importante fuite a exposé environ 72 000 images sensibles (selfies, pièces d’identité) et plus d’1,1 million de messages privés.
- La fuite a été révélée après qu’un utilisateur ait partagé un lien pour télécharger la base de données compromise.
- Les données touchées concernaient majoritairement des utilisateurs inscrits avant février 2024, date à laquelle l’application a migré vers une infrastructure plus sécurisée.
- En réponse, Tea prévoit de proposer des services de protection d’identité aux utilisateurs impactés.

Faille dans le paquet npm **is** : attaque en chaîne d’approvisionnement
[https://socket.dev/blog/npm-is-package-hijacked-in-expanding-supply-chain-attack](https://socket.dev/blog/npm-is-package-hijacked-in-expanding-supply-chain-attack)

- Une campagne de phishing ciblant les mainteneurs npm a compromis plusieurs comptes, incluant celui du paquet `is`.
- Des versions compromises du paquet `is` (notamment les versions 3.3.1 et 5.0.0) contenaient un chargeur de malware JavaScript destiné aux systèmes Windows.
- Ce malware a offert aux attaquants un accès à distance via WebSocket, permettant potentiellement l’exécution de code arbitraire.
- L’attaque fait suite à d’autres compromissions de paquets populaires comme `eslint-config-prettier`, `eslint-plugin-prettier`, `synckit`, `@pkgr/core`, `napi-postinstall`, et `got-fetch`.
- Tous ces paquets ont été publiés sans aucun commit ou PR sur leurs dépôts GitHub respectifs, signalant un accès non autorisé aux tokens mainteneurs.
- Le domaine usurpé `[npnjs.com](http://npnjs.com)` a été utilisé pour collecter les jetons d’accès via des emails de phishing trompeurs.
- L’épisode met en lumière la fragilité des chaînes d’approvisionnement logicielle dans l’écosystème npm et la nécessité d’adopter des pratiques renforcées de sécurité autour des dépendances.

**Revues de sécurité automatisées avec Claude Code**
[https://www.anthropic.com/news/automate-security-reviews-with-claude-code](https://www.anthropic.com/news/automate-security-reviews-with-claude-code)

- Anthropic a lancé des fonctionnalités de sécurité automatisées pour **Claude Code**, un assistant de codage d'IA en ligne de commande. Ces fonctionnalités ont été introduites en réponse au besoin croissant de maintenir la sécurité du code alors que les outils d'IA accélèrent considérablement le développement de logiciels.
- **Commande `/security-review`** : les développeurs peuvent exécuter cette commande dans leur terminal pour demander à Claude d'identifier les vulnérabilités de sécurité, notamment les risques d'injection SQL, les vulnérabilités de script intersite (XSS), les failles d'authentification et d'autorisation, ainsi que la gestion non sécurisée des données. Claude peut également suggérer et implémenter des correctifs.
- **Intégration GitHub Actions** : une nouvelle action GitHub permet à Claude Code d'analyser automatiquement chaque nouvelle demande d'extraction (pull request). L'outil examine les modifications de code pour y trouver des vulnérabilités, applique des règles personnalisables pour filtrer les faux positifs et commente directement la demande d'extraction avec les problèmes détectés et les correctifs recommandés.
- Ces fonctionnalités sont conçues pour créer un processus d'examen de sécurité cohérent et s'intégrer aux pipelines CI/CD existants, ce qui permet de s'assurer qu'aucun code n'atteint la production sans un examen de sécurité de base.


### Loi, société et organisation

Google embauche les personnes clés de Windsurf [https://www.blog-nouvelles-technologies.fr/333959/openai-windsurf-google-deepmind-codage-agentique/](https://www.blog-nouvelles-technologies.fr/333959/openai-windsurf-google-deepmind-codage-agentique/)

- windsurf devait être racheté par OpenAI
- Google ne fait pas d’offre de rachat mais débauche quelques personnes clés de Windsurf
- Windsurf reste donc indépendante mais sans certains cerveaux y compris son PDG. 
- Les nouveaux dirigeants sont les ex leaders des force de vente
- Donc plus une boîte tech
- Pourquoi le deal a 3 milliard est tombé à l’eau ?
- On ne sait pas mais la divergence et l‘indépendance technologique est possiblement en cause. 
- Les transfuge vont bosser chez Deepmind dans le code argentique 

Opinion Article: [https://www.linkedin.com/pulse/dear-people-who-think-ai-low-skilled-code-monkeys-future-jan-moser-svade/](https://www.linkedin.com/pulse/dear-people-who-think-ai-low-skilled-code-monkeys-future-jan-moser-svade/)

- Jan Moser critique ceux qui pensent que l'IA et les développeurs peu qualifiés peuvent remplacer les ingénieurs logiciels compétents.
- Il cite l'exemple de l'application Tea, une plateforme de sécurité pour femmes, qui a exposé 72 000 images d'utilisateurs en raison d'une mauvaise configuration de Firebase et d'un manque de pratiques de développement sécurisées.
- Il souligne que l'absence de contrôles automatisés et de bonnes pratiques de sécurité a permis cette fuite de données.
- Moser avertit que des outils comme l'IA ne peuvent pas compenser l'absence de compétences en génie logiciel, notamment en matière de sécurité, de gestion des erreurs et de qualité du code.
- Il appelle à une reconnaissance de la valeur des ingénieurs logiciels qualifiés et à une approche plus rigoureuse dans le développement logiciel.

YouTube déploie une technologie d'estimation d'âge pour identifier les adolescents aux États-Unis
[https://techcrunch.com/2025/07/29/youtube-rolls-out-age-estimatation-tech-to-identify-u-s-teens-and-apply-additional-protections/](https://techcrunch.com/2025/07/29/youtube-rolls-out-age-estimatation-tech-to-identify-u-s-teens-and-apply-additional-protections/)

- Sujet très à la mode, surtout au UK mais pas que...
- YouTube commence à déployer une technologie d'estimation d'âge basée sur l'IA pour identifier les utilisateurs adolescents aux États-Unis, indépendamment de l'âge déclaré lors de l'inscription.
- Cette technologie analyse divers signaux comportementaux, tels que l'historique de visionnage, les catégories de vidéos consultées et l'âge du compte.
- Lorsqu'un utilisateur est identifié comme adolescent, YouTube applique des protections supplémentaires, notamment :
- Désactivation des publicités personnalisées.
- Activation des outils de bien-être numérique, tels que les rappels de temps d'écran et de coucher.
- Limitation de la visualisation répétée de contenus sensibles, comme ceux liés à l'image corporelle.
- Si un utilisateur est incorrectement identifié comme mineur, il peut vérifier son âge via une pièce d'identité gouvernementale, une carte de crédit ou un selfie.
- Ce déploiement initial concerne un petit groupe d'utilisateurs aux États-Unis et sera étendu progressivement.
- Cette initiative s'inscrit dans les efforts de YouTube pour renforcer la sécurité des jeunes utilisateurs en ligne.

Mistral AI : contribution à un standard environnemental pour l’IA
[https://mistral.ai/news/our-contribution-to-a-global-environmental-standard-for-ai](https://mistral.ai/news/our-contribution-to-a-global-environmental-standard-for-ai)

- Mistral AI a réalisé la première analyse de cycle de vie complète d’un modèle d’IA, en collaboration avec plusieurs partenaires.
- L’étude quantifie l’impact environnemental du modèle Mistral Large 2 sur les émissions de gaz à effet de serre, la consommation d’eau, et l’épuisement des ressources.
- La phase d’entraînement a généré 20,4 kilotonnes de CO₂ équivalent, consommé 281 000 m³ d’eau, et utilisé 660 kg SB-eq (mineral consumption).
- Pour une réponse de 400 tokens, l’impact marginal est faible mais non négligeable : 1,14 gramme de CO₂, 45 mL d’eau, et 0,16 mg d’équivalent antimoine.
- Mistral propose trois indicateurs pour évaluer cet impact : l’impact absolu de l’entraînement, l’impact marginal de l’inférence, et le ratio inference/impact total sur le cycle de vie.
- L’entreprise souligne l’importance de choisir le modèle en fonction du cas d’usage pour limiter l’empreinte environnementale.
- Mistral appelle à plus de transparence et à l’adoption de standards internationaux pour permettre une comparaison claire entre modèles.

L’IA promettait plus d’efficacité… elle nous fait surtout travailler plus
[https://afterburnout.co/p/ai-promised-to-make-us-more-efficient](https://afterburnout.co/p/ai-promised-to-make-us-more-efficient)

- Les outils d’IA devaient automatiser les tâches pénibles et libérer du temps pour les activités stratégiques et créatives. En réalité, le temps gagné est souvent aussitôt réinvesti dans d’autres tâches, créant une surcharge.
- Les utilisateurs croient être plus productifs avec l’IA, mais les données contredisent cette impression : une étude montre que les développeurs utilisant l’IA prennent 19 % de temps en plus pour accomplir leurs tâches.
- Le rapport DORA 2024 observe une baisse de performance globale des équipes lorsque l’usage de l’IA augmente : -1,5 % de throughput et -7,2 % de stabilité de livraison pour +25 % d’adoption de l’IA.
- L’IA ne réduit pas la charge mentale, elle la déplace : rédaction de prompts, vérification de résultats douteux, ajustements constants… Cela épuise et limite le temps de concentration réelle.
- Cette surcharge cognitive entraîne une forme de dette mentale : on ne gagne pas vraiment du temps, on le paie autrement.
- Le vrai problème vient de notre culture de la productivité, qui pousse à toujours vouloir optimiser, quitte à alimenter l'épuisement professionnel.
- Trois pistes concrètes :
  - Repenser la productivité non en temps gagné, mais en énergie préservée.
  - Être sélectif dans l’usage des outils IA, en fonction de son ressenti et non du battage médiatique.
  - Accepter la courbe en J : l’IA peut être utile, mais nécessite des ajustements profonds pour produire des gains réels.
- Le vrai hack de productivité ? Parfois, ralentir pour rester lucide et durable.





## Conférences

MCP Submit Europe [https://mcpdevsummit.ai/](https://mcpdevsummit.ai/)


Retour de JavaOne en 2026
[https://inside.java/2025/08/04/javaone-returns-2026/](https://inside.java/2025/08/04/javaone-returns-2026/)

- JavaOne, la conférence dédiée à la communauté Java, fait son grand retour dans la **Bay Area du 17 au 19 mars 2026**. 
- Après le succès de l'édition 2025, ce retour s'inscrit dans la continuité de la mission initiale de la conférence : rassembler la communauté pour apprendre, collaborer et innover.


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 25-27 août 2025 : [SHAKA Biarritz](https://shaka.events) - Biarritz (France) 
- 5 septembre 2025 : [JUG Summer Camp 2025](https://www.jugsummercamp.org/edition/16) - La Rochelle (France) <a href="https://conference-hall.io/jug-summer-camp-2025"><img alt="CFP JUG Summer Camp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=red"></a>
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
- 8-10 octobre 2025 : [SIG 2025](https://www.geo-evenement.fr/) - Paris (France) & Online <a href="https://www.geo-evenement.fr/registration/communiquer"><img alt="CFP SIG 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-August-2025&color=green"></a>
- 9 octobre 2025 : [DevCon #25 : informatique quantique](https://www.programmez.com/page-devcon/devcon-25-informatique-quantique) - Paris (France) <a href="https://forms.gle/2Szh1rpTMQtH44Hk8"><img alt="CFP DevCon 25 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 9-10 octobre 2025 : [Forum PHP 2025](https://event.afup.org/) - Marne-la-Vallée (France) <a href="https://afup.org/event/forumphp2025"><img alt="CFP Forum PHP 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=red"></a>
- 9-10 octobre 2025 : [EuroRust 2025](https://eurorust.eu) - Paris (France) <a href="https://www.papercall.io/eurorust-2025"><img alt="CFP EuroRust 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-May-2025&color=red"></a>
- 16 octobre 2025 : [PlatformCon25 Live Day Paris](https://platformconlive.fr/) - Paris (France) <a href="https://conference-hall.io/platformcon25-live-day-paris"><img alt="CFP PlatformCon25 Live Day Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=red"></a>
- 16 octobre 2025 : [Power 365 - 2025](https://www.power365.fr) - Lille (France) <a href="https://sessionize.com/power-365-2025/"><img alt="CFP Power 365 - 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 16-17 octobre 2025 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) <a href="https://conference-hall.io/devfest-nantes-2025"><img alt="CFP DevFest Nantes 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-June-2025&color=red"></a>
- 17 octobre 2025 : [Sylius Con 2025](https://sylius.com/conference-2025/) - Lyon (France) <a href="https://sylius.com/conference-2025/#speakers"><img alt="CFP Sylius Con 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=red"></a>
- 17 octobre 2025 : [ScalaIO 2025](https://scala.io) - Paris (France) <a href="https://www.papercall.io/scala-io-2025"><img alt="CFP ScalaIO 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-August-2025&color=green"></a>
- 17-19 octobre 2025 : [OpenInfra Summit Europe](https://summit2025.openinfra.org/) - Paris (France) 
- 20 octobre 2025 : [Codeurs en Seine](https://www.codeursenseine.com/2025) - Rouen (France) <a href="https://conference-hall.io/codeurs-en-seine-20-novembre-2025"><img alt="CFP Codeurs en Seine 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-September-2025&color=green"></a>
- 23 octobre 2025 : [Cloud Nord](https://cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/cloud-nord-2025"><img alt="CFP Cloud Nord" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-August-2025&color=green"></a>
- 30-31 octobre 2025 : [Agile Tour Bordeaux 2025](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2025/"><img alt="CFP Agile Tour Bordeaux 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=red"></a>
- 30-31 octobre 2025 : [Agile Tour Nantais 2025](https://agilenantes.org/) - Nantes (France) <a href="https://sessionize.com/agile-tour-nantais-2025/"><img alt="CFP Agile Tour Nantais 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2025&color=red"></a>
- 30 octobre 2025-2 novembre 2025 : [PyConFR 2025](https://www.pycon.fr/2025/) - Lyon (France) <a href="https://cfp.pycon.fr/pyconfr-2025/cfp"><img alt="CFP PyConFR 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-July-2025&color=red"></a>
- 4-7 novembre 2025 : [NewCrafts 2025](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/ncrafts/"><img alt="CFP NewCrafts 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=red"></a>
- 5-6 novembre 2025 : [Tech Show Paris](https://www.techshowparis.fr/) - Paris (France) 
- 6 novembre 2025 : [dotAI 2025](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=red"></a>
- 6 novembre 2025 : [Agile Tour Aix-Marseille 2025](http://atmrs.esprit-agile.com/) - Gardanne (France) <a href="https://sessionize.com/agile-tour-aix-marseille-2025/"><img alt="CFP Agile Tour Aix-Marseille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-August-2025&color=green"></a>
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

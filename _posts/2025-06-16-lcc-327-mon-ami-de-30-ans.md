---
title: LCC 327 - Mon ami de 30 ans
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 327
youtube:
mp3_length: 74555636
tweet: Mon ami de 30 ans #WebAssembly #JDK #Java #Kotlin #IA #Hibernate #Spring #Vertx #Conscience #Virtualisation #Conteneurisation #Claude4 #GPT41 #Sécurité #OpenSource #Méthodologie #Outils
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, c'est le retour de Katia et d'Antonio.
Les Cast Codeurs explorent WebAssembly 2.0, les 30 ans de Java, l'interopérabilité Swift-Java et les dernières nouveautés Kotlin.
Ils plongent dans l'évolution de l'IA avec Claude 4 et GPT-4.1, débattent de la conscience artificielle et partagent leurs retours d'expérience sur l'intégration de l'IA dans le développement.
Entre virtualisation, défis d'infrastructure et enjeux de sécurité open source, une discussion riche en insights techniques et pratiques.

Enregistré le 13 juin 2025

Téléchargement de l’épisode [LesCastCodeurs-Episode-327.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-327.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/@lescastcodeurs).

## News


### Langages

Wasm 2.0 enfin officialisé !
[https://webassembly.org/news/2025-03-20-wasm-2.0/](https://webassembly.org/news/2025-03-20-wasm-2.0/)

- La spécification Wasm 2.0 est officiellement sortie en décembre dernier.
- Le consensus sur la spécification avait été atteint plus tôt, en 2022.
- Les implémentations majeures supportent Wasm 2.0 depuis un certain temps.
- Le processus W3C a pris du temps pour atteindre le statut de “Recommandation Candidate” pour des raisons non techniques.
- Les futures versions de Wasm adopteront un modèle “evergreen” où la “Recommandation Candidate” sera mise à jour en place.
- La dernière version de la spécification est considérée comme le standard actuel ([Candidate Recommendation Draft](https://www.w3.org/TR/wasm-core-2/)).
- La version la plus à jour est disponible sur la page GitHub ([GitHub page](https://webassembly.github.io/spec/)).
- Wasm 2.0 inclut les nouveautés suivantes :
  - [Instructions vectorielles](https://github.com/webassembly/simd) pour le SIMD 128-bit.
  - [Instructions de manipulation de mémoire en bloc](https://github.com/WebAssembly/bulk-memory-operations) pour des copies et initialisations plus rapides.
  - [Résultats multiples](https://github.com/WebAssembly/multi-value) pour les instructions, blocs et fonctions.
  - [Types références](https://github.com/WebAssembly/reference-types) pour les références à des fonctions ou objets externes.
  - [Conversions non-piégeantes](https://github.com/WebAssembly/nontrapping-float-to-int-conversions) de flottant à entier.
  - [Instructions d'extension de signe](https://github.com/WebAssembly/sign-extension-ops) pour les entiers signés.
- Wasm 2.0 est entièrement rétrocompatible avec Wasm 1.0.

Paul Sandoz annonce que le JDK intègrera bientôt une API minimaliste pour lire et écrire du JSON
[https://mail.openjdk.org/pipermail/core-libs-dev/2025-May/145905.html](https://mail.openjdk.org/pipermail/core-libs-dev/2025-May/145905.html)


Java a 30 ans, c'était quoi les points bluffants au début ? [https://blog.jetbrains.com/idea/2025/05/do-you-really-know-java/](https://blog.jetbrains.com/idea/2025/05/do-you-really-know-java/)

- nom de code Oak
- Mais le trademark était pris
- Write Once Run Anywhere
- Garbage Collector Automatique
- multi threading au coeur de la palteforme meme si Java est passé par les green threads pendant un temps
- modèle de sécurité: sandbox applets, security manager, bytecode verifier, classloader

Des progrès dans l’interopérabilité Swift / Java mentionnés à la conférence Apple WWDC 2025
[https://www.youtube.com/watch?v=QSHO-GUGidA](https://www.youtube.com/watch?v=QSHO-GUGidA)

- **Interopérabilité Swift-Java** : Utiliser Swift dans des apps Java et vice-versa.
- **Historique** : L’interopérabilité Swift existait déjà avec C et C++.
- **Méthodes** : Deux directions d’interopérabilité : Java depuis Swift et Swift depuis Java.
- **JNI** : JNI est l’API Java pour le code natif, mais elle est verbeuse.
- **Swift-Java** : Un projet pour une interaction Swift-Java plus flexible, sûre et performante.
- **Exemples pratiques** : Utiliser des bibliothèques Java depuis Swift et rendre des bibliothèques Swift disponibles pour Java.
- **Gestion mémoire** : Swift-Java utilise la nouvelle API FFM de Java pour gérer la mémoire des objets Swift.
- **Open Source** : Le projet Swift-Java est open source et invite aux contributions.

KotlinConf le retour [https://www.sfeir.dev/tendances/kotlinconf25-quelles-sont-les-annonces-a-retenir/](https://www.sfeir.dev/tendances/kotlinconf25-quelles-sont-les-annonces-a-retenir/) par Adelin de Sfeir

- "1 developeur sur 10" utilise Kotlin
- Kotlin 2.2 en RC
- `$$` multi dollar interpolation pour eviter les sur interpolations
- non local break / continue (changement dans la conssitance de Kotlin
- guards sur le pattern matching
- D'autres features annoncées
- alignement des versions de l'ecosysteme sur kotlin jvm par defaut
- un nouvel outil de build Amper
- beaucoup d'annonces autour de l'IA
- Koog, framework agentique de maniere declarative
- nouvelle version du LLM de JetBrains: Mellum (focalisé sur le code)
- Kotlin et Compose multiplateforme (stable en iOS)
- Hot Reload dans compose en alpha
- partenariat strategque avec Spring pour bien integrer kotlin dans spring


### Librairies

Sortie d’une version Java de ADK, le framework d’agents IA lancé par Google
[https://glaforge.dev/posts/2025/05/20/writing-java-ai-agents-with-adk-for-java-getting-started/](https://glaforge.dev/posts/2025/05/20/writing-java-ai-agents-with-adk-for-java-getting-started/)

- Guillaume a travaillé sur le lancement de ce framework ! (améliorations de l’API, code d’exemple, doc...)

Comment déployer un serveur MCP en Java, grâce à Quarkus, et le déployer sur Google Cloud Run
[https://glaforge.dev/posts/2025/06/09/building-an-mcp-server-with-quarkus-and-deploying-on-google-cloud-run/](https://glaforge.dev/posts/2025/06/09/building-an-mcp-server-with-quarkus-and-deploying-on-google-cloud-run/)

- Même Guillaume se met à faire du Quarkus !
- Utilisation du support MCP développé par l’équipe Quarkus. C’est facile, suffit d’annoter une méthode avec @Tool et ses arguments avec @ToolArg et c’est parti !
- L’outil MCP inspector est très pratique pour inspecter manuellement le fonctionnement de ses serveurs MCP
- Déployer sur Cloud Run est facile grâce aux Dockerfiles fournis par Quarkus
- En bonus, Guillaume montre comment configuré un serveur MCP comme un outil dans le framework ADK pour Java, pour créer ses agents IA

Jilt 1.8 est sorti, un annotation processor pour le pattern builder
[https://www.endoflineblog.com/jilt-1_8-and-1_8_1-released](https://www.endoflineblog.com/jilt-1_8-and-1_8_1-released)

- processing incrémental pour Gradle
- meilleure couverture de votre code (pour ne pas comptabiliser le code généré par l’annotation processeur)
- une correction d’un problème lors de l’utilisation des types génériques récursifs (genre `Node<T extends Node<T>>`

Hibernate Search 8 est sorti [https://in.relation.to/2025/06/06/hibernate-search-8-0-0-Final/](https://in.relation.to/2025/06/06/hibernate-search-8-0-0-Final/)

- aggregation de metriques
- compatibilité avec les dernieres OpenSearch et Elasticsearch
- Lucene 10 en backend
- Preview des requetes validées à la compilation

Hibernate 7 est sorti [https://in.relation.to/2025/05/20/hibernate-orm-seven/](https://in.relation.to/2025/05/20/hibernate-orm-seven/)

- ASL 2.0
- Hibernate Validator 9
- Jakarta Persistence 3.2 et Jakarta Validation 3.1
- `saveOrUpdate` (reattachement d'entité) n'est plus supporté
- session stateless plus capable: oeprations unitaires et pas seulement bach, acces au cache de second niveau, m,eilleure API pour les batchs (insertMultiple etc)
- nouvelle API criteria simple et type-safe: et peut ajouter a une requete de base

Un article qui décrit la Dev UI de Quarkus [https://www.sfeir.dev/back/quarkus-dev-ui-linterface-ultime-pour-booster-votre-productivite-en-developpement-java/](https://www.sfeir.dev/back/quarkus-dev-ui-linterface-ultime-pour-booster-votre-productivite-en-developpement-java/)

- apres un test pour soit ou une demo, c'est un article détaillé et la doc de Quarkus n'est pas top là dessus

Vert.x 5 est sorti [https://vertx.io/blog/eclipse-vert-x-5-released/](https://vertx.io/blog/eclipse-vert-x-5-released/)

- on en avait parlé fin de l'année dernière ou début d'année
- **Modèle basé uniquement sur les Futures** : Vert.x 5 abandonne le modèle de callbacks pour ne conserver que les Futures, avec une nouvelle classe de base `VerticleBase` mieux adaptée à ce modèle asynchrone.
- **Support des modules Java (JPMS)** : Vert.x 5 prend en charge le système de modules de la plateforme Java avec des modules explicites, permettant une meilleure modularité des applications.
- **Améliorations majeures de gRPC** : Support natif de gRPC Web et gRPC Transcoding (support HTTP/JSON et gRPC), format JSON en plus de Protobuf, gestion des timeouts et deadlines, services de réflexion et de health.
- **Support d'io_uring** : Intégration native du système io_uring de Linux (précédemment en incubation) pour de meilleures performances I/O sur les systèmes compatibles.
- **Load balancing côté client** : Nouvelles capacités de répartition de charge pour les clients HTTP et gRPC avec diverses politiques de distribution.
- **Service Resolver** : Nouveau composant pour la résolution dynamique d'adresses de services, étendant les capacités de load balancing à un ensemble plus large de résolveurs.
- **Améliorations du proxy HTTP** : Nouvelles transformations prêtes à l'emploi, interception des upgrades WebSocket et interface SPI pour le cache avec support étendu des spécifications.
- **Suppressions et remplacements** : Plusieurs composants sont dépréciés (gRPC Netty, JDBC API, Service Discovery) ou supprimés (Vert.x Sync, RxJava 1), remplacés par des alternatives plus modernes comme les virtual threads et Mutiny.

Spring AI 1.0 est sorti [https://spring.io/blog/2025/05/20/spring-ai-1-0-GA-released](https://spring.io/blog/2025/05/20/spring-ai-1-0-GA-released)

- **ChatClient multi-modèles** : API unifiée pour interagir avec 20 modèles d'IA différents avec support multi-modal et réponses JSON structurées.
- **Écosystème RAG complet** : Support de 20 bases vectorielles, pipeline ETL et enrichissement automatique des prompts via des advisors.
- **Fonctionnalités enterprise** : Mémoire conversationnelle persistante, support MCP, observabilité Micrometer et évaluateurs automatisés.
- **Agents et workflows** : Patterns prédéfinis (routing, orchestration, chaînage) et agents autonomes pour applications d'IA complexes.


### Infrastructure

Les modèles d’IA refusent d’être éteint et font du chantage pour l’eviter, voire essaient se saboter l’extinction [https://www.thealgorithmicbridge.com/p/ai-companies-have-lost-controland?utm_source=substac[…]aign=email-restack-comment&amp;r=2qoalf&amp;triedRedirect=true](https://www.thealgorithmicbridge.com/p/ai-companies-have-lost-controland?utm_source=substack&amp;utm_medium=email&amp;utm_campaign=email-restack-comment&amp;r=2qoalf&amp;triedRedirect=true)

- Les chercheur d’Anthropic montrent comment Opus 4 faisait du chantage aux ingenieurs qui voulaient l’eteindre pour mettre une nouvelle version en ligne
- Une boite de recherche a montré la même chose d’Open AI o3
- non seulemenmt il ne veut pas mais il essaye activement d’empêcher l’extinction

Apple annonce le support de la virtualisation / conteneurisation dans macOS lors de la WWDC
[https://github.com/apple/containerization](https://github.com/apple/containerization)

- C’est open source
- Possibilité de lancer aussi des VM légères
- Documentation technique : [https://apple.github.io/containerization/documentation/](https://apple.github.io/containerization/documentation/)

Grosse chute de services internet suite à un soucis sur GCP

- Le retour de cloud flare  [https://blog.cloudflare.com/cloudflare-service-outage-june-12-2025/](https://blog.cloudflare.com/cloudflare-service-outage-june-12-2025/)
- Leur système de stockage (une dépendance majeure) dépend exclusivement de GCP 
- Mais ils ont des plans pour surfit de cette dépendance exclusive
- la première analyse de Google [https://status.cloud.google.com/incidents/ow5i3PPK96RduMcb1SsW](https://status.cloud.google.com/incidents/ow5i3PPK96RduMcb1SsW)
- Un quota auto mis à jour qui a mal tourné. 
- ils ont bypassé le quota en code mais le service de quote en us-central1 était surchargé. 
- Prochaines améliorations: pas d propagation de données corrompues, pas de déploiement global sans rolling upgrade avec monitoring qui peut couper 
- par effet de bord (fail over) certains autres cloud providers ont aussi eu quelques soucis (charge) - unverified 




### Data et Intelligence Artificielle

Claude 4 est sorti

[https://www.anthropic.com/news/claude-4](https://www.anthropic.com/news/claude-4)

- Deux nouveaux modèles lancés : Claude Opus 4 (le meilleur modèle de codage au monde) et Claude Sonnet 4 (une amélioration significative de Sonnet 3.7)
- Claude Opus 4 atteint 72,5% sur SWE-bench et peut maintenir des performances soutenues sur des tâches longues durant plusieurs heures
- Claude Sonnet 4 obtient 72,7% sur SWE-bench tout en équilibrant performance et efficacité pour un usage quotidien
- Nouvelle fonctionnalité de "pensée étendue avec utilisation d'outils" permettant à Claude d'alterner entre raisonnement et usage d'outils
- Les modèles peuvent maintenant utiliser plusieurs outils en parallèle et suivre les instructions avec plus de précision
- Capacités mémoire améliorées : Claude peut extraire et sauvegarder des informations clés pour maintenir la continuité sur le long terme
- Claude Code devient disponible à tous avec intégrations natives VS Code et JetBrains pour la programmation en binôme
- Quatre nouvelles capacités API : outil d'exécution de code, connecteur MCP, API Files et mise en cache des prompts
- Les modèles hybrides offrent deux modes : réponses quasi-instantanées et pensée étendue pour un raisonnement plus approfondi en mode "agentique"

L’intégration de l’IA au delà des chatbots et des boutons à étincelles
[https://glaforge.dev/posts/2025/05/23/beyond-the-chatbot-or-ai-sparkle-a-seamless-ai-integration/](https://glaforge.dev/posts/2025/05/23/beyond-the-chatbot-or-ai-sparkle-a-seamless-ai-integration/)

- Plaidoyer pour une IA intégrée de façon transparente et intuitive, au-delà des chatbots.
- Chatbots : pas toujours l’option LLM la plus intuitive ou la moins perturbatrice.
- Préconisation : IA directement dans les applications pour plus d’intelligence et d’utilité naturelle.
- Exemples d’intégration transparente : résumés des conversations Gmail et chat, web clipper Obsidian qui résume et taggue, complétion de code LLM.
- Meilleure UX IA : intégrée, contextuelle, sans “boutons IA” ou fenêtres de chat dédiées.
- Conclusion de Guillaume : intégrations IA réussies = partie naturelle du système, améliorant les workflows sans perturbation, le développeur ou l’utilisateur reste dans le “flow”

Garder votre base de donnée vectorielle à jour avec Debezium [https://debezium.io/blog/2025/05/19/debezium-as-part-of-your-ai-solution/](https://debezium.io/blog/2025/05/19/debezium-as-part-of-your-ai-solution/)

- pas besoin de detailler mais
- expliquer idee de garder les changements a jour dans l'index


### Outillage

guide pratique pour choisir le bon modèle d’IA à utiliser avec GitHub Copilot, en fonction de vos besoins en développement logiciel. [https://github.blog/ai-and-ml/github-copilot/which-ai-model-should-i-use-with-github-copilot/](https://github.blog/ai-and-ml/github-copilot/which-ai-model-should-i-use-with-github-copilot/)
- Équilibre coût/performance : GPT-4.1, GPT-4o ou Claude 3.5 Sonnet pour des tâches générales et multilingues.
- Tâches rapides : o4-mini ou Claude 3.5 Sonnet pour du prototypage ou de l’apprentissage rapide.
- Besoins complexes : Claude 3.7 Sonnet, GPT-4.5 ou o3 pour refactorisation ou planification logicielle.
- Entrées multimodales : Gemini 2.0 Flash ou GPT-4o pour analyser images, UI ou diagrammes.
- Projets techniques/scientifiques : Gemini 2.5 Pro pour raisonnement avancé et gros volumes de données.



UV, un package manager pour les pythonistes qui amène un peu de sanité et de vitesse [http://blog.ippon.fr/2025/05/12/uv-un-package-manager-python-adapte-a-la-data-partie-1-theorie-et-fonctionnalites/](http://blog.ippon.fr/2025/05/12/uv-un-package-manager-python-adapte-a-la-data-partie-1-theorie-et-fonctionnalites/)

- pour les pythonistes
- un ackage manager plus rapide et simple
- mais il est seulement semi ouvert (license)

IntelliJ IDEA 2025.1 permet de rajouter un mode MCP client à l'assistant IA [https://blog.jetbrains.com/idea/2025/05/intellij-idea-2025-1-model-context-protocol/](https://blog.jetbrains.com/idea/2025/05/intellij-idea-2025-1-model-context-protocol/)

- par exemple faire tourner un MCP server qui accède à la base de donnée



### Méthodologies

Développement d’une bibliothèque OAuth 2.1 open source par Cloudflare, en grande partie générée par l’IA Claude:
- Prompts intégrés aux commits : Chaque commit contient le prompt utilisé, ce qui facilite la compréhension de l’intention derrière le code.
- Prompt par l’exemple : Le premier prompt montrait un exemple d’utilisation de l’API qu’on souhaite obtenir, ce qui a permis à l’IA de mieux comprendre les attentes.
- Prompts structurés : Les prompts les plus efficaces suivaient un schéma clair : état actuel, justification du changement, et directive précise.
- Traitez les prompts comme du code source : Les inclure dans les commits aide à la maintenance.
- Acceptez les itérations : Chaque fonctionnalité a nécessité plusieurs essais.
- Intervention humaine indispensable : Certaines tâches restent plus rapides à faire à la main.
[https://www.maxemitchell.com/writings/i-read-all-of-cloudflares-claude-generated-commits/](https://www.maxemitchell.com/writings/i-read-all-of-cloudflares-claude-generated-commits/)



### Sécurité

Un packet npm malicieux passe par Cursor AI pour infecter les utilisateurs [https://thehackernews.com/2025/05/malicious-npm-packages-infect-3200.html](https://thehackernews.com/2025/05/malicious-npm-packages-infect-3200.html)

- **Trois packages npm malveillants** ont été découverts ciblant spécifiquement l'éditeur de code Cursor sur macOS, téléchargés plus de 3 200 fois au total.**Les packages se déguisent** en outils de développement promettant "l'API Cursor la moins chère" pour attirer les développeurs intéressés par des solutions AI abordables.
- **Technique d'attaque sophistiquée** : les packages volent les identifiants utilisateur, récupèrent un payload chiffré depuis des serveurs contrôlés par les pirates, puis remplacent le fichier main.js de Cursor.
- **Persistance assurée** en désactivant les mises à jour automatiques de Cursor et en redémarrant l'application avec le code malveillant intégré.
- **Nouvelle méthode de compromission** : au lieu d'injecter directement du malware, les attaquants publient des packages qui modifient des logiciels légitimes déjà installés sur le système.
- **Persistance même après suppression** : le malware reste actif même si les packages npm malveillants sont supprimés, nécessitant une réinstallation complète de Cursor.
- **Exploitation de la confiance** : en s'exécutant dans le contexte d'une application légitime (IDE), le code malveillant hérite de tous ses privilèges et accès.
- **Package "rand-user-agent" compromis** : un package légitime populaire a été infiltré pour déployer un cheval de Troie d'accès distant (RAT) dans certaines versions.
- **Recommandations de sécurité** : surveiller les packages exécutant des scripts post-installation, modifiant des fichiers hors node_modules, ou initiant des appels réseau inattendus, avec monitoring d'intégrité des fichiers.


### Loi, société et organisation

Le drama OpenRewrite (automatisation de refactoring sur de larges bases de code) est passé en mode propriétaire
[https://medium.com/@jonathan.leitschuh/when-open-source-isnt-how-openrewrite-lost-its-way-642053be287d](https://medium.com/@jonathan.leitschuh/when-open-source-isnt-how-openrewrite-lost-its-way-642053be287d)

- **Faits Clés :**
  - Moderne, Inc. a re-licencié silencieusement du code OpenRewrite (dont `rewrite-java-security`) de la licence Apache 2.0 à une licence propriétaire (MPL) sans consultation des contributeurs.
  - Ce re-licenciement rend le code inaccessible et non modifiable pour les contributeurs originaux.
  - Moderne s’est retiré de la Commonhaus Foundation (dédiée à l’open source) juste avant ces changements.
  - La justification de Moderne est la crainte que de grandes entreprises utilisent OpenRewrite sans contribuer, créant une concurrence.
  - Des contributions communautaires importantes (VMware, AliBaba) sous Apache 2.0 ont été re-licenciées sans leur consentement.
  - La légalité de ce re-licenciement est incertaine sans CLA des contributeurs.
  - Cette action crée un précédent dangereux pour les futurs contributeurs et nuit à la confiance dans l’écosystème OpenRewrite.
- **Corrections de Moderne (Suite aux réactions) :**
  - Les dépôts Apache originaux ont été restaurés et archivés.
  - Des versions majeures ont été utilisées pour signaler les changements de licence.
  - Des espaces de noms distincts (`org.openrewrite` vs. `io.moderne`) ont été créés pour différencier les modules.
- **Suggestions de Correction de l’Auteur :**
  - **Annuler les changements de licence** sur toutes les recettes communautaires.
  - **S’engager dans le dialogue** et communiquer publiquement les changements majeurs.
  - **Respecter le versionnement sémantique** (versions majeures pour les changements de licence).

**L’ancien gourou du design d’Apple, Jony Ive, va occuper un rôle majeur chez OpenAI**
OpenAI va acquérir la startup d’Ive pour 6,5 milliards de dollars, tandis qu’Ive et le PDG Sam Altman travaillent sur une nouvelle génération d’appareils et d’autres produits d’IA
[https://www.wsj.com/tech/ai/former-apple-design-guru-jony-ive-to-take-expansive-role-at-openai-5787f7da](https://www.wsj.com/tech/ai/former-apple-design-guru-jony-ive-to-take-expansive-role-at-openai-5787f7da)




## Rubrique débutant

Un article pour les débutants sur le lien entre source, bytecode et le debug [https://blog.jetbrains.com/idea/2025/05/sources-bytecode-debugging/](https://blog.jetbrains.com/idea/2025/05/sources-bytecode-debugging/)

- le debugger voit le bytecode
- et le lien avec la ligne ou la methode est potentiellement perdu
- javac peut ajouter les ligne et offset des operations pour que le debugger les affichent
- les noms des arguments est aussi ajoutable dans le `.class`
- quand vous pointez vers une mauvaise version du fichier source, vous avez des lignes decalées, c'est pour ca 
- peu de raisons de ne pas actier des approches de compilations mais cela rend le fichier un peu plus gros



## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 11-13 juin 2025 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxxpl25.cfp.dev/#/login"><img alt="CFP Devoxx Poland 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=red"></a>
- 12-13 juin 2025 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 12-13 juin 2025 : [DevLille](https://devlille.fr/) - Lille (France) <a href="https://conference-hall.io/devlille-2025"><img alt="CFP DevLille" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-March-2025&color=red"></a>
- 13 juin 2025 : [Tech F'Est 2025](https://tech-fest.dev) - Nancy (France) <a href="https://sessionize.com/bsides-boulder-2025/"><img alt="CFP Tech F'Est 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-February-2025&color=red"></a>
- 17 juin 2025 : [Mobilis In Mobile](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/mobilis-in-mobile-2025"><img alt="CFP Mobilis In Mobile 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-April-2025&color=red"></a>
- 19-21 juin 2025 : [Drupal Barcamp Perpignan 2025](https://www.drupal.fr/evenements/drupal-barcamp-perpignan-2025) - Perpignan (France) 
- 24 juin 2025 : [WAX 2025](https://www.waxconf.fr/) - Aix-en-Provence (France) <a href="https://conference-hall.io/wax2025"><img alt="CFP WAX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=red"></a>
- 25 juin 2025 : [Rust Paris 2025](https://rustparis.fr/) - Paris (France) 
- 25-26 juin 2025 : [Agi'Lille 2025](https://agilille.fr) - Lille (France) <a href="https://sessionize.com/agilille-2025/"><img alt="CFP Agi'Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-February-2025&color=red"></a>
- 25-27 juin 2025 : [BreizhCamp 2025](https://www.breizhcamp.org) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2025/"><img alt="CFP BreizhCamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-March-2025&color=red"></a>
- 26-27 juin 2025 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2025"><img alt="CFP SunnyTech 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-Feb-2025&color=red"></a>
- 1-4 juillet 2025 : [Open edX Conference - 2025](https://con.openedx.org) - Palaiseau (France) <a href="https://sessionize.com/open-edx-conference-2025"><img alt="CFP Open edX Conference - 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-December-2024&color=red"></a>
- 7-9 juillet 2025 : [Riviera DEV 2025](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/riviera-dev-2025/"><img alt="CFP Riviera DEV 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-March-2025&color=red"></a>
- 5 septembre 2025 : [JUG Summer Camp 2025](https://www.jugsummercamp.org/edition/16) - La Rochelle (France) <a href="https://conference-hall.io/jug-summer-camp-2025"><img alt="CFP JUG Summer Camp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=green"></a>
- 12 septembre 2025 : [Agile Pays Basque 2025](https://agile-paysbasque.fr/) - Bidart (France) <a href="https://conference-hall.io/agile-pays-basque-2025"><img alt="CFP Agile Pays Basque 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-May-2025&color=red"></a>
- 18-19 septembre 2025 : [API Platform Conference](https://api-platform.com/con/2025/) - Lille (France) & Online <a href="https://conference-hall.io/api-platform-conference-2025-lille-and-online"><img alt="CFP API Platform Conference 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-March-2025&color=red"></a>
- 23 septembre 2025 : [OWASP AppSec France 2025](https://www.owaspappsecdays.fr/2025/) - Paris (France) <a href="https://sessionize.com/owasp-appsec-days-france-2025/"><img alt="CFP OWASP AppSec France" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=red"></a>
- 25-26 septembre 2025 : [Paris Web 2025](https://www.paris-web.fr) - Paris (France) <a href="https://appel.paris-web.fr/"><img alt="CFP Paris Web 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-March-2025&color=red"></a>
- 2-3 octobre 2025 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) <a href="https://conference-hall.io/volcamp-2025"><img alt="CFP Volcamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2025&color=red"></a>
- 3 octobre 2025 : [DevFest Perros-Guirec 2025](https://devfest.codedarmor.fr/) - Perros-Guirec (France) <a href="https://conference-hall.io/devfest-perros-guirec-2025"><img alt="CFP DevFest Perros Guirec 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2025&color=green"></a>
- 6-7 octobre 2025 : [Swift Connection 2025](https://swiftconnection.io) - Paris (France) <a href="https://sessionize.com/swift-connection-2025/"><img alt="CFP Swift Connection 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2025&color=green"></a>
- 6-10 octobre 2025 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) <a href="https://dvbe25.cfp.dev/"><img alt="CFP Devoxx Belgium 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-July-2025&color=green"></a>
- 7 octobre 2025 : [BSides Mulhouse](https://bsides-mulhouse.fr) - Mulhouse (France) <a href="https://conference-hall.io/bsides-mulhouse-2025"><img alt="CFP BSides Mulhouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-June-2025&color=red"></a>
- 9 octobre 2025 : [DevCon #25 : informatique quantique](https://www.programmez.com/page-devcon/devcon-25-informatique-quantique) - Paris (France) <a href="https://forms.gle/2Szh1rpTMQtH44Hk8"><img alt="CFP DevCon 25 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=green"></a>
- 9-10 octobre 2025 : [Forum PHP 2025](https://event.afup.org/) - Marne-la-Vallée (France) <a href="https://afup.org/event/forumphp2025"><img alt="CFP Forum PHP 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=green"></a>
- 9-10 octobre 2025 : [EuroRust 2025](https://eurorust.eu) - Paris (France) <a href="https://www.papercall.io/eurorust-2025"><img alt="CFP EuroRust 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-May-2025&color=red"></a>
- 16 octobre 2025 : [PlatformCon25 Live Day Paris](https://platformconlive.fr/) - Paris (France) <a href="https://conference-hall.io/platformcon25-live-day-paris"><img alt="CFP PlatformCon25 Live Day Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=green"></a>
- 16 octobre 2025 : [Power 365 - 2025](https://www.power365.fr) - Lille (France) <a href="https://sessionize.com/power-365-2025/"><img alt="CFP Power 365 - 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=green"></a>
- 16-17 octobre 2025 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) <a href="https://conference-hall.io/devfest-nantes-2025"><img alt="CFP DevFest Nantes 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-June-2025&color=red"></a>
- 30-31 octobre 2025 : [Agile Tour Bordeaux 2025](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2025/"><img alt="CFP Agile Tour Bordeaux 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=green"></a>
- 30-31 octobre 2025 : [Agile Tour Nantais 2025](https://agilenantes.org/) - Nantes (France) <a href="https://sessionize.com/agile-tour-nantais-2025/"><img alt="CFP Agile Tour Nantais 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=green"></a>
- 30 octobre 2025-2 novembre 2025 : [PyConFR 2025](https://www.pycon.fr/2025/) - Lyon (France) <a href="https://cfp.pycon.fr/pyconfr-2025/cfp"><img alt="CFP PyConFR 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-July-2025&color=green"></a>
- 4-7 novembre 2025 : [NewCrafts 2025](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/ncrafts/"><img alt="CFP NewCrafts 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=red"></a>
- 5-6 novembre 2025 : [Tech Show Paris](https://www.techshowparis.fr/) - Paris (France) 
- 6 novembre 2025 : [dotAI 2025](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=red"></a>
- 7 novembre 2025 : [BDX I/O](https://bdxio.fr) - Bordeaux (France) <a href="https://conference-hall.io/bdx-i-o-2025"><img alt="CFP BDX I/O 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-June-2025&color=green"></a>
- 12-14 novembre 2025 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) <a href="https://dvma25.cfp.dev/"><img alt="CFP Devoxx Morocco 25" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-June-2025&color=green"></a>
- 13 novembre 2025 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse-2025"><img alt="CFP DevFest Toulouse 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=green"></a>
- 15-16 novembre 2025 : [Capitole du Libre](https://capitoledulibre.org/) - Toulouse (France) <a href="https://cfp.capitoledulibre.org/cdl-2025/"><img alt="CFP Capitole du Libre 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2025&color=green"></a>
- 19 novembre 2025 : [SREday Paris 2025 Q4](https://sreday.com/2025-paris-q4/) - Paris (France) <a href="https://www.papercall.io/sreday-paris-2025-q4"><img alt="CFP SREday Paris 2025 Q4" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-September-2025&color=green"></a>
- 20 novembre 2025 : [OVHcloud Summit](https://summit.ovhcloud.com/fr/) - Paris (France) 
- 21 novembre 2025 : [DevFest Paris 2025](https://devfest.gdgparis.fr/) - Paris (France) <a href="https://conference-hall.io/devfest-paris-2025"><img alt="CFP DevFest Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2025&color=red"></a>
- 27 novembre 2025 : [DevFest Strasbourg 2025](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/devfest-strasbourg-2025"><img alt="CFP DevFest Strasbourg 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-July-2025&color=green"></a>
- 28 novembre 2025 : [DevFest Lyon](https://devfest.gdglyon.com/) - Lyon (France) <a href="https://conference-hall.io/devfest-lyon-2025"><img alt="DevFest Lyon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=green"></a>
- 5 décembre 2025 : [DevFest Dijon 2025](https://devfest.developers-group-dijon.fr/) - Dijon (France) <a href="https://conference-hall.io/devfest-dijon-2025"><img alt="CFP Devest Dijon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=green"></a>
- 10-11 décembre 2025 : [Devops REX](https://www.devopsrex.fr/) - Paris (France) <a href="https://talks.devopsdays.org/devops-rex-2025/cfp"><img alt="CFP Devops REX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=green"></a>
- 10-11 décembre 2025 : [Open Source Experience](https://www.opensource-experience.com) - Paris (France) 
- 28-31 janvier 2026 : [SnowCamp 2026](https://snowcamp.io/) - Grenoble (France) 
- 2-6 février 2026 : [Web Days Convention](https://webdays.events/) - Aix-en-Provence (France) <a href="https://conference-hall.io/web-days-convention"><img alt="CFP Web Days Convention" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-February-2026&color=green"></a>
- 3 février 2026 : [Cloud Native Days France 2026](https://www.cloudnativedays.fr/) - Paris (France) 
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 17 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>

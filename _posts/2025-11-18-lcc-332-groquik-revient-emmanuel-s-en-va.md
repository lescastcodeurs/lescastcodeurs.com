---
title: LCC 332 - Groquik revient, Emmanuel s'en va
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 332
youtube: QZSmMH6Dso0
mp3_length: 66507297
tweet: Groquik revient, Emmanuel s'en va #Java #Spring #Quarkus #Infinispan #Gemini #Javelit #développement #IA #modèles #outils #productivité #NTP #JVM #RedHat
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Emmanuel, Katia et Guillaume discutent de Spring 7, Quarkus, d'Infinispan et Keycloak.
On discute aussi de projets sympas comme Javelit, de comment démarre une JVM, du besoin d'argent de NTP.
Et puis on discute du changement de carrière d'Emmanuel.

Enregistré le 14 novembre 2025

Téléchargement de l’épisode [LesCastCodeurs-Episode-332.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-332.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=QZSmMH6Dso0).

## News

Emmanuel quitte Red Hat après 20 ans [https://emmanuelbernard.com/blog/2025/11/13/leaving-redhat/](https://emmanuelbernard.com/blog/2025/11/13/leaving-redhat/)

### Langages

Support HTTP/3 dans le HttpClient de JDK 26 - [https://inside.java/2025/10/22/http3-support/](https://inside.java/2025/10/22/http3-support/)

- JDK 26 introduit le support de HTTP/3 dans l'API HttpClient existante depuis Java 11
- HTTP/3 utilise le protocole QUIC sur UDP au lieu de TCP utilisé par HTTP/2
- Par défaut HttpClient préfère HTTP/2, il faut explicitement configurer HTTP/3 avec Version.HTTP_3
- Le client effectue automatiquement un downgrade vers HTTP/2 puis HTTP/1.1 si le serveur ne supporte pas HTTP/3
- On peut forcer l'utilisation exclusive de HTTP/3 avec l'option H3_DISCOVERY en mode HTTP_3_URI_ONLY
- HttpClient apprend qu'un serveur supporte HTTP/3 via le header alt-svc (RFC 7838) et utilise cette info pour les requêtes suivantes
- La première requête peut utiliser HTTP/2 même avec HTTP/3 préféré, mais la seconde utilisera HTTP/3 si le serveur l'annonce
- L'équipe OpenJDK encourage les tests et retours d'expérience sur les builds early access de JDK 26


### Librairies

Eclispe Jetty et CometD changent leurs stratégie de support [https://webtide.com/end-of-life-changes-to-eclipse-jetty-and-cometd/](https://webtide.com/end-of-life-changes-to-eclipse-jetty-and-cometd/)

- À partir du 1er janvier 2026, Webtide ne publiera plus Jetty 9/10/11 et CometD 5/6/7 sur Maven Central
- Pendant 20 ans, Webtide a financé les projets Jetty et CometD via services et support, publiant gratuitement les mises à jour EOL
- Le comportement des entreprises a changé : beaucoup cherchent juste du gratuit plutôt que du véritable support
- Des sociétés utilisent des versions de plus de 10 ans sans migrer tant que les correctifs CVE sont gratuits
- Cette politique gratuite a involontairement encouragé la complaisance et retardé les migrations vers versions récentes
- MITRE développe des changements au système CVE pour mieux gérer les concepts d’EOL
- Webtide lance un programme de partenariat avec TuxCare et HeroDevs pour distribuer les résolutions CVE des versions EOL
- Les binaires EOL seront désormais distribués uniquement aux clients commerciaux et via le réseau de partenaires
- Webtide continue le support standard open-source : quand Jetty 13 sortira, Jetty 12.1 recevra des mises à jour pendant 6 mois à un an
- Ce changement vise à clarifier la politique EOL avec une terminologie industrielle établie

Améliorations cloud du SDK A2A Java [https://quarkus.io/blog/quarkus-a2a-cloud-enhancements/](https://quarkus.io/blog/quarkus-a2a-cloud-enhancements/)

- Version 0.3.0.Final du SDK A2A Java apporte des améliorations pour les environnements cloud et distribués
- Composants en mémoire remplacés par des implémentations persistantes et répliquées pour environnements multi-instances
- JpaDatabaseTaskStore et JpaDatabasePushNotificationConfigStore permettent la persistance des tâches et configurations en base PostgreSQL
- ReplicatedQueueManager assure la réplication des événements entre instances A2A Agent via Kafka et MicroProfile Reactive Messaging
- Exemple complet de déploiement Kubernetes avec Kind incluant PostgreSQL, Kafka via Strimzi, et load balancing entre pods
- Démonstration pratique montrant que les messages peuvent être traités par différents pods tout en maintenant la cohérence des tâches
- Architecture inspirée du SDK Python A2A, permettant la gestion de tâches asynchrones longues durée en environnement distribué

Quarkus 3.29  sort avec des backends de cache multiples et support du débogueur Qute [https://quarkus.io/blog/quarkus-3-29-released/](https://quarkus.io/blog/quarkus-3-29-released/)

- Possibilité d'utiliser plusieurs backends de cache simultanément dans une même application
- Chaque cache peut être associé à un backend spécifique (par exemple Caffeine et Redis ou Infinispan)
- Support du Debug Adapter Protocol (DAP) pour déboguer les templates Qute directement dans l'IDE
- et dans la version 3.28
- Configuration programmatique de la protection CSRF via une API fluent
- Possibilité de restreindre les filtres OIDC à des flux d'authentification spécifiques avec annotations
- Support des dashboards Grafana personnalisés via fichiers JSON dans META-INF/grafana/
- Extension Liquibase MongoDB supporte désormais plusieurs clients simultanés
- Amélioration significative des performances de build avec réduction des allocations mémoire
- Parallélisation de tâches comme la génération de proxies Hibernate ORM et la construction des Jar

Et l'utilisation des fichiers `.proto` est plus simple dans Quarkus avbec Quarkus gRPC Zero [https://quarkus.io/blog/grpc-zero/](https://quarkus.io/blog/grpc-zero/)

- c'est toujours galere des fichiers .proto car les generateurs demandent des executables natifs
- maintenant ils sont bundlés dans la JVM et vous n'avez rien a configurer
- cela utilise Caffeine pour faire tourner cela en WASM dans la JVM

Spring AI 1.1 est presque là [https://spring.io/blog/2025/11/08/spring-ai-1-1-0-RC1-available-now](https://spring.io/blog/2025/11/08/spring-ai-1-1-0-RC1-available-now)

- support des MCP tool caching pour les callback qui reduit les iooerations redondantes
- Access au contenu de raisonnement OpenAI 
- Un modele de Chat MongoDB
- Support du modele de penser Ollama
- Reessaye sur les echec de reseau
- OpenAI speech to text

Spring gRPC Les prochaines étapes pour la 1.0.0 [https://spring.io/blog/2025/11/05/spring-grpc-next-steps](https://spring.io/blog/2025/11/05/spring-grpc-next-steps)

- Spring gRPC 1.0 arrive prochainement avec support de Spring Boot 4
- L'intégration dans Spring Boot 4.0 est reportée, prévue pour Spring Boot 4.1
- Les coordonnées Maven restent sous org.springframework.grpc pour la version 1.0
- Le jar spring-grpc-test est renommé en spring-grpc-test-spring-boot-autoconfigure
- Les packages d'autoconfiguration changent de nom nécessitant de modifier les imports
- Les dépendances d'autoconfiguration seront immédiatement dépréciées après la release 1.0
- Migration minimale attendue pour les projets utilisant déjà la version 0.x
- La version 1.0.0-RC1 sera publiée dès que possible avant la version finale

Spring arrete le support reactif d'Apache Pulsar [https://spring.io/blog/2025/10/29/spring-pulsar-reactive-discontinued](https://spring.io/blog/2025/10/29/spring-pulsar-reactive-discontinued)

- logique d'évaluer le temps passé vs le nombre d'utilisateurs
- c'est cependant une tendance qu'on a vu s'accélerer

Spring 7 est sorti [https://spring.io/blog/2025/11/13/spring-framework-7-0-general-availability](https://spring.io/blog/2025/11/13/spring-framework-7-0-general-availability)



### Infrastructure

Infinispan 16.0 [https://infinispan.org/blog/2025/11/10/infinispan-16-0](https://infinispan.org/blog/2025/11/10/infinispan-16-0)

- Ajout majeur : **migration en ligne sans interruption** pour les nœuds d’un cluster (rolling upgrades) ([infinispan.org](http://infinispan.org))
- Messages de clustering refaits avec Protocol Buffers + ProtoStream : meilleure compatibilité, schéma évolutif garanti ([infinispan.org](http://infinispan.org))
- Console Web améliorée 
- API dédiée de gestion des schémas (SchemasAdmin) pour gérer les schémas ProtoStream à distance ([infinispan.org](http://infinispan.org))
- Module de requête (query) optimisé :
  - support complet des agrégations (sum, avg …) dans les requêtes indexées en cluster grâce à l’intégration de Hibernate Search 8.1 ([infinispan.org](http://infinispan.org))
- Serveur :
  - image conteneur minimalisée pour réduire la surface d’attaque ([infinispan.org](http://infinispan.org))
  - démarrage plus rapide grâce à séparation du démarrage cache/serveur ([infinispan.org](http://infinispan.org))
  - caches pour connecteurs (Memcached, RESP) créés à la demande (on-demand) et non à l’initiaton automatique ([infinispan.org](http://infinispan.org))
  - moteur Lua 5.1 mis à jour avec corrections de vulnérabilités et opérations dangereuses désactivées ([infinispan.org](http://infinispan.org))
- Support JDK :
  - version minimale toujours JDK 17 ([infinispan.org](http://infinispan.org))
  - prise en charge des threads virtuels (virtual threads) et des fonctionnalités AOT (Ahead-of-Time) de JDK plus récentes ([infinispan.org](http://infinispan.org))



### Web

Javelit, une nouvelle librairie Java inspirée de Streamlit pour faire facilement et rapidement des petites interfaces web
[https://glaforge.dev/posts/2025/10/24/javelit-to-create-quick-interactive-app-frontends-in-java/](https://glaforge.dev/posts/2025/10/24/javelit-to-create-quick-interactive-app-frontends-in-java/)

- Site web du projet : [https://javelit.io/](https://javelit.io/)
- **Javelit** : outil pour créer rapidement des applications de données (mais pas que) en Java.
- Simplifie le développement : élimine les tracas du frontend et de la gestion des événements.
- Transforme une classe Java en application web en quelques minutes.
- Inspiré par la simplicité de **Streamlit** de l’écosystème Python (ou Gradio et Mesop), mais pour Java.
- Développement axé sur la logique : pas de code standard répétitif (boilerplate), **rechargement à chaud**.
- Interactions faciles : les widgets retournent directement leur valeur, sans besoin de HTML/CSS/JS ou gestion d’événements.
- Déploiement flexible : applications autonomes ou intégrables dans des frameworks Java (Spring, Quarkus, etc.).
- L’article de Guillaume montre comment créer une petite interface pour créer et modifier des images avec le modèle génératif Nano Banana
- Un deuxième article montre comment utiliser Javelit pour créer une interface de chat avec LangChain4j [https://glaforge.dev/posts/2025/10/25/creating-a-javelit-chat-interface-for-langchain4j/](https://glaforge.dev/posts/2025/10/25/creating-a-javelit-chat-interface-for-langchain4j/)

Améliorer l'accessibilité avec les applis JetPack Compose [https://blog.ippon.fr/2025/10/29/rendre-son-application-accessible-avec-jetpack-compose/](https://blog.ippon.fr/2025/10/29/rendre-son-application-accessible-avec-jetpack-compose/)

- TalkBack est le lecteur d'écran Android qui vocalise les éléments sélectionnés pour les personnes malvoyantes
- Accessibility Scanner et les outils Android Studio détectent automatiquement les problèmes d'accessibilité statiques
- Les images fonctionnelles doivent avoir un contentDescription, les images décoratives contentDescription null
- Le contraste minimum requis est de 4.5:1 pour le texte normal et 3:1 pour le texte large ou les icônes
- Les zones cliquables doivent mesurer au minimum 48dp x 48dp pour faciliter l'interaction
- Les formulaires nécessitent des labels visibles permanents et non de simples placeholders qui disparaissent
- Modifier.semantics permet de définir l'arbre sémantique lu par les lecteurs d'écran
- Les propriétés mergeDescendants et traversalIndex contrôlent l'ordre et le regroupement de la lecture

Diriger le navigateur Chrome avec le modèle Gemini Computer Use
[https://glaforge.dev/posts/2025/11/03/driving-a-web-browser-with-gemini-computer-use-model-in-java/](https://glaforge.dev/posts/2025/11/03/driving-a-web-browser-with-gemini-computer-use-model-in-java/)

- **Objectif** : Automatiser la navigation web en Java avec le modèle “Computer Use” de Gemini 2.5 Pro.
- **Modèle “Computer Use”** : Gemini analyse des captures d’écran et génère des actions d’interface (clic, saisie, etc.).
- **Outils** : Gemini API, Java, Playwright (pour l’interaction navigateur).
- **Fonctionnement** : Boucle agent où Gemini reçoit une capture, propose une action, Playwright l’exécute, puis une nouvelle capture est envoyée à Gemini.
- **Implémentation clé** : Toujours envoyer une capture d’écran à Gemini après chaque action pour qu’il comprenne l’état actuel.
- **Défis** : Lenteur, gestion des CAPTCHA et pop-ups (gérables).
- **Potentiel** : Automatisation des tâches web répétitives, création d’agents autonomes.


### Data et Intelligence Artificielle

Apicurio ajoute le support de nouveaux schema sans reconstruire Apicurio [https://www.apicur.io/blog/2025/10/27/custom-artifact-types](https://www.apicur.io/blog/2025/10/27/custom-artifact-types)

- Apicurio Registry 3.1.0 permet d'ajouter des types d'artefacts personnalisés au moment du déploiement sans recompiler le projet
- Supporte nativement OpenAPI, AsyncAPI, Avro, JSON Schema, Protobuf, GraphQL, WSDL et XSD
- Trois approches d'implémentation disponibles : classes Java pour la performance maximale, JavaScript/TypeScript pour la facilité de développement, ou webhooks pour une flexibilité totale
- Configuration via un simple fichier JSON pointant vers les implémentations des composants personnalisés
- Les scripts JavaScript sont exécutés via QuickJS dans un environnement sandboxé sécurisé
- Un package npm TypeScript fournit l'autocomplétion et la sécurité de type pour le développement
- Six composants optionnels configurables : détection automatique de type, validation, vérification de compatibilité, canonicalisation, déréférencement et recherche de références
- Cas d'usage typiques : formats propriétaires internes, support RAML, formats legacy comme WADL, schémas spécifiques à un domaine métier
- Déploiement simple via Docker en montant les fichiers de configuration et scripts comme volumes
- Les performances varient selon l'approche : Java offre les meilleures performances, JavaScript un bon équilibre, webhooks la flexibilité maximale
- Le truc interessant c'est que c'est Quarkus based et donc demandait le rebuilt
- donc pour eviter cela, ils ont ajouter QuickJS via Chicorey un moteur WebAssembly

GPT 5.1 pour les développeurs est sorti. [https://openai.com/index/gpt-5-1-for-developers/](https://openai.com/index/gpt-5-1-for-developers/)

- C'est le meilleur puisque c'est le dernier :slightly_smiling_face: 
- **Raisonnement Adaptatif et Efficace :** GPT-5.1 ajuste dynamiquement son temps de réflexion en fonction de la complexité de la tâche, le rendant nettement plus rapide et plus économique en jetons pour les tâches simples, tout en maintenant des performances de pointe sur les tâches difficiles.
- **Nouveau Mode « Sans Raisonnement » :** Un mode (`reasoning_effort='none'`) a été introduit pour les cas d'utilisation sensibles à la latence, permettant une réponse plus rapide avec une intelligence élevée et une meilleure exécution des outils.
- **Cache de Prompt Étendu :** La mise en cache des invites est étendue jusqu'à **24 heures** (contre quelques minutes auparavant), ce qui réduit la latence et le coût pour les interactions de longue durée (chats multi-tours, sessions de codage). Les jetons mis en cache sont 90 % moins chers.
- **Améliorations en Codage :** Le modèle offre une meilleure personnalité de codage, une qualité de code améliorée et de meilleures performances sur les tâches d'agenticité de code, atteignant 76,3 % sur SWE-bench Verified.
- **Nouveaux Outils pour les Développeurs :** Deux nouveaux outils sont introduits ( [https://cookbook.openai.com/examples/build_a_coding_agent_with_gpt-5.1](https://cookbook.openai.com/examples/build_a_coding_agent_with_gpt-5.1) ) :
  - L'outil `apply_patch` pour des modifications de code plus fiables via des _diffs_ structurés.
  - L'outil `shell` qui permet au modèle de proposer et d'exécuter des commandes shell sur une machine locale, facilitant les boucles d'inspection et d'exécution.
- **Disponibilité :** GPT-5.1 (ainsi que les modèles `gpt-5.1-codex`) est disponible pour les développeurs sur toutes les plateformes API payantes, avec les mêmes tarifs et limites de débit que GPT-5.

Comparaison de similarité d’articles et de documents avec les embedding models
[https://glaforge.dev/posts/2025/11/12/finding-related-articles-with-vector-embedding-models/](https://glaforge.dev/posts/2025/11/12/finding-related-articles-with-vector-embedding-models/)

- **Principe :** Convertir les articles en vecteurs numériques ; la similarité sémantique est mesurée par la proximité de ces vecteurs.
- **Démarche :**
  - Résumé des articles via Gemini-2.5-flash.
  - Conversion des résumés en vecteurs (embeddings) par Gemini-embedding-001.
  - Calcul de la similarité entre vecteurs par similarité cosinus.
  - Affichage des 3 articles les plus pertinents (>0.75) dans le frontmatter Hugo.
- **Bilan :** Approche “résumé et embedding” efficace, pragmatique et améliorant l’engagement des lecteurs.


### Outillage

Composer : Nouveau modèle d'agent rapide pour l'ingénierie logicielle - [https://cursor.com/blog/composer](https://cursor.com/blog/composer)

- Composer est un modèle d'agent conçu pour l'ingénierie logicielle qui génère du code quatre fois plus rapidement que les modèles similaires
- Le modèle est entraîné sur de vrais défis d'ingénierie logicielle dans de grandes bases de code avec accès à des outils de recherche et d'édition
- Il s'agit d'un modèle de type mixture-of-experts optimisé pour des réponses interactives et rapides afin de maintenir le flux de développement
- L'entraînement utilise l'apprentissage par renforcement dans divers environnements de développement avec des outils comme la lecture de fichiers, l'édition, les commandes terminal et la recherche sémantique
- Cursor Bench est un benchmark d'évaluation basé sur de vraies demandes d'ingénieurs qui mesure la correction et le respect des abstractions du code existant
- Le modèle apprend automatiquement des comportements utiles comme effectuer des recherches complexes, corriger les erreurs de linter et écrire des tests unitaires
- L'infrastructure d'entraînement utilise PyTorch et Ray avec des kernels MXFP8 pour entraîner sur des milliers de GPUs NVIDIA
- Le système exécute des centaines de milliers d'environnements de codage sandboxés concurrents dans le cloud pour l'entraînement
- Composer est déjà utilisé quotidiennement par les développeurs de Cursor pour leur propre travail
- Le modèle se positionne juste derrière GPT-5 et Sonnet 4.5 en termes de performance sur les benchmarks internes

Rex sur l'utilisation de l'IA pour les développeurs, un gain de productivité réel et des contextes adaptés [https://mcorbin.fr/posts/2025-10-17-genai-dev/](https://mcorbin.fr/posts/2025-10-17-genai-dev/)

- Un développeur avec 18 ans d'expérience partage son retour sur l'IA générative après avoir changé d'avis
- Utilise exclusivement Claude Code dans le terminal pour coder en langage naturel
- Le "vibe coding" permet de générer des scripts et interfaces sans regarder le code généré
- Génération rapide de scripts Python pour traiter des CSV, JSON ou créer des interfaces HTML
- Le mode chirurgien résout des bugs complexes en one-shot, exemple avec un plugin Grafana fixé en une minute
- Pour le code de production, l'IA génère les couches repository, service et API de manière itérative, mais le dev controle le modele de données
- Le développeur relit toujours le code et ajuste manuellement ou via l'IA selon le besoin
- L'IA ne remplacera pas les développeurs car la réflexion, conception et expertise technique restent essentielles
- La construction de produits robustes, scalables et maintenables nécessite une expérience humaine
- L'IA libère du temps sur les tâches répétitives et permet de se concentrer sur les aspects complexes
- ce que je trouve interessant c'est la partie sur le code de prod
- effectivement, je corrige aussi beaucoup les propositions de l'IA en lui demandant de faire mieux dans tel ou tel domaine
- Sans guide, tout cela serait perdu
- Affaire a suivre
- un article en parallele sur le métier de designer [https://blog.ippon.fr/2025/11/03/lia-ne-remplace-pas-un-designer-elle-amplifie-la-difference-entre-faire-et-bien-faire/](https://blog.ippon.fr/2025/11/03/lia-ne-remplace-pas-un-designer-elle-amplifie-la-difference-entre-faire-et-bien-faire/)

Plus besoin de se rappeler les racourcis dans IntelliJ idea avec l'universal entry point [https://blog.jetbrains.com/idea/2025/11/universal-entry-point-a-single-entry-point-for-context-aware-coding-assistance/](https://blog.jetbrains.com/idea/2025/11/universal-entry-point-a-single-entry-point-for-context-aware-coding-assistance/)

- IntelliJ IDEA introduit Command Completion, une nouvelle façon d'accéder aux actions de l'IDE directement depuis l'éditeur
- Fonctionne comme la complétion de code : tapez point (.) pour voir les actions contextuelles disponibles
- Tapez double point (..) pour filtrer et n'afficher que les actions disponibles
- Propose des corrections, refactorings, génération de code et navigation selon le contexte
- Complète les fonctionnalités existantes sans les remplacer : raccourcis, Alt+Enter, Search Everywhere
- Facilite la découverte des fonctionnalités de l'IDE sans interrompre le flux de développement
- En Beta dans la version 2025.2, sera activé par défaut dans 2025.3
- Support actuel pour Java et Kotlin, avec actions spécifiques aux frameworks comme Spring et Hibernate

Homebrew, package manage pour macOS et Linux passe en version 5 [https://brew.sh/2025/11/12/homebrew-5.0.0/](https://brew.sh/2025/11/12/homebrew-5.0.0/)

- **Téléchargements Parallèles par Défaut :** Le paramètre `HOMEBREW_DOWNLOAD_CONCURRENCY=auto` est activé par défaut, permettant des téléchargements concurrents pour tous les utilisateurs, avec un rapport de progression.
- **Support Linux ARM64/AArch64 en Tier 1 :** Le support pour Linux ARM64/AArch64 a été promu au niveau "Tier 1" (support officiel de premier plan).
- **Feuille de Route pour les Dépréciations macOS :**
  - **Septembre 2026 (ou plus tard) :** Homebrew ne fonctionnera plus sur macOS Catalina (10.15) et versions antérieures. macOS Intel (x86_64) passera en "Tier 3" (fin du support CI et des binaires précompilés/bottles).
  - **Septembre 2027 (ou plus tard) :** Homebrew ne fonctionnera plus sur macOS Big Sur (11) sur Apple Silicon ni du tout sur Intel (x86_64).
- **Sécurité et Casks :**
  - Dépréciation des Casks sans signature de code.
  - Désactivation des Casks échouant aux vérifications Gatekeeper en septembre 2026.
  - Les options `--no-quarantine` et `--quarantine` sont dépréciés pour ne plus faciliter le contournement des fonctionnalités de sécurité de macOS.
- **Nouvelles Fonctionnalités &amp; Améliorations :**
  - Support officiel pour **macOS 26 (Tahoe)**.
  - `brew bundle` supporte désormais l'installation de packages **Go** via un `Brewfile`.
  - Ajout de la commande `brew info --sizes` pour afficher la taille des _formulae_ et _casks_.
  - La commande `brew search --alpine` permet de chercher des packages Alpine Linux.


### Architecture

Selon l’analyste RedMonk, Java reste très pertinent dans l’aire de l’IA et des agents
[https://redmonk.com/jgovernor/java-relevance-in-the-ai-era-agent-frameworks-emerge/](https://redmonk.com/jgovernor/java-relevance-in-the-ai-era-agent-frameworks-emerge/)

- Java reste pertinent à l’ère de l’IA, pas besoin d’apprendre une pile technique entièrement nouvelle.
- Capacité d’adaptation de Java (“anticorps”) aux innovations (Big Data, cloud, IA), le rendant idéal pour les contextes d’entreprise.
- L’écosystème JVM offre des avantages sur Python pour la logique métier et les applications sophistiquées, notamment en termes de sécurité et d’évolutivité.
- **Embabel** (par Rod Johnson, créateur de Spring) : un framework d’agents fortement typé pour JVM, visant le déterminisme des projets avant la génération de code par LLM.
- **LangChain4J** : facilite l’accès aux capacités d’IA pour les développeurs Java, s’aligne sur les modèles d’entreprise établis et permet aux LLM d’appeler des méthodes Java.
- **Koog** (Jetbrains) : framework d’agents basé sur Kotlin, typé et spécifique aux développeurs JVM/Kotlin.
- **Akka** : a pivoté pour se concentrer sur les flux de travail d’agents IA, abordant la complexité, la confiance et les coûts des agents dans les systèmes distribués.
- Le Model Context Protocol (MCP) est jugé insuffisant, manquant d’explicabilité, de découvrabilité, de capacité à mélanger les modèles, de garde-fous, de gestion de flux, de composabilité et d’intégration sécurisée.
- Les développeurs Java sont bien placés pour construire des applications compatibles IA et intégrer des agents.
- Des acteurs majeurs comme IBM, Red Hat et Oracle continuent d’investir massivement dans Java et son intégration avec l’IA.



### Sécurité

AI Deepfake, Hiring ... A danger réel [https://www.eu-startups.com/2025/10/european-startups-get-serious-about-deepfakes-as-ai-fraud-losses-surpass-e1-3-billion/](https://www.eu-startups.com/2025/10/european-startups-get-serious-about-deepfakes-as-ai-fraud-losses-surpass-e1-3-billion/)

- Pertes liées aux deepfakes en Europe : **> 1,3 milliard €** (860 M € rien qu’en 2025).
- Création de deepfakes désormais possible pour **quelques euros**.
- Fraudes : faux entretiens vidéo, usurpations d’identité, arnaques diverses.
- Startups actives : **Acoru, IdentifAI, Trustfull, Innerworks, Keyless** (détection et prévention).
- Réglementation : **AI Act** et **Digital Services Act** imposent transparence et contrôle.
- Recommandations : vérifier identités, former employés, adopter authentification multi-facteurs.
- En lien :
- [https://www.techmonitor.ai/technology/cybersecurity/remote-hiring-cybersecurity](https://www.techmonitor.ai/technology/cybersecurity/remote-hiring-cybersecurity)
- 1 Candidat sur 4 sera Fake en 2028 selon Gartner research [https://www.gartner.com/en/newsroom/press-releases/2025-07-31-gartner-survey-shows-j[…]-percent-of-job-applicants-trust-ai-will-fairly-evaluate-them](https://www.gartner.com/en/newsroom/press-releases/2025-07-31-gartner-survey-shows-just-26-percent-of-job-applicants-trust-ai-will-fairly-evaluate-them)


### Loi, société et organisation

Amazon - prévoit supprimer 30.000 postes [https://www.20minutes.fr/economie/4181936-20251028-amazon-prevoit-supprimer-30-000-emplois-bureau-selon-plusieurs-medias](https://www.20minutes.fr/economie/4181936-20251028-amazon-prevoit-supprimer-30-000-emplois-bureau-selon-plusieurs-medias)

- **Postes supprimés** : 30 000 bureaux
- **Part des effectifs** : ~10 % des employés corporatifs
- **Tranche confirmée** : 14 000 postes
- **Divisions touchées** : RH, Opérations, Devices &amp; Services, Cloud
- **Motifs** : sur-recrutement, bureaucratie, automatisation/IA
- **Accompagnement** : 90 jours pour poste interne + aides
- **Non concernés** : entrepôts/logistique
- **Objectif** : concentrer sur priorités stratégiques

NTP a besoin d'argent [https://www.ntp.org/](https://www.ntp.org/)

- Il n'est que le protocole qui synchronise toutes les machines du monde
- La fondation [https://www.nwtime.org/](https://www.nwtime.org/) recherche 11000$ pour maintenir son activité



## Rubrique débutant

Une plongée approfondie dans le démarrage de la JVM [https://inside.java/2025/01/28/jvm-start-up](https://inside.java/2025/01/28/jvm-start-up)

- La JVM effectue une initialisation complexe avant d'exécuter le code : validation des arguments, détection des ressources système et sélection du garbage collector approprié
- Le chargement de classes suit une stratégie lazy où chaque classe charge d'abord ses dépendances dans l'ordre de déclaration, créant une chaîne d'environ 450 classes même pour un simple Hello World
- La liaison de classes comprend trois sous-processus : vérification de la structure, préparation avec initialisation des champs statiques à leurs valeurs par défaut, et résolution des références symboliques du Constant Pool
- Le CDS améliore les performances au démarrage en fournissant des classes pré-vérifiées, réduisant le travail de la JVM
- L'initialisation de classe exécute les initialiseurs statiques via la méthode spéciale clinit générée automatiquement par javac
- Le Project Leyden introduit la compilation AOT dans JDK 24 pour réduire le temps de démarrage en effectuant le chargement et la liaison de classes en avance de phase
- Pas si débutant finalement



## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 12-14 novembre 2025 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) <a href="https://dvma25.cfp.dev/"><img alt="CFP Devoxx Morocco 25" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-June-2025&color=red"></a>
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
- 9-11 décembre 2025 : [APIdays Paris](https://www.apidays.global/paris/) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP API Days Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-November-2025&color=red"></a>
- 9-11 décembre 2025 : [Green IO Paris](https://greenio.tech/conference/17/paris-2025-december) - Paris (France) <a href="https://apidays.typeform.com/to/SMHd2wFE?=green-io-conference%3Dcall-for-speakers&typeform-source=greenio.tech"><img alt="CFP Green IO Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-December-2025&color=green"></a>
- 10-11 décembre 2025 : [Devops REX](https://www.devopsrex.fr/) - Paris (France) <a href="https://talks.devopsdays.org/devops-rex-2025/cfp"><img alt="CFP Devops REX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=red"></a>
- 10-11 décembre 2025 : [Open Source Experience](https://www.opensource-experience.com) - Paris (France) 
- 11 décembre 2025 : [Normandie.ai 2025](https://normandie.ai/) - Rouen (France) <a href="https://conference-hall.io/normandie-ai-2025"><img alt="CFP Normandie.ai 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-October-2025&color=red"></a>
- 14-17 janvier 2026 : [SnowCamp 2026](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/snowcamp-2026"><img alt="CFP SnowCamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2025&color=red"></a>
- 22 janvier 2026 : [DevCon #26 : sécurité / post-quantique / hacking](https://www.programmez.com/page-devcons) - Paris (France) <a href="https://docs.google.com/forms/d/e/1FAIpQLScAkKRuLpmUYUyxBP7uVCpWLxShOUxvDD7rKbAiz_4njAyMRQ/viewform?usp=header"><img alt="CFP DevCon #26 : sécurité / post-quantique / hacking" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-December-2025&color=green"></a>
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
- 27-29 mars 2026 : [Shift](https://shift-hackathon.com/) - Nantes (France) 
- 31 mars 2026 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-7/"><img alt="CFP ParisTestConf 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-October-2025&color=red"></a>
- 16-17 avril 2026 : [MiXiT 2026](https://mixitconf.org) - Lyon (France) <a href="https://sessionize.com/mixit-2026/"><img alt="CFP MiXiT" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-Jan-2026&color=green"></a>
- 22-24 avril 2026 : [Devoxx France 2026](https://www.devoxx.fr) - Paris (France) 
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 6-7 mai 2026 : [Devoxx UK 2026](https://www.devoxx.co.uk/) - London (UK) 
- 22 mai 2026 : [AFUP Day 2026 Lille](https://event.afup.org/afup-day-2026/) - Lille (France) <a href="https://afup.org/event/afupday2026lille/cfp"><img alt="CFP AFUP Day Lille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Paris](https://event.afup.org/afup-day-2026/) - Paris (France) <a href="https://afup.org/event/afupday2026paris/cfp"><img alt="CFP AFUP Day Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Bordeaux](https://event.afup.org/afup-day-2026/) - Bordeaux (France) <a href="https://afup.org/event/afupday2026bordeaux/cfp"><img alt="CFP AFUP Day Bordeaux 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 22 mai 2026 : [AFUP Day 2026 Lyon](https://event.afup.org/afup-day-2026/) - Lyon (France) <a href="https://afup.org/event/afupday2026lyon/cfp"><img alt="CFP AFUP Day Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-November-2025&color=red"></a>
- 17 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 
- 11-12 juillet 2026 : [DevLille 2026](https://devlille.fr/) - Lille (France) <a href="https://conference-hall.io/devlille-2026"><img alt="CFP DevLille 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2026&color=green"></a>
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

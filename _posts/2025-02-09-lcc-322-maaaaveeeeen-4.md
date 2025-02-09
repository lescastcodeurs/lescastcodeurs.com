---
title: LCC 322 - Maaaaveeeeen 4 !
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 322
youtube: https://www.youtube.com/watch?v=9zdBaC8ZaKU
mp3_length: 55771090
tweet: Maaaaveeeeen 4 ! #jvm #jdbc #fetchsize #mcp #promptengineering #deepseek #maven4 #mavenrepo #iceberg
# tweet size: 91-93 -> 99-101 #######################################################################
---
Arnaud et Emmanuel discutent des nouvelles de ce mois.
On y parle intégrité de JVM, fetch size de JDBC, MCP, de prompt engineering, de DeepSeek bien sûr mais aussi de Maven 4 et des proxy de répository Maven. Et d'autres choses encore, bonne lecture.

Enregistré le 7 février 2025

Téléchargement de l’épisode [LesCastCodeurs-Episode-322.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-322.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/@lescastcodeurs).

## News


### Langages

Les evolutions de la JVM pour augmenter l'intégrité [https://inside.java/2025/01/03/evolving-default-integrity/](https://inside.java/2025/01/03/evolving-default-integrity/)

- un article sur les raisons pour lesquelles les editeurs de frameworks et les utilisateurs s'arrachent les cheveux et vont continuer
- garantir l'integrite du code et des données en enlevant des APIs existantes historiquemnt
- agents dynamiques, setAccessible, Unsafe, JNI
- Article expliques les risques percus par les mainteneurs de la JVM
- Franchement c'est un peu leg sur les causes l'article, auto propagande

JavaScript Temporal, enfin une API propre et moderne pour gérer les dates en JS
[https://developer.mozilla.org/en-US/blog/javascript-temporal-is-coming/](https://developer.mozilla.org/en-US/blog/javascript-temporal-is-coming/)

- JavaScript Temporal est un nouvel objet conçu pour remplacer l’objet Date, qui présente des défauts.
- Il résout des problèmes tels que le manque de prise en charge des fuseaux horaires et la mutabilité.
- Temporal introduit des concepts tels que les instants, les heures civiles et les durées.
- Il fournit des classes pour gérer diverses représentations de date/heure, y compris celles qui tiennent compte du fuseau horaire et celles qui n’en tiennent pas compte.
- Temporal simplifie l’utilisation de différents calendriers (par exemple, chinois, hébreu).
- Il comprend des méthodes pour les comparaisons, les conversions et le formatage des dates et des heures.
- La prise en charge par les navigateurs est expérimentale, Firefox Nightly ayant l’implémentation la plus aboutie.
- Un polyfill est disponible pour essayer Temporal dans n’importe quel navigateur.


### Librairies

Un article sur les fetch size du JDBC et les impacts sur vos applications [https://in.relation.to/2025/01/24/jdbc-fetch-size/](https://in.relation.to/2025/01/24/jdbc-fetch-size/)

- qui connait la valeur fetch size par default de son driver?
- en fonction de vos use cases, ca peut etre devastateur
- exemple d'une appli qui retourne 12 lignes et un fetch size de oracle a 10, 2 a/r pour rien
- et si c'est 50 lignres retournées
- la base de donnée est le facteur limitant, pas Java
- donc monter sont fetch size est avantageux, on utilise la memoire de Java pour eviter la latence

Quarkus annouce les MCP servers project pour collecter les servier MCP en Java [https://quarkus.io/blog/introducing-mcp-servers/](https://quarkus.io/blog/introducing-mcp-servers/)

- MCP d'Anthropic
- introspecteur de bases JDBC
- lecteur de filke system
- Dessine en Java FX
- demarrables facilement avec jbang
- et testes avec claude desktop, goose et mcp-cli
- permet d'utliser le pouvoir des librarires Java de votre IA
- d'ailleurs Spring a la version 0.6 de leur support MCP [https://spring.io/blog/2025/01/23/spring-ai-mcp-0](https://spring.io/blog/2025/01/23/spring-ai-mcp-0)


### Infrastructure

Apache Flink sur Kibernetes [https://www.decodable.co/blog/get-running-with-apache-flink-on-kubernetes-2](https://www.decodable.co/blog/get-running-with-apache-flink-on-kubernetes-2)

- un article tres complet ejn deux parties sur l'installation de Flink sur Kubernetes
- installation, setup
- mais aussi le checkpointing, la HA, l'observablité




### Data et Intelligence Artificielle

10 techniques de prompt engineering
[https://medium.com/google-cloud/10-prompt-engineering-techniques-every-beginner-should-know-bf6c195916c7](https://medium.com/google-cloud/10-prompt-engineering-techniques-every-beginner-should-know-bf6c195916c7)

- Si vous voulez aller plus loin, l’article référence un très bon livre blanc sur le prompt engineering [https://www.kaggle.com/whitepaper-prompt-engineering](https://www.kaggle.com/whitepaper-prompt-engineering)
- Les techniques évoquées :
  1. Zero-Shot Prompting:
    - On demande directement à l’IA de répondre à une question sans lui fournir d’exemple préalable. C’est comme si on posait une question à une personne sans lui donner de contexte.
  2. Few-Shot Prompting:
    - On donne à l’IA un ou plusieurs exemples de la tâche qu’on souhaite qu’elle accomplisse. C’est comme montrer à quelqu’un comment faire quelque chose avant de lui demander de le faire.
  3. System Prompting:
    - On définit le contexte général et le but de la tâche pour l’IA. C’est comme donner à l’IA des instructions générales sur ce qu’elle doit faire.
  4. Role Prompting:
    - On attribue un rôle spécifique à l’IA (enseignant, journaliste, etc.). C’est comme demander à quelqu’un de jouer un rôle spécifique.
  5. Contextual Prompting:
    - On fournit des informations supplémentaires ou un contexte pour la tâche. C’est comme donner à quelqu’un toutes les informations nécessaires pour répondre à une question.
  6. Step-Back Prompting:
    - On pose d’abord une question générale, puis on utilise la réponse pour poser une question plus spécifique. C’est comme poser une question ouverte avant de poser une question plus fermée.
  7. Chain-of-Thought Prompting:
    - On demande à l’IA de montrer étape par étape comment elle arrive à sa conclusion. C’est comme demander à quelqu’un d’expliquer son raisonnement.
  8. Self-Consistency Prompting:
    - On pose plusieurs fois la même question à l’IA et on compare les réponses pour trouver la plus cohérente. C’est comme vérifier une réponse en la posant sous différentes formes.
  9. Tree-of-Thoughts Prompting:
    - On permet à l’IA d’explorer plusieurs chemins de raisonnement en même temps. C’est comme considérer toutes les options possibles avant de prendre une décision.
  10. ReAct Prompting:
    - On permet à l’IA d’interagir avec des outils externes pour résoudre des problèmes complexes. C’est comme donner à quelqu’un les outils nécessaires pour résoudre un problème.

Les patterns GenAI the thoughtworks [https://martinfowler.com/articles/gen-ai-patterns/](https://martinfowler.com/articles/gen-ai-patterns/)

- tres introductif et pre RAG
- le direct prompt qui est un appel direct au LLM: limitations de connaissance et de controle de l'experience
- eval: evaluer la sortie d'un LLM avec plusieurs techniques mais fondamentalement une fonction qui prend la demande, la reponse et donc un score numerique
- evaluation via un LLM (le meme ou un autre), ou evaluation humaine
- tourner les evaluations a partir de la chaine de build amis aussi en live vu que les LLMs puvent evoluer.
- Decrit les embedding notament d'image amis aussi de texte avec la notion de contexte

DeepSeek et la fin de la domination de NVidia [https://youtubetranscriptoptimizer.com/blog/05_the_short_case_for_nvda](https://youtubetranscriptoptimizer.com/blog/05_the_short_case_for_nvda)

- un article sur les raisons pour lesquelles NVIDIA va se faire cahllengert sur ses marges
- 90% de marge quand meme parce que les plus gros GPU et CUDA qui est proprio
- mais des approches ardware alternatives existent qui sont plus efficientes (TPU et gros waffle)
- Google, MS et d’autres construisent leurs GPU alternatifs
- CUDA devient de moins en moins le linga franca avec l’investissement sur des langages intermediares alternatifs par Apple, Google OpenAI etc
- L’article parle de DeepSkeek qui est venu mettre une baffe dans le monde des LLMs
- Ils ont construit un competiteur a gpt4o et o1 avec 5M de dollars et des capacites de raisonnements impressionnant
- la cles c’etait beaucoup de trick d’optimisation mais le plus gros est d’avoir des poids de neurores sur 8 bits vs 32 pour les autres. 
- et donc de quatizer au fil de l’eau et au moment de l’entrainement
- beaucoup de reinforcemnt learning innovatifs aussi
- et des Mixture of Expert
- donc ~50x moins chers que OpenAI
- Donc plus besoin de GPU qui on des tonnes de vRAM
- ah et DeepSeek est open source
- un article de semianalytics change un peu le narratif
- le papier de DeepSkeek en dit long via ses omissions
- par ensemple les 6M c'est juste l'inference en GPU, pas les couts de recherches et divers trials et erreurs
- en comparaison Claude Sonnet a coute 10M en infererence
- DeepSeek a beaucoup de CPU pre ban et ceratins post bans evalués a 5 Milliards en investissement.
- leurs avancées et leur ouverture reste extremement interessante

Une intro à Apache Iceberg [http://blog.ippon.fr/2025/01/17/la-revolution-des-donnees-lavenement-des-lakehouses-avec-apache-iceberg/](http://blog.ippon.fr/2025/01/17/la-revolution-des-donnees-lavenement-des-lakehouses-avec-apache-iceberg/)

- issue des limites du data lake. non structuré et des Data Warehouses aux limites en diversite de données et de volume
- entrent les lakehouse
- Et particulierement Apache Iceberg issue de Netflix
- gestion de schema mais flexible
- notion de copy en write vs merge on read en fonction de besoins
- garantie atomicite, coherence, isoliation et durabilite
- notion de time travel et rollback
- partitions cachées (qui abstraient la partition et ses transfos) et evolution de partitions
- compatbile avec les moteurs de calcul comme spark, trino, flink etc
- explique la structure des metadonnées et des données

Guillaume s’amuse à générer des histoires courtes de Science-Fiction en programmant des Agents IA avec LangChain4j et aussi avec des workflows
[https://glaforge.dev/posts/2025/01/27/an-ai-agent-to-generate-short-scifi-stories/](https://glaforge.dev/posts/2025/01/27/an-ai-agent-to-generate-short-scifi-stories/)
[https://glaforge.dev/posts/2025/01/31/a-genai-agent-with-a-real-workflow/](https://glaforge.dev/posts/2025/01/31/a-genai-agent-with-a-real-workflow/)

- Création d’un générateur automatisé de nouvelles de science-fiction à l’aide de Gemini et Imagen en Java, LangChain4j, sur Google Cloud.
- Le système génère chaque nuit des histoires, complétées par des illustrations créées par le modèle Imagen 3, et les publie sur un site Web.
- Une étape d’auto-réflexion utilise Gemini pour sélectionner la meilleure image pour chaque chapitre.
- L’agent utilise un workflow explicite, drivé par le code Java, où les étapes sont prédéfinies dans le code, plutôt que de s’appuyer sur une planification basée sur LLM.
- Le code est disponible sur GitHub et l’application est déployée sur Google Cloud.
- L’article oppose les agents de workflow explicites aux agents autonomes, en soulignant les compromis de chaque approche. Car parfois, les Agent IA autonomes qui gèrent leur propre planning hallucinent un peu trop et n’établissent pas un plan correctement, ou ne le suive pas comme il faut, voire hallucine des “function call”.
- Le projet utilise Cloud Build, le Cloud Run jobs, Cloud Scheduler, Firestore comme base de données, et Firebase pour le déploiement et l’automatisation du frontend.
- Dans le deuxième article, L’approche est différente, Guillaume utilise un outil de Workflow, plutôt que de diriger le planning avec du code Java.
- L’approche impérative utilise du code Java explicite pour orchestrer le workflow, offrant ainsi un contrôle et une parallélisation précis.
- L’approche déclarative utilise un fichier YAML pour définir le workflow, en spécifiant les étapes, les entrées, les sorties et l’ordre d’exécution.
- Le workflow comprend les étapes permettant de générer une histoire avec Gemini 2, de créer une invite d’image, de générer des images avec Imagen 3 et d’enregistrer le résultat dans Cloud Firestore (base de donnée NoSQL).
- Les principaux avantages de l’approche impérative sont un contrôle précis, une parallélisation explicite et des outils de programmation familiers.
- - Les principaux avantages de l’approche déclarative sont des définitions de workflow peut-être plus faciles à comprendre (même si c’est un YAML, berk !) la visualisation, l’évolutivité et une maintenance simplifiée (on peut juste changer le YAML dans la console, comme au bon vieux temps du PHP en prod).
- Les inconvénients de l’approche impérative incluent le besoin de connaissances en programmation, les défis potentiels en matière de maintenance et la gestion des conteneurs.
- Les inconvénients de l’approche déclarative incluent une création YAML pénible, un contrôle de parallélisation limité, l’absence d’émulateur local et un débogage moins intuitif.
- Le choix entre les approches dépend des exigences du projet, la déclarative étant adaptée aux workflows plus simples.
- L’article conclut que la planification déclarative peut aider les agents IA à rester concentrés et prévisibles.


### Outillage

Vulnérabilité des proxy Maven
[https://github.blog/security/vulnerability-research/attacks-on-maven-proxy-repositories/](https://github.blog/security/vulnerability-research/attacks-on-maven-proxy-repositories/)

- Quelque soit le langage, la techno, il est hautement conseillé de mettre en place des gestionnaires de repositories en tant que proxy pour mieux contrôler les dépendances qui contribuent à la création de vos produits
- Michael Stepankin de l'équipe GitHub Security Lab a cherché a savoir si ces derniers ne sont pas aussi sources de vulnérabilité en étudiant quelques CVEs sur des produits comme JFrog Artifactory, Sonatype Nexus, et Reposilite
- Certaines failles viennent de la UI des produits qui permettent d'afficher les artifacts (ex: mettez un JS dans un fichier POM) et même de naviguer dedans (ex: voir le contenu d'un jar / zip et on exploite l'API pour lire, voir modifier des fichiers du serveur en dehors des archives)
- Les artifacts peuvent aussi être compromis en jouant sur les paramètres propriétaires des URLs ou en jouant sur le nomage avec les encodings.
- Bref, rien n'est simple ni niveau. Tout système rajoute de la compléxité et il est important de les tenir à mettre à jour. Il faut  surveiller activement sa chaine de distribution via différents moyens et ne pas tout miser sur le repository manager.
- L'auteur a fait une présentation sur le sujet : [https://www.youtube.com/watch?v=0Z_QXtk0Z54](https://www.youtube.com/watch?v=0Z_QXtk0Z54)

Apache Maven 4... Bientôt, c'est promis .... qu'est ce qu'il y aura dedans ? [https://gnodet.github.io/maven4-presentation/](https://gnodet.github.io/maven4-presentation/)

- Et aussi [https://github.com/Bukama/MavenStuff/blob/main/Maven4/whatsnewinmaven4.md](https://github.com/Bukama/MavenStuff/blob/main/Maven4/whatsnewinmaven4.md)
- Apache Maven 4
  - Doucement mais surement .... c'est le principe d'un projet
  - Maven 4.0.0-rc-2 est dispo (Dec 2024).
  - Maven a plus de 20 ans et est largement utilisé dans l'écosystème Java.
  - La compatibilité ascendante a toujours été une priorité, mais elle a limité la flexibilité.
  - Maven 4 introduit des changements significatifs, notamment un nouveau schéma de construction et des améliorations du code.
- Changements du POM
  - Séparation du Build-POM et du Consumer-POM :
    - Build-POM : Contient des informations propres à la construction (ex. plugins, configurations).
    - Consumer-POM : Contient uniquement les informations nécessaires aux consommateurs d'artefacts (ex. dépendances).
  - Nouveau Modèle Version 4.1.0 :
    - Utilisé uniquement pour le Build-POM, alors que le Consumer-POM reste en 4.0.0 pour la compatibilité.
    - Introduit de nouveaux éléments et en marque certains comme obsolètes.
  - Modules renommés en sous-projets :
    - "Modules" devient "Sous-projets" pour éviter la confusion avec les Modules Java.
    - L'élément `<subprojects>` remplace `<modules>` (qui reste pris en charge).
  - Nouveau type de packaging : "bom" (Bill of Materials) :
    - Différencie les POMs parents et les BOMs de gestion des dépendances.
    - Prend en charge les exclusions et les imports basés sur les classifiers.
  - Déclaration explicite du répertoire racine :
    - `<project root="true">` permet de définir explicitement le répertoire racine du projet.
    - Élimine toute ambiguïté sur la localisation des racines de projet.
  - Nouvelles variables de répertoire :
    - `${project.rootDirectory}`, `${session.topDirectory}` et `${session.rootDirectory}` pour une meilleure gestion des chemins.
    - Remplace les anciennes solutions non officielles et variables internes obsolètes.
  - Prise en charge de syntaxes alternatives pour le POM
    - Introduction de ModelParser SPI permettant des syntaxes alternatives pour le POM.
    - Apache Maven Hocon Extension est un exemple précoce de cette fonctionnalité.
- Améliorations pour les sous-projets
  - Versioning automatique des parents
    - Il n'est plus nécessaire de définir la version des parents dans chaque sous-projet.
    - Fonctionne avec le modèle de version 4.1.0 et s'étend aux dépendances internes au projet.
  - Support complet des variables compatibles CI
    - Le Flatten Maven Plugin n'est plus requis.
    - Prend en charge les variables comme `${revision}` pour le versioning.
    - Peut être défini via `maven.config` ou la ligne de commande (`mvn verify -Drevision=4.0.1`).
  - Améliorations et corrections du Reactor
    - Correction de bug : Gestion améliorée de `--also-make` lors de la reprise des builds.
    - Nouvelle option `--resume` (`-r`) pour redémarrer à partir du dernier sous-projet en échec.
    - Les sous-projets déjà construits avec succès sont ignorés lors de la reprise.
    - Constructions sensibles aux sous-dossiers : Possibilité d'exécuter des outils sur des sous-projets sélectionnés uniquement.
    - Recommandation : Utiliser `mvn verify` plutôt que `mvn clean install`.
  - Autres Améliorations
    - Timestamps cohérents pour tous les sous-projets dans les archives packagées.
    - Déploiement amélioré : Le déploiement ne se produit que si tous les sous-projets sont construits avec succès.
- Changements de workflow, cycle de vie et exécution
  - Java 17 requis pour exécuter Maven
    - Java 17 est le JDK minimum requis pour exécuter Maven 4.
    - Les anciennes versions de Java peuvent toujours être ciblées pour la compilation via Maven Toolchains.
    - Java 17 a été préféré à Java 21 en raison d'un support à long terme plus étendu.
  - Mise à jour des plugins et maintenance des applications
    - Suppression des fonctionnalités obsolètes (ex. Plexus Containers, expressions `${pom.}`).
    - Mise à jour du Super POM, modifiant les versions par défaut des plugins.
    - Les builds peuvent se comporter différemment ; définissez des versions fixes des plugins pour éviter les changements inattendus.
    - Maven 4 affiche un avertissement si des versions par défaut sont utilisées.
  - Nouveau paramètre "Fail on Severity"
    - Le build peut échouer si des messages de log atteignent un niveau de gravité spécifique (ex. `WARN`).
    - Utilisable via `--fail-on-severity WARN` ou `-fos WARN`.
  - Maven Shell (`mvnsh`)
    - Chaque exécution de `mvn` nécessitait auparavant un redémarrage complet de Java/Maven.
    - Maven 4 introduit Maven Shell (`mvnsh`), qui maintient un processus Maven résident unique ouvert pour plusieurs commandes.
    - Améliore la performance et réduit les temps de build.
    - Alternative : Utilisez Maven Daemon (`mvnd`), qui gère un pool de processus Maven résidents.


### Architecture

Un article sur les feature flags avec Unleash [https://feeds.feedblitz.com/~/911939960/0/baeldung~Implement-Feature-Flags-in-Java-With-Unleash](https://feeds.feedblitz.com/~/911939960/0/baeldung~Implement-Feature-Flags-in-Java-With-Unleash)

- Pour A/B testing et des cycles de développements plus rapides pour « tester en prod »
- Montre comment tourner sous docker unleash
- Et ajouter la librairie a du code java pour tester un feature flag



### Sécurité

Keycloak 26.1 [https://www.keycloak.org/2025/01/keycloak-2610-released.html](https://www.keycloak.org/2025/01/keycloak-2610-released.html)

- detection des noeuds via la proble base de donnée aulieu echange reseau
- virtual threads pour infinispan et jgroups
- opentelemetry tracing supporté
- et plein de fonctionalités de sécurité 


### Loi, société et organisation

Les grands morceaux du coût et revenus d’une conférence. Ici <http://bdx.io|bdx.io> [https://bsky.app/profile/ameliebenoit33.bsky.social/post/3lgzslhedzk2a](https://bsky.app/profile/ameliebenoit33.bsky.social/post/3lgzslhedzk2a)

- 44% le billet
- 52% les sponsors
- 38% loc du lieu
- 29% traiteur et café 
- 12% standiste
- 5% frais speaker (donc pas tous)



## Ask Me Anything

Julien de Provin: J'aime beaucoup le mode "continuous testing" de Quarkus, et je me demandais s'il existait une alternative en dehors de Quarkus, ou à défaut, des ressources sur son fonctionnement ?
J'aimerais beaucoup avoir un outil agnostique utilisable sur les projets non-Quarkus sur lesquels j'intervient, quitte à y metttre un peu d'huile de coude (ou de phalange pour le coup).

* [https://github.com/infinitest/infinitest/](https://github.com/infinitest/infinitest/)


## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 6-7 février 2025 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/touraine-tech-2025"><img alt="CFP Touraine Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-October-2024&color=red"></a>
- 21 février 2025 : [LyonJS 100](https://www.lyonjs.org/lyonjs-100) - Lyon (France) 
- 28 février 2025 : [Paris TS La Conf](http://typescript.paris/) - Paris (France) 
- 6 mars 2025 : [DevCon #24 : 100% IA](https://www.programmez.com/page-devcon/devcon-24-100-ia) - Paris (France) <a href="mailto:ftonic@programmez.com"><img alt="CFP DevCon Programmez" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2025&color=red"></a>
- 13 mars 2025 : [Oracle CloudWorld Tour Paris](https://www.oracle.com/fr/cloudworld-tour/) - Paris (France) 
- 14 mars 2025 : [Rust In Paris 2025](https://www.rustinparis.com/) - Paris (France) 
- 19-21 mars 2025 : [React Paris](https://react.paris/) - Paris (France) <a href="https://forms.gle/KfsWGQH2Xn2N2Nua8"><img alt="CFP React Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2027-December-2024&color=red"></a>
- 20 mars 2025 : [PGDay Paris](https://2025.pgday.paris) - Paris (France) 
- 20-21 mars 2025 : [Agile Niort](https://agileniort.fr/) - Niort (France) <a href="https://sessionize.com/agile-niort-2025"><img alt="CFP Agile Niort 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-January-2025&color=red"></a>
- 25 mars 2025 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-6/"><img alt="CFP ParisTestConf 6" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2024&color=red"></a>
- 26-29 mars 2025 : [JChateau Unconference 2025](https://jchateau.org/) - Cour-Cheverny (France) 
- 27-28 mars 2025 : [SymfonyLive Paris 2025](https://live.symfony.com/2025-paris/) - Paris (France) 
- 28 mars 2025 : [DataDays](https://days.data-lille.fr/2025/) - Lille (France) <a href="https://conference-hall.io/data-days-lille-2025"><img alt="CFP DataDays 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-February-2025&color=green"></a>
- 28-29 mars 2025 : [Agile Games France 2025](https://agilegamesfrance.fr/) - Lille (France) 
- 3 avril 2025 : [DotJS](http://www.dotjs.io) - Paris (France) <a href="https://www.dotjs.io/speak"><img alt="CFP dotJS 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-November-2024&color=red"></a>
- 3 avril 2025 : [SoCraTes Rennes 2025](https://socrates-rennes.github.io/) - Rennes (France) 
- 4 avril 2025 : [Flutter Connection 2025](https://flutterconnection.io) - Paris (France) <a href="https://sessionize.com/flutter-connection-2025"><img alt="CFP Flutter Connection 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-January-2025&color=red"></a>
- 4 avril 2025 : [aMP Orléans 04-04-2025](https://bit.ly/aMPOrleans2025Reg) - Orléans (France) <a href="https://sessionize.com/amp-orleans-04-04-2025/"><img alt="CFP aMP Orléans 04-04-2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=green"></a>
- 10-11 avril 2025 : [Android Makers](https://androidmakers.droidcon.com/) - Montrouge (France) <a href="https://sessionize.com/android-makers-by-droidcon-2025/"><img alt="CFP Android Makers by droidcon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-February-2025&color=green"></a>
- 10-12 avril 2025 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr25.cfp.dev/"><img alt="CFP Devoxx Greece 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-November-2024&color=red"></a>
- 16-18 avril 2025 : [Devoxx France](https://www.devoxx.fr) - Paris (France) <a href="https://devoxxfr2025.cfp.dev/#/login"><img alt="CFP Devoxx France 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-January-2025&color=red"></a>
- 23-25 avril 2025 : [MODERN ENDPOINT MANAGEMENT EMEA SUMMIT 2025](http://endpointsummit.com) - Paris (France) <a href="https://sessionize.com/MEMSummit2025"><img alt="CFP MODERN ENDPOINT MANAGEMENT EMEA SUMMIT 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-January-2025&color=red"></a>
- 24 avril 2025 : [IA Data Day 2025](https://iadataday.capitale.dev/) - Strasbourg (France) <a href="https://conference-hall.io/ia-data-day-strasbourg-2025"><img alt="CFP IA Data Day 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-March-2025&color=green"></a>
- 29-30 avril 2025 : [MixIT](https://mixitconf.org/) - Lyon (France) <a href="https://sessionize.com/mixit-2025/"><img alt="CFP MixIT 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-January-2025&color=red"></a>
- 7-9 mai 2025 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk25.cfp.dev/#/"><img alt="CFP Devoxx UK 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2025&color=red"></a>
- 15 mai 2025 : [Cloud Toulouse](https://cloudtoulouse.com/) - Toulouse (France) <a href="https://conference-hall.io/cloud-toulouse-2025"><img alt="CFP Cloud Toulouse 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=green"></a>
- 16 mai 2025 : [AFUP Day 2025 Lille](https://event.afup.org/afup-day-2025/) - Lille (France) <a href="https://afup.org/event/afupday2025lille"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Lyon](https://event.afup.org/afup-day-2025/) - Lyon (France) <a href="https://afup.org/event/afupday2025lyon"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Poitiers](https://event.afup.org/afup-day-2025/) - Poitiers (France) <a href="https://afup.org/event/afupday2025poitiers"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 24 mai 2025 : [Polycloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/polycloud-2025"><img alt="Polycloud 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-February-2025&color=green"></a>
- 24 mai 2025 : [NG Baguette Conf 2025](https://ngbaguette.angulardevs.fr/) - Nantes (France) <a href="https://conference-hall.io/ng-baguette-conf-2025"><img alt="NG baguette Conf 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-March-2025&color=green"></a>
- 5-6 juin 2025 : [AlpesCraft](https://www.alpescraft.fr/) - Grenoble (France) 
- 5-6 juin 2025 : [Devquest 2025](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/devquest-2025"><img alt="CFP Devquest 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-March-2025&color=green"></a>
- 10-11 juin 2025 : [Modern Workplace Conference Paris 2025](https://modern-workplace.pro) - Paris (France) <a href="https://sessionize.com/mwcp25"><img alt="CFP Modern Workplace Conference Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=green"></a>
- 11-13 juin 2025 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxxpl25.cfp.dev/#/login"><img alt="CFP Devoxx Poland 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=green"></a>
- 12-13 juin 2025 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 12-13 juin 2025 : [DevLille](https://devlille.fr/) - Lille (France) <a href="https://conference-hall.io/devlille-2025"><img alt="CFP DevLille" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-March-2025&color=green"></a>
- 13 juin 2025 : [Tech F'Est 2025](https://tech-fest.dev) - Nancy (France) <a href="https://sessionize.com/bsides-boulder-2025/"><img alt="CFP Tech F'Est 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-February-2025&color=green"></a>
- 17 juin 2025 : [Mobilis In Mobile](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/mobilis-in-mobile-2025"><img alt="CFP Mobilis In Mobile 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-April-2025&color=green"></a>
- 24 juin 2025 : [WAX 2025](https://www.waxconf.fr/) - Aix-en-Provence (France) <a href="https://conference-hall.io/wax2025"><img alt="CFP WAX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-May-2025&color=green"></a>
- 25-26 juin 2025 : [Agi'Lille 2025](https://agilille.fr) - Lille (France) <a href="https://sessionize.com/agilille-2025/"><img alt="CFP Agi'Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-February-2025&color=red"></a>
- 25-27 juin 2025 : [BreizhCamp 2025](https://www.breizhcamp.org) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2025/"><img alt="CFP BreizhCamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-March-2025&color=green"></a>
- 26-27 juin 2025 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2025"><img alt="CFP SunnyTech 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-Feb-2025&color=green"></a>
- 1-4 juillet 2025 : [Open edX Conference - 2025](https://con.openedx.org) - Palaiseau (France) <a href="https://sessionize.com/open-edx-conference-2025"><img alt="CFP Open edX Conference - 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-December-2024&color=red"></a>
- 7-9 juillet 2025 : [Riviera DEV 2025](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/riviera-dev-2025/"><img alt="CFP Riviera DEV 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-March-2025&color=green"></a>
- 18-19 septembre 2025 : [API Platform Conference](https://api-platform.com/con/2025/) - Lille (France) & Online <a href="https://conference-hall.io/api-platform-conference-2025-lille-and-online"><img alt="CFP API Platform Conference 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-March-2025&color=green"></a>
- 2-3 octobre 2025 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) 
- 6-10 octobre 2025 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 9-10 octobre 2025 : [Forum PHP 2025](https://event.afup.org/) - Marne-la-Vallée (France) 
- 16-17 octobre 2025 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) 
- 4-7 novembre 2025 : [NewCrafts 2025](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/ncrafts/"><img alt="CFP NewCrafts 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=green"></a>
- 6 novembre 2025 : [dotAI 2025](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=green"></a>
- 7 novembre 2025 : [BDX I/O](https://bdxio.fr) - Bordeaux (France) 
- 12-14 novembre 2025 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) 
- 28-31 janvier 2026 : [SnowCamp 2026](https://snowcamp.io/) - Grenoble (France) 
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 17 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>

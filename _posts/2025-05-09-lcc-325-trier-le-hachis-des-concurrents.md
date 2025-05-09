---
title: LCC 325 - Trier le hachis des concurrents
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 325
youtube: https://www.youtube.com/watch?v=y-qgME0R8NY
mp3_length: 79170437
tweet: Trier le hachis des concurrents #java #scala #micronaut #nodejs #ia #sampling #llm #dto #vibecoding #broadcom #redhat #licence
# tweet size: 91-93 -> 99-101 #######################################################################
---
Gros épisode qui couvre un large spectre de sujets : Java, Scala, Micronaut, NodeJS, l'IA et la compétence des développeurs, le sampling dans les LLMs, les DTO, le vibe coding, les changements chez Broadcom et Red Hat ainsi que plusieurs nouvelles sur les licences open source.

Enregistré le 7 mai 2025

Téléchargement de l’épisode [LesCastCodeurs-Episode-325.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-325.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=y-qgME0R8NY).

## News


### Langages

A l'occasion de JavaOne et du lancement de Java 24, Oracle lance un nouveau site avec des ressources vidéo pour apprendre le langage
[https://learn.java/](https://learn.java/)

- site plutôt à destination des débutants et des enseignants
- couvre la syntaxe aussi, y compris les ajouts plus récents comme les records ou le pattern matching
- c'est pas le site le plus trendy du monde.

Martin Odersky partage un long article sur l’état de l’écosystème Scala et les évolutions du language
[https://www.scala-lang.org/blog/2025/03/24/evolving-scala.html](https://www.scala-lang.org/blog/2025/03/24/evolving-scala.html)

- **Stabilité et besoin d’évolution :** Scala maintient sa position (~14ème mondial) avec des bases techniques solides, mais doit évoluer face à la concurrence pour rester pertinent.
- **Axes prioritaires :** L’évolution se concentre sur l’amélioration du duo **sécurité/convivialité**, le **polissage** du langage (suppression des “rugosités”) et la **simplification pour les débutants**.
- **Innovation continue :** Geler les fonctionnalités est exclu ; l’innovation est clé pour la valeur de Scala. Le langage doit rester généraliste et ne pas se lier à un framework spécifique.
- **Défis et progrès :** L’**outillage** (IDE, outils de build comme `sbt`, `scala-cli`, `Mill`) et la **facilité d’apprentissage** de l’écosystème sont des points d’attention, avec des améliorations en cours (partenariat pédagogique, plateformes simples).

Des strings encore plus rapides !
[https://inside.java/2025/05/01/strings-just-got-faster/](https://inside.java/2025/05/01/strings-just-got-faster/)

- Dans JDK 25, la performance de la fonction `String::hashCode` a été améliorée pour être principalement **constant foldable**.
- Cela signifie que si les chaînes de caractères sont utilisées comme clés dans une `Map` statique et immuable, des gains de performance significatifs sont probables.
- L’amélioration repose sur l’annotation interne `@Stable` appliquée au champ privé `String.hash`.
- Cette annotation **permet à la machine virtuelle de lire la valeur du hash une seule fois et de la considérer comme constante** si elle n’est pas la valeur par défaut (zéro).
- Par conséquent, l’opération `String::hashCode` peut **être remplacée par la valeur de hash connue**, optimisant ainsi les lookups dans les `Map` immuables.
- Un cas limite est celui où le code de hachage de la chaîne est zéro, auquel cas l’optimisation ne fonctionne pas (par exemple, pour la chaîne vide “”).
- Bien que l’annotation `@Stable` soit interne au JDK, un nouveau JEP ([JEP 502: Stable Values (Preview)](https://openjdk.org/jeps/502)) est en cours de développement pour permettre aux utilisateurs de bénéficier indirectement de fonctionnalités similaires.

AtomicHash, une implémentation Java d’une HashMap qui est thread-safe, atomique et non-bloquante
[https://github.com/arxila/atomichash](https://github.com/arxila/atomichash)

- implémenté sous forme de version immutable de Concurrent Hash Trie


### Librairies

Sortie de Micronaut 4.8.0
[https://micronaut.io/2025/04/01/micronaut-framework-4-8-0-released/](https://micronaut.io/2025/04/01/micronaut-framework-4-8-0-released/)

- **Mise à jour de la BOM (Bill of Materials) :** La version 4.8.0 met à jour la BOM de la plateforme Micronaut.
- **Améliorations de Micronaut Core :** Intégration de **Micronaut SourceGen** pour la génération interne de métadonnées et d’expressions bytecode.
- Nombreuses améliorations dans **Micronaut SourceGen**.
- Ajout du **traçage de l’injection de dépendances** pour faciliter le débogage au démarrage et à la création des beans.
- Nouveau membre `definitionType` dans l’annotation **`@Client`** pour faciliter le partage d’interfaces entre client et serveur.
- Support de la **fusion** dans les Bean Mappers via l’annotation `@Mapping`.
- Nouvelle **liveness probe** détectant les threads bloqués (deadlocked) via `ThreadMXBean`.
- **Intégration Kubernetes améliorée :** Mise à jour du client Java Kubernetes vers la version 22.0.1.
- Ajout du module **Micronaut Kubernetes Client OpenAPI**, offrant une alternative au client officiel avec moins de dépendances, une configuration unifiée, le support des filtres et la compatibilité Native Image.
- Introduction d’un nouveau **runtime serveur basé sur le serveur HTTP intégré de Java**, permettant de créer des applications sans dépendances serveur externes.
- Ajout dans Micronaut Micrometer d’un module pour instrumenter les **sources de données** (traces et métriques).
- Ajout de la condition `condition` dans l’annotation **`@MetricOptions`** pour contrôler l’activation des métriques via une expression.
- Support des **Consul watches** dans Micronaut Discovery Client pour détecter les changements de configuration distribuée.
- Possibilité de **générer du code source à partir d’un schéma JSON** via les plugins de build (Gradle et Maven).




### Web

Node v24.0.0 passe en version Current: [https://nodejs.org/en/blog/release/v24.0.0](https://nodejs.org/en/blog/release/v24.0.0)

- **Mise à jour du moteur V8 vers la version 13.6** : intégration de nouvelles fonctionnalités JavaScript telles que `Float16Array`, la gestion explicite des ressources (`using`), `RegExp.escape`, `WebAssembly Memory64` et `Error.isError`. 
- **npm 11 inclus** : améliorations en termes de performance, de sécurité et de compatibilité avec les packages JavaScript modernes. 
- **Changement de compilateur pour Windows** : abandon de MSVC au profit de ClangCL pour la compilation de Node.js sur Windows. 
- **`AsyncLocalStorage` utilise désormais `AsyncContextFrame` par défaut** : offrant une gestion plus efficace du contexte asynchrone. 
- **`URLPattern` disponible globalement** : plus besoin d'importer explicitement cette API pour effectuer des correspondances d'URL. 
- **Améliorations du modèle de permissions** : le flag expérimental `--experimental-permission` devient `--permission`, signalant une stabilité accrue de cette fonctionnalité. 
- **Améliorations du test runner** : les sous-tests sont désormais attendus automatiquement, simplifiant l'écriture des tests et réduisant les erreurs liées aux promesses non gérées. 
- **Intégration d'Undici 7** : amélioration des capacités du client HTTP avec de meilleures performances et un support étendu des fonctionnalités HTTP modernes. 
- **Dépréciations et suppressions** :
  - Dépréciation de `url.parse()` au profit de l'API WHATWG URL.
  - Suppression de `tls.createSecurePair`.
  - Dépréciation de `SlowBuffer`.
  - Dépréciation de l'instanciation de REPL sans `new`.
  - Dépréciation de l'utilisation des classes Zlib sans `new`.
  - Dépréciation du passage de `args` à `spawn` et `execFile` dans `child_process`. 
- Node.js 24 est actuellement la version "Current" et deviendra une version LTS en octobre 2025. Il est recommandé de tester cette version pour évaluer son impact sur vos applications.


### Data et Intelligence Artificielle

Apprendre à coder reste crucial et l’IA est là pour venir en aide :
[https://kyrylo.org/software/2025/03/27/learn-to-code-ignore-ai-then-use-ai-to-code-even-better.html](https://kyrylo.org/software/2025/03/27/learn-to-code-ignore-ai-then-use-ai-to-code-even-better.html)

- **Apprendre à coder reste essentiel malgré l’IA.**
- L’IA peut assister la programmation.
- Une **solide base est cruciale pour comprendre et contrôler le code.**
- Cela permet d’éviter la dépendance à l’IA.
- Cela réduit le risque de remplacement par des outils d’IA accessibles à tous.
- **L’IA est un outil, pas un substitut à la maîtrise des fondamentaux.**

Super article de Anthropic qui essaie de comprendre comment fonctionne la “pensée” des LLMs
[https://www.anthropic.com/research/tracing-thoughts-language-model](https://www.anthropic.com/research/tracing-thoughts-language-model)

- **Effet boîte noire :** Stratégies internes des IA (Claude) opaques aux développeurs et utilisateurs.
- **Objectif :** Comprendre le “raisonnement” interne pour vérifier capacités et intentions.
- **Méthode :** Inspiration neurosciences, développement d’un “microscope IA” (regarder quels circuits neuronaux s’activent).
- **Technique :** Identification de concepts (“features”) et de “circuits” internes.
- **Multilinguisme :** Indice d’un “langage de pensée” conceptuel commun à toutes les langues avant de traduire dans une langue particulière.
- **Planification :** Capacité à anticiper (ex: rimes en poésie), pas seulement de la génération mot par mot (token par token).
- **Raisonnement non fidèle :** Peut fabriquer des arguments plausibles (“bullshitting”) pour une conclusion donnée.
- **Logique multi-étapes :** Combine des faits distincts, ne se contente pas de mémoriser.
- **Hallucinations :** Refus par défaut ; réponse si “connaissance” active, sinon risque d’hallucination si erreur.
- **“Jailbreaks” :** Tension entre cohérence grammaticale (pousse à continuer) et sécurité (devrait refuser).
- **Bilan :** Méthodes limitées mais prometteuses pour la transparence et la fiabilité de l’IA.

Le “S” dans MCP veut dire Securité (ou pas !)
[https://elenacross7.medium.com/%EF%B8%8F-the-s-in-mcp-stands-for-security-91407b33ed6b](https://elenacross7.medium.com/%EF%B8%8F-the-s-in-mcp-stands-for-security-91407b33ed6b)

- La spécification MCP pour permettre aux LLMs d’avoir accès à divers outils et fonctions a peut-être été adoptée un peu rapidement, alors qu’elle n’était pas encore prête niveau sécurité
- L’article liste 4 types d’attaques possibles :
  - vulnérabilité d’injection de commandes
  - attaque d’empoisonnement d’outils
  - redéfinition silencieuse de l’outil
  - le shadowing d’outils inter-serveurs
- Pour l’instant, MCP n’est pas sécurisé : 
  - Pas de standard d’authentification
  - Pas de chiffrement de contexte
  - Pas de vérification d’intégrité des outils
- Basé sur l’article de InvariantLabs [https://invariantlabs.ai/blog/mcp-security-notification-tool-poisoning-attacks](https://invariantlabs.ai/blog/mcp-security-notification-tool-poisoning-attacks)

Sortie Infinispan 15.2 - pre rolling upgrades 16.0 [https://infinispan.org/blog/2025/03/27/infinispan-15-2](https://infinispan.org/blog/2025/03/27/infinispan-15-2)

- Support de Redis JSON + scripts Lua
- Métriques JVM désactivables
- Nouvelle console (PatternFly 6)
- Docs améliorées (métriques + logs)
- JDK 17 min, support JDK 24
- Fin du serveur natif (performances)

Guillaume montre comment développer un serveur MCP HTTP Server Sent Events avec l’implémentation de référence Java et LangChain4j
[https://glaforge.dev/posts/2025/04/04/mcp-client-and-server-with-java-mcp-sdk-and-langchain4j/](https://glaforge.dev/posts/2025/04/04/mcp-client-and-server-with-java-mcp-sdk-and-langchain4j/)

- Développé en Java, avec l’implémentation de référence qui est aussi à la base de l’implémentation dans Spring Boot (mais indépendant de Spring)
- Le serveur MCP est exposé sous forme de servlet dans Jetty
- Le client MCP lui, est développé avec le module MCP de LangChain4j
- c'est semi independant de Spring dans le sens où c'est dépendant de Reactor et de ses interface.
- il y a une conversation sur le github d'anthropic pour trouver une solution, mais cela ne parait pas simple.

Les fallacies derrière la citation “AI won’t replace you, but humans using AI will”
[https://platforms.substack.com/cp/161356485](https://platforms.substack.com/cp/161356485)

- **La fallacie de l’automatisation vs. l’augmentation :** Elle se concentre sur l’amélioration des tâches existantes avec l’IA au lieu de considérer le changement de la valeur de ces tâches dans un nouveau système.
- **La fallacie des gains de productivité :** L’augmentation de la productivité ne se traduit pas toujours par plus de valeur pour les travailleurs, car la valeur créée peut être capturée ailleurs dans le système.
- **La fallacie des emplois statiques :** Les emplois sont des constructions organisationnelles qui peuvent être redéfinies par l’IA, rendant les rôles traditionnels obsolètes.
- **La fallacie de la compétition “moi vs. quelqu’un utilisant l’IA” :** La concurrence évolue lorsque l’IA modifie les contraintes fondamentales d’un secteur, rendant les compétences existantes moins pertinentes.
- **La fallacie de la continuité du flux de travail :** L’IA peut entraîner une réimagination complète des flux de travail, éliminant le besoin de certaines compétences.
- **La fallacie des outils neutres :** Les outils d’IA ne sont pas neutres et peuvent redistribuer le pouvoir organisationnel en changeant la façon dont les décisions sont prises et exécutées.
- **La fallacie du salaire stable :** Le maintien d’un emploi ne garantit pas un salaire stable, car la valeur du travail peut diminuer avec l’augmentation des capacités de l’IA.
- **La fallacie de l’entreprise stable :** L’intégration de l’IA nécessite une restructuration de l’entreprise et ne se fait pas dans un vide organisationnel.

Comprendre le “sampling” dans les LLMs
[https://rentry.co/samplers](https://rentry.co/samplers)

- Explique pourquoi les LLMs utilisent des tokens
- Les différentes méthodes de “sampling” : càd de choix de tokens
- Les hyperparamètres comme la température, top-p, et leur influence réciproque
- Les algorithmes de tokenisation comme Byte Pair Encoding et SentencePiece.

Un de moins … OpenAI va racheter Windsurf pour 3 milliards de dollars.  
[https://www.bloomberg.com/news/articles/2025-05-06/openai-reaches-agreement-to-buy-startup-windsurf-for-3-billion](https://www.bloomberg.com/news/articles/2025-05-06/openai-reaches-agreement-to-buy-startup-windsurf-for-3-billion)

- l’accord n’est pas encore finalisé 
- Windsurf était valorisé à 1,25 milliards l’an dernier et OpenAI a levé 40 milliards dernièrement portant sa valeur à 300 milliards 
- Le but pour OpenAI est de rentrer dans le monde des assistants de code pour lesquels ils sont aujourd’hui absent 

Docker desktop se met à l'IA... ? Une nouvelle fonctionnalité dans docker desktop 4.4 sur macos: Docker Model Runner
[https://dev.to/docker/run-genai-models-locally-with-docker-model-runner-5elb](https://dev.to/docker/run-genai-models-locally-with-docker-model-runner-5elb)

- Permet de faire tourner des modèles nativement en local ( [https://docs.docker.com/model-runner/](https://docs.docker.com/model-runner/) ) mais aussi des serveurs MCP ( [https://docs.docker.com/ai/mcp-catalog-and-toolkit/](https://docs.docker.com/ai/mcp-catalog-and-toolkit/) )


### Outillage

Jetbrains défend la suppression des commentaires négatifs sur son assistant IA [https://devclass.com/2025/04/30/jetbrains-defends-removal-of-negative-reviews-for-unpopular-ai-assistant/?td=rt-3a](https://devclass.com/2025/04/30/jetbrains-defends-removal-of-negative-reviews-for-unpopular-ai-assistant/?td=rt-3a)

- L'IA Assistant de JetBrains, lancée en juillet 2023, a été téléchargée plus de 22 millions de fois mais n'est notée que 2,3 sur 5.
- Des utilisateurs ont remarqué que certaines critiques négatives étaient supprimées, ce qui a provoqué une réaction négative sur les réseaux sociaux.
- Un employé de JetBrains a expliqué que les critiques ont été supprimées soit parce qu'elles mentionnaient des problèmes déjà résolus, soit parce qu'elles violaient leur politique concernant les "grossièretés, etc."
- L'entreprise a reconnu qu'elle aurait pu mieux gérer la situation, un représentant déclarant : "Supprimer plusieurs critiques d'un coup sans préavis semblait suspect. Nous aurions dû au moins publier un avis et fournir plus de détails aux auteurs."
- Parmi les problèmes de l'IA Assistant signalés par les utilisateurs figurent : un support limité pour les fournisseurs de modèles tiers, une latence notable, des ralentissements fréquents, des fonctionnalités principales verrouillées aux services cloud de JetBrains, une expérience utilisateur incohérente et une documentation insuffisante.
- Une plainte courante est que l'IA Assistant s'installe sans permission. Un utilisateur sur Reddit l'a qualifié de "plugin agaçant qui s'auto-répare/se réinstalle comme un phénix".
- JetBrains a récemment introduit un niveau gratuit et un nouvel agent IA appelé Junie, destiné à fonctionner parallèlement à l'IA Assistant, probablement en réponse à la concurrence entre fournisseurs. Mais il est plus char a faire tourner.
- La société s'est engagée à explorer de nouvelles approches pour traiter les mises à jour majeures différemment et envisage d'implémenter des critiques par version ou de marquer les critiques comme "Résolues" avec des liens vers les problèmes correspondants au lieu de les supprimer.
- Contrairement à des concurrents comme Microsoft, AWS ou Google, JetBrains commercialise uniquement des outils et services de développement et ne dispose pas d'une activité cloud distincte sur laquelle s'appuyer.

Vos images de README et fichiers Markdown compatibles pour le dark mode de GitHub: [https://github.blog/developer-skills/github/how-to-make-your-images-in-markdown-on-github-adjust-for-dark-mode-and-light-mode/](https://github.blog/developer-skills/github/how-to-make-your-images-in-markdown-on-github-adjust-for-dark-mode-and-light-mode/)

- Seulement quelques lignes de pure HTML pour le faire


### Architecture

Alors, les DTOs, c’est bien ou c’est pas bien ?
[https://codeopinion.com/dtos-mapping-the-good-the-bad-and-the-excessive/](https://codeopinion.com/dtos-mapping-the-good-the-bad-and-the-excessive/)

- **Utilité des DTOs** : Les DTOs servent à transférer des données entre les différentes couches d’une application, en mappant souvent les données entre différentes représentations (par exemple, entre la base de données et l’interface utilisateur).
- **Surutilisation fréquente** : L’article souligne que les DTOs sont souvent utilisés de manière excessive, notamment pour créer des API HTTP qui ne font que refléter les entités de la base de données, manquant ainsi l’opportunité de composer des données plus riches.
- **Vraie valeur** : La valeur réelle des DTOs réside dans la gestion du couplage entre les couches et la composition de données provenant de sources multiples en formes optimisées pour des cas d’utilisation spécifiques.
- **Découplage** : Il est suggéré d’utiliser les DTOs pour découpler les modèles de données internes des contrats externes (comme les API), ce qui permet une évolution et une gestion des versions indépendantes.
- **Exemple avec CQRS** : Dans le cadre de CQRS (Command Query Responsibility Segregation), les réponses aux requêtes (queries) agissent comme des DTOs spécifiquement adaptés aux besoins de l’interface utilisateur, pouvant inclure des données de diverses sources.
- **Protection des données internes** : Les DTOs aident à distinguer et protéger les modèles de données internes (privés) des changements externes (publics).
- **Éviter l’excès** : L’auteur met en garde contre les couches de mapping excessives (mapper un DTO vers un autre DTO) qui n’apportent pas de valeur ajoutée.
- **Création ciblée** : Il est conseillé de ne créer des DTOs que lorsqu’ils résolvent des problèmes concrets, tels que la gestion du couplage ou la facilitation de la composition de données.


### Méthodologies

Même Guillaume se met au “vibe coding”
[https://glaforge.dev/posts/2025/05/02/vibe-coding-an-mcp-server-with-micronaut-and-gemini/](https://glaforge.dev/posts/2025/05/02/vibe-coding-an-mcp-server-with-micronaut-and-gemini/)

- Selon Andrey Karpathy, c’est le fait de POC-er un proto, une appli jetable du weekend [https://x.com/karpathy/status/1886192184808149383](https://x.com/karpathy/status/1886192184808149383)
- Mais Simon Willison s’insurge que certains confondent coder avec l’assistance de l’IA avec le vibe coding [https://simonwillison.net/2025/May/1/not-vibe-coding/](https://simonwillison.net/2025/May/1/not-vibe-coding/)
- Guillaume c’est ici amusé à développer un serveur MCP avec Micronaut, en utilisant Gemini, l’IA de Google.
- Contrairement à Quarkus ou Spring Boot, Micronaut n’a pas encore de module ou de support spécifique pour faciliter la création de serveur MCP


### Sécurité

Une faille de sécurité 10/10 sur Tomcat [https://www.it-connect.fr/apache-tomcat-cette-faille-activement-exploitee-seulement-30-heures-apres-sa-divulgation-patchez/](https://www.it-connect.fr/apache-tomcat-cette-faille-activement-exploitee-seulement-30-heures-apres-sa-divulgation-patchez/)

- Une faille de sécurité critique (CVE-2025-24813) affecte Apache Tomcat, permettant l'exécution de code à distance
- Cette vulnérabilité est activement exploitée seulement 30 heures après sa divulgation du 10 mars 2025
- L'attaque ne nécessite aucune authentification et est particulièrement simple à exécuter
- Elle utilise une requête PUT avec une charge utile Java sérialisée encodée en base64, suivie d'une requête GET
- L'encodage en base64 permet de contourner la plupart des filtres de sécurité
- Les serveurs vulnérables utilisent un stockage de session basé sur des fichiers (configuration répandue)
- Les versions affectées sont : 11.0.0-M1 à 11.0.2, 10.1.0-M1 à 10.1.34, et 9.0.0.M1 à 9.0.98
- Les mises à jour recommandées sont : 11.0.3+, 10.1.35+ et 9.0.99+
- Les experts prévoient des attaques plus sophistiquées dans les prochaines phases d'exploitation (upload de config ou jsp)

Sécurisation d’un serveur ssh [https://ittavern.com/ssh-server-hardening/](https://ittavern.com/ssh-server-hardening/) 

- un article qui liste les configurations clés pour sécuriser un serveur SSH
- par exemple, enlever password authentigfication, changer de port, desactiver le login root, forcer le protocol ssh 2, 
- certains que je ne connaissais pas comme `MaxStartups` qui limite le nombre de connections non authentifiées concurrentes
- Port knocking est une technique utile mais demande une approche cliente consciente du protocol

Oracle admet que les identités IAM de ses clients ont leaké [https://www.theregister.com/2025/04/08/oracle_cloud_compromised/](https://www.theregister.com/2025/04/08/oracle_cloud_compromised/)

- Oracle a confirmé à certains clients que son cloud public a été compromis, alors que l'entreprise avait précédemment nié toute intrusion.
- Un pirate informatique a revendiqué avoir piraté deux serveurs d'authentification d'Oracle et volé environ six millions d'enregistrements, incluant des clés de sécurité privées, des identifiants chiffrés et des entrées LDAP.
- La faille exploitée serait la vulnérabilité CVE-2021-35587 dans Oracle Access Manager, qu'Oracle n'avait pas corrigée sur ses propres systèmes.
- Le pirate a créé un fichier texte début mars sur [login.us2.oraclecloud.com](http://login.us2.oraclecloud.com) contenant son adresse email pour prouver son accès.
- Selon Oracle, un ancien serveur contenant des données vieilles de huit ans aurait été compromis, mais un client affirme que des données de connexion aussi récentes que 2024 ont été dérobées.
- Oracle fait face à un procès au Texas concernant cette violation de données. 
- Cette intrusion est distincte d'une autre attaque contre Oracle Health, sur laquelle l'entreprise refuse de commenter.
- Oracle pourrait faire face à des sanctions sous le RGPD européen qui exige la notification des parties affectées dans les 72 heures suivant la découverte d'une fuite de données.
- Le comportement d'Oracle consistant à nier puis à admettre discrètement l'intrusion est inhabituel en 2025 et pourrait mener à d'autres actions en justice collectives.

Une GitHub action très populaire compromise [https://www.stepsecurity.io/blog/harden-runner-detection-tj-actions-changed-files-action-is-compromised](https://www.stepsecurity.io/blog/harden-runner-detection-tj-actions-changed-files-action-is-compromised)

- **Compromission de l'action `tj-actions/changed-files`** : En mars 2025, une action GitHub très utilisée (`tj-actions/changed-files`) a été compromise. Des versions modifiées de l’action ont exposé des secrets CI/CD dans les logs de build.
- **Méthode d'attaque** : Un PAT compromis a permis de rediriger plusieurs tags de version vers un commit contenant du code malveillant.
- **Détails du code malveillant** : Le code injecté exécutait une fonction Node.js encodée en base64, qui téléchargeait un script Python. Ce script parcourait la mémoire du runner GitHub à la recherche de secrets (tokens, clés…) et les exposait dans les logs. Dans certains cas, les données étaient aussi envoyées via une requête réseau.
- **Période d’exposition** : Les versions compromises étaient actives entre le 12 et le 15 mars 2025. Tout dépôt, particulièrement ceux publiques, ayant utilisé l’action pendant cette période doit être considéré comme potentiellement exposé.
- **Détection** : L’activité malveillante a été repérée par l’analyse des comportements inhabituels pendant l’exécution des workflows, comme des connexions réseau inattendues.
- **Réaction** : GitHub a supprimé l’action compromise, qui a ensuite été nettoyée. 
- **Impact potentiel** : Tous les secrets apparaissant dans les logs doivent être considérés comme compromis, même dans les dépôts privés, et régénérés sans délai.


### Loi, société et organisation

Les startup the YCombinateur ont les plus fortes croissances de leur histoire [https://www.cnbc.com/2025/03/15/y-combinator-startups-are-fastest-growing-in-fund-history-because-of-ai.html](https://www.cnbc.com/2025/03/15/y-combinator-startups-are-fastest-growing-in-fund-history-because-of-ai.html)

- Les entreprises en phase de démarrage à Silicon Valley connaissent une croissance significative grâce à l'intelligence artificielle.
- Le PDG de Y Combinator, Garry Tan, affirme que l'ensemble des startups de la dernière cohorte a connu une croissance hebdomadaire de 10% pendant neuf mois.
- L'IA permet aux développeurs d'automatiser des tâches répétitives et de générer du code grâce aux grands modèles de langage.
- Pour environ 25% des startups actuelles de YC, 95% de leur code a été écrit par l'IA.
- Cette révolution permet aux entreprises de se développer avec moins de personnel - certaines atteignant 10 millions de dollars de revenus avec moins de 10 employés.
- La mentalité de "croissance à tout prix" a été remplacée par un renouveau d'intérêt pour la rentabilité.
- Environ 80% des entreprises présentées lors du "demo day" étaient centrées sur l'IA, avec quelques startups en robotique et semi-conducteurs.
- Y Combinator investit 500 000 dollars dans les startups en échange d'une participation au capital, suivi d'un programme de trois mois.

Red Hat middleware (ex-jboss) rejoint IBM
[https://markclittle.blogspot.com/2025/03/red-hat-middleware-moving-to-ibm.html](https://markclittle.blogspot.com/2025/03/red-hat-middleware-moving-to-ibm.html)

- Les activités Middleware de Red Hat (incluant JBoss, Quarkus, etc.) vont être transférées vers IBM, dans l’unité dédiée à la sécurité des données, à l’IAM et aux runtimes.
- Ce changement découle d’une décision stratégique de Red Hat de se concentrer davantage sur le cloud hybride et l’intelligence artificielle.
- Mark Little explique que ce transfert était devenu inévitable, Red Hat ayant réduit ses investissements dans le Middleware ces dernières années.
- L'intégration vise à renforcer l’innovation autour de Java en réunissant les efforts de Red Hat et IBM sur ce sujet.
- Les produits Middleware resteront open source et les clients continueront à bénéficier du support habituel sans changement.
- Mark Little affirme que des projets comme Quarkus continueront à être soutenus et que cette évolution est bénéfique pour la communauté Java.

Un an de commonhaus [https://www.commonhaus.org/activity/253.html](https://www.commonhaus.org/activity/253.html)

- un an, démarré sur les communautés qu'ils connaissaient bien
- maintenant 14 projets et put en accepter plus
- confiance, gouvernance legère et proteger le futur des projets
- automatisation de l'administratif, stabiilité sans complexité, les developpeurs au centre du processus de décision
- ils ont besoins de members et supporters (financiers)
- ils veulent accueillir des projets au delà de ceux du cercles des Java Champions

Spring Cloud Data Flow devient un produit commercial et ne sera plus maintenu en open source
[https://spring.io/blog/2025/04/21/spring-cloud-data-flow-commercial](https://spring.io/blog/2025/04/21/spring-cloud-data-flow-commercial)

- Peut-être sous l’influence de Broadcom, Spring se met à mettre en mode propriétaire des composants du portefeuille Spring
- ils disent que peu de gens l'utilisaent en mode OSS et la majorité venait d'un usage dans la plateforme Tanzu
- Maintenir en open source le coutent du temps qu'ils son't pas sur ces projets.

La CNCF protège le projet NATS, dans la fondation depuis 2018, vu que la société Synadia qui y contribue souhaitait reprendre le contrôle du projet
[https://www.cncf.io/blog/2025/04/24/protecting-nats-and-the-integrity-of-open-source-cncfs-commitment-to-the-community/](https://www.cncf.io/blog/2025/04/24/protecting-nats-and-the-integrity-of-open-source-cncfs-commitment-to-the-community/)

- **CNCF :** Protège projets OS, gouvernance neutre.
- **Synadia vs CNCF :** Veut retirer NATS, licence non-OS (BUSL).
- **CNCF :** Accuse Synadia de “claw back” (reprise illégitime).
- **Revendications Synadia :** Domaine [nats.io](http://nats.io), orga GitHub.
- **Marque NATS :** Synadia n’a pas transféré (promesse rompue malgré aide CNCF).
- **Contestation Synadia :** Juge règles CNCF “trop vagues”.
- **Vote interne :** Mainteneurs Synadia votent sortie CNCF (sans communauté).
- **Support CNCF :** Investissement majeur ($ audits, légal), succès communautaire (>700 orgs).
- **Avenir NATS (CNCF) :** Maintien sous Apache 2.0, gouvernance ouverte.
- **Actions CNCF :** Health check, appel mainteneurs, annulation marque Synadia, rejet demandes.
- Mais finalement il semble y avoir un bon dénouement :
- [https://www.cncf.io/announcements/2025/05/01/cncf-and-synadia-align-on-securing-the-future-of-the-nats-io-project/](https://www.cncf.io/announcements/2025/05/01/cncf-and-synadia-align-on-securing-the-future-of-the-nats-io-project/)
- **Accord pour l’avenir de [NATS.io](http://NATS.io) :** La Cloud Native Computing Foundation (CNCF) et Synadia ont conclu un accord pour sécuriser le futur du projet [NATS.io](http://NATS.io).
- **Transfert des marques NATS :** Synadia va céder ses deux enregistrements de marque NATS à la Linux Foundation afin de renforcer la gouvernance ouverte du projet.
- **Maintien au sein de la CNCF :** L’infrastructure et les actifs du projet NATS resteront sous l’égide de la CNCF, garantissant ainsi sa stabilité à long terme et son développement en open source sous licence Apache-2.0.
- **Reconnaissance et engagement :** La Linux Foundation, par la voix de Todd Moore, reconnaît les contributions de Synadia et son soutien continu. Derek Collison, PDG de Synadia, réaffirme l’engagement de son entreprise envers NATS et la collaboration avec la Linux Foundation et la CNCF.
- **Adoption et soutien communautaire :** NATS est largement adopté et considéré comme une infrastructure critique. Il bénéficie d’un fort soutien de la communauté pour sa nature open source et l’implication continue de Synadia.

Finalement, Redis revient vers une licence open source OSI, avec la AGPL
[https://foojay.io/today/redis-is-now-available-under-the-agplv3-open-source-license/](https://foojay.io/today/redis-is-now-available-under-the-agplv3-open-source-license/)

- Redis passe à la licence open source AGPLv3 pour contrer l’exploitation par les fournisseurs cloud sans contribution.
- Le passage précédent à la licence SSPL avait nui à la relation avec la communauté open source.
- Salvatore Sanfilippo (antirez) est revenu chez Redis.
- Redis 8 adopte la licence AGPL, intègre les fonctionnalités de Redis Stack (JSON, Time Series, etc.) et introduit les “vector sets” (le support de calcul vectoriel développé par Salvatore).
- Ces changements visent à renforcer Redis en tant que plateforme appréciée des développeurs, conformément à la vision initiale de Salvatore.





## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 6-7 mai 2025 : [GOSIM AI Paris](https://paris2025.gosim.org/) - Paris (France) <a href="https://cfp.gosim.org/"><img alt="CFP GOSIM AI Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-April-2025&color=red"></a>
- 7-9 mai 2025 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk25.cfp.dev/#/"><img alt="CFP Devoxx UK 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2025&color=red"></a>
- 15 mai 2025 : [Cloud Toulouse](https://cloudtoulouse.com/) - Toulouse (France) <a href="https://conference-hall.io/cloud-toulouse-2025"><img alt="CFP Cloud Toulouse 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Lille](https://event.afup.org/afup-day-2025/) - Lille (France) <a href="https://afup.org/event/afupday2025lille"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Lyon](https://event.afup.org/afup-day-2025/) - Lyon (France) <a href="https://afup.org/event/afupday2025lyon"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Poitiers](https://event.afup.org/afup-day-2025/) - Poitiers (France) <a href="https://afup.org/event/afupday2025poitiers"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 22-23 mai 2025 : [Flupa UX Days 2025](https://www.uxdays.eu) - Paris (France) <a href="https://sessionize.com/ux-days-2025"><img alt="CFP Flupa UX Days 2025 – Appel à orateur·rices pour la 13ᵉ édition" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-March-2025&color=red"></a>
- 24 mai 2025 : [Polycloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/polycloud-2025"><img alt="Polycloud 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-February-2025&color=red"></a>
- 24 mai 2025 : [NG Baguette Conf 2025](https://ngbaguette.angulardevs.fr/) - Nantes (France) <a href="https://conference-hall.io/ng-baguette-conf-2025"><img alt="NG baguette Conf 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-March-2025&color=red"></a>
- 3 juin 2025 : [TechReady](https://www.linkedin.com/company/techreadylive/) - Nantes (France) <a href="https://conference-hall.io/techready"><img alt="CFP TechReady" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-April-2025&color=red"></a>
- 5-6 juin 2025 : [AlpesCraft](https://www.alpescraft.fr/) - Grenoble (France) 
- 5-6 juin 2025 : [Devquest 2025](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/devquest-2025"><img alt="CFP Devquest 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-March-2025&color=red"></a>
- 10-11 juin 2025 : [Modern Workplace Conference Paris 2025](https://modern-workplace.pro) - Paris (France) <a href="https://sessionize.com/mwcp25"><img alt="CFP Modern Workplace Conference Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=red"></a>
- 11-13 juin 2025 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxxpl25.cfp.dev/#/login"><img alt="CFP Devoxx Poland 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=red"></a>
- 12 juin 2025 : [Positive Design Days](https://positive-design-days.com) - Strasbourg (France) <a href="https://conference-hall.io/positive-design-days"><img alt="CFP Positive Design Days" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-April-2025&color=red"></a>
- 12-13 juin 2025 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 12-13 juin 2025 : [DevLille](https://devlille.fr/) - Lille (France) <a href="https://conference-hall.io/devlille-2025"><img alt="CFP DevLille" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-March-2025&color=red"></a>
- 13 juin 2025 : [Tech F'Est 2025](https://tech-fest.dev) - Nancy (France) <a href="https://sessionize.com/bsides-boulder-2025/"><img alt="CFP Tech F'Est 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-February-2025&color=red"></a>
- 17 juin 2025 : [Mobilis In Mobile](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/mobilis-in-mobile-2025"><img alt="CFP Mobilis In Mobile 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-April-2025&color=red"></a>
- 19-21 juin 2025 : [Drupal Barcamp Perpignan 2025](https://www.drupal.fr/evenements/drupal-barcamp-perpignan-2025) - Perpignan (France) 
- 24 juin 2025 : [WAX 2025](https://www.waxconf.fr/) - Aix-en-Provence (France) <a href="https://conference-hall.io/wax2025"><img alt="CFP WAX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=red"></a>
- 25-26 juin 2025 : [Agi'Lille 2025](https://agilille.fr) - Lille (France) <a href="https://sessionize.com/agilille-2025/"><img alt="CFP Agi'Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-February-2025&color=red"></a>
- 25-27 juin 2025 : [BreizhCamp 2025](https://www.breizhcamp.org) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2025/"><img alt="CFP BreizhCamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-March-2025&color=red"></a>
- 26-27 juin 2025 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2025"><img alt="CFP SunnyTech 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-Feb-2025&color=red"></a>
- 1-4 juillet 2025 : [Open edX Conference - 2025](https://con.openedx.org) - Palaiseau (France) <a href="https://sessionize.com/open-edx-conference-2025"><img alt="CFP Open edX Conference - 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-December-2024&color=red"></a>
- 7-9 juillet 2025 : [Riviera DEV 2025](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/riviera-dev-2025/"><img alt="CFP Riviera DEV 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-March-2025&color=red"></a>
- 5 septembre 2025 : [JUG Summer Camp 2025](https://www.jugsummercamp.org/edition/16) - La Rochelle (France) <a href="https://conference-hall.io/jug-summer-camp-2025"><img alt="CFP JUG Summer Camp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-June-2025&color=green"></a>
- 12 septembre 2025 : [Agile Pays Basque 2025](https://agile-paysbasque.fr/) - Bidart (France) <a href="https://conference-hall.io/agile-pays-basque-2025"><img alt="CFP Agile Pays Basque 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-May-2025&color=green"></a>
- 18-19 septembre 2025 : [API Platform Conference](https://api-platform.com/con/2025/) - Lille (France) & Online <a href="https://conference-hall.io/api-platform-conference-2025-lille-and-online"><img alt="CFP API Platform Conference 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-March-2025&color=red"></a>
- 23 septembre 2025 : [OWASP AppSec France 2025](https://www.owaspappsecdays.fr/2025/) - Paris (France) <a href="https://sessionize.com/owasp-appsec-days-france-2025/"><img alt="CFP OWASP AppSec France" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=red"></a>
- 25-26 septembre 2025 : [Paris Web 2025](https://www.paris-web.fr) - Paris (France) <a href="https://appel.paris-web.fr/"><img alt="CFP Paris Web 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-March-2025&color=red"></a>
- 2-3 octobre 2025 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) <a href="https://conference-hall.io/volcamp-2025"><img alt="CFP Volcamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2025&color=green"></a>
- 3 octobre 2025 : [DevFest Perros-Guirec 2025](https://devfest.codedarmor.fr/) - Perros-Guirec (France) <a href="https://conference-hall.io/devfest-perros-guirec-2025"><img alt="CFP DevFest Perros Guirec 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2025&color=green"></a>
- 6-10 octobre 2025 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 7 octobre 2025 : [BSides Mulhouse](https://bsides-mulhouse.fr) - Mulhouse (France) <a href="https://conference-hall.io/bsides-mulhouse-2025"><img alt="CFP BSides Mulhouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-June-2025&color=green"></a>
- 9-10 octobre 2025 : [Forum PHP 2025](https://event.afup.org/) - Marne-la-Vallée (France) 
- 9-10 octobre 2025 : [EuroRust 2025](https://eurorust.eu) - Paris (France) <a href="https://www.papercall.io/eurorust-2025"><img alt="CFP EuroRust 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-May-2025&color=green"></a>
- 16 octobre 2025 : [PlatformCon25 Live Day Paris](https://platformconlive.fr/) - Paris (France) <a href="https://conference-hall.io/platformcon25-live-day-paris"><img alt="CFP PlatformCon25 Live Day Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=green"></a>
- 16-17 octobre 2025 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) <a href="https://conference-hall.io/devfest-nantes-2025"><img alt="CFP DevFest Nantes 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-June-2025&color=green"></a>
- 30-31 octobre 2025 : [Agile Tour Bordeaux 2025](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2025/"><img alt="CFP Agile Tour Bordeaux 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=green"></a>
- 30-31 octobre 2025 : [Agile Tour Nantais 2025](https://agilenantes.org/) - Nantes (France) <a href="https://sessionize.com/agile-tour-nantais-2025/"><img alt="CFP Agile Tour Nantais 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=green"></a>
- 30 octobre 2025-2 novembre 2025 : [PyConFR 2025](https://www.pycon.fr/2025/) - Lyon (France) <a href="https://cfp.pycon.fr/pyconfr-2025/cfp"><img alt="CFP PyConFR 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-July-2025&color=green"></a>
- 4-7 novembre 2025 : [NewCrafts 2025](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/ncrafts/"><img alt="CFP NewCrafts 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=red"></a>
- 6 novembre 2025 : [dotAI 2025](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=red"></a>
- 7 novembre 2025 : [BDX I/O](https://bdxio.fr) - Bordeaux (France) <a href="https://conference-hall.io/bdx-i-o-2025"><img alt="CFP BDX I/O 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-June-2025&color=green"></a>
- 12-14 novembre 2025 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) 
- 13 novembre 2025 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse-2025"><img alt="CFP DevFest Toulouse 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-June-2025&color=green"></a>
- 15-16 novembre 2025 : [Capitole du Libre](https://capitoledulibre.org/) - Toulouse (France) <a href="https://cfp.capitoledulibre.org/cdl-2025/"><img alt="CFP Capitole du Libre 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2025&color=green"></a>
- 20 novembre 2025 : [OVHcloud Summit](https://summit.ovhcloud.com/fr/) - Paris (France) 
- 21 novembre 2025 : [DevFest Paris 2025](https://devfest.gdgparis.fr/) - Paris (France) <a href="https://conference-hall.io/devfest-paris-2025"><img alt="CFP Devest Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2025&color=green"></a>
- 27 novembre 2025 : [Devfest Strasbourg 2025](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) 
- 28 novembre 2025 : [DevFest Lyon](https://devfest.gdglyon.com/) - Lyon (France) <a href="https://conference-hall.io/devfest-lyon-2025"><img alt="DevFest Lyon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2025&color=green"></a>
- 5 décembre 2025 : [DevFest Dijon 2025](https://devfest.developers-group-dijon.fr/) - Dijon (France) <a href="https://conference-hall.io/devfest-dijon-2025"><img alt="CFP Devest Dijon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2025&color=green"></a>
- 10-11 décembre 2025 : [Devops REX](https://www.devopsrex.fr/) - Paris (France) <a href="https://talks.devopsdays.org/devops-rex-2025/cfp"><img alt="CFP Devops REX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2025&color=green"></a>
- 10-11 décembre 2025 : [Open Source Experience](https://www.opensource-experience.com) - Paris (France) 
- 28-31 janvier 2026 : [SnowCamp 2026](https://snowcamp.io/) - Grenoble (France) 
- 2-6 février 2026 : [Web Days Convention](https://webdays.events/) - Aix-en-Provence (France) <a href="https://conference-hall.io/web-days-convention"><img alt="CFP Web Days Convention" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-February-2026&color=green"></a>
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 17 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

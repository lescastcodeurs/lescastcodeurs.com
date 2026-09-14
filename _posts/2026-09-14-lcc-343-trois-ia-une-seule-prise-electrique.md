---
title: LCC 343 - Trois IA, une seule prise électrique
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 343
youtube: FZdOe1gszV4
mp3_length: 69586718
tweet: Trois IA, une seule prise électrique #Java #Kotlin #Kubernetes #Cloud #AI #Security #Infrastructure #OpenSourceAI #AntiGravity #AgentProtocol #AISafety #LSP
# tweet size: 91-93 -> 99-101 #######################################################################
---
Côté IA : MCP devient stateless, Claude watermarke ses textes, GPT-6 Astra défie Claude Fable, et une étude JetBrains confirme Claude Code en tête des agents de code. Côté JVM : JDK 27 généralise G1, Kotlin 2.4 stabilise les context parameters, une API JSON arrive dans le JDK, et Quarkus comme Micronaut enchaînent les versions. En bonus, trois pannes IA simultanées et un câble débranché chez Google Cloud.

Enregistré le 11 septembre 2026

Téléchargement de l’épisode [LesCastCodeurs-Episode-343.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-343.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=FZdOe1gszV4).

## News

### Langages

Les Types Algébriques de Données (ADTs) en Java
[rockthejvm.com/articles/algebraic-data-types-in-java](https://rockthejvm.com/articles/algebraic-data-types-in-java)

- **Le problème :** L'approche classique (champs nullables, hiérarchies de classes ouvertes) crée des états invalides et des erreurs à l'exécution (comme le `NullPointerException`).
- **Types Produits (ET logique) :** Implémentés en Java avec les **Records**. Ils regroupent plusieurs champs de manière immuable et concise.
- **Types Sommes (OU logique) :** Implémentés avec les **Sealed Interfaces**. Elles définissent un ensemble strictement fermé de sous-types connus à la compilation.
- **ADTs (Types Algébriques) :** La combinaison des Sealed Interfaces et des Records. Ils garantissent que les états invalides sont impossibles à représenter dans le code.
- **Pattern Matching :** L'extraction des données se fait via des expressions `switch` exhaustives, supprimant le besoin de _casts_ manuels et obligeant le développeur à traiter tous les cas possibles.
- **Généralisation :** Ce modèle est idéal pour créer des types comme `Result<T, E>`, forçant le traitement explicite et sécurisé des succès et des erreurs typées.
- **Pourquoi "Algébrique" ?** Parce que les types sont combinés mathématiquement (Produits = multiplication, Sommes = addition) pour limiter strictement le nombre d'états possibles d'une donnée.

JDK 27 : fonctionnalités et calendrier de sortie [openjdk.org/projects/jdk/27](https://openjdk.org/projects/jdk/27/)  [infoworld.com/article/4202901/jdk-27-the-new-features-of-java-27.html](https://www.infoworld.com/article/4202901/jdk-27-the-new-features-of-java-27.html)

- JDK 27 est la prochaine version majeure de Java, une version non-LTS avec seulement 6 mois de support, qui succède à JDK 26.
- La disponibilité générale est prévue pour le 15 septembre 2026, avec des release candidates les 6 et 20 août 2026.
- Le périmètre est désormais figé (feature freeze) avec neuf JEP au programme.
- Le ramasse-miettes G1 devient le collecteur par défaut dans tous les environnements, et plus seulement en mode serveur.
- Ajout d'un support de la cryptographie post-quantique pour TLS 1.3, via des échanges de clés hybrides combinant algorithmes classiques et résistants au quantique.
- Finalisation de l'API PEM pour encoder et décoder clés, certificats et listes de révocation au format PEM.
- L'API Vector poursuit son incubation pour la douzième fois, permettant d'exprimer des calculs vectoriels compilés en instructions CPU optimisées.
- Les en-têtes d'objets compacts, introduits en JDK 24, sont désormais activés par défaut et réduisent l'empreinte mémoire du tas.
- Plusieurs previews sont reconduites : constantes paresseuses (3e preview), types primitifs dans les patterns (5e preview) et concurrence structurée (7e preview).
- Ajout d'une fonctionnalité de rédaction in-process pour JFR, afin de masquer les données sensibles dans les enregistrements de profiling.

Kotlin 2.4 : nouveautés du langage et outillage [kotlinlang.org/docs/whatsnew24.html](https://kotlinlang.org/docs/whatsnew24.html)

- Kotlin est un langage moderne, multiplateforme (JVM, Android, iOS, JavaScript, Wasm) développé par JetBrains, souvent utilisé comme alternative à Java.
- Les context parameters passent en stable : ils permettent de fournir des dépendances implicites à une fonction sans les déclarer en paramètre explicite, un peu comme une injection de dépendances.
- Les collection literals arrivent en expérimental : on peut écrire une liste avec des crochets, comme en Python, par exemple val fruits = ["pomme", "banane"].
- L'API UUID de la bibliothèque standard devient stable, pour générer et manipuler des identifiants uniques nativement.
- Nouvelles fonctions utilitaires comme isSorted() pour vérifier si une collection est déjà triée.
- Support de Java 26 côté JVM et alignement automatique des versions Java et Kotlin dans les projets Maven.
- Kotlin/Native, la compilation vers du code natif iOS et macOS, active par défaut un nouveau ramasse-miettes plus rapide et améliore l'export vers Swift.
- Kotlin/Wasm, la compilation vers WebAssembly pour faire tourner du Kotlin dans le navigateur, rend la compilation incrémentale stable.
- Kotlin/JS permet désormais d'exporter des value classes vers JavaScript et TypeScript.
- Le compilateur K1, l'ancienne génération, n'est plus supporté : seul le nouveau compilateur K2 reste disponible.

JEP 540 : une API JSON simple intégrée au JDK (incubation) [openjdk.org/jeps/540](https://openjdk.org/jeps/540)

- Le JDK ne propose aujourd'hui aucune API JSON native, obligeant à dépendre de bibliothèques externes comme Jackson, Gson ou Jakarta JSON pour parser ou générer du JSON.
- Cette JEP remplace la JEP 198 de 2014 et cible JDK 28 avec le nouveau module incubateur jdk.incubator.json.
- L'objectif est de couvrir les besoins simples d'extraction de données sans binding de données ni API de streaming, en laissant ces cas avancés aux bibliothèques existantes.
- L'API s'articule autour de l'interface scellée JsonValue avec six sous-types : JsonString, JsonNumber, JsonBoolean, JsonNull, JsonObject et JsonArray.
- Le parsing est strict et conforme à RFC 8259 : pas de virgules finales, pas de commentaires, et les noms de membres dupliqués provoquent une erreur. Donc pas de JSON5
- La navigation se fait via get et tryGet, et la conversion vers des types Java via asInt, asLong, asDouble, asString, asMap ou asList.
- En cas d'erreur, une JsonValueException précise le chemin exact dans le document et sa position en ligne et colonne.
- Le pattern matching sur les sous-types de JsonValue permet de gérer proprement l'évolution du format d'un document JSON dans le temps.
- La génération se fait via toString pour une sortie compacte ou Json.toDisplayString pour une sortie indentée et lisible.
- À terme, le JDK pourrait utiliser cette API en interne, par exemple pour remplacer les fichiers de configuration au format property par du JSON.

Autres nouvelles du JDK [openjdk.org/jeps/535](https://openjdk.org/jeps/535) [openjdk.org/jeps/541](http://openjdk.org/jeps/541)

- le mode generationel pour Shenandoah est prévu par défaut et deprécue le non générationel en 28
- fini le support de Java sur Apple Intel

GraalVM 25.2 : références compressées et Graal Script Agent [medium.com/graalvm/…](https://medium.com/graalvm/graalvm-25-2-is-here-600a9ae53f83)

- GraalVM est une machine virtuelle polyglotte d'Oracle offrant compilation JIT avancée et compilation en image native pour accélérer les applications Java et d'autres langages.
- Cette version 25.2 fait partie du train de releases innovation qui livre les nouveautés plus vite, pendant que GraalVM 25.0 reste la version stable recevant les correctifs de sécurité critiques.
- Nouveauté phare, le Graal Script Agent transforme des demandes en langage naturel en plugins sandboxés exécutés localement, en JavaScript ou Python, avec un accès restreint aux APIs de l'application.
- Les références compressées sont désormais activées par défaut dans Native Image sur les systèmes 64 bits, remplaçant les adresses complètes par des valeurs 32 bits relatives au tas.
- Cette optimisation réduit de 39% la consommation mémoire RSS d'une application Micronaut connectée à Oracle Database, comparée à la version 25.0.
- Contrepartie de cette optimisation, le tas géré est désormais plafonné à 32 Go.
- Le garbage collector G1 est maintenant disponible sur toutes les plateformes, y compris Windows, via l'option --gc=G1.
- G1 apporte de meilleures performances, une latence réduite et un démarrage plus rapide, avec des images natives plus petites grâce à l'optimisation guidée par profil.
- Le Vector API de Java est activé par défaut pour exploiter les instructions SIMD, utile pour le machine learning et le traitement de données.
- Bonne intégration avec l'écosystème via Micronaut 5.1, Quarkus et WebAssembly.

Shopify arrête React Native pour ses applis mobiles iOS et Android et repasse à du natif avec Swift et Kotlin
[shopify.engineering/back-to-native](https://shopify.engineering/back-to-native)

- Les progrès majeurs des LLM (IA) réduisent drastiquement le coût du développement sur deux plateformes distinctes.
- Les bénéfices du natif pur restent supérieurs, moins de couches d’abstractions, de dépenfances externes, et plus rapide pour adopter les dernières fonctionnalités des OS
- Les bibliothèques open-source (Skia, FlashList, Restyle) évoluent : Skia sera forkée par William Candillon, FlashList cherche un nouveau repreneur, Restyle sera archivée fin 2026.
- Migration des applications (Shop, Shopify, etc.) réalisée en mode "greenfield" (reconstruction totale) assistée par IA.
- Utilisation du système "Helix" pour un développement itératif et contrôlé par des agents IA.
- Découplage de la logique métier et de l'interface via une CLI pour accélérer les tests et éviter les lenteurs des simulateurs.
- L'application Shop a été entièrement reconstruite en natif en 12 semaines ; les autres suivront.


### Librairies

LangChain4j CDI est une extension CDI qui intègre LangChain4j avec CDI de Jakarta EE
[langchain4j.github.io/langchain4j-cdi](https://langchain4j.github.io/langchain4j-cdi/)

- LangChain4j CDI : Extension intégrant LangChain4j à Jakarta EE et MicroProfile.
- Services IA : Injection et gestion de cycle de vie via @RegisterAIService.
- Orchestration d'agents : 11 topologies d'agents configurables par annotations.
- Serveur MCP : Conversion de beans CDI en serveurs Model Context Protocol.
- Fonctionnalités d'entreprise : Configuration externe, tolérance aux pannes et observabilité OpenTelemetry.
- Installation Maven : Deux extensions disponibles selon l'environnement (build-time pour Quarkus/Helidon, portable pour WildFly/GlassFish/Liberty).
- Prérequis techniques : Java 17+, Jakarta EE 10, MicroProfile 6.1.

Quarkus 3.36, 3.37 et 3.38 : trois releases avant Quarkus 4 [quarkus.io/blog/quarkus-3-38-released](https://quarkus.io/blog/quarkus-3-38-released/) [quarkus.io/blog/quarkus-3-37-released](https://quarkus.io/blog/quarkus-3-37-released/) [quarkus.io/blog/quarkus-3-36-released](https://quarkus.io/blog/quarkus-3-36-released/)

- Quarkus est un framework Java cloud natif optimisé pour GraalVM et HotSpot, conçu pour les microservices et les environnements conteneurisés.
- En 3.38 (29 juillet), l'équipe allège les nouveautés pour se concentrer sur Quarkus 4, la communauté atteint 1213 contributeurs.
- 3.38 introduit l'éviction basée sur le poids mémoire pour le cache Caffeine de second niveau d'Hibernate, en plus de l'éviction par comptage.
- 3.38 apporte l'extension Quarkus HTTP Problem qui implémente la RFC 9457 pour mapper les exceptions en réponses application/problem+json, intégrée à OpenAPI.
- 3.37 (24 juin) ajoute l'extension expérimentale quarkus jlink pour générer des images runtime JDK sur mesure et réduire la taille des conteneurs.
- 3.37 active par défaut la sérialisation Jackson sans réflexion pour de meilleures performances. et 3.39 lesdesactivent et les rement en opt-in
- 3.37 introduit dans REST Client RestMultiResponse pour lire codes de statut et en-têtes sur des réponses REST en streaming, avec passage à Hibernate ORM 7.4 qui exige PostgreSQL 14 minimum.
- 3.36 (27 mai) propose Quarkus Signals en expérimental, un système de communication typée entre composants inspiré des events CDI et de l'EventBus Vert.x.
- 3.36 embarque des SBOM applicatifs exposés via /.well-known/sbom, y compris en image native selon la spécification GraalVM.
- 3.36 ajoute l'authentification OIDC via JWT SPIFFE, facilitant l'identité de charge de travail en environnement zero trust.

Micronaut Framework 5.1.0 : injection de dépendances, IA et sécurité renforcées [github.com/micronaut-projects/micronaut-platform/…/v5.1.0](https://github.com/micronaut-projects/micronaut-platform/releases/tag/v5.1.0)

- Micronaut est un framework JVM pour microservices et applications cloud-natives, avec injection de dépendances à la compilation et démarrage rapide.
- Introduction d'Open DI 1.0.0, une implémentation CDI Lite s'appuyant sur l'infrastructure d'injection de dépendances de Micronaut.
- Côté données, support officiel de SQLite et intégration MyBatis, avec ETags basés sur les valeurs pour le verrouillage optimiste.
- En sécurité, arrivée d'un module OWASP HTML Sanitizer, délégation d'authentification @RunAs et résolution de locale via OIDC.
- Côté IA, LangChain4j ajoute le support Chroma, la mémorisation de chat Oracle et l'authentification Google injectée pour Vertex AI, avec passage du MCP en version 2.0.0.
- Mises à jour majeures des dépendances : Spring Boot 4.1.0, Jetty 12.1.10, Tomcat 11.0.23, OpenTelemetry 1.64.0 et Kubernetes Java Client 27.0.0.
- SSL activé par défaut par service pour les clients HTTP


### Infrastructure

Ça coûte combien de faire tourner un LLM local sur son Apple Silicon ?
[towardsdatascience.com/how-much-does-a-local-llm-actually-cost-to-run-i-measured-every-watt-on-apple-silicon](https://towardsdatascience.com/how-much-does-a-local-llm-actually-cost-to-run-i-measured-every-watt-on-apple-silicon/)

- Coût électrique des LLM locaux sur Mac Apple Silicon
- Un modèle 120B (MoE) coûte 5x à 10x _moins_ cher qu'un modèle 27B (Dense).
- Le coût dépend du débit (tokens/seconde), pas du nombre de paramètres.
- Modèle dense --> Charge 100% des poids par token = lent et très énergivore.
- MoE (Mixture of Experts) --> N'active qu'une fraction des poids = rapide et économe.
- Conclusion : Pour réduire la facture électrique, choisir des modèles MoE quantifiés (haut débit).

Kubernetes 1.36 (Haru) : sécurité renforcée et alignement IA [infoq.com/news/2026/05/kubernetes-1-36-released](https://www.infoq.com/news/2026/05/kubernetes-1-36-released)

- Kubernetes est la plateforme open source de référence pour l'orchestration de conteneurs, portée par la CNCF.
- La version 1.36 nommée Haru apporte 70 améliorations : 18 passent stables, 25 en bêta et 25 en alpha, avec 106 entreprises et 491 contributeurs.
- Les user namespaces passent en disponibilité générale, isolant le root du conteneur de celui de l'hôte.
- Les Mutating Admission Policies passent en GA, remplaçant les webhooks par des règles CEL natives plus performantes.
- L'autorisation de l'API kubelet devient plus fine, remplaçant le droit trop large nodes/proxy.
- Le labeling SELinux des volumes utilise désormais mount -o context, accélérant le démarrage des pods.
- Plusieurs avancées ciblent les charges IA : gang scheduling en bêta, préemption consciente des groupes de pods, et allocation dynamique de ressources activée par défaut pour le partage fin des GPU.
- Le redimensionnement vertical des pods en place passe en bêta et activé par défaut, ajustant CPU et mémoire sans redémarrage.
- Suppression du plugin gitRepo, source de risque de sécurité, et du mode IPVS de kube-proxy, tous deux dépréciés de longue date.
- Avec la sortie de 1.36, la version 1.34 devient la plus ancienne branche encore supportée et entre en maintenance, ne recevant plus que des correctifs critiques avant sa fin de support.

Terraform vs OpenTofu en 2026 : la divergence est actée [ecorpit.hashnode.dev/terraform-vs-opentofu-in-2026-the-fork-has-diverged-so-which-do-you-standardize-on](https://ecorpit.hashnode.dev/terraform-vs-opentofu-in-2026-the-fork-has-diverged-so-which-do-you-standardize-on) [env0.com/insights/opentofu-in-2026-what-the-terraform-fork-became-after-three-years-of-independence](https://www.env0.com/insights/opentofu-in-2026-what-the-terraform-fork-became-after-three-years-of-independence)

- Terraform est l'outil historique d'Infrastructure as Code de HashiCorp, OpenTofu en est le fork open source lancé après le changement de licence.
- HashiCorp est passé de la licence MPL 2.0 a la BUSL 1.1 en aout 2023, ce qui a poussé une partie de la communauté a créer OpenTofu sous la Linux Foundation.
- IBM a racheté HashiCorp pour 6,4 milliards de dollars, finalisé en février 2025, tandis qu'OpenTofu rejoignait le CNCF comme projet sandbox en avril 2025.
- OpenTofu prend de l'avance sur des fonctionnalités inédites : chiffrement du state côté client depuis la v1.7, valeurs éphémères qui gardent les secrets hors du state depuis la v1.11, et prevent_destroy dynamique en v1.12 (mai 2026).
- Terraform garde l'avantage sur l'orchestration managée avec Terraform Stacks, désormais en disponibilité générale, sans équivalent natif côté OpenTofu.
- Le coût diverge fortement : HCP Terraform facture jusqu'à 0,99 dollar par ressource gérée et par mois, alors qu'OpenTofu reste une CLI gratuite couplée au backend de son choix.
- Fidelity Investments a migré plus de 2000 applications et 50000 fichiers d'état vers OpenTofu, la complexité venant surtout de l'écosystème (CI/CD, gouvernance) plutôt que du binaire lui-même.
- OpenTofu reste compatible avec les configurations Terraform jusqu'a la version 1.6.x, mais les versions Terraform plus récentes n'offrent plus aucune garantie de compatibilité.
- Pour les secteurs régulés, le chiffrement natif du state par OpenTofu et sa gouvernance ouverte sont des arguments forts face aux exigences de protection des données.
- La recommandation qui ressort des deux articles : partir sur OpenTofu pour les projets neufs et rester sur Terraform si l'on est déjà investi dans HCP Terraform et ses fonctionnalités de gouvernance.

OTel est à la peine ?
[matduggan.com/otel-isnt-going-well-and-i-made-a-spreadsheet-about-it](https://matduggan.com/otel-isnt-going-well-and-i-made-a-spreadsheet-about-it/)

- Le développement d'OTel est un peu au point mort
- **Périmètre démesuré :** Volonté de supporter un nombre gigantesque de langages, bibliothèques et frameworks.
- **Pénurie critique de mainteneurs :** Les données montrent une hyper-concentration du travail ; de nombreux SDK (comme PHP ou Ruby) dépendent d'une ou deux personnes seulement.
- **Stabilité paralysante :** La règle interdisant toute modification d'une fonctionnalité déclarée « stable » crée une peur de valider les nouveautés, entraînant des mois de débats.
- **Solutions proposées par l'auteur :**
  - Créer un niveau « Bêta » temporaire (ex: 12 mois) entre les statuts « Expérimental » et « Stable ».
  - Faire preuve de transparence sur les différences de qualité/maintenance entre les langages (ne pas mettre Go et Ruby sur le même plan).
  - Communiquer activement sur le besoin urgent de nouveaux mainteneurs.
- Assouplir la politique de stabilité en acceptant des _breaking changes_ bien documentés.

Honeycomb transforme son infrastructure Kafka [honeycomb.io/blog/transforming-how-we-run-kafka-honeycomb](https://www.honeycomb.io/blog/transforming-how-we-run-kafka-honeycomb)

- Honeycomb est une plateforme d'observabilité dont Kafka est le coeur du pipeline d'ingestion, traitant des millions d'événements par seconde.
- L'entreprise a migré de Confluent Platform auto-hébergée vers Apache Kafka 4.1.1 en mode KRaft.
- Le nouveau cluster tourne sur AWS EKS avec Strimzi comme couche d'orchestration Kubernetes.
- Motivation principale : la récupération après remplacement de broker était passée de 8-12h à 48-72h avec l'ancienne stack.
- Confluent imposait aussi sa solution propriétaire de Tiered Storage, impossible à corriger en interne.
- Un incident de décembre 2025 ayant vidé un cluster a révélé une fenêtre d'opportunité pour migrer.
- La migration s'est faite progressivement sur six clusters, de dogfood jusqu'à la production.
- Les producteurs sont basculés avant les consommateurs, avec une courte fenêtre de downtime assumée entre les deux.
- Le stockage utilise des NVMe en instance store plutôt que de l'EBS pour minimiser la latence.
- interessant de voir une société reprendre en main sa compétence
- et de voir les contraintes de certaines fonctionalités propriétaires


### Cloud

AWS us-west-2 : panne réseau régionale et effet domino chez les fournisseurs SaaS [blog.incidenthub.cloud/aws-us-west-2-outage-jul-24-2026](https://blog.incidenthub.cloud/aws-us-west-2-outage-jul-24-2026)

- AWS us-west-2 (Oregon) est une région cloud majeure hébergeant de nombreux services et fournisseurs SaaS.
- Le 24 juillet 2026, une panne matérielle réseau a coupé la connectivité entre la région et le Seattle Metro pendant environ 20 minutes.
- Particularité notable, seule la couche de connectivité externe a été touchée, le trafic interne à la région a continué de fonctionner normalement.
- Après la réparation matérielle, une phase distincte de reconvergence des routes a de nouveau causé une connectivité intermittente pendant plusieurs dizaines de minutes.
- Les clients Direct Connect via EqSe2 ont subi une coupure bien plus longue que le reste, 1h17 au total.
- Neuf incidents chez sept fournisseurs ont cité explicitement AWS comme cause, dont SendGrid, SparkPost et NinjaOne.
- Fait marquant, les temps de rétablissement des fournisseurs tiers ont largement dépassé la durée de la panne AWS elle même.
- NinjaOne a mis 9h29 à se rétablir totalement, avec 150000 appareils tentant de se reconnecter simultanément freinés par des mécanismes de backoff et jitter.
- SparkPost a mis 6h45 à absorber l'arriéré de courriels accumulé pendant la coupure, avec encore 80 à 90 minutes de retard des heures plus tard.
- L'article recommande d'identifier ses dépendances en us-west-2 et de prévoir capacité et bascule, l'effet différé pouvant durer bien plus longtemps que l'incident initial.

Rapport Cloudflare Radar sur les perturbations Internet au Q2 2026 [blog.cloudflare.com/fr-fr/q2-2026-internet-disruption-summary](https://blog.cloudflare.com/fr-fr/q2-2026-internet-disruption-summary/)

- Cloudflare Radar est la plateforme qui analyse en temps réel le trafic mondial pour détecter pannes, coupures et censures Internet.
- l'instabilité est le nouveau normal
- Le super-typhon Sinlaku a fait chuter le trafic de près de 80% à Guam les 13 et 14 avril.
- Deux séismes de magnitude 7,5 ont fortement dégradé la connectivité au Venezuela le 24 juin.
- Une coupure électrique a provoqué cinq heures de perturbation en Tanzanie le 27 juin.
- En Iran, la connectivité s'est stabilisée à 59% du niveau normal après 88 jours de coupure.
- Le Soudan a imposé dix coupures programmées pendant les examens nationaux mi-avril.
- L'Irak a coupé Internet à trois reprises pour lutter contre la fraude aux examens.
- Des frappes de drones ont endommagé la région AWS me-central-1 aux Émirats arabes unis.
- Un renouvellement de clés DNSSEC a rendu les sites .de inaccessibles en Allemagne le 5 mai.
- Une rupture de câble sous-marin a fait chuter le trafic de 60% à Sainte-Lucie fin juin.
- l'instabilité est le nouveau normal

Un ingénieur Google débranche une zone entière de Google Cloud [https://www.theregister.com/off-prem/2026/09/04/google-engineer-unplugged-every-fiber-they-could-see-and-surprise-took-down-a-chunk-of-the-g-cloud/5294418](https://www.theregister.com/off-prem/2026/09/04/google-engineer-unplugged-every-fiber-they-could-see-and-surprise-took-down-a-chunk-of-the-g-cloud/5294418)

- Google Cloud est la plateforme d'infrastructure cloud de Google, organisée en régions et zones de disponibilité comme us-central1.
- Le 1er septembre 2026, un ingénieur a débranché par erreur des câbles fibre optique lors d'une opération de maintenance matérielle routinière dans la zone us-central1-b.
- En 13 minutes, il a déconnecté 100 % des chemins de fibre optique de tous les équipements de cette portion de la zone.
- Les machines virtuelles hébergées dans la zone touchée sont devenues injoignables, avec une perte de paquets élevée.
- Le taux de chute du trafic réseau pour les ressources concernées a atteint 100 %.
- L'incident a duré 4 heures et 11 minutes, de 7h41 à 11h52 heure du Pacifique.
- Google a détecté l'anomalie, reroute le trafic, identifié les liaisons optiques débranchées puis rebranché physiquement les fibres avant le retour à la normale.
- Les post-mortems d'incident cloud sont un classique du podcast, mais l'erreur humaine sur du câblage physique chez un hyperscaler mérite une minute d'antenne.

ChatGPT, Claude et Grok en panne presque simultanément le 3 septembre [theregister.com/ai-and-ml/…/5294322](https://www.theregister.com/ai-and-ml/2026/09/03/chatgpt-claude-and-grok-all-had-outages-at-the-same-time/5294322)

- ChatGPT, Claude et Grok sont les assistants IA et coding agents désormais utilisés au quotidien par de nombreux développeurs.
- xAI loue ses datacenters à un certains nombre de fournisseurs de cloud et d'IA.
- ils ont fait tombé ses concurrents :slightly_smiling_face:
- Arreter là
- Le 3 septembre 2026, les trois services sont tombés en panne quasiment en même temps.
- ChatGPT a connu une panne de 7h43 à 8h17 PT, soit environ 34 minutes, due à une erreur de routage rendant ChatGPT et Codex indisponibles.
- Claude a subi une panne partielle de 3 heures et 6 minutes touchant [Claude.ai](http://Claude.ai), Claude Code, Claude Cowork et l'API Claude, résolue à 16h16 UTC.
- xAI a commencé à enquêter sur les problèmes de Grok dès 6h30 PT, puis SpaceX a confirmé une panne de son centre de calcul de Memphis.
- La coïncidence des trois pannes a fait suspecter un fournisseur commun à l'origine du problème.
- Pour les développeurs devenus dépendants de ces coding agents, l'épisode illustre le risque d'un point de défaillance unique
- xAI loue ses datacenters à un certains nombre de fournisseurs de cloud et d'IA.


### Web

Nouveautés CSS 2026 : mixins, masonry natif et animations pilotées par le scroll [modern-css.com/whats-new-in-css-2026](https://modern-css.com/whats-new-in-css-2026/)

- `animation-timeline: scroll()` et `view()` atteignent le baseline cross-browser, Firefox et Safari ayant livré le support complet. Plus besoin de préfixes ni de librairie JS.
- `@starting-style` devient cross-browser : animations d'entrée depuis `display: none` sans hack de timing JS.
- Firefox 147 amène l'anchor positioning au baseline, plus les view transition types et la Navigation API.
- Les menus contextuels via popover CSS arrivent aussi.


### Data et Intelligence Artificielle

Guillaume a porté le SDK Python d'Antigravity en Java... en utilisant Antigravity lui même comme assistant !
[glaforge.dev/posts/…/the-unofficial-antigravity-sdk-for-java](https://glaforge.dev/posts/2026/07/31/the-unofficial-antigravity-sdk-for-java/)

- SDK Java non officiel pour Antigravity, rétro-ingénierie du SDK Python pour exploiter un binaire Go sous-jacent.
- Cas d'usage : pipelines CI/CD, applications d'entreprise (Spring Boot), outils internes, surveillance en arrière-plan, interfaces personnalisées.
- Gestion des ressources : implémente `AutoCloseable`(try-with-resources) pour lancer et fermer proprement le processus Go.
- Exécution de code Java personnalisé : exposition de méthodes Java comme outils IA via les annotations `@Tool`et`@Param`.
- Streaming et programmation réactive : prise en charge des `CompletableFuture`, des callbacks (`chatStream`), et de`Flow.Publisher`.
- Fonctionnalités avancées : persistance de session, protocole MCP, politiques de sécurité, entrées multimodales, et sorties structurées mappées sur des records Java.

Le SDK Java pour le protocol Agent2Agent sort sa version 1.2.0
[medium.com/google-cloud/a2a-java-sdk-1-2-0-final-released…](https://medium.com/google-cloud/a2a-java-sdk-1-2-0-final-released-101f7a28bf0b)

- Prise en charge de la **spécification A2A 1.0**.
- **Sécurité renforcée** : Vérification stricte des autorisations de lecture sur les tâches référencées et implémentation d'une logique de blocage par défaut (_fail-closed_).
- **Intégration facilitée** : Support du câblage programmatique des autorisations pour les environnements non-CDI (comme Spring).
- **Contrôle des flux** : Ajout du _Task Stream Lifecycle Hook_ pour surveiller et gérer le cycle de vie des abonnements aux flux d'événements.
- **Stabilité des données** : Immutabilité stricte imposée sur les enregistrements de spécifications pour empêcher toute modification accidentelle.
- **Documentation** : Lancement d'une documentation web multi-versions et d'un Javadoc agrégé pour tous les modules.
- **Corrections de bugs** : Résolution de problèmes liés à la synchronisation des tâches, aux réponses de streaming et aux conditions de concurrence HTTP.
- **Breaking changes** : Nécessite une migration suite à la modification de certaines méthodes d'autorisation, la réorganisation de packages et le renommage de l'état `TaskState.UNRECOGNIZED` en `TaskState.TASK_STATE_UNSPECIFIED`.
- Article sur le blog de JetBrains : [blog.jetbrains.com/idea/2026/08/intellij-idea-goes-lsp](https://blog.jetbrains.com/idea/2026/08/intellij-idea-goes-lsp/)
- pas trop de temps

Langchain4j continue sa progression [github.com/langchain4j/langchain4j/…/1.18.0](https://github.com/langchain4j/langchain4j/releases/tag/1.18.0) [github.com/langchain4j/langchain4j/…/1.19.0](https://github.com/langchain4j/langchain4j/releases/tag/1.19.0) [github.com/langchain4j/langchain4j/…/1.17.0](https://github.com/langchain4j/langchain4j/releases/tag/1.17.0)

- Introduction du pattern Debate pour lancer des sous agents dans rechercehnt et entrent dans un debat critique sur une decision  avant qu'un juge decide (1.17)
- compensation d'action d'un outil avec `@ReverseTool`  (1.17)
- Ajout du pattern Belief-Desire-Intention (1.18): belief est l'état du monde cru, desire est la liste des objectifs, intention est le plan pour avancer un ou plusieurs objectif
- Support d'un systeme crash resilient dans l'approche Human in the loop avec des checkpoints nestés (1.18)
- Support Open AI TextToSpeech (1.18)
- Support de Mistral batch chat (1.18)
- support MCP client 2026-07-28 (1.19)
- Anthromic batch chat et Google thinking mode (1.19)

Embabel atteint 1.0 GA [github.com/embabel/embabel-agent/…/v1.0.0](https://github.com/embabel/embabel-agent/releases/tag/v1.0.0)

- embabel d'eloigne de Spring AI ne s'appuie que sur Spring (notamment tool calling)
- nettoyage des explorations autour du pattern GOAL avant a 1.0
- ajout observabilite (dont le cout)
- les approches de retry solidifiées
- et d'autres choses
- toujours basées sur la description de goals typés et des dependences entre eux via les types

MCP 2026-07-28 : le protocole devient stateless [blog.modelcontextprotocol.io/posts/2026-07-28](https://blog.modelcontextprotocol.io/posts/2026-07-28)

- MCP (Model Context Protocol) est le protocole standard permettant aux LLM et agents IA de communiquer avec des outils, ressources et serveurs externes.
- Cette version marque le plus gros changement depuis le lancement du MCP distant il y a 18 mois.
- Le protocole passe d'un modèle bidirectionnel avec état à un modèle stateless en requête/réponse.
- Suppression de la poignée de main initialize/initialized et du header Mcp-Session-Id, chaque requête devient autoportante.
- N'importe quelle requête peut désormais être routée vers n'importe quelle instance de serveur derrière un load balancer classique, sans stockage partagé.
- Introduction des Multi Round-Trip Requests (MRTR) pour remplacer les requêtes initiées par le serveur, via un resultType input_required et des inputResponses.
- Nouveaux headers Mcp-Method et Mcp-Name pour permettre aux gateways de router et autoriser sans parser le JSON.
- Les résultats de tools, prompts et resources deviennent cacheables grâce aux paramètres ttlMs et cacheScope.
- Renforcement sécurité avec la validation d'issuer RFC 9207 pour éviter les attaques de confusion entre serveurs d'autorisation, et transition de DCR vers CIMD.
- Roots, Sampling et Logging sont dépréciés avec douze mois de support garanti, tout comme le transport legacy HTTP+SSE.

Un site qui référence les skills pour la JVM (framework, langage, build...)
[jvmskills.com](https://jvmskills.com/)

- Frameworks : Spring, Quarkus, Jakarta EE, Reactor, Camel
- Java : bonne pratiques, conventions, guides de mise à jour à niveau LTS, API spécifiques (streams, optionals, logs...)
- Bases de données : ORM, validation, modélisation PostgreSQL, vectorielle avec pgvector
- Tests et qualité : TDD, mutation testing, debogage avec JDB
- Workflows dev et archi : commits git, domain modeling
- Outils et diagnostics JVM : JFR, Jstall, JSpecify

Une skill n’est pas une librairie [https://devx.writizzy.blog/p/un-skill-nest-pas-une-lib](https://devx.writizzy.blog/p/un-skill-nest-pas-une-lib) 

- Les skills sont des éléments de configuration en prose pour agents IA comme Claude, distribués via des marketplaces à la manière de librairies logicielles.
- Frédéric Camblor critique cette analogie car partager un skill n'est pas la même chose que le mutualiser durablement.
- Écrire un skill prend 30 minutes mais l'adopter ailleurs coûte cher en appropriation et en maintenance.
- Forker un skill s'avère souvent plus efficace que de chercher à converger vers une version commune.
- Contrairement au code, les régressions d'un skill ne sont pas détectables automatiquement.
- Un skill peut se dégrader silencieusement sur plusieurs cas d'usage en corrigeant un autre.
- Les skills vieillissent vite car les modèles progressent et intègrent naturellement certaines bonnes pratiques.
- Le skill-creator d'Anthropic permet d'évaluer un skill via des jeux de cas et des mesures de variance.
- L'auteur distingue quatre sphères de partage : personnelle, équipe, outil et marketplace.
- Il propose un cycle partage puis appropriation puis duplication puis divergence plutôt qu'une installation collective figée.

Les modèles Anthropic introduisent un filigrane (watermark) dans les textes qu’ils génèrent [https://www.anthropic.com/news/claude-text-watermark](https://www.anthropic.com/news/claude-text-watermark) 

- Claude est l'assistant IA d'Anthropic, et le watermarking est une technique permettant de marquer discrètement un contenu généré par IA pour en tracer l'origine.
- Anthropic annonce que les futurs modèles Claude intégreront un filigrane numérique invisible dans le texte généré.
- Le principe exploite les choix de mots équivalents que le modèle fait naturellement, en les orientant via une clé cryptographique plutôt qu'un tirage aléatoire.
- Le texte produit reste indiscernable à l'œil nu, sans caractères cachés, sans ralentissement ni coût supplémentaire.
- Seule la personne possédant la clé correspondante peut détecter la présence du filigrane.
- Le filigrane est plus fiable sur les textes longs et créatifs, moins sur du texte factuel, du code ou après une édition manuelle poussée.
- Il ne prouve pas qu'un texte est écrit par IA, ni n'identifie l'auteur ou la conversation d'origine, il donne seulement une probabilité d'implication de Claude.
- Une API de détection est proposée en accès restreint aux régulateurs, forces de l'ordre, médias et vérificateurs de faits.
- Pour les fichiers non textuels comme les images ou les PDF, Anthropic s'appuie sur le standard C2PA.
- Cette initiative s'inscrit dans le Code de Pratique de l'UE sur la transparence des contenus IA, signé par Anthropic et environ 190 autres acteurs, en lien avec la loi européenne sur l'IA.

GPT-6 Astra, le nouveau modèle d'OpenAI face à Claude Fable 5.1 [https://openai.com/index/gpt-6-astra/](https://openai.com/index/gpt-6-astra/)

- GPT-6 Astra est le nouveau modèle phare d'OpenAI, annoncé le 3 septembre 2026 comme le plus intelligent et le plus aligné de l'entreprise.
- Le modèle arrive deux jours après Claude Fable 5.1, à un tarif affiché comparable, dans une course accélérée aux modèles de code et de raisonnement.
- Astra revendique 98 % sur FrontierMath Tier 4, 99,9 % sur ARC-AGI-3 et 100 % sur ExploitBench.
- Fenêtre de contexte d'environ 1,05 million de tokens.
- Tarification API, 10 dollars par million de tokens en entrée, 50 dollars en sortie, et 1 dollar par million pour les tokens en cache.
- Au-delà de 272 000 tokens en entrée, toute la requête est facturée au double sur l'entrée et une fois et demie sur la sortie.
- Astra est le premier modèle d'OpenAI à franchir le seuil interne critique en cybersécurité.
- La version publique refuse les tâches offensives avancées comme générer des preuves de concept d'exploits.
- Le déploiement est progressif, les entreprises du programme de cybersécurité Daybreak d'OpenAI y accèdent en premier, avant ChatGPT Plus, Pro, Business, Enterprise, l'API et AWS.
- Même logique de diffusion contrôlée que chez Anthropic avec Mythos 5.1 : deux jours d'écart, deux modèles de tête, et la même question de savoir qui accède en premier aux capacités les plus sensibles.


### Outillage

JetBrains s'est lancé dans les LSP (Language Server Protocol) avec une extension IntelliJ pour VS Code et assimilés
[marketplace.visualstudio.com/items?itemName=JetBrains.intellij-s…](https://marketplace.visualstudio.com/items?itemName=JetBrains.intellij-server)

- **Nouveau produit :** Lancement de l'extension **Java &amp; Kotlin by IntelliJ IDEA** pour les éditeurs basés sur VS Code (incluant Cursor).
- **Technologie :** Utilisation du standard **LSP** (Language Server Protocol).
- **Objectif :** S'adapter au développement piloté par les agents IA, qui nécessite des fonctionnalités IDE légères et standardisées.
- **Fonctionnalités clés :**
  - Support des projets Java, Kotlin et mixtes.
  - Débogage (DAP).
  - Complétion intelligente, navigation et analyse de code.
  - Refactoring.
  - Prise en charge de Maven, Gradle et Bazel.
- **Disponibilité :** Téléchargeable via le Visual Studio Marketplace et l'Open VSX registry.
- **Licence / Prix :**
  - **Gratuit** durant la phase de _preview_ (évaluation renouvelable de 30 jours).
  - Nécessitera un abonnement **IntelliJ IDEA Ultimate** après la _preview_.
  - _(Note : Le LSP purement Kotlin reste gratuit et open-source)._
- **Avenir :** Développement en cours pour optimiser les flux de travail avec les agents IA en ligne de commande (ex: Claude Code, Codex) afin de réduire la consommation de tokens.

Après son acquisition par SpaceX, Cursor perd l'accès aux modèles OpenAI [https://openai.com/index/our-decision-on-cursor-following-its-acquisition-by-spacex/](https://openai.com/index/our-decision-on-cursor-following-its-acquisition-by-spacex/) 

- decision difficile
- mais Elon ment comme un arracheur de dent
- (et c'est un competiteur donc bon ça nous arrange)

David Pilato a créé un thème spéciale pour les gens pour les devrel, ou qui font des talks à droite à gauche, pour le moteur Hugo
[https://david.pilato.fr/posts/2026-09-07-hugo-theme-devrel/](https://david.pilato.fr/posts/2026-09-07-hugo-theme-devrel/)

- hugo-theme-devrel, thème Hugo (MIT) pour Developer Advocates et conférenciers, fonctionnant comme un module superposé au thème Dream.
- Gestion des conférences (cartes Leaflet), présentations (PDF, YouTube, co-auteurs), vues dédiées (archives, sujets récurrents, vidéos) et recherche Pagefind.
- Chaque intervention est un page bundle YAML structuré comme une base de données relationnelle compilée par Hugo.


### Architecture

Airbnb refond son authentification en architecture server-driven, 60 % de code en moins [https://www.infoq.com/news/2026/09/airbnb-server-driven-login/](https://www.infoq.com/news/2026/09/airbnb-server-driven-login/)

- Airbnb a restructuré son authentification autour d'un modèle en deux phases, identification du compte (email, téléphone ou connexion sociale) puis choix du challenge d'authentification décidé côté serveur selon le contexte utilisateur.
- Ce qui est interessant c'est que choisir la method d'authentification est côté serveur et adaptative, comme si c'était une révolution
- Arreter là
- Un moteur de politique serveur sélectionne la méthode d'authentification optimale avec des solutions de repli, permettant des adaptations régionales comme l'OTP WhatsApp au Brésil ou des fournisseurs d'identité locaux en Corée du Sud sans nouvelle version client.
- Un Challenge Picker propose des méthodes alternatives classées par probabilité de succès en cas d'échec.
- Résultat chiffré, 60 % de code d'authentification en moins et 100 Ko de moins sur le bundle client web.


### Méthodologies

Les nouvelles règles d'ingénierie du contexte pour les modèles Claude 5 [x.com/trq212/status/2080710971228918066](https://x.com/trq212/status/2080710971228918066)

- Partage par Thariq des apprentissages sur l'ingénierie du contexte et le prompt engineering pour les nouveaux modèles Claude 5 (comme Claude Opus 5 et Claude Fable 5) utilisés dans Claude Code.
- Évolution majeure vers le dés-empirement (unhobbling) : plus de 80 % du prompt système de Claude Code a pu être supprimé sans perte sur les évaluations de code, les modèles récents faisant preuve d'un bien meilleur jugement contextuel.
- Passage des règles strictes au jugement : au lieu d'interdire les commentaires ou d'imposer des contraintes lourdes, les modèles s'adaptent désormais au code environnant et font appel à leur propre discernement.
- Remplacement des exemples par la conception d'interfaces : fournir des exemples figés restreint l'exploration du modèle, d'où l'importance de concevoir des outils et des fichiers plus expressifs.
- Adoption de la divulgation progressive (progressive disclosure) : chargement dynamique du contexte (via des compétences ou des outils à chargement différé comme ToolSearch) pour éviter de saturer la fenêtre de contexte avec des instructions fixes.
- Utilisation d'une mémoire automatique et de références riches (artefacts HTML, suites de tests, fonctions de référence) plutôt que de fichiers CLAUDE.md pléthoriques ou de consignes répétitives.
- Recommandation pour les fichiers CLAUDE.md et les Skills : les garder légers, se concentrer sur les pièges spécifiques (gotchas) du dépôt, et structurer les guides sous forme d'arborescences modulaires pour ne charger que le nécessaire.

Niveau d'adoption des agents IA de codage selon une étude de JetBrains
[blog.jetbrains.com/research/2026/08/ai-coding-agent-adoption-2026](https://blog.jetbrains.com/research/2026/08/ai-coding-agent-adoption-2026/)

- **Adoption massive** : 90 % des développeurs professionnels utilisent des agents d'IA de codage au moins une fois par semaine, et 68 % quotidiennement.
- **Claude Code domine** : Il devient le nouveau leader du marché avec 39 % d'adoption mondiale (47 % aux États-Unis), détrônant largement ses concurrents.
- **Déclin de GitHub Copilot** : L'ancien leader perd de sa superbe, passant de 29 % à 21 % d'adoption, bien qu'il conserve une très forte notoriété (79 %).
- **Percée de Codex** : Sa croissance est fulgurante, son taux d'adoption ayant été multiplié par 5 en quelques mois (de 3 % à 16 %).
- **Recul de Cursor** : L'outil connaît une légère baisse, passant de 18 % à 12 % d'adoption, principalement due à une forte chute sur le marché chinois.
- **Écosystème diversifié** : JetBrains AI atteint 9 % d'adoption. Des alternatives comme OpenCode (7 %) et Google Antigravity (6 %, mais très populaire en Inde à 15 %) continuent de s'implanter.

L'IA a cassé les hypothèses de la CI... ou pas [https://stack72.dev/ai-broke-the-assumptions-behind-ci/](https://stack72.dev/ai-broke-the-assumptions-behind-ci/)

- Paul Stack (ex-Pulumi) explique que l'intégration continue a toujours mêlé deux rôles distincts, exécuter la vérification du code et coordonner les fusions.
- avec les agents, la pression sur la CI augmente, car ils ne testent pas end to end tout le temps
- ils ont maintenant des workflows qui verifient tests, lint, revue d'agent etc dans un env local isolé
- donc c'est pre PR push
- Il propose de séparer vérification (exécution), attestations structurées (hash de commit, checksums SHA256) et CI, réduite à la validation et à la coordination des fusions.
- Sa thèse, les agents IA peuvent désormais vérifier tout le code localement avant même l'ouverture d'une pull request, ce qui bouleverse cet équilibre.
- l'attestation vient ensuite
- et la CI est une étape de vérification (attestation de commit et de tests et si branche a bougé, repart à l'execution)
- Martin Fowler, qui a repéré l'article dans ses Fragments du 1er septembre 2026, réplique que la vraie CI a toujours exigé une vérification locale avant de pousser le code.
- ca demande une chaine d'attestation forte
- quid de garder les metriques historique de CI


### Sécurité

France Passoire: une analyse sur les différents vols de données des services publics de ces dernières mois [https://www.cybernetica.fr/piratage-des-impots-comment-en-est-on-arrive-la/](https://www.cybernetica.fr/piratage-des-impots-comment-en-est-on-arrive-la/) 

- Analyse du piratage massif de la DGFiP et d'autres administrations françaises en 2026, révélateur de failles systémiques de cybersécurité de l'État.
- Intrusion détectée fin juin à la DGFiP, mais l'exfiltration de 678 000 entrées fiscales n'a été découverte qu'en août lors de leur mise en vente.
- Données volées : noms, revenu fiscal de référence, taux de prélèvement, adresse, téléphone.
- Une seconde attaque du même pirate a visé le cadastre fin juillet, exposant plus de 2 millions de personnes.
- L'Éducation nationale a aussi été piratée fin juillet, données de tous les agents depuis 2001 exposées.
- Cause principale : modèle de sécurité fondé sur le périmètre physique plutôt que sur le zero trust, sans contrôle après authentification.
- Le télétravail post Covid a étendu les accès distants sans reconstruire les modèles de confiance.
- Aucun système de détection d'exfiltration n'existait, la fuite n'a été révélée que par le pirate lui-même.
- La transposition de la directive NIS2 est bloquée en France depuis septembre 2025, la CJUE a condamné le pays à des astreintes.
- L'article souligne un désengagement croissant des Etats-Unis en matière de cybersécurité internationale et une dépendance technologique accrue de la France.


### Loi, société et organisation

Ce que l'IA change vraiment au métier de manager [shapeandship.ai/p/ce-que-lia-change-vraiment-au-metier-de-manager](https://www.shapeandship.ai/p/ce-que-lia-change-vraiment-au-metier-de-manager)

- Retour d'expérience et analyse par Mathilde Rigabert sur l'impact réel de l'IA générative dans le quotidien d'un Engineering Manager.
- L'IA excelle pour automatiser la reconstitution factuelle de l'activité (lecture de PRs, commits, reviews) nécessaire aux 1:1 et entretiens annuels, mais elle offre une vision uniquement quantitative et nécessite d'être croisée avec des notes de terrain.
- L'IA rend le maintien de la qualité et des standards plus difficile : selon une étude Faros AI sur 22 000 développeurs, les PRs mergées sans aucune revue ont augmenté de 31 %, fragilisant la compréhension commune apportée par le pairing et les revues de code.
- Le temps gagné par l'IA ne permet pas d'augmenter massivement le span of control (seulement 2 ou 3 personnes de plus), car l'IA compresse la collecte d'informations mais pas les conversations humaines complexes ou l'accompagnement du changement.
- Les compétences d'orchestration et de gestion de sujets multiples acquises par les managers facilitent leur transition vers le pilotage de plusieurs agents IA en contribution individuelle.
- Le piège actuel réside dans l'accumulation des casquettes (manager, tech lead, product owner, contributeur, pompier), conduisant à l'épuisement et au délaissement du travail de fond sur l'organisation et l'humain.
- Le temps libéré par l'IA doit être réinvesti dans le travail invisible qui fait tenir le système (suivi des actions de rétro, analyse de métriques, coaching), que personne ne réclame à court terme mais dont l'absence fragilise les équipes à long terme.

Je regrette d'avoir migré vers Codeberg [xn--gckvb8fzb.com/i-regret-migrating-to-codeberg](https://xn--gckvb8fzb.com/i-regret-migrating-to-codeberg/)

- L'auteur explique pourquoi il regrette d'avoir quitté GitHub pour Codeberg, à la suite des récentes modifications des conditions d'utilisation (ToS) de la plateforme.
- Codeberg a interdit les projets principalement générés par des LLM ainsi que les projets liés aux cryptomonnaies via des propositions de l'Assembly 2026, au motif qu'ils nuisent à sa réputation. [blog.codeberg.org/protecting-our-floss-commons-from…](https://blog.codeberg.org/protecting-our-floss-commons-from-llms.html)
- Critique de l'argument de Codeberg sur l'absence de communauté des vibe coders, en rappelant que la majorité des logiciels libres (FOSS) sont créés par des développeurs solos sans communauté au sens romancé du terme.
- Ironie soulignée concernant la posture de Codeberg et Forgejo, qui a hérité de la communauté de Gitea après un hard fork avant de faire la leçon aux développeurs individuels.
- Alerte sur le risque de censure idéologique : interdire des catégories entières plutôt que de traiter les abus réels ou la consommation d'infrastructure crée un précédent dangereux pour une forge qui se veut libre.
- Proposition de solutions alternatives pour gérer l'impact des LLM et de la crypto : déclaration obligatoire via des cases à cocher, hébergement sur des tiers d'infrastructure spécifiques payants ou sous quotas, et disclaimers automatiques.
- Décision de l'auteur de quitter Codeberg pour mettre en place son propre serveur Git personnel afin d'éviter la dépendance à une plateforme qui modifie ses règles de manière unilatérale.

Cloud souverain : Airbus choisit Scaleway pour l’hébergement de ses applications critiques  [https://www.usine-digitale.fr/aeronautique-spatial/airbus/cloud-souverain-airbus-choisit-scaleway-pour-lhebergement-de-ses-applications-critiques.OHBVBMSZIJELNOKN6G5F6B7NSI.html](https://www.usine-digitale.fr/aeronautique-spatial/airbus/cloud-souverain-airbus-choisit-scaleway-pour-lhebergement-de-ses-applications-critiques.OHBVBMSZIJELNOKN6G5F6B7NSI.html) 

- Scaleway est le cloud provider français filiale du groupe Iliad, positionné comme alternative souveraine aux hyperscalers américains.
- Airbus a lancé un appel d'offres de six mois consultant une cinquantaine d'acteurs dont OVHcloud, Thales, Google S3NS et Microsoft Bleu.
- Scaleway a été retenu pour héberger les applications critiques liées à la conception d'aéronefs, l'ingénierie, la production industrielle et les opérations.
- Le contrat prévoit la migration d'environ 70 applications d'ici 2028, puis jusqu'à 900 applications sur 5 à 6 ans.
- Le montant du contrat n'a pas été communiqué.
- Scaleway revendique zéro actionnaire, zéro employé et zéro filiale hors Union européenne pour garantir une protection contre les lois extraterritoriales.
- Damien Lucas, PDG de Scaleway, évoque une immunité complète face aux évolutions politiques et législatives externes.
- La plateforme doit aussi accélérer les usages d'intelligence artificielle d'Airbus, avec les modèles de Mistral AI déjà déployés chez Scaleway.
- Catherine Jestin, responsable numérique d'Airbus, souligne que cette intégration accélère la démarche IA du groupe.
- Ce choix ne remet pas en cause la stratégie multicloud d'Airbus, Scaleway venant compléter les fournisseurs existants pour les charges nécessitant le plus haut niveau de gouvernance et de résilience.

Debian adopte une résolution sur l'usage responsable de l'IA générative [lwn.net/Articles/1091231](https://lwn.net/Articles/1091231/)

- La discussion sur l'usage des LLM dans Debian s'est tenue du 23 juillet au 13 août 2026, suivie d'un vote du 15 au 28 août 2026.
- 1045 développeurs Debian étaient éligibles à voter, avec un quorum de 48,49 votes largement dépassé par les huit options en lice.
- Les options allaient d'une interdiction stricte des contributions générées par LLM inscrite dans le contrat social à une acceptation encadrée des contributions IA.
- L'option gagnante au classement Condorcet est Responsible Use of Generative AI, devant Allow AI-Assisted Contributions with conditions et A cautious approach to generative AI.
- Le texte adopté n'interdit ni n'encourage l'usage d'outils d'IA générative dans le développement de Debian.
- Il exige que toute contribution, quels que soient les outils utilisés pour la produire, respecte les mêmes standards de qualité, correction, maintenabilité et conformité légale.
- Les contributeurs doivent comprendre, relire, tester et si besoin modifier la production assistée par IA avant de l'intégrer à Debian.
- Les informations sensibles du projet ne doivent pas être transmises à des fournisseurs d'IA non fiables, et la divulgation de l'usage de l'IA est encouragée sans être obligatoire.
- Le détail du vote et le texte complet de la résolution sont disponibles sur la page officielle [[debian.org/vote/2026/vote_002](https://www.debian.org/vote/2026/vote_002)](http://debian.org/vote/2026/vote_002](https://www.debian.org/vote/2026/vote_002)).
- Contraste direct avec l'OpenJDK, qui a publié une politique interdisant le code généré par LLM (épisode 340), et avec l'auteur de jqwik qui a piégé sa librairie contre les agents.





## Conférences



## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>

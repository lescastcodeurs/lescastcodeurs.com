---
title: LCC 342 - Bun en Rust, TypeScript en Go
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 342
youtube: XZAffYHgdkg
mp3_length: 67128819
tweet: Bun en Rust, TypeScript en Go #Bun #Rust #TypeScript #ClaudeCode #Java #COBOL #BDD #JakartaEE #BigDecimal
# tweet size: 91-93 -> 99-101 #######################################################################
---
Bun quitte Zig pour Rust en 11 jours à coups de Claude Code, pour 165 000$ payés par Anthropic : la réaction du créateur de Zig ne se fait pas attendre. TypeScript 7 débarque, réécrit en Go, 8 à 12x plus rapide. Entre les deux, Vidocq réimplémente Jakarta EE en souverain, le COBOL met un uppercut aux microservices, et un CTO demande à son équipe combien de temps il lui faudrait pour revenir à sa vélocité antérieure sans Claude Code. De quoi réfléchir avant le prochain rewrite.

Enregistré le 17 juillet 2026

Téléchargement de l’épisode [LesCastCodeurs-Episode-342.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-342.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=XZAffYHgdkg).

## News


### Langages

Est-ce qu'on peut aussi utiliser des double, des longs, ou autre pour gérer les montants monétaires en Java ?
[https://blog.frankel.ch/bigdecimal-vs-double/](https://blog.frankel.ch/bigdecimal-vs-double/)

- double (IEEE 754)
  - Usage : Calculs scientifiques, métriques, statistiques.
  - Avantages : Très performant (matériel), idéal pour l'approximatif.
  - Risques : Erreurs d'accumulation, égalité (==) trompeuse, NaN / -0.0.
  - Bonnes pratiques : Utiliser une tolérance (epsilon ou ULP) pour comparer ; utiliser des algorithmes de sommation compensée (Kahan/Neumaier) pour la précision.
- BigDecimal
  - Usage : Finance, comptabilité, fiscalité (précision décimale stricte).
  - Avantages : Contrôle total des arrondis et de l'échelle.
  - Risques : Lent (allocations), immutabilité (risque de mauvaise réaffectation), confusion equals() vs compareTo().
  - Bonnes pratiques : Initialiser via String ou valueOf() ; utiliser compareTo pour l'égalité.
- Point fixe (long)
  - Usage : Trading, systèmes haute performance, paiements.
  - Avantages : Très rapide, déterministe, zéro allocation.
  - Risques : Gestion manuelle de l'échelle et des débordements (Math.addExact).
- Points de vigilance en production
  - Sérialisation (JSON) : Préférer les String pour BigDecimal pour éviter la perte d'échelle.
  - Atomicité : double n'est pas atomique ; utiliser volatile ou DoubleAdder (pour les compteurs).
  - Tests : Toujours définir un delta ou Offset pour les tests de flottants.
- Bibliothèques recommandées
  - Moneta (JSR 354) : Standard bancaire complet.
  - decimal4j : Optimisé pour le point fixe haute performance.
  - Apache Commons Numbers : Outils robustes pour la précision et les sommations.

Typescript 7 est de sortie
[devblogs.microsoft.com/typescript/announcing-typescript-7-0](https://devblogs.microsoft.com/typescript/announcing-typescript-7-0/)

- Performance majeure : Portage natif en Go offrant des gains de vitesse de 8x à 12x et une consommation mémoire réduite.
- Architecture optimisée : Utilisation du multithreading (mémoire partagée) et parallélisation native (analyse, vérification de types,émission).
- Nouvelles options de contrôle : Introduction des flags --checkers, --builders (parallélisation) et --singleThreaded (mode mono-cœur).
- Nouvel observateur de fichiers : Passage à une solution basée sur @parcel/watcher pour une meilleure réactivité et stabilité du mode --watch.
- Compatibilité et transition :
  - Compatible avec les bases de code TypeScript 6.0.
  - Utilisation du package @typescript/typescript6 recommandée pour maintenir des outils dépendants de l'ancienne API.
- Changements de configuration : Durcissement des défauts (ex: strict activé par défaut) et suppression de nombreuses options obsolètes (target: es5, baseUrl, etc.).
- Amélioration de l'expérience éditeur : Serveur de langage (LSP) plus stable avec une réduction de 80 % des erreurs et 60 % des crashs.
- Limitations actuelles : Support incomplet pour les frameworks utilisant des plugins de langage (Vue, Svelte, Astro, Angular) en attendant une API stable.

"Java, the documentary" est sur YouTube, retraçant l'histoire du langage
[youtube.com/watch?v=…](https://www.youtube.com/watch?v=ZqGSg4b_cZA)

- La vidéo n'était pas encore disponible à l'heure de l'enregistrement. Sortie officielle le 17 juillet.
- Avec des interviews de James Gosling, Brian Goetz, Venkat Subramaniam, et bien d'autres.


### Librairies

What's New in 8.0 - Hibernate [docs.hibernate.org/orm/8.0/whats-new](https://docs.hibernate.org/orm/8.0/whats-new/)

- L'intégration de Jakarta Persistence 4.0 apporte des nouveautés majeures comme `EntityAgent` (qui standardise la `StatelessSession`), les mappings de _result set_ en SQL natif, et de nouvelles options de configuration de session et de requêtes (_Session Creation Options_, _Query Options_).
- Le support de Jakarta Data 1.1 est ajouté pour les Hibernate Data Repositories, incluant l'intégration avec les requêtes statiques JPA4, les projections `@Select`, et les repositories asynchrones via Jakarta Concurrency ou Hibernate Reactive.
- L'introduction du _Graph-based Flushing_ remplace l'ancienne approche basée sur des heuristiques par un modèle de dépendances utilisant les contraintes relationnelles, afin d'améliorer la fiabilité des tris, la gestion des _batchs_ et les performances globales (bien que l'ancienne méthode reste temporairement disponible).
- L'API `ProcedureCall` a été améliorée pour faciliter le _casting_ des résultats (`asResultSetOutput`) et permettre la déclaration paresseuse (_lazy_) du mapping des `ResultSet`.
- Hibernate supporte désormais la sécurité au niveau de la ligne (_Row-Level Security_) de manière native pour les bases de données compatibles (PostgreSQL, Db2, SQL Server, CockroachDB) afin de gérer la visibilité en contexte multi-tenant.
- Une nouvelle méthode `getReference()` permet dorénavant de récupérer la référence d'une entité directement à partir de son _natural id_.
- Le mode _Safe Mode Validator_ (`hibernate.query.safe_mode_enabled=true`) fait son apparition pour bloquer les opérations risquées comme `sql()`, `function()` ou `column()` dans les requêtes HQL et Criteria, ce qui est particulièrement utile pour les applications exposées aux LLMs.
- La gestion des associations bidirectionnelles lors de la phase de _flush_ peut maintenant être prise en charge automatiquement par Hibernate (`hibernate.bidirectionality_management=true`), synchronisant la référence côté inverse de l'association.
- Le _Subselect Fetching_ est considérablement amélioré, supportant dorénavant les associations "to-one" pour le _bulk select fetching_ (au lieu de se limiter aux collections) et devenant une option de premier ordre via `FetchMethod.BY_SUBQUERY`.

Un des papas de Cucumber et Gherkin lance Var, une alternative pour le test et le BDD
[var.oselvar.com](https://var.oselvar.com/)

- Lancement de Vár : Nouvel outil de test créé pour pallier les défauts de Cucumber.
- Limites de Cucumber : Syntaxe Gherkin trop rigide, intégration difficile avec les exécuteurs de tests et support éditeur limité.
- Usage avec l'IA : Conçu spécifiquement pour vérifier que les agents IA respectent les intentions et spécifications de l'utilisateur.
- Fonctionnement : Utilisation du Markdown plutôt que du Gherkin ; sert à la fois de guide et d'outil de vérification.
- Développement assisté : Code et documentation générés en grande partie par Claude sous supervision humaine.
- Appel aux retours : Projet ouvert aux tests et aux critiques de la communauté.




### Web

Une nouvelle méthode HTTP : QUERY
[https://kreya.app/blog/new-http-query-method-explained/](https://kreya.app/blog/new-http-query-method-explained/)

- Méthode HTTP QUERY (RFC 10008) pour les recherches complexes.
- Problème : GET (limité par l'URL) vs POST (sémantique inadaptée).
- Avantages : Permet un corps de requête, sûr, idempotent et cacheable.
- Limites : Support infrastructurel faible, non partageable par lien, cache complexe.
- Usage : À réserver aux requêtes complexes si l'environnement le permet.

Comment je fais du design en tant que dev backend [eventuallycoding.com/p/comment-je-fais-du-design-en-tant-que-dev-backend](https://eventuallycoding.com/p/comment-je-fais-du-design-en-tant-que-dev-backend)

- Hugo Lassiège retrace l'évolution de son workflow de création d'interfaces en tant que développeur backend, depuis ses débuts avec Bootstrap jusqu'à l'ère de l'intelligence artificielle.
- L'article explique comment la structuration des éléments visuels a progressé grâce à l'Atomic Design, l'émergence des design systems et l'adoption des design tokens via un framework comme Tailwind.
- L'auteur détaille son processus actuel qui s'appuie fortement sur Claude Design pour générer et itérer sur des maquettes à partir d'un brief, d'un screenshot ou d'un design system de référence.
- Il aborde également le risque de slopification et de standardisation extrême apporté par ces outils, rappelant que si l'IA simplifie la technique, il reste crucial d'injecter de l'identité et de l'originalité pour éviter un web trop aseptisé.


### Data et Intelligence Artificielle

De l'utilisation de SKILL.md et de "loop engineering" pour augmenter sa productivité
[glaforge.dev/posts/…/of-skills-and-loops-with-ai-assistance](https://glaforge.dev/posts/2026/07/01/of-skills-and-loops-with-ai-assistance/)

- Les skills permettent d'encoder une procédure de manière répétable et automatisable
- Le loop engineering enlève l'humain de la boucle afin que l'agent atteigne un objectif donné de façon plus autonome
- Pour écrire des Codelabs (sorte de tutoriel guidé pas à pas) Guillaume a transformé une séance de création de codelab avec son agent préféré (Antigravity) en skill réutilisable pour l'écriture de ses prochains codelabs
- Il a également utilisé l'approche de "loop engineering" à la mode en ce moment pour que son agent IA compile, exécute, teste les instructions et le code de son codelab, pour qu'il soit complètement fonctionnel
- Gain estimé : passer de 2 jours de travail à moins de 2 heures !

Redeploying Claude Fable 5 [anthropic.com/news/redeploying-fable-5](https://www.anthropic.com/news/redeploying-fable-5)

- Anthropic a annoncé le rétablissement de l'accès à ses modèles Claude Fable 5 et Mythos 5, qui avaient été suspendus suite à des restrictions d'exportation imposées par le gouvernement américain le 12 juin 2026.
- Cette suspension faisait suite à un rapport d'Amazon démontrant une méthode pour contourner les garde-fous de Fable 5, lui permettant d'identifier et d'exploiter une vulnérabilité logicielle (un jailbreak).
- Pour y remédier, Anthropic a renforcé ses mécanismes de sécurité en déployant un nouveau classifieur capable de bloquer cette technique spécifique dans plus de 99 % des cas, acceptant en contrepartie une augmentation des faux positifs sur des requêtes bénignes.
- Face à l'absence de consensus sur l'évaluation des jailbreaks, Anthropic s'associe à Amazon, Microsoft, Google et d'autres partenaires pour développer un standard industriel évaluant la sévérité de ces failles selon quatre critères : gain de capacité, étendue du gain, facilité d'arsenalisation et découvrabilité.
- L'entreprise s'engage également à approfondir sa collaboration avec le gouvernement américain, notamment via des évaluations pré-déploiement, un partage rapide d'informations sur les failles, et des ressources dédiées à la recherche conjointe sur la sécurité de l'IA.


### Outillage

La réécriture de Bun en Rust et la réaction du créateur de Zig [bun.com/blog/bun-in-rust](https://bun.com/blog/bun-in-rust) et [andrewkelley.me/post/my-thoughts-bun-rust-rewrite.html](https://andrewkelley.me/post/my-thoughts-bun-rust-rewrite.html)

- Bun, le runtime JavaScript et TypeScript écrit à l'origine en Zig, a été entièrement réécrit en Rust pour des raisons de stabilité et de gestion de la mémoire.
- Cette migration massive d'un demi-million de lignes de code a été bouclée en seulement 11 jours grâce à l'utilisation intensive de Claude Code fonctionnant en parallèle, pour un coût d'API estimé à 165 000 dollars financé par Anthropic.
- Andrew Kelley, le créateur de Zig, a réagi publiquement en qualifiant l'ancienne base de code de Bun de "slop" remplie de hacks et de fuites mémoire accumulées par une course aux fonctionnalités.
- Kelley exprime son soulagement face à ce départ, expliquant que les plantages incessants de Bun devenaient un passif réputationnel toxique pour le langage Zig et sa fondation.
- Le rachat de Bun par Anthropic fin 2025 avait déjà mis fin aux donations financières de Bun envers la Zig Software Foundation, facilitant cette séparation.
- La nouvelle version Rust de Bun passe désormais la quasi-totalité des tests, réduit la taille du binaire et est déjà déployée de manière transparente en production dans Claude Code.

Nouveautés de Git 2.55 [github.blog/open-source/git/highlights-from-git-2-55](https://github.blog/open-source/git/highlights-from-git-2-55/)

- Support natif de FSMonitor sous Linux via inotify pour accélérer les commandes comme git status sur les grands dépôts
- Intégration de la compaction incrémentale MIDX (multi-pack index) dans git repack pour optimiser la réécriture des métadonnées
- Amélioration drastique des performances de génération des bitmaps et des pseudo-merge bitmaps lors des tâches de maintenance
- Nouvelle commande expérimentale git history fixup pour intégrer facilement des modifications locales dans un commit antérieur
- Possibilité d'exécuter des hooks configurés en parallèle pour optimiser le temps de build et de validation
- Utilisation d'un autostash automatique lors d'un git checkout -m en cas de conflit de fusion pour éviter de bloquer l'espace de travail
- Nouvelle commande git format-rev permettant de formater rapidement des commits reçus via l'entrée standard (stdin)
- Support du push simultané vers un groupe de remotes configuré
- Protection contre l'exécution de séquences de contrôle de terminal malveillantes via les flux de progression distants

Vidocq, une réimplémentation souveraine et sans dépendance de Jakarta EE et Microprofile
[vidocq.dev/posts/vidocq-a-sovereign-jakarta-ee-and-microprofile-runtime](https://vidocq.dev/posts/vidocq-a-sovereign-jakarta-ee-and-microprofile-runtime/)

- Lancement de Vidocq : Runtime Java open source complet, compatible Jakarta EE Core Profile et Souveraineté numérique : Projet européen hébergé sur Codeberg, sous licences EUPL 1.2, EPL 2 et GPL 2.0.
- Standardisation totale : Implémentation fidèle des spécifications (CDI, REST, JSON, etc.), validée par 5 650 tests TCK officiels.
- Sécurité radicale : Zéro dépendance externe et aucune bibliothèque tierce.
- Aucune manipulation de bytecode à l'exécution (« magie » générée à la compilation via JDK 25).
- Compatible JPMS, AOT, GraalVM et Leyden CDS.
- Disponibilité : Projet en phase alpha, code et documentation accessibles sur [vidocq.dev](http://vidocq.dev).
- Article complémentaire qui revient sur la genèse de Vidocq, en utilisant l'IA et les TCKs pour driver l'aspect spec-driven development [vidocq.dev/posts/the-story-of-vidocq](https://vidocq.dev/posts/the-story-of-vidocq/)

Le "selfware" : Guillaume s'est fait plais' en vibe-codant son propre éditeur de texte
[glaforge.dev/posts/…/selfware-building-my-own-text-editor-without-knowing-swift](https://glaforge.dev/posts/2026/07/16/selfware-building-my-own-text-editor-without-knowing-swift/)

- Concept de « Selfware » : création de logiciels conçus exclusivement pour soi-même, sans monétisation ni contraintes liées aux utilisateurs tiers.
- Le rôle de l'IA : les agents de programmation (comme Antigravity) suppriment la barrière technique de l'apprentissage des langages (Swift, APIs) pour les non-développeurs.
- Développement minimaliste : privilégier la performance et l'utilité directe (démarrage instantané, interface native) au détriment des fonctionnalités complexes (plugins, télémétrie, gestion de comptes).
- Absence de pression : libération des contraintes liées à la compatibilité, à la maintenance logicielle et aux retours utilisateurs ; le logiciel n'a besoin d'être « assez bon » que pour ses propres besoins.
- Incitation à l'autonomie : encourager la création d'outils sur mesure pour résoudre les frictions quotidiennes plutôt que de subir les limitations des logiciels commerciaux.


### Architecture

Le cobol a donné un uppercut au microservices  [https://freedium-mirror.cfd/@maahisoft20/your-microservices-lost-to-cobol-let-that-sink-in-8ce2e236d007](https://freedium-mirror.cfd/@maahisoft20/your-microservices-lost-to-cobol-let-that-sink-in-8ce2e236d007) 

- Retour d'expérience sur la migration d'un système COBOL vers des microservices cloud-native qui s'est soldée par un retour en arrière après avoir constaté que le traitement batch initial était plus rapide, moins cher et plus fiable
- Là où le batch COBOL traitait 2.4 millions d'enregistrements en 11 minutes, le système distribué modernisé à base de message queues, retries et Kubernetes prenait 47 minutes et tombait sous la charge
- COBOL brille par ses caractéristiques conçues spécifiquement pour la finance comme le calcul décimal précis sans floating point errors et l'absence totale d'overhead réseau, de conteneurs ou de cold starts
- Rappel que distribuer un système multiplie les points de défaillance silencieux et complexifie la gestion de la cohérence transactionnelle par rapport à une exécution locale séquentielle
- Une invitation à se demander si les projets de décomposition en microservices apportent réellement un gain de performance de bout en bout pour l'utilisateur final ou s'ils optimisent seulement le diagramme d'architecture


### Méthodologies

Ma meilleure question d'entretien Spring [beaufume.fr/articles/spring-interview](https://beaufume.fr/articles/spring-interview/)

- Florian beaufumé partage sa question d'entretien favorite pour évaluer des développeurs Spring de niveau intermédiaire à avancé : "Que pouvez-vous me dire sur le paramètre `spring.jpa.open-in-view` ?".
- Ce paramètre détermine l'activation du pattern Open Session In View (OSIV) qui, lorsqu'il est à `true` (la valeur par défaut dans Spring Boot), maintient l'un `EntityManager` JPA ouvert durant toute la requête HTTP.
- Si l'OSIV facilite le développement en évitant les fameuses `LazyInitializationException` lors de la sérialisation des entités en JSON, il pose d'importants problèmes de performance en provoquant des requêtes SQL non maîtrisées (comme le problème du N+1 select) en dehors de la couche service.
- Maintenir l'OSIV actif augmente également le temps de rétention des connexions au sein du pool de la base de données, limitant la scalabilité de l'application.
- La recommandation est de désactiver ce comportement en le positionnant à `false`, et de gérer explicitement le chargement des données requises au sein des transactions (via des DTOs, des requêtes `JOIN FETCH` ou des Entity Graphs) pour garder le contrôle sur les accès à la base de données.

10 points à retenir du rapport AI Engineering 2026 : The Acceleration Whiplash [faros.ai/blog/ai-acceleration-whiplash-takeaways](https://www.faros.ai/blog/ai-acceleration-whiplash-takeaways)

- L'IA a franchi un cap et est devenue l'auteur principal du code : le taux d'acceptation du code généré est passé de 20% à 60% dans les équipes étudiées par Faros AI.
- La vélocité métier est bien réelle, avec une augmentation de 66% des epics livrées et une hausse de 33,7% du throughput des tâches par développeur.
- Ce volume cache un code churn massif (+861%), ce qui signifie qu'une quantité énorme de code est supprimée ou remplacée peu après avoir été ajoutée.
- La qualité en aval se dégrade fortement : les bugs par développeur ont augmenté de 54% et le nombre d'incidents par pull request a explosé de 242,7%.
- Le processus de code review est complètement saturé, entraînant un temps médian de relecture multiplié par cinq et une augmentation de 31,3% des PRs mergées sans aucune revue.
- Le système repose de plus en plus sur les développeurs seniors qui subissent une "senior engineer tax", devant relire un volume insoutenable de code à l'apparence correcte mais structurellement fragile.
- Contrairement à certaines hypothèses récentes de DORA, une forte maturité DevOps ne protège pas les entreprises contre cette détérioration ; le "Acceleration Whiplash" frappe de la même manière les équipes très performantes.
- En résumé, les outils d'IA inondent les pipelines de livraison avec un volume de code pensé pour un rythme machine, alors que les systèmes de vérification reposent toujours sur un rythme de validation humain.



### Loi, société et organisation

Le coût d’une equipe d’engineering qui ne sait plus ce qu’elle fait dans un contexte d’augmentation de coût des coding agents [https://freedium-mirror.cfd/@developer_programmer/i-spent-47-000-on-claude-code-in-90-[…]-asked-me-one-question-and-i-couldnt-answer-it-af3b203f81bb](https://freedium-mirror.cfd/@developer_programmer/i-spent-47-000-on-claude-code-in-90-days-my-cto-asked-me-one-question-and-i-couldnt-answer-it-af3b203f81bb)

- Une équipe de 8 ingénieurs a vu sa vélocité de développement exploser en utilisant Claude Code de manière intensive, jusqu'à recevoir une facture d'API salée de 47 213 $ pour seulement trois mois d'utilisation.
- Face à cette dépense, la question piège du CTO n'était pas sur le montant, mais sur la dépendance : "Si nous arrêtions Claude Code demain, combien de temps faudrait-il pour que notre vélocité revienne à son niveau initial ?".
- L'auteur s'est rendu compte qu'il était incapable de répondre car son équipe, en particulier les profils juniors, avait commencé à perdre l'habitude de concevoir et d'implémenter des fonctionnalités complexes sans l'aide permanente d'un agent.
- Le deuxième risque stratégique soulevé est celui de la dépendance tarifaire et du vendor lock-in : si l'outil devient une infrastructure indispensable au quotidien, l'entreprise perd tout pouvoir de négociation face aux augmentations de prix de l'éditeur d'IA.
- Pour éviter que l'IA ne devienne une béquille qui atrophie les compétences de l'équipe, l'article suggère de poser des limites budgétaires strictes, d'organiser régulièrement des sprints sans IA ("AI-free sprints") et de concevoir des processus de développement portables.

Retour de Nicolas Delsaux sur jqwik qui donne une perspective plus complète

- concernant jqwik, il me semble que vous oubliez (comme tous les gens qui 
- parlent de LLM dans “l’industrie”) que l’auteur n’a pas fait ça juste 
- pour faire chier le monde, mais parce que ces outils ont des 
- externalités incroyablement négatives, ce dont l’auteur s’explique dans 
- son blog 
- ([blog.johanneslink.net/2026/06/09/the-jqwik-anti-ai-affair](https://blog.johanneslink.net/2026/06/09/the-jqwik-anti-ai-affair/))
- - Vous oubliez également de signaler que le ticket 
- ([github.com/jqwik-team/jqwik/issues/708](https://github.com/jqwik-team/jqwik/issues/708)) par lequel un 
- utilisateur se plaint de cette fonctionnalité a été écrit par un agent.
- - N’oubliez pas non plus que l’enthousiasme pour ces technologies n’est en 
- fait pas universel, et que ces technologies sont loin d’être inévitables 
- (les gains de vitesse ne sont, d’après circle CI - 
- [circleci.com/resources/2026-state-of-software-delivery](https://circleci.com/resources/2026-state-of-software-delivery/), pas des 
- gains de productivité )

OkHttp, Okio, Retrofit et SQLDelight rejoignent Commonhaus ! [commonhaus.org/activity/315.html](https://www.commonhaus.org/activity/315.html)

- La fondation Commonhaus, via une publication de Andres Almiray, annonce l'arrivée de quatre projets majeurs de l'écosystème Java et Kotlin : OkHttp, Okio, Retrofit et SQLDelight.
- Ces projets, initialement créés chez Square (devenu Block), sont désormais regroupés et gérés sous la bannière [lysine.dev](http://lysine.dev) au sein de la fondation.
- Jesse Wilson et Jake Wharton, créateurs et mainteneurs historiques de ces outils, rejoignent Commonhaus en tant que leaders de [lysine.dev](http://lysine.dev).
- Suite à leur départ de Block, ils expliquent avoir choisi Commonhaus pour offrir à leur immense communauté d'utilisateurs un cadre de gouvernance pérenne, stable et digne de confiance.





## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 28-30 août 2026 : [State of the Map](https://2026.stateofthemap.org/) - Champs-sur-Marne (France) 
- 4 septembre 2026 : [JUG Summer Camp 2026](https://www.jugsummercamp.org/) - La Rochelle (France) <a href="https://conference-hall.io/jug-summer-camp-2026"><img alt="CFP JUG Summer Camp 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-June-2026&color=red"></a>
- 10-11 septembre 2026 : [Nantes Craft](https://www.nantes-craft.fr/) - Nantes (France) <a href="https://conference-hall.io/nantes-craft-2026"><img alt="CFP Nantes Craft" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-June-2026&color=red"></a>
- 17 septembre 2026 : [dotAI](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-April-2026&color=red"></a>
- 17-18 septembre 2026 : [API Platform Conference 2026](https://api-platform.com/fr/con/) - Lille (France) <a href="https://api-platform.com/fr/con/2026/call-for-papers/"><img alt="CFP API Platform Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-March-2026&color=red"></a>
- 18 septembre 2026 : [WordCamp Bretagne](https://bretagne.wordcamp.org/2026/) - Rennes (France) <a href="https://conference-hall.io/wordcamp-bretagne"><img alt="CFP WordCamp Bretagne" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-July-2026&color=red"></a>
- 18 septembre 2026 : [dotJS](https://www.dotjs.io/) - Paris (France) <a href="https://www.dotjs.io/speak"><img alt="CFP dotJS" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-April-2026&color=red"></a>
- 18 septembre 2026 : [WordCamp Bretagne](https://bretagne.wordcamp.org/2026/) - Rennes (France) 
- 22 septembre 2026 : [Salon Data 2026](https://salondata.fr) - Nantes (France) <a href="https://sessionize.com/salon-data-2026/"><img alt="CFP Salon Data 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-May-2026&color=red"></a>
- 22-23 septembre 2026 : [Agile en Seine & IA 2026](https://www.agileenseine.com/) - Paris (France) <a href="https://sessionize.com/agile-en-seine-2026"><img alt="CFP Agile en Seine & IA 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-June-2026&color=red"></a>
- 24 septembre 2026 : [aMP Day Montpellier 2026](https://ampcommunity.online/amp-day-montpellier-2026/) - Montpellier (France) <a href="https://sessionize.com/ampday-montpellier-2026/"><img alt="CFP aMP Day Montpellier 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-July-2026&color=red"></a>
- 24 septembre 2026 : [OWASP AppSec Days France 2026](https://www.owaspappsecdays.fr/2026/) - Paris (France) <a href="https://sessionize.com/owasp-appsec-days-france-2026"><img alt="CFP OWASP AppSec Days France 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-May-2026&color=red"></a>
- 24 septembre 2026 : [PlatformCon Paris](https://platformconlive.fr/) - Paris (France) <a href="https://conference-hall.io/platformcon26-live-day-paris"><img alt="CFP PlatformCon Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2026&color=red"></a>
- 24 septembre 2026 : [React Native Connection 2026](https://reactnativeconnection.io/) - Paris (France) <a href="https://conference-hall.io/react-native-connection-2026"><img alt="CFP React Native Connection 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-June-2026&color=red"></a>
- 24-26 septembre 2026 : [Paris Web 2026](https://www.paris-web.fr) - Paris (France) <a href="https://appel.paris-web.fr/"><img alt="CFP Paris Web 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-April-2026&color=red"></a>  <img alt="Closed Captions" src="https://img.shields.io/static/v1?label=CC&message=Closed%20Captions&color=blue" />
- 25 septembre 2026 : [SAP Inside Track Paris 2026](https://sapcommunityparis.github.io/SITPAR2026) - Paris (France) <a href="https://sessionize.com/sit-paris-2026"><img alt="CFP SAP Inside Track Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-July-2026&color=red"></a>
- 28-29 septembre 2026 : [4th Tech Summit on AI & Robotics](https://artificialintelligence.averconferences.com/) - Paris (France) & Online <a href="https://artificialintelligence.averconferences.com/scientific_session.php"><img alt="CFP tech summit 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-March-2026&color=red"></a>
- 1 octobre 2026 : [WAX 2026](https://www.waxconf.fr/) - Marseille (France) <a href="https://conference-hall.io/wax-2026-conference-tech-au-stade-velodrome"><img alt="CFP WAX 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2026&color=red"></a>
- 1-2 octobre 2026 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) <a href="https://conference-hall.io/volcamp-2026"><img alt="CFP Volcamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-May-2026&color=red"></a>
- 2 octobre 2026 : [DevFest Perros-Guirec 2026](https://devfest.codedarmor.fr/) - Perros-Guirec (France) <a href="https://conference-hall.io/devfest-perros-guirec-2026"><img alt="CFP DevFest Perros-Guirec 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2026&color=red"></a>
- 5-9 octobre 2026 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) <a href="https://dvbe26.cfp.dev/"><img alt="CFP Devoxx Belgium" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-July-2026&color=green"></a>
- 8-9 octobre 2026 : [Forum PHP 2026](https://event.afup.org/) - Marne-la-Vallée (France) <a href="https://afup.org/event/forumphp2026"><img alt="CFP Forum PHP 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2026&color=red"></a>
- 12 octobre 2026 : [Dev With AI](https://www.devw.ai/) - Paris (France) 
- 22-23 octobre 2026 : [Agile Tour Bordeaux 2026](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2026"><img alt="CFP Agile Tour Bordeaux 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2026&color=red"></a>
- 26 octobre 2026 : [Agile Tour Montpellier](https://agiletourmontpellier.fr/) - Montpellier (France) <a href="https://conference-hall.io/atmtp26"><img alt="CFP Agile Tour Montpellier" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-June-2026&color=red"></a>
- 27-29 octobre 2026 : [Directions EMEA 2026](https://www.directionsforpartners.com/emea2026) - Paris (France) <a href="https://sessionize.com/directions-emea-2026"><img alt="CFP Directions EMEA 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-September-2026&color=green"></a>
- 29-30 octobre 2026 : [Campus Agile Grenoble](https://www.campus-agile.org/accueil) - Grenoble (France) <a href="https://www.campus-agile.org/Speakers"><img alt="CFP Campus Agile Grenoble" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2026&color=red"></a>
- 29-30 octobre 2026 : [BDX I/O 2026](https://bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/bdx-i-o-2026"><img alt="CFP BDX I/O 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-June-2026&color=red"></a>
- 29-30 octobre 2026 : [Agile Tour Nantais 2026](https://agilenantes.org/evenements/agile-tour-nantes/agile-tour-nantais-2026/) - Nantes (France) <a href="https://conference-hall.io/cloud-nord-2026"><img alt="CFP Agile Tour Nantais 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2022-June-2026&color=red"></a>
- 29 octobre 2026-1 novembre 2026 : [Pycon FR](https://www.pycon.fr/2026/) - Biarritz (France) 
- 30 octobre 2026 : [Cloud Nord 2026](https://cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/cloud-nord-2026"><img alt="CFP Cloud Nord 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-June-2026&color=red"></a>
- 4-5 novembre 2026 : [Devoxx Morocco](https://devoxx.ma/) - Casablanca (Morocco) <a href="https://dvma26.cfp.dev"><img alt="CFP of Devoxx Morocco" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-July-2026&color=red"></a>
- 14-15 novembre 2026 : [Capitole du Libre](https://capitoledulibre.org) - Toulouse (France) <a href="https://cfp.capitoledulibre.org/cdl-2026/cfp"><img alt="CFP Capitole du Libre 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-July-2026&color=green"></a>
- 19 novembre 2026 : [DevFest Toulouse 2026](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse-2026"><img alt="CFP DevFest Toulouse 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2026&color=red"></a>
- 19 novembre 2026 : [Agile Laval 2026](http://www.agilelaval.org/) - Laval (France) <a href="https://sessionize.com/agile-laval-2026"><img alt="CFP Agile Laval 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-July-2026&color=red"></a>
- 19 novembre 2026 : [OVHcloud Summit](https://summit.ovhcloud.com/en/) - Paris (France) 
- 19 novembre 2026 : [Codeurs en Seine](https://www.codeursenseine.com/2026) - Rouen (France) 
- 27 novembre 2026 : [DevFest Paris 2026](https://devfest.gdgparis.fr/) - Paris (France) <a href="https://conference-hall.io/devfest-paris-2026"><img alt="CFP DevFest Paris 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-July-2026&color=red"></a>
- 1-3 décembre 2026 : [Apidays Paris](https://www.apidays.global/paris) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP Apidays Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2026&color=green"></a>
- 2-3 décembre 2026 : [Cloud Native AI Summit Europe](https://www.cloudnative.ai/events/paris) - Paris (France) <a href="https://sessionize.com/cloud-native-summit-europe-2026/"><img alt="CFP Cloud Native AI Summit Europe" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-August-2026&color=green"></a>
- 4 décembre 2026 : [DevFest Lyon 2026](https://devfest.gdglyon.com/) - Lyon (France) <a href="https://conference-hall.io/devfest-lyon-2026"><img alt="CFP DevFest Lyon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-June-2026&color=red"></a>
- 4 décembre 2026 : [DevFest Dijon 2026](https://devfest.developers-group-dijon.fr/) - Dijon (France) <a href="https://conference-hall.io/devfest-dijon-2026"><img alt="CFP DevFest Dijon 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2026&color=red"></a>
- 9-10 décembre 2026 : [OpenSource Expérience](https://www.opensource-experience.com/) - Paris (France) <a href="https://pretalx.com/open-source-experience-2026/cfp"><img alt="CFP OpenSource Expérience" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-June-2026&color=red"></a>
- 9-10 décembre 2026 : [DevOps REX](https://www.devopsrex.fr/fr/) - Paris (France) <a href="https://www.devopsrex.fr/fr/cfp"><img alt="CFP DevOps REX" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-June-2026&color=red"></a>
- 10 décembre 2026 : [KCD Provence](https://cloudnative-provence.fr/) - Aix-en-Provence (France) <a href="https://conference-hall.io/kcd-provence-2026"><img alt="KCD Provence 2026" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-Sept-2026&color=green"></a>
- 10 décembre 2026 : [DevCon 28 : sécurité | post-quantique | hacking édition 2027](https://www.meetup.com/meetup-programmez/events/315681765/) - Paris (France) <a href="https://docs.google.com/forms/d/1kY8lmUZWrxXyghGAXz7b4yYenhxIl4nucrOTq_lAJQ4/edit"><img alt="CFP DevCon 28 : sécurité, post-quantique, hacking édition 2027" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-October-2026&color=green"></a>
- 14-16 janvier 2027 : [SnowCamp 2027](https://snowcamp.io/) - Grenoble (France) 
- 7-9 avril 2027 : [Devoxx France 2027](https://www.devoxx.fr/) - Paris (France) 
- 3 juin 2027 : [Cloud Native Days France 2027](https://www.cloudnativedays.fr/) - Paris (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

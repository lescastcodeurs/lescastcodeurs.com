---
title: LCC 319 - le ramasse-miettes-charognes
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 319
mp3_length: 50633366
tweet: Le ramasse-miettes-charognes #go #gc #jvm #micronaut #langchain4j #springai #llm #observabilite #attaquejavac
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode en audio et en vidéo (youtube.com/lescastcodeurs), Guillaume et Emmanuel discutent des 15 ans de Go,
d’une nouvelle approche de garbage collecting, de LLMs dans les applications Java, d’observabilité,
d’une attaque de chaine d’approvisionnement via javac et d’autres choses.

Enregistré le 13 décembre 2024

Téléchargement de l’épisode [LesCastCodeurs-Episode-319.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-319.mp3)

## News


### Langages

Go fête son 15ème anniversaire !
[https://go.dev/blog/15years](https://go.dev/blog/15years)

- Discute les 15 ans
- La correction de gotchas dans les `for` loops (notamment les variables étaient loop scoped).
- Le fait que la compilation échoue si on attend une version de go supérieure seulement depuis go 1.21, en parallèle de la gestion de la chaine d’outil (seulement en 2023 !).
- Opt-in telemetry aussi recent.

Construire OpenJDK à partir des sources sur macOS :
[https://www.morling.dev/blog/building-openjdk-from-source-on-macos/](https://www.morling.dev/blog/building-openjdk-from-source-on-macos/)

- de manière surprenante, ce n’est pas tres compliqué.

Papier sur l’approche Mark-scavenge pour un ramasse-miette :
[https://inside.java/2024/11/22/mark-scavenge-gc/](https://inside.java/2024/11/22/mark-scavenge-gc/)

- Papier de recherche.
- Utiliser l’accessibilité pour preuve de vie n’est pas idéal : un objet peut être atteignable mais ne sera jamais accédé par le programme. 
- Les régions les plus pauvres en objets vivants voient leurs objets bouger dans une autre region et la region libérée, c’est le comportement classique des GC.
- Deux méthodes : mark evaluate qui le fait en deux temps et la liveness peut évoluer ; et scavenge qui bouge l’objet vivant dès sa découverte.
- Ils ont fait tourner via ZGC des expériences pour voir les objets considérés vivants et bougés inutilement.
- Les résultats montrent un gros taux d’objets bougés de manière inutile.
- Proposent un algo different.
- Ils marquent les objets vivants, mais ne les bougent pas avant le prochain GC pour leur donner une chance de devenir unreachable.
- Élimine beaucoup de déplacements inutiles vu que les objets deviennent non accessible en un cycle de GC.
- Jusqu’à 91 % de reduction ! Particulièrement notable dans les machines chargées en CPU.

Les tokens d’accès court ou longs :
[https://grayduck.mn/2023/04/17/refresh-vs-long-lived-access-tokens/](https://grayduck.mn/2023/04/17/refresh-vs-long-lived-access-tokens/)

- Pourquoi des long access tokens (genre refresh token) sont utilisés pour des short lived dans OAuth 2.0.
- Refresh token simplifient la revocation : vu que seul le auth serveur a à verifier la révocation et les clients vérifient l’expiration et la validité de la signature.
- Refresh token ne sont envoyés qu’entre endpoints alors que les access tokens se baladent pas mal : les frontières de confiance ne sont pas traversées.
- Refresh token rarement utilisé, et donc peut être protegé dans une enclave.
- Les changements de grants sont plus simple tout en restant distribuables.
- Histoire des access refresh token et access token permet de mieux tracer les abus / attaques.
- Les inconvénients : c’est plus compliqué en flow, le auth serveur est un SPOF mais mitigeable.

Java Advent est de retour :
[https://www.javaadvent.com/calendar](https://www.javaadvent.com/calendar)

- Backstage.
- Java integrity par défaut (et ses conséquences sur l’écosystème).
- Timefold (solver).
- Les extensions JUnit 5.
- OpenTelemetry via Java Agent vs Micrometer.
- Analyse statique de code.
- CQRS et les fonctionnalités modernes de Java.
- Java simple (sans compilation, sans objet). 
- Fullstack dev with Quarkus as backend.

José Paumard introduit et explique les Gatherers dans Java 24 dans cette vidéo :
[https://inside.java/2024/11/26/jepcafe23/](https://inside.java/2024/11/26/jepcafe23/)



### Librairies

Micronaut 4.7, avec l’intégration de LangChain4j :
[https://micronaut.io/2024/11/14/micronaut-framework-4-7-0-released/](https://micronaut.io/2024/11/14/micronaut-framework-4-7-0-released/)


Combiner le framework de test Spock et Cucumber :
[https://www.sfeir.dev/back/spock-framework-revolutionnez-vos-tests-unitaires-avec-la-puissance-du-bdd-et-de-cucumber/](https://www.sfeir.dev/back/spock-framework-revolutionnez-vos-tests-unitaires-avec-la-puissance-du-bdd-et-de-cucumber/)

- Les experts peuvent écrire leurs tests au format Gherkin (de Cucumber) et les développeurs peuvent implémenter les assertions correspondantes avec l’intégration dans Spock, pour des tests très lisibles.

Spring 6.2 :
[https://spring.io/blog/2024/11/14/spring-framework-6-2-0-available-now](https://spring.io/blog/2024/11/14/spring-framework-6-2-0-available-now)

- Beans `@Fallback`.
- Améliorations sur SpELet sur le support de tests.
- Support de l’échappement des property placeholders.
- Une nouvelle initialisation des beans en tâche de fond.
- Et pleins d’autres choses encore.

Comment créer une application Java LLM tournant 100% en Java avec Jlama :
[https://quarkus.io/blog/quarkus-jlama/](https://quarkus.io/blog/quarkus-jlama/)

- Blog de Mario Fusco, Mr API et Java et Drools.
- Utilise Jlama + Quarkus + LangChain.
- Explique les avantages de l’approche pure Java comme le cycle de vie unique, tester les modèles rapidement, sécurité (tout est in process), monolithe ahahah, observabilité simplifiée, distribution simplifiée (genre appli embarquée)...

Vert.x 5 en seconde incubation :
[https://vertx.io/blog/eclipse-vert-x-5-candidate-2-released/](https://vertx.io/blog/eclipse-vert-x-5-candidate-2-released/)

- Support des Java modules (mais beaucoup des modules Vert.x eux-mêmes ne le supportent pas).
- Support io_uring dans Vert.x core.
- Le load balancing côté client.
- Le modèle des callbacks n’est plus supporté, vive les Futur !
- Beaucoup d’améliorations autour de gRPC.
- Et d’autres choses.

Un article sur Spring AI et la multi-modalité audio :
[https://spring.io/blog/2024/12/05/spring-ai-audio-modality](https://spring.io/blog/2024/12/05/spring-ai-audio-modality)

- Permet de voir les evolutions des APIs de Spring AI.
- S’appuie sur les derniers modèles d’Open AI.
- Des examples, comme un chatbot voix et donc comment enregistrer la voix et la passer à OpenAI.

Comment activer le support experimental HTTP/3 dans Spring Boot :
[https://spring.io/blog/2024/11/26/http3-in-reactor-2024](https://spring.io/blog/2024/11/26/http3-in-reactor-2024)

- C’est Netty qui fait le boulot.
- Puis Spring Netty.
- L’article décrit les étapes pour l’utiliser dans vos applis Spring Boot ou Spring Cloud Gateway.
- L’article explique aussi le côté client (app cliente) ce qui est sympa.


### Infrastructure

Un survol des offres d’observabilité :
[http://blog.ippon.fr/2024/11/18/observabilite-informatique-comprendre-les-bases-2eme-partie/](http://blog.ippon.fr/2024/11/18/observabilite-informatique-comprendre-les-bases-2eme-partie/)

- Un survol des principales offres d’observabilité.
- Open source ou SaaS.
- Et certains outsiders.
- Pas mal pour commencer à défricher ce qui vous conviendrait.
- Blog de ippon.



### Web

Sortie de Angular 19 :
[https://blog.ninja-squad.com/2024/11/19/what-is-new-angular-19.0/](https://blog.ninja-squad.com/2024/11/19/what-is-new-angular-19.0/)

- Stabilité des Signal APIs.
- Migration automatique vers Signal APIs.
- Composants standalone par défaut.
- Nouvelles APIs `linkedSignal` et `resource`.
- De grosses améliorations de SSR et HMR.

Angular 19 :
[https://www.sfeir.dev/front/angular-19-tout-ce-quil-faut-savoir-sur-les-innovations-majeures-du-framework/](https://www.sfeir.dev/front/angular-19-tout-ce-quil-faut-savoir-sur-les-innovations-majeures-du-framework/)

- Composant standalone par default (limiter les problèmes de dépendances), peut le mettre en strict pour le l’imposer (ou planter).
- Signalement des imports inutilisés.
- `@let` pour les variables locales dans les templates.
- `linkedSignal` (experimental) pour lier des signaux entre eux (cascade de changement suite à un événement).
- Hydratation incrémentale (contenu progressivement interactif avec le chargement sur les parties de la page visibles ou nécessaires).
- Et event replay, routing et modes de rendu hybride, Hot module replacement...

The State of Frontend — dernière compilation des préférences des développeurs en termes de front :
[https://tsh.io/state-of-frontend/](https://tsh.io/state-of-frontend/)

- React en tête, suivi de Vue et Svelte. Angular seulement 4ème.
- Côté rendering framework, Next.js a la majorité absolue, ensuite viennent Nuxt et Astro.
- Zod est la solution de validation préférée.
- Pour la gestion de date, date-fns est en tête, suivi par moment.js.
- Côté state management, React Context API en première place, mais les suivants sont tous aussi pour React !
- Grosse utilisation de Lodash pour plein d’utilités.
- Pour fetcher des resources distantes, l’API native Fetch et Axios sont les deux vainqueurs.
- Pour le déploiement, Vercel est premier.
- Côté CI/CD, beaucoup de Github Actions, suivi par Gitlab CI.
- Package management, malgré de bonnes alternatives, NPM se taille toujours la part du lion.
- Écrasante utilisation de Node.js comme runtime JavaScript pour faire du développement front.
- Pour ce qui est du typing, beaucoup utilisent TypeScript, et un peu de JSdoc, et la majorité des répondants pensent que TypeScript a dépassé JavaScript en usage.
- Dans les API natives du navigateur, Fetch, Storage et WebSockets sont les APIs les plus utilisées.
- La popularité des PWA devrait suivre son petit bonhomme de chemin.
- En termes de design system, shadcn/ui en tête, suivi par Material, puis Bootstrap.
- Pour la gestion des styles, un bon mix de plain old CSS, de Tailwind, et de Sass/CSS.
- Jest est premier comme framework de tests.
- Les 3/4 des développeurs front utilisent Visual Studio Code, quant au quart suivant, c’est JetBrains qui raffle les miettes.
- Pour le build, Vite récolte les 4/5 des voix.
- ESLint et Prettier sont les deux favoris pour vérifier le code.

Parfois, on aimerait pouvoir tester une librairie ou un framework JavaScript, sans pour autant devoir mettre en place tout un projet, avec outil de build et autre. Julia Evans explore les différents cas de figure, suivant la façon dont ces librairies sont bundlées.
[https://jvns.ca/blog/2024/11/18/how-to-import-a-javascript-library/](https://jvns.ca/blog/2024/11/18/how-to-import-a-javascript-library/)

- Certaines librairies permettent de ne faire qu’un simple import dans une balise script
- Certaines frameworks sont distribués sous forme d’Universal Module Definition, sous CommonJS, d’ESmodule.
- Franchement, en tant que noob, c’est compliqué quand même !


### Data et Intelligence Artificielle

L’impact de l’IA en entreprise et des accès aux documents un peu laxistes :
[https://archive.ph/uPyhX](https://archive.ph/uPyhX)

- L’indexing choppe tout ce qu’il peut.
- Et l’IA est très puissante pour diriger des requêtes et extraire les données qui auraient dû être plus restreintes.

Différentes manières de faire de l’extraction de données et de forcer la main à un LLM pour qu’il génère du JSON :
[https://glaforge.dev/posts/2024/11/18/data-extraction-the-many-ways-to-get-llms-to-spit-json-content/](https://glaforge.dev/posts/2024/11/18/data-extraction-the-many-ways-to-get-llms-to-spit-json-content/)

- L’approche “je demande gentiment” au LLM, en faisant du prompt engineering.
- En utilisant du function calling pour les modèles supportant la fonctionnalité, en particulier avant les approches de type “JSON mode” ou “JSON schema”.
- Ou effectivement si le modèle le supporte aussi, toujours avec un peu de prompting, mais en utilisant le “JSON mode” qui force le LLM a généré du JSON valide.
- Encore mieux avec la possibilité de spécifier un schema JSON (type OpenAPI) pour que le JSON en sortie soit “compliant” avec le schéma proposé.

Comment masquer les données confidentielles avec ses échanges avec les LLMs :
[https://glaforge.dev/posts/2024/11/25/redacting-sensitive-information-when-using-generative-ai-models/](https://glaforge.dev/posts/2024/11/25/redacting-sensitive-information-when-using-generative-ai-models/)

- Utilisation de l’API Data Loss Prevention de Google Cloud qui permet d’identifier puis de censurer / masquer (“redacted” en anglais) des informations personnelles identifiables (“PII”, comme un nom, un compte bancaire, un numéro de passeport, etc).
- Pour des raisons de sécurité, de privacy, pour éviter les brèches de données comme on en entend trop souvent parler dans les nouvelles.

On peut utiliser certains modèles d’embedding pour faire de la recherche de code :
[https://glaforge.dev/posts/2024/12/02/semantic-code-search-for-programming-idioms-with-langchain4j-and-vertex-ai-embedding-models/](https://glaforge.dev/posts/2024/12/02/semantic-code-search-for-programming-idioms-with-langchain4j-and-vertex-ai-embedding-models/)

- Guillaume recherche des bouts de code, en entrant une requête en langue naturel.
- Certains embedding models supportent différents types de tâches, comme question/réponse, question en langue naturelle / retour sous forme de code, ou d’autres tâches comme le fact checking...
- Dans cet article, utilisation du modèle de Google Cloud Vertex AI, en Java, avec LangChain4j.

Google sort la version 2 de Gemini Flash :
[https://blog.google/technology/google-deepmind/google-gemini-ai-update-december-2024/](https://blog.google/technology/google-deepmind/google-gemini-ai-update-december-2024/)

- La nouvelle version Gemini 2.0 Flash dépasse même Gemini 1.5 Pro dans les benchmarks.
- Tout en étant 2 fois plus rapide que Gemini 1.5 Pro, et bien que le prix ne soit pas encore annoncé, on imagine également plus abordable.
- Google présente Gemini 2 comme le LLM idéal pour les “agents”.
- Gemini propose une vraie multimodalité en sortie (premier LLM sur le marché à le proposer) : Gemini 2 peut entrelacer du texte, des images, de l’audio.
- Gemini 2 supporte plus de 100 langues.
- Huit voix de haute qualité, assez naturelles, pour la partie audio.
- Un nouveau mode speech-to-speech en live, où on peut même interrompre le LLM, c’est d’ailleurs ce qui est utilisé dans Project Astra, l’application mobile montrée à Google I/O qui devient un vrai assistant vocal en live sur votre téléphone.
- Google annonce aussi une nouvelle expérimentation autour des assistants de programmation, avec Project Jules, avec lequel on peut discuter en live aussi, partager son code, comme un vrai pair programmeur.
- Google a présenté Project Mariner qui est un agent qui est sous forme d’extension Chrome, qui va permettre de commander votre navigateur comme votre assistant de recherche personnel, qui va être capable de faire des recherches sur le web, de naviguer dans les sites web, pour trouver les infos que vous recherchez.
- Cet autre article montre différentes vidéos de démos de ces fonctionnalités [https://developers.googleblog.com/en/the-next-chapter-of-the-gemini-era-for-developers/](https://developers.googleblog.com/en/the-next-chapter-of-the-gemini-era-for-developers/).
- Un nouveau projet appelé Deep Research, qui permet de faire des rapports dans Gemini Advanced : on donne un sujet et l’agent va proposer un plan pour un rapport sur ce sujet (qu’on peut valider, retoucher) et ensuite, Deep Research va effectuer des recherches sur le web pour vous, et faire la synthèse de ses recherches dans un rapport final [https://blog.google/products/gemini/google-gemini-deep-research/](https://blog.google/products/gemini/google-gemini-deep-research/).
- Enfin, Google AI Studio, en plus de vous permettre d’expérimenter avec Gemini 2, vous pourrez aussi utiliser des “starter apps” qui montrent comment faire de la reconnaissance d’objet dans des images, comment faire des recherches avec un agent connecté à Google Maps...
- Google AI Studio permet également de partager votre écran avec lui, en mobile ou en desktop, de façon à l’utiliser comme un assistant qui peut voir ce que vous faites, ce que vous codez et peut répondre à vos questions.




### Méthodologies

Un article de GitHub sur l’impact de la surutilisation des CPU sur la perf de l’appli :
[https://github.blog/engineering/architecture-optimization/breaking-down-cpu-speed-how-utilization-impacts-performance/](https://github.blog/engineering/architecture-optimization/breaking-down-cpu-speed-how-utilization-impacts-performance/)

- C’est surprenant qu’ils aient des effets dès 30 % de perf.
- C’est dû à la non limit thermique, au boost de fréquence qui en suit.
- Ils ont donc cherché le golden ratio.
- Pour eux autour de 60 %.
- Ils prennent des morceaux de cluster kube pour faire tourner les workloads.
- Et ajoutent des workload CPU artificiels (genre math).


### Sécurité

Attaque de la chaîne d’approvisionnement via `javac` :
[https://xdev.software/en/news/detail/discovering-the-perfect-java-supply-chain-attack-vector-and-how-it-got-fixed](https://xdev.software/en/news/detail/discovering-the-perfect-java-supply-chain-attack-vector-and-how-it-got-fixed) 

- S’appuie sur l’annotation processeur.
- Des dépendances sont chargées et exécutées au moment du build du projet.
- Et cherche les annotations processor dans le user classpath (via le pattern `ServiceLoader`).
- Et donc si la dépendance est attaquée et un annotation processor est ajouté ou modifié, on a un vecteur d’attaque au moment de la compilation du projet ciblé.
- Des qu’on démarre l’IDE en gros.
- Workaround, activer `-proc:none` et activer les annotation processors explicitement dans votre outil de build.
- Certaines améliorations dans le JDK : le compilateur note qu’il exécute un annotation processor.
- Dans Java 23+, les annotation processors sont désactivés par défaut.





## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 19 décembre 2024 : [Normandie.ai 2024](https://normandie.ai) - Rouen (France) <a href="https://conference-hall.io/normandie-ai"><img alt="Normandie.ai 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-November-2024&color=red"></a>
- 20 janvier 2025 : [Elastic{ON}](https://www.elastic.co/events/elasticon/paris) - Paris (France) <a href="https://sessionize.com/elasticon"><img alt="CFP ElasticON" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-December-2024&color=green"></a>
- 22-25 janvier 2025 : [SnowCamp 2025](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/snow-camp-2025"><img alt="CFP SnowCamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2024&color=red"></a>
- 24-25 janvier 2025 : [Agile Games Île-de-France 2025](https://agilegamesfrance.fr/doku.php?id=evenement_agidf2025) - Paris (France) 
- 30 janvier 2025 : [DevOps D-Day #9](https://www.devopsdday.com/) - Marseille (France) <a href="https://conference-hall.io/devops-dday-2025"><img alt="CFP DevOps D-Day #9" src="https://img.shields.io/static/v1?label=CFP&message=until%2021-October-2024&color=red"></a>
- 6-7 février 2025 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/touraine-tech-2025"><img alt="CFP Touraine Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-October-2024&color=red"></a>
- 21 février 2025 : [LyonJS 100](https://www.lyonjs.org/lyonjs-100) - Lyon (France) 
- 28 février 2025 : [Paris TS La Conf](http://typescript.paris/) - Paris (France) 
- 20 mars 2025 : [PGDay Paris](https://2025.pgday.paris) - Paris (France) 
- 20-21 mars 2025 : [Agile Niort](https://agileniort.fr/) - Niort (France) <a href="https://sessionize.com/agile-niort-2025"><img alt="CFP Agile Niort 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-January-2025&color=green"></a>
- 25 mars 2025 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-6/"><img alt="CFP ParisTestConf 6" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2024&color=red"></a>
- 26-29 mars 2025 : [JChateau Unconference 2025](https://jchateau.org/) - Cour-Cheverny (France) 
- 28 mars 2025 : [DataDays](https://days.data-lille.fr/2025/) - Lille (France) <a href="https://conference-hall.io/data-days-lille-2025"><img alt="CFP DataDays 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-February-2025&color=green"></a>
- 28-29 mars 2025 : [Agile Games France 2025](https://agilegamesfrance.fr/) - Lille (France) 
- 3 avril 2025 : [DotJS](http://www.dotjs.io) - Paris (France) <a href="https://www.dotjs.io/speak"><img alt="CFP dotJS 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-November-2024&color=red"></a>
- 10-11 avril 2025 : [Android Makers](https://androidmakers.droidcon.com/) - Montrouge (France) <a href="https://sessionize.com/android-makers-by-droidcon-2025/"><img alt="CFP Android Makers by droidcon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-February-2025&color=green"></a>
- 10-12 avril 2025 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr25.cfp.dev/"><img alt="CFP Devoxx Greece 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-November-2024&color=red"></a>
- 16-18 avril 2025 : [Devoxx France](https://www.devoxx.fr) - Paris (France) <a href="https://devoxxfr2025.cfp.dev/#/login"><img alt="CFP Devoxx France 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-January-2025&color=green"></a>
- 29-30 avril 2025 : [MixIT](https://mixitconf.org/) - Lyon (France) <a href="https://sessionize.com/mixit-2025/"><img alt="CFP MixIT 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-January-2025&color=green"></a>
- 7-9 mai 2025 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk25.cfp.dev/#/"><img alt="CFP Devoxx UK 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2025&color=green"></a>
- 16 mai 2025 : [AFUP Day 2025 Lille](https://event.afup.org/afup-day-2025/) - Lille (France) <a href="https://afup.org/event/afupday2025lille"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Lyon](https://event.afup.org/afup-day-2025/) - Lyon (France) <a href="https://afup.org/event/afupday2025lyon"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Poitiers](https://event.afup.org/afup-day-2025/) - Poitiers (France) <a href="https://afup.org/event/afupday2025poitiers"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 24 mai 2025 : [Polycloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/polycloud-2025"><img alt="Polycloud 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-February-2025&color=green"></a>
- 5-6 juin 2025 : [AlpesCraft](https://www.alpescraft.fr/) - Grenoble (France) 
- 11-13 juin 2025 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxxpl25.cfp.dev/#/login"><img alt="CFP Devoxx Poland 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=green"></a>
- 12-13 juin 2025 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 12-13 juin 2025 : [DevLille](https://devlille.fr/) - Lille (France) 
- 24 juin 2025 : [WAX 2025](https://www.waxconf.fr/) - Aix-en-Provence (France) <a href="https://conference-hall.io/wax2025"><img alt="CFP WAX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-May-2025&color=green"></a>
- 26-27 juin 2025 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2025"><img alt="CFP SunnyTech 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-Feb-2025&color=green"></a>
- 1-4 juillet 2025 : [Open edX Conference - 2025](https://con.openedx.org) - Palaiseau (France) <a href="https://sessionize.com/open-edx-conference-2025"><img alt="CFP Open edX Conference - 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-December-2024&color=red"></a>
- 18-19 septembre 2025 : [API Platform Conference](https://api-platform.com/con/2025/) - Lille (France) & Online 
- 2-3 octobre 2025 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) 
- 6-10 octobre 2025 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 16-17 octobre 2025 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) 
- 6 novembre 2025 : [dotAI 2025](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=green"></a>
- 12-14 novembre 2025 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) 
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 17 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

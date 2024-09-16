---
title: LCC 315 - les températures ne sont pas déterministes
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 315
mp3_length: 79473562
tweet: Les températures ne sont pas déterministes #GenAI #Java #JavaAppStack #licence
# tweet size: 91-93 -> 99-101 #######################################################################
---
JVM summit, virtual threads, stacks applicatives, licences, déterminisme et LLMs, quantification, deux outils de l'épisode et bien plus encore.

Enregistré le 13 septembre 2024

Téléchargement de l’épisode [LesCastCodeurs-Episode-315.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-315.mp3)

## News


### Langages

Netflix utilise énormément Java et a rencontré un problème avec les Virtual Thread dans Java 21. Les ingénieurs de Netflix analysent ce problème dans cet article :
[https://netflixtechblog.com/java-21-virtual-threads-dude-wheres-my-lock-3052540e231d](https://netflixtechblog.com/java-21-virtual-threads-dude-wheres-my-lock-3052540e231d)

- Les threads virtuels peuvent améliorer les performances mais posent des défis.
- Un problème de locking a été identifié : les threads virtuels se bloquent mutuellement.
- Cela entraîne des performances dégradées et des instabilités.
- Netflix travaille à résoudre ces problèmes et à tirer pleinement parti des threads virtuels.

Une syntax pour indiquer qu’un type est nullable ou null-restricted arriverait dans Java
[https://bugs.openjdk.org/browse/JDK-8303099](https://bugs.openjdk.org/browse/JDK-8303099)

- Foo! interdirait null
- Foo? indiquerait que null est accepté
- Foo?[]! serait un tableau non-null de valeur nullable
- Il y a aussi des idées de syntaxe pour initialiser les tableaux null-restricted
- JEP: [https://openjdk.org/jeps/8303099](https://openjdk.org/jeps/8303099)

Les vidéos du JVM Language Summit 2024 sont en ligne
[https://www.youtube.com/watch?v=OOPSU4LnKg0&amp;list=PLX8CzqL3ArzUEYnTa6KYORRbP3nhsK0L1](https://www.youtube.com/watch?v=OOPSU4LnKg0&amp;list=PLX8CzqL3ArzUEYnTa6KYORRbP3nhsK0L1)

- Project Leyden Update
- Project Babylon - Code Reflection
- Valhalla - Where Are We? 
- An Opinionated Overview on Static Analysis for Java Rethinking Java String Concatenation
- Code Reflection in Action - Translating Java to SPIR-V Java in 2024
- Type Specialization of Java Generics - What If Casts Have Teeth ? (avec notre Rémi Forax national !)
- aussi tip or tail pour tout l'ecosysteme
- quelques liens sur Babylon: Code reflection pour exprimer des langages etranger (SQL) dans Java: [https://openjdk.org/projects/babylon/](https://openjdk.org/projects/babylon/) et sont example en emulation de LINQ [https://openjdk.org/projects/babylon/articles/linq](https://openjdk.org/projects/babylon/articles/linq)


### Librairies

Micronaut sort sa version 4.6
[https://micronaut.io/2024/08/26/micronaut-framework-4-6-0-released/](https://micronaut.io/2024/08/26/micronaut-framework-4-6-0-released/)

- essentiellement une grosse mise à jour de tonnes de modules avec les dernières versions des dépendances

Microprofile 7 faire quelques changements et evolution incompatibles [https://microprofile.io/2024/08/22/microprofile-7-0-release/#general](https://microprofile.io/2024/08/22/microprofile-7-0-release/#general)

- enleve Metrics et remplace avec Telemetry (metrics, log et tracing)
- Metrics reste une spec mais standalone
- Microprofile 7 depende de Jakarta Core profile et ne le package plus
- Microprofile OpenAPI 4 et Telemetry 2 amenent des changements incompatibles

Quarkus 3.14 avec LetsEncrypt et des serialiseurs JAckson sans reflection [https://quarkus.io/blog/quarkus-3-14-1-released/](https://quarkus.io/blog/quarkus-3-14-1-released/)

- Hibernate ORM 6.6
- Serialisateurs JAckson sans reflection
- installer des certificats letsencrypt simplement (notamment avec la ligne de commande qui aide
- sympa notamment avec ngrok pour faire un tunnel vers son localhost
- retropedalage sur `@QuarkusTestResource` vs `@WithTestResource` suite aux retour de OOME et lenteur des tests mieux isolés

Les logs structurées dans Spring Boot 3.4
[https://spring.io/blog/2024/08/23/structured-logging-in-spring-boot-3-4](https://spring.io/blog/2024/08/23/structured-logging-in-spring-boot-3-4)

- Les logs structurées (souvent en JSON) vous permettent de les envoyer facilement vers des backends comme Elastic, AWS CloudWatch...
- Vous pouvez les lier à du reporting et de l'alerting.
- Spring Boot 3.4 prend en charge la journalisation structurée par défaut. Il prend en charge les formats Elastic Common Schema (ECS) et Logstash, mais il est également possible de l'étendre avec vos propres formats.
- Vous pouvez également activer la journalisation structurée dans un fichier. Cela peut être utilisé, par exemple, pour imprimer des journaux lisibles par l'homme sur la console et écrire des journaux structurés dans un fichier pour l'ingestion par machine.


### Infrastructure

CockroachDB qui avait une approche Business Software License (source available puis ALS 3 ans apres), passe maintenant en license proprietaire avec source available [https://www.cockroachlabs.com/blog/enterprise-license-announcement/](https://www.cockroachlabs.com/blog/enterprise-license-announcement/)


Polyform project offre des licences standardisees selon les besoins de gratuit vs payant [https://polyformproject.org/](https://polyformproject.org/)



### Cloud

Azure fonctions, comment le demarrage a froid est optimisé [https://www.infoq.com/articles/azure-functions-cold-starts/?utm_campaign=infoq_content&amp;utm_source=twitter&amp;utm_medium=feed&amp;utm_term=Cloud](https://www.infoq.com/articles/azure-functions-cold-starts/?utm_campaign=infoq_content&amp;utm_source=twitter&amp;utm_medium=feed&amp;utm_term=Cloud)

- fonctions ont une latence naturelle forte 
- toutes les lantences longues ne sont aps impactantes pour le business
- les demarrages a froid peuvent etre mesures avec les outils du cloud provider donc faites en usage
- faites des decentilers de latences
- experience 381 ms cold et 10ms apres
- tracing pour end to end latence
- les strategies
- keep alive pings: reveiller la fonctione a intervalles reguliers pour rester "warm"
- dans le code de la fonction: initialiser les connections et le chargement des assemblies dans l'initialization
- configurer dans host.json le batching, desactiver file system logging etc
- deployer les fonctions as zips
- reduire al taille du code et des fichiers (qui sont copies sur le serveur froid)
- sur .net activer ready to run qui aide le JIT compiler
- instances azure avec plus de CPU et memoire sont plus cher amis baissent le cold start
- dedicated azure instances pour vos fonctions (pas aprtage avec les autres tenants)
- ensuite montre des exemples concrets


### Web

Sortie de Vue.js 3.5
[https://blog.vuejs.org/posts/vue-3-5](https://blog.vuejs.org/posts/vue-3-5)

- Vue.JS 3.5: Nouveautés clés
- **Optimisations de performance et de mémoire:**
  - Réduction significative de la consommation de mémoire (-56%).
  - Amélioration des performances pour les tableaux réactifs de grande taille.
  - Résolution des problèmes de valeurs calculées obsolètes et de fuites de mémoire.
- **Nouvelles fonctionnalités:**
  - **Reactive Props Destructure:** Simplification de la déclaration des props avec des valeurs par défaut.
  - **Lazy Hydration:** Contrôle de l’hydratation des composants asynchrones.
  - **useId():** Génération d’ID uniques stables pour les applications SSR.
  - **data-allow-mismatch:** Suppression des avertissements de désynchronisation d’hydratation.
  - **Améliorations des éléments personnalisés:** Prise en charge de configurations d’application, d’API pour accéder à l’hôte et au shadow root, de montage sans Shadow DOM, et de nonce pour les balises.
  - **useTemplateRef():** Obtention de références de modèle via l’API useTemplateRef().
  - **Teleport différé:** Téléportation de contenu vers des éléments rendus après le montage du composant.
  - **onWatcherCleanup():** Enregistrement de callbacks de nettoyage dans les watchers.


### Data et Intelligence Artificielle

On entend souvent parler de Large Language Model quantisés, c’est à dire qu’on utilise par exemple des entiers sur 8 bits plutôt que des floatants sur 32 bits, pour réduire les besoins mémoire des GPU tout en gardant une précision proche de l’original. Cet article explique très visuellement et intuitivement ce processus de quantisation :
[https://newsletter.maartengrootendorst.com/p/a-visual-guide-to-quantization](https://newsletter.maartengrootendorst.com/p/a-visual-guide-to-quantization)


Guillaume continue de partager ses aventures avec le framework LangChain4j.
Comment effectuer de la classification de texte : [https://glaforge.dev/posts/2024/07/11/text-classification-with-gemini-and-langchain4j/](https://glaforge.dev/posts/2024/07/11/text-classification-with-gemini-and-langchain4j/)

- en utilisant la classe `TextClassification` de LangChain4j, qui utilise une approche basée sur les vector embeddings pour comparer des textes similaires
- en utilisant du few-shot prompting, sous différentes variantes, dans cet autre article : [https://glaforge.dev/posts/2024/07/30/sentiment-analysis-with-few-shots-prompting/](https://glaforge.dev/posts/2024/07/30/sentiment-analysis-with-few-shots-prompting/)
- et aussi comment faire du multimodal avec LangChain4j (avec le modèle Gemini) pour analyser des textes, des images, mais également des vidéos, du contenu audio, ou bien des fichiers PDFs : [https://glaforge.dev/posts/2024/07/25/analyzing-videos-audios-and-pdfs-with-gemini-in-langchain4j/](https://glaforge.dev/posts/2024/07/25/analyzing-videos-audios-and-pdfs-with-gemini-in-langchain4j/)

Pour faire varier la prédictibilité ou la créativité des LLMs, certains hyperparamètres peuvent être ajustés, comme la température, le top-k et le top-p. Mais est-ce que vous savez vraiment comment fonctionnent ces paramètres ? Deux articles très clairs et intuitifs expliquent leur fonctionnement :
[https://medium.com/google-cloud/is-a-zero-temperature-deterministic-c4a7faef4d20](https://medium.com/google-cloud/is-a-zero-temperature-deterministic-c4a7faef4d20)
[https://medium.com/google-cloud/beyond-temperature-tuning-llm-output-with-top-k-and-top-p-24c2de5c3b16](https://medium.com/google-cloud/beyond-temperature-tuning-llm-output-with-top-k-and-top-p-24c2de5c3b16)

- la tempoerature va ecraser la probabilite du prochain token mais il reste des variables: approximnation des calculs flottants, stacks differentes effectuants ces choix differemment, que faire en cas d'egalité de probabilité entre deux tokens
- mais il y a d'atures apporoches de configuiration des reaction du LLM: top-k (qui evite les tokens peu frequents), top-p pour avoir les n des tokens qui totalient p% des probabilités
- temperature d'abord puis top-k puis top-p
- explique quoi utiliser quand

OSI propose une definition de l'IA open source [https://www.technologyreview.com/2024/08/22/1097224/we-finally-have-a-definition-for-open-source-ai/](https://www.technologyreview.com/2024/08/22/1097224/we-finally-have-a-definition-for-open-source-ai/)

- gros debats ces derniers mois
- utilisable pour tous usages sans besoin de permission
- chercheurs peuvent inspecter les components et etudier comment le system fonctionne
- systeme modifiable pour tout objectif y compris chager son comportement
- et paratger avec d'autres avec ou sans modification quelque soit l'usage
- Definit des niveaux de transparence (donnees d'entranement, code source, poids)

Une longue rétrospective de PostgreSQL a des volumes de malades et les problèmes de lock [https://ardentperf.com/2024/03/03/postgres-indexes-partitioning-and-lwlocklockmanager-scalability/](https://ardentperf.com/2024/03/03/postgres-indexes-partitioning-and-lwlocklockmanager-scalability/)

- un article pour vous rassurer que vous n’aurez probablement jamais le problème 
- histoire sous forme de post mortem
- des conseils pour éviter ces falaises


### Outillage

Un premier coup d’oeil à la future notation déclarative de Gradle
[https://blog.gradle.org/declarative-gradle-first-eap](https://blog.gradle.org/declarative-gradle-first-eap)

- un article qui explique à quoi ressemble cette nouvelle syntaxe déclarative de Gradle (en plus de Groovy et Kotlin)
- Quelques vidéos montrent le support dans Android Studio, pour le moment, ainsi que dans un outil expérimental, en attendant le support dans tous les IDEs
- L’idée est d’éviter le scripting et d’avoir vraiment qu’une description de son build
- Cela devrait améliorer la prise en charge de Gradle dans les IDEs et permettre d’avoir de la complétion rapide, etc
- c'est moi on on a Maven là?

Support de Firefox dans Puppeteer
[https://hacks.mozilla.org/2024/08/puppeteer-support-for-firefox/](https://hacks.mozilla.org/2024/08/puppeteer-support-for-firefox/)

- Puppeteer, la bibliothèque d’automatisation de navigateur, supporte désormais officiellement Firefox dès la version 23.
- Cette avancée permet aux développeurs d’écrire des scripts d’automatisation et d’effectuer des tests de bout en bout sur Chrome et Firefox de manière interchangeable.
- L’intégration de Firefox dans Puppeteer repose sur WebDriver BiDi, un protocole inter-navigateurs en cours de standardisation au W3C.
- WebDriver BiDi facilite la prise en charge de plusieurs navigateurs et ouvre la voie à une automatisation plus simple et plus efficace.
- Les principales fonctionnalités de Puppeteer, telles que la capture de journaux, l’émulation de périphériques, l’interception réseau et le préchargement de scripts, sont désormais disponibles pour Firefox.
- Mozilla considère WebDriver BiDi comme une étape importante vers une meilleure expérience de test inter-navigateurs.
- La prise en charge expérimentale de CDP (Chrome DevTools Protocol) dans Firefox sera supprimée fin 2024 au profit de WebDriver BiDi.
- Bien que Firefox soit officiellement pris en charge, certaines API restent non prises en charge et feront l’objet de travaux futurs.

Guillaume a créé une annotation `@Retry` pour  JUnit 5, pour retenter l’exécution d’un test qui est “flaky”
[https://glaforge.dev/posts/2024/09/01/a-retryable-junit-5-extension/](https://glaforge.dev/posts/2024/09/01/a-retryable-junit-5-extension/)

- Guillaume n’avait pas trouvé d’extension par défaut dans JUnit 5 pour remplacer les Retry rules de JUnit 4
- Mais sur les réseaux sociaux, une discussion intéressante s’ensuit avec des liens sur des extensions qui implémentent cette approche
- Comme JUnit Pioneer qui propose plein d’extensions utiles [https://junit-pioneer.org/docs/retrying-test/](https://junit-pioneer.org/docs/retrying-test/)
- Ou l’extension rerunner [https://github.com/artsok/rerunner-jupiter](https://github.com/artsok/rerunner-jupiter)
- Arnaud a aussi suggéré la configuration de Maven Surefire pour relancer automatiquement les tests qui ont échoué [https://maven.apache.org/surefire/maven-surefire-plugin/examples/rerun-failing-tests.html](https://maven.apache.org/surefire/maven-surefire-plugin/examples/rerun-failing-tests.html)
- la question philosophique est: est-ce que c'est tolerable les tests qui ecouent de façon intermitente


### Architecture

Un ancien fan de GraphQL en a fini avec la technologie GraphQL et réfléchit aux alternatives
[https://bessey.dev/blog/2024/05/24/why-im-over-graphql/](https://bessey.dev/blog/2024/05/24/why-im-over-graphql/)

- **Problèmes de GraphQL:**
- Sécurité:
  - Attaques d’autorisation
  - Difficulté de limitation de débit
  - Analyse de requêtes malveillantes
- Performance:
  - Problème N+1 (récupération de données et autorisation)
  - Impact sur la mémoire lors de l’analyse de requêtes invalides
- Complexité accrue:
  - Couplage entre logique métier et couche de transport
  - Difficulté de maintenance et de tests
- **Solutions envisagées:**
- Adoption d’API REST conformes à OpenAPI 3.0+
  - Meilleure documentation et sécurité des types
  - Outils pour générer du code client/serveur typé
- Deux approches de mise en œuvre d’OpenAPI:
  - “Implementation first” (génération de la spécification à partir du code)
  - “Specification first” (génération du code à partir de la spécification)
- retour interessant de quelqu'un qui n'utilise pas GraphQL au quotidien. C'était des problemes qui devaient etre corrigés avec la maturité de l'ecosysteme et des outils mais ca a montré ces limites pour cette personne.

Prensentation de Grace Hoper en 1980 sur le future des ordinateurs. [https://youtu.be/AW7ZHpKuqZg?si=w_o5_DtqllVTYZwt](https://youtu.be/AW7ZHpKuqZg?si=w_o5_DtqllVTYZwt)

- c’est fou la modernité de ce qu’elle décrit
- Des problèmes qu’on a encore aujourd’hui 
- positive leadership 
- Elle décrit l’avantage de systèmes fait de plusieurs ordinateurs 
- récemment declassifié

Leader election avec les conditional writes sur les buckets S3/GCS/Azure
[https://www.morling.dev/blog/leader-election-with-s3-conditional-writes/](https://www.morling.dev/blog/leader-election-with-s3-conditional-writes/)

- L’élection de leader est le processus de choisir un nœud parmi plusieurs pour effectuer une tâche.
- Traditionnellement, l’élection de leader se fait avec un service de verrouillage distribué comme ZooKeeper.
- Amazon S3 a récemment ajouté le support des écritures conditionnelles, ce qui permet l’élection de leader sans service séparé.
- L’algorithme d’élection de leader fonctionne en faisant concourir les nœuds pour créer un fichier de verrouillage dans S3.
- Le fichier de verrouillage inclut un numéro d’époque, qui est incrémenté à chaque fois qu’un nouveau leader est élu.
- Les nœuds peuvent déterminer s’ils sont le leader en listant les fichiers de verrouillage et en vérifiant le numéro d’époque.
- attention il peut y avoir plusieurs leaders élus (horloges qui ont dérivé) donc c'est à gérer aussi


### Méthodologies

Guillaume Laforge interviewé par Sfeir, où il parle de l’importance de la curiosité, du partage, de l’importance de la qualité du code, et parsemé de quelques photos des Cast Codeurs !
[https://www.sfeir.dev/success-story/guillaume-laforge-maestro-de-java-et-esthete-du-code-propre/](https://www.sfeir.dev/success-story/guillaume-laforge-maestro-de-java-et-esthete-du-code-propre/)



### Sécurité

Comment crowdstrike met a genoux windows et de nombreuses entreprises [https://next.ink/144464/crowdstrike-donne-des-details-techniques-sur-son-fiasco/](https://next.ink/144464/crowdstrike-donne-des-details-techniques-sur-son-fiasco/)

- l’incident vient de la mise à jour de la configuration de Falcon l’EDR de crowdstrike [https://www.crowdstrike.com/blog/falcon-update-for-windows-hosts-technical-details/](https://www.crowdstrike.com/blog/falcon-update-for-windows-hosts-technical-details/)
- qu’est ce qu’un EDR? Un système Endpoint Detection and Response a pour but de surveiller votre machine ( access réseaux, logs, …) pour detecter des usages non habituels. Cet espion doit interagir avec les couches basses du système (réseau, sockets, logs systems) et se greffe donc au niveau du noyau du système d’exploitation. Il remonte les informations en live à une plateforme qui peut ensuite adapter les réponse en live
- si l’incident a duré moins de 1h30 coté crowdstrike plus de 8 millions de machines se sont retrouvées hors service bloquées sur le Blue Screen Of Death selon Microsoft [https://blogs.microsoft.com/blog/2024/07/20/helping-our-customers-through-the-crowdstrike-outage/](https://blogs.microsoft.com/blog/2024/07/20/helping-our-customers-through-the-crowdstrike-outage/)
- cela n’est pas la première fois et était déjà arrivé il y a quelques mois sur Linux. Comme il s’agissait d’une incompatibilité de kernel il avait été moins important car les services ITs gèrent mieux ces problèmes sous Linux [https://stackdiary.com/crowdstrike-took-down-debian-and-rocky-linux-a-few-months-ago-and-no-one-noticed/](https://stackdiary.com/crowdstrike-took-down-debian-and-rocky-linux-a-few-months-ago-and-no-one-noticed/)

**Les benchmarks CIS, un pilier pour la sécurité de nos environnements cloud, et pas que ! (**Katia HIMEUR TALHI**)**
[https://blog.cockpitio.com/security/cis-benchmarks/](https://blog.cockpitio.com/security/cis-benchmarks/)

- Le CIS est un organisme à but non lucratif qui élabore des normes pour améliorer la cybersécurité.
- Les référentiels CIS sont un ensemble de recommandations et de bonnes pratiques pour sécuriser les systèmes informatiques.
- Ils peuvent être utilisés pour renforcer la sécurité, se conformer aux réglementations et normaliser les pratiques.


### Loi, société et organisation

Microsoft signe un accord avec OVHCloud pour qu'il arretent leur plaine d'antitrust [https://www.politico.eu/article/microsoft-signs-antitrust-truce-with-ovhcloud/](https://www.politico.eu/article/microsoft-signs-antitrust-truce-with-ovhcloud/)

- la plainte était en Europe
- mermet a des clients de plus facilement deployer les solutions Microsoft dans le fournisseur de cloud de leur choix
- la plainte avait ete posé à l'été 2021
- ca rendait faire tourner les solutions MS plus cheres et non competitives vs MS

ElasticSearch et Kibana sont de nouveau Open Source, en ajoutant la license AGPL à ses autres licences existantes
[https://www.elastic.co/fr/blog/elasticsearch-is-open-source-again](https://www.elastic.co/fr/blog/elasticsearch-is-open-source-again)

- le marché d'il y a trois ans et maintenant a changé
- AWS est une bon partenaire
- le flou Elasticsearch vs le produit d'AWS s'est clarifié
- donc retour a l'open source via AGPL Affero GPL
- Elastic n’a jamais cessé de croire en l’open source d’après Shay Banon son fondateur
- Le changement vers l’AGPL est une option supplémentaire, pas un remplacement d’une des autres licences existantes
- et juste apres, Elastic annonce des resultants decevants faisant plonger l'action de 25% [https://siliconangle.com/2024/08/29/elastic-shares-plunge-25-lower-revenue-projections-amid-slower-customer-commitments/](https://siliconangle.com/2024/08/29/elastic-shares-plunge-25-lower-revenue-projections-amid-slower-customer-commitments/)
- [https://unrollnow.com/status/1832187019235397785](https://unrollnow.com/status/1832187019235397785) et [https://www.elastic.co/pricing/faq/licensing](https://www.elastic.co/pricing/faq/licensing) pour un résumé des licenses chez elastic


## Outils de l’épisode

MailMate un client email Markdown et qui gere beaucoup d'emails [https://medium.com/@nicfab/mailmate-a-powerful-client-email-for-macos-markdown-integrated-email-composition-e218fe2accf3](https://medium.com/@nicfab/mailmate-a-powerful-client-email-for-macos-markdown-integrated-email-composition-e218fe2accf3)

- Emmanuel l'utilise sur les boites email secondaires
- un peu lent a demarrer (synchro) et le reste est rapide
- boites virtuelles (par requete)
- SpamSieve
- Que macOS je crois

Trippy, un analyseur de réseau
[https://github.com/fujiapple852/trippy](https://github.com/fujiapple852/trippy)

- Il regroupe dans une CLI traceroute et ping



## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 17 septembre 2024 : [We Love Speed](https://www.welovespeed.com/) - Nantes (France) <a href="https://www.welovespeed.com/2024/cfp"><img alt="CFP We Love Speed" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-May-2024&color=red"></a>
- 17-18 septembre 2024 : [Agile en Seine 2024](https://www.agileenseine.com/) - Issy-les-Moulineaux (France) <a href="https://sessionize.com/agile-en-seine-2024/"><img alt="CFP Agile en Seine 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-June-2024&color=red"></a>
- 19-20 septembre 2024 : [API Platform Conference](https://api-platform.com/con/) - Lille (France) & Online <a href="https://conference-hall.io/public/event/GMijW4ZrZDo6hzKeF1gk"><img alt="CFP API Platform Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-March-2024&color=red"></a>
- 20-21 septembre 2024 : [Toulouse Game Dev](http://toulousegamedev.fr/masterclass/) - Toulouse (France) 
- 25-26 septembre 2024 : [PyData Paris](https://pydata.org/paris2024) - Paris (France) <a href="https://pydata.org/paris2024/cfp"><img alt="CFP PyData Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-April-2024&color=red"></a>
- 26 septembre 2024 : [Agile Tour Sophia-Antipolis 2024](https://www.telecom-valley.fr/agile-tour-sophia-2024/) - Biot (France) <a href="https://sessionize.com/agile-tour-sophia-antipolis-2024/"><img alt="CFP Agile Tour Sophia-Antipolis 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2024&color=red"></a>
- 2-4 octobre 2024 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) <a href="https://dvma24.cfp.dev"><img alt="CFP Devoxx Morocco 2024" src="https://img.shields.io/static/v1?label=CFP&message=from%2006-May-2024-until%2007-Jul-2024&color=red"></a>
- 3 octobre 2024 : [VMUG Montpellier](https://bit.ly/vmug-montpellier-2024) - Montpellier (France) 
- 7-11 octobre 2024 : [Devoxx Belgium](https://devoxx.be) - Antwerp (Belgium) <a href="https://dvbe24.cfp.dev"><img alt="CFP Devoxx Belgium 2024" src="https://img.shields.io/static/v1?label=CFP&message=from%2003-June-2024-until%2012-Jul-2024&color=red"></a>
- 8 octobre 2024 : [Red Hat Summit: Connect 2024](https://www.redhat.com/fr/summit/connect/emea/paris-2024) - Paris (France) 
- 10 octobre 2024 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/public/event/WhX2AfC4tuVw5Ukdd5FW"><img alt="CFP Cloud Nord" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2024&color=red"></a>
- 10-11 octobre 2024 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) <a href="https://conference-hall.io/public/event/98FptSgEGcOSQZymZkUr"><img alt="CFP Volcamp 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-May-2024&color=red"></a>
- 10-11 octobre 2024 : [Forum PHP](https://event.afup.org/) - Marne-la-Vallée (France) <a href="https://afup.org/event/"><img alt="CFP Forum PHP 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-June-2024&color=red"></a>
- 11-12 octobre 2024 : [SecSea2k24](https://secsea.org/) - La Ciotat (France) 
- 15-16 octobre 2024 : [Malt Tech Days 2024](https://www.papercall.io/mtd-2024) - Paris (France) <a href="https://www.papercall.io/mtd-2024"><img alt="CFP Malt Tech Days 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-August-2024&color=red"></a>
- 16 octobre 2024 : [DotPy](https://www.dotpy.io/) - Paris (France) <a href="https://www.dotpy.io/cfp"><img alt="CFP DotPy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=red"></a>
- 16-17 octobre 2024 : [NoCode Summit 2024](https://www.nocode-summit.org/fr) - Paris (France) 
- 17-18 octobre 2024 : [DevFest Nantes](https://devfest.gdgnantes.com/en/) - Nantes (France) <a href="https://conference-hall.io/public/event/AJYPylkzTDd6j3O6ADZn"><img alt="CFP DevFest Nantes 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-June-2024&color=red"></a>
- 17-18 octobre 2024 : [DotAI](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/cfp"><img alt="CFP DotAI 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=red"></a>
- 30-31 octobre 2024 : [Agile Tour Nantais 2024](https://agilenantes.org/agile-tour-nantais-2024/) - Nantes (France) <a href="https://sessionize.com/agile-tour-nantais-2024"><img alt="CFP Agile Tour Nantais 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-July-2024&color=red"></a>
- 30-31 octobre 2024 : [Agile Tour Bordeaux 2024](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2024/"><img alt="CFP Agile Tour Bordeaux 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2024&color=red"></a>
- 31 octobre 2024-3 novembre 2024 : [PyCon.FR](https://www.pycon.fr/2024/) - Strasbourg (France) <a href="https://cfp.pycon.fr/pyconfr-2024/cfp"><img alt="CFP PyCon.FR" src="https://img.shields.io/static/v1?label=CFP&message=until%2021-July-2024&color=red"></a>
- 6 novembre 2024 : [Master Dev De France](https://www.masterdevfrance.com/) - Paris (France) 
- 7 novembre 2024 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse/"><img alt="CFP DevFest Toulouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-June-2024&color=red"></a>
- 8 novembre 2024 : [BDX I/O](https://bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/9udDKH96m45FLJmqz2Uu"><img alt="CFP BDX IO 24" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-July-2024&color=red"></a>
- 13-14 novembre 2024 : [Agile Tour Rennes 2024](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2024/"><img alt="CFP Agile Tour Rennes 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2024&color=red"></a>
- 16-17 novembre 2024 : [Capitole Du Libre](https://capitoledulibre.org/) - Toulouse (France) <a href="https://cfp.capitoledulibre.org/cdl-2024/cfp"><img alt="CFP Capitole du Libre" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-September-2024&color=green"></a>
- 20-22 novembre 2024 : [Agile Grenoble 2024](https://agile-grenoble.org/) - Grenoble (France) <a href="https://sessionize.com/agile-grenoble-2024/"><img alt="CFP Agile Grenoble 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2024&color=red"></a>
- 21 novembre 2024 : [DevFest Strasbourg](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/public/event/ZZv81ZNIzVzCMBxjX1xe"><img alt="CFP DevFest Strasbourg" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-July-2024&color=red"></a>
- 21 novembre 2024 : [Codeurs en Seine](https://www.codeursenseine.com) - Rouen (France) <a href="https://conference-hall.io/public/event/Su6sfM6SAhoHmg3GWKHS"><img alt="CFP Codeurs en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-September-2024&color=green"></a>
- 27-28 novembre 2024 : [Cloud Expo Europe](https://www.cloudexpoeurope.fr/) - Paris (France) 
- 28 novembre 2024 : [Who Run The Tech ?](https://whorunthetech.com) - Rennes (France) <a href="https://conference-hall.io/public/event/bJDribf9r5Lf2VzBgbYQ"><img alt="CFP Who Run The Tech ? 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%204-June-2024&color=red"></a>
- 2-3 décembre 2024 : [Tech Rocks Summit](https://events.tech.rocks/summit-2024) - Paris (France) 
- 3 décembre 2024 : [Generation AI](https://www.apidays.global/generationai-paris/) - Paris (France) <a href="https://apidays.typeform.com/to/BUasJhAb"><img alt="CFP Generation AI" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-November-2024&color=green"></a>
- 3-5 décembre 2024 : [APIdays Paris](https://www.apidays.global/paris/) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP API Days Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-November-2024&color=green"></a>
- 4-5 décembre 2024 : [DevOpsRex](https://www.devopsrex.fr/fr) - Paris (France) <a href="https://talks.devopsdays.org/devopsdays-paris-2024/cfp"><img alt="CFP DevOps Rex" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-July-2024&color=red"></a>
- 4-5 décembre 2024 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) <a href="https://pretalx.com/opensource-experience-2024/cfp"><img alt="CFP Open Source Experience" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-July-2024&color=red"></a>
- 5 décembre 2024 : [GraphQL Day Europe](https://www.apidays.global/graphqldayeurope/) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP GraphQL Days Europe" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-November-2024&color=green"></a>
- 6 décembre 2024 : [DevFest Dijon](https://devfest.developers-group-dijon.fr/) - Dijon (France) <a href="https://conference-hall.io/public/event/LvvYRcF5AIhpojdn2lkQ"><img alt="CFP DevFest Dijon 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2024&color=red"></a>
- 22-25 janvier 2025 : [SnowCamp 2025](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/snow-camp-2025"><img alt="CFP SnowCamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2024&color=green"></a>
- 30 janvier 2025 : [DevOps D-Day #9](https://www.devopsdday.com/) - Marseille (France) <a href="https://conference-hall.io/devops-dday-2025"><img alt="CFP DevOps D-Day #9" src="https://img.shields.io/static/v1?label=CFP&message=until%2021-October-2024&color=green"></a>
- 6-7 février 2025 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/touraine-tech-2025"><img alt="CFP Touraine Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-October-2024&color=green"></a>
- 3 avril 2025 : [DotJS](http://www.dotjs.io) - Paris (France) 
- 16-18 avril 2025 : [Devoxx France](https://www.devoxx.fr) - Paris (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

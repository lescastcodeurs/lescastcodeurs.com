---
title: LCC 298 - De l'IA à toutes les sauces
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 298
mp3_length: 74955668
tweet: De l'IA à toutes les sauces #java #rust #go #micronaut #webgpu #ddd #sondage #ia #rhel
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode estival Guillaume, Emmanuel et Arnaud parcourent les nouvelles du début d'été. Du Java, du Rust, du Go du côté des langages, 
du Micronaut, du Quarkus pour les frameworks, mais aussi du WebGPU, de l'agilité, du DDD, des sondages, de nombreux outils et surtout de l'intelligence artificielle à toutes les sauces (dans les bases de données, dans les voitures...).

Enregistré le 21 juillet 2023

Téléchargement de l’épisode [LesCastCodeurs-Episode-298.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-298.mp3)

## News


### Langages

La release candidate de Go 1.21 supporte WASM et WASI nativement
[https://go.dev/blog/go1.21rc](https://go.dev/blog/go1.21rc)

`StringBuilder` ou concatenation de `String`
[https://reneschwietzke.de/java/the-stringbuilder-advise-is-dead-or-isnt-it.html](https://reneschwietzke.de/java/the-stringbuilder-advise-is-dead-or-isnt-it.html)

- `StringBuilder` était la recommendation car ça créait moins d'objets notamment.
- Mais la JVM a évolué et le compilateur ou JIT remplace cela par du code efficace.
- Quelques petites exceptions.
- Le code froid (c.-à-d. startup time) qui est encore interprété peut bénéficier de `StringBuilder`.
- Autre cas, la concatenation dans des boucles où le JIT ne pourrait peut-être pas optimiser.
- Le `StringBuilder` "fluid" est plus efficace (inliné ?).
- Ces règles ne changent pas si des objets sont stringifié pour être concaténés.

GPT-4 n'est pas une révolution
[https://thealgorithmicbridge.substack.com/p/gpt-4s-secret-has-been-revealed](https://thealgorithmicbridge.substack.com/p/gpt-4s-secret-has-been-revealed)

- Rumeurs, car beaucoup de secrets autour de GPT-4
- Pas un modèle à 1 trillion de paramètres, mais 8 à 220 milliards combinés intelligemment.
- Les chercheurs attendaient un breakthrough mais c'est une évolution et pas particulièrement nouveau.
- Méthode déjà implémentée par des chercheurs chez Google (maintenant chez OpenAI).
- Ils ont retardé la compétition avec ces rumeurs de breakthrough, mais 8 LLaMA peuvent peut-être rivaliser avec GPT-4.

Le blog Open Source de Google propose un article sur 5 mythes ou non sur l’apprentissage et l’utilisation de Rust
[https://opensource.googleblog.com/2023/06/rust-fact-vs-fiction-5-insights-from-googles-rust-journey-2022.html](https://opensource.googleblog.com/2023/06/rust-fact-vs-fiction-5-insights-from-googles-rust-journey-2022.html)

- Il faut plus de 6 mois pour apprendre Rust : plutôt faux ; quelques semaines à 3-4 mois max.
- Le compilateur Rust n'est pas aussi rapide qu’on le souhaiterait — vrai !
- Le code unsafe et l’interop sont les plus gros challenges — faux, ce sont plutôt les macros, l’ownership/borrowing et la programmation asynchrone.
- Rust fournit des messages d’erreur de compilation géniaux — vrai.
- Le code Rust est de haute qualité — vrai.

InfoQ sort un nouveau guide sur le Pattern Matching pour le switch de Java
[https://www.infoq.com/articles/pattern-matching-for-switch/](https://www.infoq.com/articles/pattern-matching-for-switch/)

- Le pattern matching supporte tous les types de référence.
- L’article parle du cas de la valeur `null`.
- L’utilisation des patterns “guarded” avec le mot clé `when`.
- L’importance de l’ordre des `case`s.
- Le pattern matching peut être utilisé aussi avec le `default` des `switch`s
- Le scope des variables du pattern.
- Un seul pattern par case label.
- Un seul case match-all dans un bloc `switch`.
- L’exhaustivité de la couverture des types.
- L’utilisation des generics.
- La gestion d’erreur avec `MatchException`.


### Librairies

Sortie de Micronaut 4
[https://micronaut.io/2023/07/14/micronaut-framework-4-0-0-released/](https://micronaut.io/2023/07/14/micronaut-framework-4-0-0-released/)

- Langage minimal : Java 17, Groovy 4 et Kotlin 1.8.
- Support de la dernière version de GraalVM.
- Utilisation des GraalVM Reachability Metadata Repository pour faciliter l’utilisation de Native Image.
- Gradle 8.
- Nouvel _Expression Language_, à la compilation, pas possible au runtime (pour des raisons de sécurité et de support de pré-compilation).
- Support des Virtual Threads.
- Nouvelle couche HTTP, éliminant les stack frames réactives quand on n’utilise pas le mode réactif.
- Support expérimental de IO Uring et HTTP/3.
- Des filtres basés sur les annotations.
- Le HTTP Client utilise maintenant le Java HTTP Client.
- Génération de client et de serveur en Micronaut à partir de fichier OpenAPI.
- L’utilisation YAML n’utilise plus la dépendance SnakeYAML (qui avait des problèmes de sécurité).
- Transition vers Jakarta terminé
- Et plein d’autres mises à jour de modules
- Couverture par InfoQ [https://www.infoq.com/news/2023/07/micronaut-brings-virtual-thread/](https://www.infoq.com/news/2023/07/micronaut-brings-virtual-thread/)

Quarkus 3.2 et LTS

- [https://quarkus.io/blog/quarkus-3-2-0-final-released/](https://quarkus.io/blog/quarkus-3-2-0-final-released/)
- [https://quarkus.io/blog/quarkus-3-1-0-final-released/](https://quarkus.io/blog/quarkus-3-1-0-final-released/)
- [https://quarkus.io/blog/lts-releases/](https://quarkus.io/blog/lts-releases/)



### Infrastructure

Red Hat partage les sources de sa distribution au travers de son Customer Portal, et impacte la communauté qui se base dessus
[https://almalinux.org/blog/impact-of-rhel-changes/](https://almalinux.org/blog/impact-of-rhel-changes/)

- RedHat a annoncé un autre changement massif qui affecte tous les rebuilds et forks de Red Hat Enterprise Linux.
- À l’avenir, Red Hat publiera uniquement le code source pour les RHEL RPMs derrière leur portail client.
- Comme tous les clones de RHEL dépendent des sources publiées, cela perturbe encore une fois l’ensemble de l’écosystème Red Hat.

Une analyse du choix de Red Hat sur la distribution du code source de RHEL
[https://dissociatedpress.net/2023/06/24/red-hat-and-the-clone-wars/](https://dissociatedpress.net/2023/06/24/red-hat-and-the-clone-wars/)

Une réponse de Red Hat aux feux démarrés par l'annonce de la non-distribution des sources de RHEL en public
[https://www.redhat.com/en/blog/red-hats-commitment-open-source-response-gitcentosorg-changes](https://www.redhat.com/en/blog/red-hats-commitment-open-source-response-gitcentosorg-changes)

Et un lien vers un de ces feux d'une personne proéminente dans la communauté Ansible
[https://www.jeffgeerling.com/blog/2023/im-done-red-hat-enterprise-linux](https://www.jeffgeerling.com/blog/2023/im-done-red-hat-enterprise-linux)

Oracle demande à garder un Linux ouvert et gratuit
[https://www.oracle.com/news/announcement/blog/keep-linux-open-and-free-2023-07-10/](https://www.oracle.com/news/announcement/blog/keep-linux-open-and-free-2023-07-10/)

- Suite à l’annonce d’IBM/RedHat, Oracle demande à garder Linux ouvert et gratuit.
- IBM ne veut pas publier le code de RHEL car elle doit payer ses ingénieurs.
- Alors que RedHat a pu maintenir son modèle économique durant des années.
- L’article revient sur CentOS qu’IBM “a tué” en 2020.
- Oracle continu ses efforts de rendre Linux ouvert et libre.
- Oracle Linux continuera à être compatible avec RHEL jusqu’à la version 9.2. Après, ça sera compliqué de maintenir une compatibilité. 
- Oracle embauche des devs Linux.
- Oracle demande à IBM de récupérer le downstream d’Oracle et de le distribuer.

SUSE forke RHEL
[https://www.suse.com/news/SUSE-Preserves-Choice-in-Enterprise-Linux/](https://www.suse.com/news/SUSE-Preserves-Choice-in-Enterprise-Linux/)

- [SUSE](http://www.suse.com/) est la société derrière Rancher, NeuVector, et SUSE Linux Enterprise (SLE).
- Annonce un fork de RHEL.
- $10M d’investissement dans le projet sur les prochaines années.
- Compatibilité assurée de RHEL et CentOS.



### Web

Google revend son service de nom de domaine à Squarespace
[https://www.reddit.com/r/webdev/comments/14agag3/squarespace_acquires_google_domains/](https://www.reddit.com/r/webdev/comments/14agag3/squarespace_acquires_google_domains/)

- et ça n'était pas gratuit, donc on n'est pas censé être le produit 😉
- Squarespace est une entreprise américaine spécialisée dans la création de sites internet.
- Squarespace est un revendeur de Google Workspace depuis longtemps.
- La vente devrait se finaliser en Q3 2023.

Petite introduction à WebGPU en français
[https://blog.octo.com/connaissez-vous-webgpu/](https://blog.octo.com/connaissez-vous-webgpu/)



### Data

Avec la mode des _Large Language Models_, on parle de plus en plus de bases de données vectorielles, pour stocker des “embeddings” (des vecteurs de nombre flottant représentant sémantiquement du texte, ou même des images).
Un article explique que les Vecteurs sont le nouveau JSON dans les bases relationnelles comme PostgreSQL
[https://jkatz05.com/post/postgres/vectors-json-postgresql/](https://jkatz05.com/post/postgres/vectors-json-postgresql/)

- L’article parle en particulier de l’extension [pgVector](https://github.com/pgvector/pgvector) qui est une extension pour PostgreSQL pour rajouter le support des vectors comme type de colonne.
- Google Cloud annonce justement l’intégration de cette extension vectorielle à CloudSQL pour PostgreSQL et à AlloyDB pour PostgreSQL : [https://cloud.google.com/blog/products/databases/announcing-vector-support-in-postgresql-services-to-power-ai-enabled-applications](https://cloud.google.com/blog/products/databases/announcing-vector-support-in-postgresql-services-to-power-ai-enabled-applications).
- Il y a également une vidéo, un notebook Colab, et un article plus détaillé techniquement utilisant LangChain : [https://cloud.google.com/blog/products/databases/using-pgvector-llms-and-langchain-with-google-cloud-databases](https://cloud.google.com/blog/products/databases/using-pgvector-llms-and-langchain-with-google-cloud-databases).
- Mais on voit aussi également Elastic améliorer Lucene pour utiliser le support des instructions SIMD pour accélérer les calculs vectoriels (produit scalaire, distance euclidienne, similarité cosinus) : [https://www.elastic.co/fr/blog/accelerating-vector-search-simd-instructions](https://www.elastic.co/fr/blog/accelerating-vector-search-simd-instructions).


### Outillage

Le sondage de StackOverflow 2023
[https://survey.stackoverflow.co/2023/](https://survey.stackoverflow.co/2023/)

- L'enquête a été réalisée auprès de 90 000 développeurs dans 185 pays.
- Les développeurs sont plus nombreux (+2%) que l'an dernier à travailler sur site (16% sur site, 41% remote, 42% hybrid).
- Les développeurs sont également de plus en plus nombreux à utiliser des outils d'intelligence artificielle, avec 70 % d'entre eux déclarant les utiliser (44%) ou prévoyant de les utiliser (25) dans leur travail.
- Les langages de programmation les plus populaires sont toujours JavaScript, Python et HTML/CSS.
- Les frameworks web les plus populaires sont Node, React, JQuery.
- Les bases de données les plus populaires sont  PostgreSQL, MySQL, et SQLite.
- Les systèmes d'exploitation les plus populaires sont Windows puis macOS et Linux.
- Les IDE les plus populaires sont Visual Studio Code, Visual Studio et IDEA IntelliJ.

Les différents types de déplacement dans Vim
[https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/moving-blazingly-fast-with-the-core-vim-motions/](https://www.barbarianmeetscoding.com/boost-your-coding-fu-with-vscode-and-vim/moving-blazingly-fast-with-the-core-vim-motions/)


JetBrains se met aussi à la mode des assistants IA dans l’IDE
[https://blog.jetbrains.com/idea/2023/06/ai-assistant-in-jetbrains-ides/](https://blog.jetbrains.com/idea/2023/06/ai-assistant-in-jetbrains-ides/)

- Une intégration avec OpenAI, mais aussi de plus petits LLMs spécifiques à JetBrains.
- Un chat intégré pour discuter avec l’assistant, puis la possibilité d’intégrer les snippets de code là où se trouve le curseur.
- Possibilité de sélectionner du code et de demander à l’assistant d’expliquer ce que ce bout de code fait, mais aussi de suggérer un refactoring, ou de régler les problèmes potentiels.
- On peut demander à générer la JavaDoc d’une méthode, d’une classe, etc, ou à suggérer un nom de méthode (en fonction de son contenu).
- Génération de message de commit.
- Il faut avoir un compte JetBrains AI pour y avoir accès.

Des commandes macOS plus ou moins connues
[https://saurabhs.org/advanced-macos-commands](https://saurabhs.org/advanced-macos-commands)

- `caffeinate` — pour garder le mac éveillé,
- `pbcopy` / `pbpaste` — pour interagir avec le clipboard,
- `networkQuality` — pour mesurer la rapidité de l’accès à internet,
- `sips` — pour manipuler / redimensionner des images,
- `textutil` — pour convertir des fichiers Word, texte, HTML,
- `screencapture` — pour faire un screenshot,
- `say` — pour donner une voix à vos commandes.

Le sondage de la communauté ArgoCD
[https://blog.argoproj.io/cncf-argo-cd-rollouts-2023-user-survey-results-514aa21c21df](https://blog.argoproj.io/cncf-argo-cd-rollouts-2023-user-survey-results-514aa21c21df)


Un client d'API open-source et cross platform pour GraphQL, REST, WebSockets, Server-sent events et gRPC
[https://github.com/Kong/insomnia](https://github.com/Kong/insomnia)



### Architecture

Moderniser l'architecture avec la découverte via le domain driven discovery
[https://www.infoq.com/articles/architecture-modernization-domain-driven-discovery/](https://www.infoq.com/articles/architecture-modernization-domain-driven-discovery/)

- Un article très détaillé pour moderniser son architecture en utilisant une approche Domain-Driven Discovery qui se fait en 4 étapes :
  1- Encadrer le problème – Clarifier le problème que vous résolvez, les personnes touchées, les résultats souhaités et les contraintes de solution.
  2- Analyser l’état actuel – Explorer les processus opérationnels et l’architecture des systèmes existants afin d’établir une base de référence pour l’amélioration.
  3- Explorer l’état futur – Concevoir une architecture modernisée fondée sur des contextes délimités, établir des priorités stratégiques, évaluer les options et créer des solutions pour l’état futur.
  4- Créer une feuille de route – Créer un plan pour moderniser l’architecture au fil du temps en fonction des flux de travail ou des résultats souhaités.

Récemment, Sfeir a lancé son blog de développement sur
[https://www.sfeir.dev/](https://www.sfeir.dev/)

- Plein d’articles techniques sur de nombreux thèmes : front, back, cloud, data, AI/ML, mobile.
- Aussi des tendances, des success stories...
- Par exemple dans les derniers articles : on parle d’Alan Turing, du Local Storage en Javascript, de la préparation de certifications React, l’impact de la cybersécurité sur le cloud.

Demis Hassabis annonce travailler sur une IA nommée Gemini qui dépassera ChatGPT
[https://www.wired.com/story/google-deepmind-demis-hassabis-chatgpt/](https://www.wired.com/story/google-deepmind-demis-hassabis-chatgpt/)

- Demis Hassabis CEO de Google DeepMind créateur de AlphaGO et AlphaFold.
- Travaille sur une IA nommée Gemini qui dépasserait ChatGPT de OpenAI.
- Similaire à GPT-4, mais avec des techniques issues de AlphaGO.
- Encore en développement, va prendre encore plusieurs mois.
- Un remplaçant à Bard ?


### Méthodologies

Approcher l'agilité par les traumatismes (de développement) passés des individus
[https://www.infoq.com/articles/trauma-informed-agile/?utm_campaign=infoq_content&amp;utm_source=twitter&amp;utm_medium=feed&amp;utm_term=culture-methods](https://www.infoq.com/articles/trauma-informed-agile/?utm_campaign=infoq_content&amp;utm_source=twitter&amp;utm_medium=feed&amp;utm_term=culture-methods)

- Nous subissons tous un traumatisme du développement qui rend difficile la collaboration avec d’autres - une partie cruciale du travail dans le développement de logiciels agiles.
- Diriger d’une manière tenant compte des traumatismes, ça n’est pas pratiquer la psychothérapie non sollicitée, et ça ne justifie pas les comportements destructeurs sans les aborder.
- Être plus sensible aux traumatismes dans votre leadership peut aider tout le monde à agir de façon plus mature et plus disponible sur le plan cognitif, surtout dans des situations émotionnellement difficiles.
- Dans les milieux de travail tenant compte des traumatismes, les gens accordent plus d’attention à leur état physique et émotionnel.
- Ils s’appuient aussi davantage sur le pouvoir de l’intention, fixent des objectifs d’une manière moins manipulatrice et sont capables d’être empathiques sans s’approprier les problèmes des autres.



### Loi, société et organisation

Mercedes va rajouter de l’intelligence artificielle dans ses voitures
[https://azure.microsoft.com/en-us/blog/mercedes-benz-enhances-drivers-experience-with-azure-openai-service/](https://azure.microsoft.com/en-us/blog/mercedes-benz-enhances-drivers-experience-with-azure-openai-service/)

- Programme beta-test de 3 mois pour le moment.
- Assistance vocale “Hey Mercedes”.
- Permet de discuter avec la voiture pour trouver son chemin, concocter une recette, ou avoir tout simplement des discussions. 
- Ils travaillent sur des plugins pour réserver un resto, acheter des tickets de cinéma.

Free software vs Open Source dans le contexte de l'intelligence artificielle par Sacha Labourey
[https://medium.com/@sachalabourey/ai-free-software-is-essential-to-save-humanity-86b08c3d4777](https://medium.com/@sachalabourey/ai-free-software-is-essential-to-save-humanity-86b08c3d4777)

- On parle beaucoup d'IA et d'open source.
- Mais il manque la dimension de contrôle des utilisateurs finaux.
- Stallman a créé la FSF par peur de la notion d'humain augmenté par des logiciels qui sont contrôlés par d'autres (implants dans le cerveau etc).
- D'où la GPL et sa viralité qui propage la capacité à voir et modifier le code que l'on fait tourner.
- Dans le débat IA, ce n'est pas seulement Open Source (casser l'oligopolie) mais aussi le Free Software qui est en jeu.

La folie du Cyber Resilience Act (CRA) européen
[https://news.apache.org/foundation/entry/save-open-source-the-impending-tragedy-of-the-cyber-resilience-act](https://news.apache.org/foundation/entry/save-open-source-the-impending-tragedy-of-the-cyber-resilience-act)

- Au sein de l’UE, la loi sur la cyber-résilience (CRA) fait maintenant son chemin à travers les processus législatifs (et doit faire l’objet d’un vote clé le 19 juillet 2023). Cette loi s’appliquera à un large éventail de logiciels (et de matériel avec logiciel intégré) dans l’UE. L’intention de ce règlement est bonne (et sans doute attendue depuis longtemps) : rendre le logiciel beaucoup plus sûr.
- Le CRA a une approche binaire : oui/non et considère tout le monde de la même manière.
- Le CRA réglementerait les projets à source ouverte à moins qu’ils n’aient « un modèle de développement entièrement décentralisé ». Mais les modèles OSS sont de complexes mélanges de pur OSS et éditeurs de logiciels.
- les entreprises commerciales et les projets open source devront être beaucoup plus prudents quant à ce que les participants peuvent travailler sur le code, quel financement ils prennent, et quels correctifs ils peuvent accepter.
- Certaines des obligations sont pratiquement impossibles à respecter, par exemple l’obligation de « livrer un produit sans vulnérabilités exploitables connues ».
- Le CRA exige la divulgation de vulnérabilités graves non corrigées et exploitées à l’ENISA (une institution de l’UE) dans un délai mesuré en heures, avant qu’elles ne soient corrigées (complètement opposé aux bonnes pratiques de sécu).
- Une fois de plus une bonne idée à l'origine, mais très mal implémentée qui risque de faire beaucoup de dommages.

Octave Klaba, avec Miro, son frère, et la Caisse des Dépôts, finalisent la création de Synfonium qui va maintenant racheter 100% de Qwant et 100% de Shadow. Synfonium est détenue à 75% par Jezby Venture et Deep Code et à 25% par la CDC.
[https://twitter.com/i/web/status/1673555414938427392](https://twitter.com/i/web/status/1673555414938427392)

- L’un des rôles de Synfonium est de créer la masse critique des utilisateurs et des clients B2C et B2B qui vont pouvoir utiliser tous ces services gratuits et payants.
- Vous y retrouverez le moteur de recherche, les services gratuits, la suite collaborative, le social login, mais aussi les services de nos partenaires tech.
- Le but est de créer une plateforme dans le Cloud SaaS EU qui respecte nos valeurs et nos lois européennes.

Yann LeCun : « L'intelligence artificielle va amplifier l'intelligence humaine »
[https://www.europe1.fr/emissions/linterview-politique-dimitri-pavlenko/yann-lecun-lintelligence-artificielle-va-amplifier-lintelligence-humaine-4189120](https://www.europe1.fr/emissions/linterview-politique-dimitri-pavlenko/yann-lecun-lintelligence-artificielle-va-amplifier-lintelligence-humaine-4189120)



## Conférences

La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 2-3 septembre 2023 : [SRE France SummerCamp](https://summercamp.srefrance.org) - Chambéry (France) <a href="https://summercamp.srefrance.org/cfp/"><img alt="CFP sre-france-summercamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2021-August-2023&color=green"></a>
- 6 septembre 2023 : [Cloud Alpes](https://www.cloudalpes.fr/) - Lyon (France) <a href="https://conference-hall.io/public/event/90HSNNtojHqk1S8SbavA"><img alt="CFP Cloud Alpes" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2023&color=red"></a>
- 8 septembre 2023 : [JUG Summer Camp](https://www.jugsummercamp.org/) - La Rochelle (France) <a href="https://conference-hall.io/public/event/wvKVYtvwGy7z5NEt8tOW"><img alt="CFP JUG Sumer Camp" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-June-2023&color=red"></a>
- 14 septembre 2023 : [Cloud Sud](https://www.cloudsud.fr/) - Remote / Toulouse (France) <a href="https://conference-hall.io/public/event/UHdxMRvP0zJB2eVBwm1C"><img alt="Cloud Sud" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2023&color=red"></a>
- 18 septembre 2023 : [Agile Tour Montpellier](https://agiletourmontpellier.fr/) - Montpellier (France) <a href="https://conference-hall.io/public/event/mXxbggAyDUbTFXazxkWX"><img alt="CFP Agile Tour Montpellier" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2023&color=red"></a>
- 19-20 septembre 2023 : [Agile en Seine](https://www.agileenseine.com/) - Paris (France) <a href="https://sessionize.com/agile-en-seine-2023/"><img alt="CFP Agile en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=red"></a>
- 19 septembre 2023 : [Salon de la Data Nantes](https://salondata.fr/index.php/le-salon/) - Nantes (France) & Online 
- 21-22 septembre 2023 : [API Platform Conference](https://api-platform.com/con/2023) - Lille (France) & Online 
- 22 septembre 2023 : [Agile Tour Sophia Antipolis](http://www.agiletoursophia.fr) - Valbonne (France) <a href="https://sessionize.com/agile-tour-sophia-2023/?sp_con=KGCdw4XVF7QH%2Fu4B8Gne1g%3D%3D"><img alt="CFP ATSA" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-june-2023&color=red"></a>
- 25-26 septembre 2023 : [BIG DATA & AI PARIS 2023](https://www.bigdataparis.com/) - Paris (France) <a href="#"><img alt="CFP BIG DATA & AI PARIS 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-March-2023&color=red"></a>
- 28-30 septembre 2023 : [Paris Web](https://www.paris-web.fr/) - Paris (France) 
- 2-6 octobre 2023 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) <a href="https://dvbe23.cfp.dev/"><img alt="CFP Devoxx Belgium 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-July-2023&color=green"></a>
- 6 octobre 2023 : [DevFest Perros-Guirec](https://devfest.codedarmor.fr/) - Perros-Guirec (France) <a href="https://conference-hall.io/public/event/sO14GCz3BN0lXwU5Ruf6"><img alt="CFP DevFest Perros-Guirec 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2023&color=red"></a>
- 10 octobre 2023 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-2023/"><img alt="CFP ParisTestConf 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2023&color=red"></a>
- 11-13 octobre 2023 : [Devoxx Morocco](https://devoxx.ma/) - Agadir (Morocco) <a href="https://dvma23.cfp.dev/"><img alt="CFP ParisTestConf 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2022-May%20to%2017-July-2023&color=red"></a>
- 12 octobre 2023 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/public/event/SkVFHQ5kzrrfUlSU4MK1"><img alt="CFP Cloud Nord 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June&color=red"></a>
- 12-13 octobre 2023 : [Volcamp 2023](https://www.volcamp.io/) - Clermont-Ferrand (France) <a href="https://conference-hall.io/public/event/b9seMUHc924mGItMl2aa"><img alt="CFP Volcamp 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-May-2023&color=red"></a>
- 12-13 octobre 2023 : [Forum PHP 2023](https://event.afup.org/forum-php-2023) - Marne-la-Vallée (France) <a href="https://afup.org/event/forumphp2023"><img alt="CFP ForumPHP 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-June-2023&color=red"></a>
- 19-20 octobre 2023 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) <a href="https://conference-hall.io/public/event/z5FSBfmwJSUWb4UO9hD4"><img alt="CFP DevFest Nantes 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=red"></a>
- 19-20 octobre 2023 : [Agile Tour Rennes](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2023/"><img alt="CFP Agile Tour Rennes 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-May-2023&color=red"></a>
- 26 octobre 2023 : [Codeurs en Seine](https://www.codeursenseine.com/2023) - Rouen (France) <a href="https://cfp.codeursenseine.com/"><img alt="CFP Codeurs en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-Aug-2023&color=green"></a>
- 25-27 octobre 2023 : [ScalaIO](https://scala.io/) - Paris (France) 
- 26-27 octobre 2023 : [Agile Tour Bordeaux](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2023/"><img alt="CFP Agile Tour Bordeaux 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-July-2023&color=green"></a>
- 26-29 octobre 2023 : [SoCraTes-FR](https://socrates-fr.github.io/) - Orange (France) 
- 10 novembre 2023 : [BDX I/O](https://www.bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/VORL07zbTZ8CBB8kOVgq"><img alt="CFP BDX I/O 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-July-2023&color=green"></a>
- 15 novembre 2023 : [DevFest Strasbourg](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/public/event/I0SQmndJ7vrnWeBdEuTQ"><img alt="CFP DevFest Strasbourg 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2023&color=green"></a>
- 16 novembre 2023 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://devfesttoulouse.fr/#le-cfp"><img alt="CFP DevFest Toulouse 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=red"></a>
- 23 novembre 2023 : [DevOps D-Day #8](https://www.devopsdday.com/) - Marseille (France) <a href="https://hopscotch.key4events.com/abstract.aspx?e=321&c=2683"><img alt="CFP DevOps D-Day #8" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-July-2023&color=green"></a>
- 30 novembre 2023 : [PrestaShop Developer Conference](https://events.prestashop.com/prestashop-developer-conference) - Paris (France) <a href="https://hopscotch.key4events.com/abstract.aspx?e=321&c=2683"><img alt="CFP PrestaShop Developer Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-September-2023&color=green"></a>
- 30 novembre 2023 : [WHO run the Tech](https://whorunthetech.com/) - Rennes (France) <a href="https://conference-hall.io/public/event/Pe62MIv1mSH9KF7nDGRA"><img alt="CFP Who Run The Tech #8" src="https://img.shields.io/static/v1?label=CFP&message=until%207-September-2023&color=green"></a>
- 6-7 décembre 2023 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) <a href="https://sessionize.com/open-source-experience-2023/"><img alt="CFP [Open Source Experience 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-june-2023&color=red"></a>
- 7 décembre 2023 : [Agile Tour Aix-Marseille](https://atmrs.esprit-agile.com/) - Gardanne (France) <a href="https://sessionize.com/agile-tour-aix-marseille-2023/"><img alt="CFP [Agile Tour Aix-Marseille" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-july-2023&color=green"></a>
- 8 décembre 2023 : [DevFest Dijon](https://developers-group-dijon.fr/#devfest) - Dijon (France) <a href="https://conference-hall.io/public/event/YfMYBkCIuy2dMjdhRZlX"><img alt="CFP DevFest Dijon" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-october-2023&color=green"></a>
- 7-8 décembre 2023 : [TechRocks Summit](https://events.tech.rocks/summit-2023/fr/registration/ticketing) - Paris (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

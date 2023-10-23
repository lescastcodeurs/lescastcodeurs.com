---
title: LCC 301 - Minoritaire ou majoritaire, là est la question!
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 301
mp3_length: 76246993
tweet: Minoritaire ou majoritaire, là est la question! #SDKMan #Temurin #LangChain4J #Unicode #WebAssembly #IA
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Emmanuel et Guillaume reviennent sur les nouveautés de l’écosystème Java (Java 21, SDKman, Temurin, JBang, Quarkus, LangChain4J…) mais aussi sur des sujets plus généraux comme Unicode, WebAssembly, les bases de données vectorielles, et bien d’autres sujets orientés IA (LLM, ChatGPT, Anthropic…).

Enregistré le 20 octobre 2023

Téléchargement de l’épisode [LesCastCodeurs-Episode-301.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-301.mp3)

## News

### Langages

Gérer facilement de multiples versions de Java grâce à SDKMan!
[https://foojay.io/today/easily-manage-different-java-versions-on-your-machine-with-sdkman/](https://foojay.io/today/easily-manage-different-java-versions-on-your-machine-with-sdkman/)

- SDKMan! supporte Java, mais aussi GraalVM, JBang, Quarkus, Micronaut… (les CLIs).
- La CLI UI est toujours un peu chelou, donc cet article est utile pour un rappel.

Tous les changements de Java 8 à Java 21
[https://advancedweb.hu/a-categorized-list-of-all-java-and-jvm-features-since-jdk-8-to-21/](https://advancedweb.hu/a-categorized-list-of-all-java-and-jvm-features-since-jdk-8-to-21/)

- Nous avons déjà partagé ce lien par le passé, mais l’article est mis à jour à chaque release majeure de Java pour couvrir les dernières nouveautés. Et en particulier, Java 21 qui vient de sortir.

Eclipse Temurin ne va pas sortir son Java 21 tout de suite
[https://adoptium.net/en-GB/blog/2023/09/temurin21-delay/](https://adoptium.net/en-GB/blog/2023/09/temurin21-delay/)

- Apparemment, une nouvelle licence pour le TCK (qui valide la compliance) doit être approuvée.
- Oracle semble avoir sorti de nouveaux termes, à quelques jours de la sortie officielle de Java 21.
- La mise à jour du TCK est arrivée le 9 octobre.
- Comment Microsoft a pu sortir le sien avant ?

Le Financial Times propose un bel article avec des animations graphiques expliquant le fonctionnement de l’architecture de réseau de neurones de type transformers, utilisé dans les Large Language Models
[https://ig.ft.com/generative-ai/](https://ig.ft.com/generative-ai/)

- LLM via relation entre les mots.
- Notion de transformer, qui parse les "phrases" entières ce qui capture le contexte.
- Discute le beam search vs greedy search pour avoir non pas le prochain mot, mais l’ensemble des prochains mots.
- L’article parle de texte/vector embeddings pour représenter les tokens et leurs relations aux autres.
- Il décrit le processus d’attention qui permet aux LLM de comprendre les associations fréquentes entre tokens
- Le sujet des hallucinations est couvert.
- Et pour éviter des hallucinations, utilisation du _grounding_.

The Absolute Minimum Every Software Developer Must Know About Unicode in 2023
[https://tonsky.me/blog/unicode/](https://tonsky.me/blog/unicode/)

- Un bel article qui explique Unicode, les encodings comme UTF-8 ou UTF-16, les code points, les graphèmes, les problèmes pour mesurer une chaîne de caractères, les normalisations de graphèmes pour la comparaison de chaîne.
- Si vous voulez mieux comprendre Unicode, c’est l’article à lire !
- Unicode, c’est un mapping chiffre - caractère en gros.
- 1,1 million de caractères disponibles, dont 15% définis et 11% pour usage privé : il reste de la place. Et non les emojis ne prennent pas beaucoup de place.
- Par exemple Apple utilise les usages privés pour délivrer le logo Apple dans les fonts du Mac (mais pas ailleurs).
- UTF est l’encoding du chiffre de l’unicode.
- UTF-32: 4 bytes tout le temps, UTF-8, encodage variable de 1 à 4 bytes (compatible avec ASCII) ; il a aussi un peu de détection d’erreurs (prefix des bytes différents).
- Optimisé pour le latin et les textes techniques genre HTML.
- Problème principal : on ne peut pas déterminer la taille en comptant les bytes, ni aller au milieu d’une chaine directement (variable).
- UTF-16 utilise 2 ou plus de bytes et est plus sympa pour les caractères asiatiques.
- Un caractère, c’est en fait un graphème qui peut être fait de plusieurs codepoints : é = `e` U+0065 + `´` U+0301 ; `☹️` (smiley qui pleure) is `U+2639` + `U+FE0F`.
- D’ailleurs selon le langage `":man-facepalming::skin-tone-3:".length = 5`, 7 en java, 17 en rust ou 1 en swift. Ça dépend de l’encodage de la chaine (UTF-?).
- "“I know, I’ll use a library to do strlen()!” — nobody, ever."
- En java, utiliser [ICU](https://github.com/unicode-org/icu).
- Attention `java.text.BreakIterator` supporte une vieille version d’Unicode, donc ce n’est pas bon.
- Les règles de graphème changent à chaque version majeure d’Unicode (tous les ans).
- Certains caractères comme `Å` ont plusieurs représentations d’encodage, donc il y a de la normalisation : NFD qui éclate en pleins de codepoints ou NDC qui regroupe au max.
- Normaliser avant de chercher dans les chaines.
- Certains Unicode sont représentés différemment selon la LOCALE (c’est la life).
- Et ça continue dans l’article…

JBang permet d’appeler Java depuis Python via un PyPI
[https://jbang.dev/learn/python-with-jbang/](https://jbang.dev/learn/python-with-jbang/)

- C’est particulièrement intéressant pour appeler Java depuis son Jupyter notebook.
- Ça fait un appel à un autre process (mais installe JBang et Java au besoin).

### Librairies

Quarkus 3.4 est sorti
[https://quarkus.io/blog/quarkus-3-4-1-released/](https://quarkus.io/blog/quarkus-3-4-1-released/)

- Un CVE donc mettez a jour vos Quarkus.
- Support de Redis 7.2.
- Plus de granularité sur la désactivation de Flyway globalement ou par data source. Depuis l’activation transparente et automatique en 3.3.
- `quarkus update` est l’approche recommandée pour mettre à jour.

Comment tester si un thread virtuel "pin"
[https://quarkus.io/blog/virtual-threads-3/](https://quarkus.io/blog/virtual-threads-3/)

- Exemple avec quarkus.
- Comment générer la stacktrace.
- Et un utilitaire JUnit qui fait échouer le test quand le thread pin.
- Une série d’articles de Clement sur les threads virtuels et comment les utiliser dans quarkus [https://quarkus.io/blog/virtual-thread-1/](https://quarkus.io/blog/virtual-thread-1/).

À la découverte de LangChain4J, l’orchestration pour l’IA générative en Java
[https://glaforge.dev/posts/2023/09/25/discovering-langchain4j/](https://glaforge.dev/posts/2023/09/25/discovering-langchain4j/)

- Guillaume nous parle du jeune projet LangChain4J, inspiré du projet Python LangChain, qui permet d’orchestrer différents composants d’une chaine d’IA générative.
- Grâce à ce projet, les développeurs Java ne sont pas en reste, et n’ont pas besoin de se mettre à coder en Python.
- LangChain4J s’intègre avec différentes bases vectorielles comme Chroma ou WeAviate, ainsi qu’une petite base en mémoire fort pratique.
- LangChain4J supporte l’API PaLM de Google, mais aussi OpenAI.
- Il y a différents composants pour charger/découper des documents et pour calculer les vector embeddings des extraits de ces documents.
- Vidéo enregistrée à Devoxx sur ce thème : [https://www.youtube.com/watch?v=ioTPfL9cd9k](https://www.youtube.com/watch?v=ioTPfL9cd9k).

### Infrastructure

OpenTF devient OpenTofu
[https://www.linuxfoundation.org/press/announcing-opentofu](https://www.linuxfoundation.org/press/announcing-opentofu)

Dans les Dockerfiles, on peut utiliser la notation “heredocs” : `<<EOF`, des commandes, puis `EOF` pour indiquer une suite de commandes à exécuter
[https://www.docker.com/blog/introduction-to-heredocs-in-dockerfiles/](https://www.docker.com/blog/introduction-to-heredocs-in-dockerfiles/)

- C’est comme faire un seul `RUN` avec des commandes séparées par des `&&`, mais en plus sympa parce que ça ressemble à un script Bash classique.
- Par contre, c’est spécifique Docker et ça n’est pas portable sur Podman ou autre.

Docker annonce un nouveau protocole pour signer ses images OpenPubkey
[https://www.linuxfoundation.org/press/announcing-openpubkey-project](https://www.linuxfoundation.org/press/announcing-openpubkey-project)

- Sigstore répond : [https://blog.sigstore.dev/openpubkey-and-sigstore/](https://blog.sigstore.dev/openpubkey-and-sigstore/).
- OpenPubkey s’appuie sur OIDC.
- C’est un repo GitHub pour l’instant.
- Pas de tier de confiance en dehors du OIDC provider.
- OIDC lie une identité à une clé de chiffrement via une extension de l’ID token.
- OIDC devient une preuve de possession.
- Purement client side via la signature de l’ID token.
- Ils utilisent le `nonce` pour stocker la clé publique et la signer cryptographiquement.
- Vs Sigstore : plus d’élément central comme le transparency log et l’autorité de certification.
- Pour le projet Sigstore, ils n’ont pas utilisé cette architecture parce que la privacy des identités, notamment en cas de renommage et sur le long terme, n’est pas respectée.
- La rotation de clés et la partie client side devient beaucoup plus complexe (OIDC quoi) et ouvre des risques de sécurité (bugs d’implémentation).
- La clé des OIDC providers est rotatée et ce n’est pas expliqué dans le flow OpenPubkey.
- La complexité passe de server side à client side (vu que le nonce est la clé du système).
- Le client notamment va devoir tracker les clés de signature des providers OIDC tout le temps (ou un système devra le faire).
- L’ID token typiquement a plus d’infos qui vont leaker en tant que certificat du truc signé (privacy).

### Cloud

Oracle Cloud rajoute GraalOS
[https://blogs.oracle.com/java/post/introducing-graalos](https://blogs.oracle.com/java/post/introducing-graalos)

- Plateforme serverless sans container.
- Application native.
- En fait des applis compilées avec GraalVM native image.

### Web

Comment créer le plus petit conteneur qui sert du contenu statique
[https://lipanski.com/posts/smallest-docker-image-static-website](https://lipanski.com/posts/smallest-docker-image-static-website)

- En utilisant les images Busybox.
- On peut descendre à environ 150 Ko.
- À voir la scalabilité.
- Et les CVEs.

The state of WebAssembly in 2023
[https://blog.scottlogic.com/2023/10/18/the-state-of-webassembly-2023.html](https://blog.scottlogic.com/2023/10/18/the-state-of-webassembly-2023.html)

- Rust et JavaScript voient leur popularité lorsqu’ils ciblent Wasm.
- Wasm est toujours beaucoup utilisé pour le développement web, mais aussi pour le serverless ou comme host pour système de plugins.
- L’étude montre que les développeurs sont intéressés par les threads, le garbage collection et le nouveau modèle de composants.
- Côté WASI, toutes les propositions sur le thème I/O retiennent l’attention comme : le support de HTTP, du filesystem, ou les sockets… pourtant, c’est ce que l’approche WASIX proposait, même si elle n’a pas été très bien reçue par la communauté.

### Data & IA

AWS investit 4 milliards dans [Anthropic.ai](http://Anthropic.ai)
et devient actionnaire **minoritaire** [https://twitter.com/didiergirard/status/1706226172428701896?s=61&amp;t=cvEVELchNh1NmF0qxg2GgA](https://twitter.com/didiergirard/status/1706226172428701896?s=61&amp;t=cvEVELchNh1NmF0qxg2GgA)

- Depuis quelque temps, beaucoup de personnes se demandaient où en était AWS dans le domaine GenAI. La réponse vient de tomber.
- Plutôt que de développer sa propre technologie comme le fait Google, Amazon adopte la stratégie de Microsoft avec OpenAI en investissant dans un pure player et en lui fournissant de la puissance de calcul.
- AWS deviendra le principal fournisseur cloud d’Anthropic, en fournissant son infrastructure à base de puces AWS Trainium et Inferentia.
- La technologie d’Anthropic sera ajoutée au catalogue d’Amazon Bedrock. Les entreprises pourront personnaliser et affiner les modèles sur AWS.
- Claude 2 propose une fenêtre contextuelle de 100 000 tokens, que les entreprises pourront utiliser.
- Dans le cadre de cet investissement, Amazon acquiert une participation minoritaire dans @AnthropicAI. La structure de gouvernance d’Anthropic reste inchangée.
- L’annonce : [https://www.anthropic.com/index/anthropic-amazon](https://www.anthropic.com/index/anthropic-amazon).
- Merci Didier Girard pour ce résumé.

Article d’opinion : les bases de données vectorielles ne sont pas une catégorie de base de donnée séparée
[https://nextword.substack.com/p/vector-database-is-not-a-separate](https://nextword.substack.com/p/vector-database-is-not-a-separate)

- On a vu l’émergence de nouvelles bases de données de type vectoriel ces deux dernières années : Pinecone, Milvus, Weaviate, Qdrant…
- Mais les DB existantes sont toutes en train de rajouter le support des vecteurs dans leur moteur.
- Pour la “data gravity” : c’est plus facile d’avoir ses données au même endroit que d’en avoir dans différentes bases malgré leur corrélation.
- Pour capturer le use case de “Retrieval Augmented Generation”, en utilisant les Large Language Model pour récupérer de l’info dans ces bases de données vectorielles.
- Je pense qu’on verra aussi les DB vectorielles ajouter également plus de fonctionnalités de requêtage qui leur manquent.

Chat GPT: voix et image [https://openai.com/blog/chatgpt-can-now-see-hear-and-speak](https://openai.com/blog/chatgpt-can-now-see-hear-and-speak)

- OpenAI a annoncé de nouvelles fonctionnalités vocales et d’image pour ChatGPT.
- OpenAI a publié un article décrivant leurs efforts de test avec GPT-4V. Ils ont utilisé le modèle dans un outil appelé Be My AI, qui aide les personnes malvoyantes en décrivant le contenu des images : [https://cdn.openai.com/papers/GPTV_System_Card.pdf](https://cdn.openai.com/papers/GPTV_System_Card.pdf).
- L’article résume l’évaluation du modèle GPT-4V par OpenAI, qui inclut des tests de comportement, de sécurité, et de capacité médicale, mais conclut que le modèle n’est pas approprié pour des fonctions médicales.

L’IA, c’est pas rentable
[https://www.tomshardware.com/news/microsoft-lost-money-on-ai](https://www.tomshardware.com/news/microsoft-lost-money-on-ai)

- Copilot dépense 20$ par utilisateur qui ramène 10$.
- Il va donc y avoir de la rationalisation après l’acquisition rush d’utilisateurs.
- En augmentant les prix.
- En mettant des limites plus restrictives.
- En utilisant des modèles plus simples et plus légers.
- Peut-être avec du hardware plus optimisé en coût.
- C’est intéressant que l’IA est déjà trop puissante pour son coût et pas encore assez pour être suffisante. Loi de Moore ?v
- MS dit que ce chiffre est faux, mais ne donne pas le vrai chiffre.

### Outillage

Amazon acquiert Fig
[https://techcrunch.com/2023/08/29/amazon-fig-command-line-terminal-generative-ai/](https://techcrunch.com/2023/08/29/amazon-fig-command-line-terminal-generative-ai/)

- On en parlait récemment.
- C’est un terminal boosté à l’IA.

Introduction de TestContainer Desktop
[https://www.infoq.com/news/2023/09/testcontainers-desktop/](https://www.infoq.com/news/2023/09/testcontainers-desktop/)

- Vient de l’appli proprio TestContainer Cloud Desktop.
- Permet de mettre les ports fixes (plus facile à debugger).
- Le gel des containers pour laisser le container tourner pour l’inspection
- Supporte les moteurs de containers alternatifs à Docker (dont Podman et d’autres que je ne connaissais pas).

Nouvelle version 1.7 de jq, l’outil en ligne de commande pour examiner/modifier vos documents JSON
[https://github.com/jqlang/jq/releases](https://github.com/jqlang/jq/releases)

- Utilisation des nombres décimaux pour ne pas perdre de précision.
- Une fonction `pick(stream)` pour faire des projections et ne garder que les champs qui nous intéressent.
- Une fonction debug() pour loguer des messages sur `stderr`.
- Une fonction abs() pour calculer la valeur absolue.
- Et plein d’autres petits raffinements et correctifs de bugs.
- La version d’avant datait de novembre 2018.

Pratiques de Dogfooding : utiliser tes propres outils comme GitHub utilise GitHub actions pour son propre système CI
[https://www.infoq.com/news/2023/10/running-GitHub-using-actions/](https://www.infoq.com/news/2023/10/running-GitHub-using-actions/)

- Avoir des runners plus larges.
- Donner l’accès à des resources privées au runner via une gateway qui reçoit un token OIDC specific au runner.
- Workflow réutilisables.
- Sortie de workflows réutilisables pour optimiser si le git id est le même qu’un run ancien.

Sondage de la communauté TestContainer
[https://www.atomicjar.com/2023/09/state-of-local-development-and-testing-2023/](https://www.atomicjar.com/2023/09/state-of-local-development-and-testing-2023/)

- TestContainer pour plus de 10 languages, pas juste Java.
- RDBMS puis message brokers et les bases nosql sont la majorité des usages.
- Mais pas que (serveur web, émulateur de cloud, microservices internes).
- 40% des utilisateurs utilisent autre chose que Docker Desktop (docker engine, podman, rancher etc).
- TestContainer au moment du dev et pas que pour les tests.

### Architecture

Vous êtes plutôt logging ou plutôt tracing ?
[https://andydote.co.uk/2023/09/19/tracing-is-better/](https://andydote.co.uk/2023/09/19/tracing-is-better/)

- L’article essaie de démontrer que le tracing, c’est mieux que le logging.
- L’imbrication des traces permet de mieux voir la corrélation que des logs.
- Les traces donnent des informations de durées, pas que des timestamp.
- On peut rajouter des attributs à ses traces, ce qui rend plus facile le requêtage, plutôt que de faire des greps sur des messages de log.

### Méthodologies

On a construit un produit top et ça a échoué
[Earthly.dev](http://Earthly.dev) raconte [https://earthly.dev/blog/shutting-down-earthly-ci/](https://earthly.dev/blog/shutting-down-earthly-ci/)

- Outil de CI/CD qui évite de répéter les tâches...
- Comme startup, tu ne releases pas un produit mature et complet en fonctionnalités.
- Mais peut-être 10x meilleur sur une chose spécifique qui peut faire oublier les manques à certains.
- Quand tu captures ces premiers, tu investis et étends, et tu répètes.
- Si au début ce différenciateur n’attire personne, ajouter des features ne va pas aider, c’est une recette pour construire quelque chose que personne ne veut.
- Ils ont construit leur plan de domination en étapes indépendantes, des produits plus focalisés.
- Et le premier produit "gratuit" ne cannibalisait pas les seconds produits, car ils adressaient différents problèmes (donc pas de risque sur le business model).
- Le premier produit construit par une personne a été beaucoup adopté.
- Le deuxième (remote workers) a aussi été adopté avec des gens qui faisaient en DIY, et quand ils ont fait une offre managée, les gens sont venus.
- Les CI traditionnelles lançaient le job et le reste était délégué à Earthly et Earthly Satellites (le cœur du build).
- Il ne restait plus qu’à allumer le troisième étage Earthly CI, mais c’est parti en cacahuete.
- La population intéressée n’était pas des fans qui avaient déjà fait le job du produit, ils demandaient en quoi la CI était différente, le coût de migration et ils n’ont jamais pu gagner.
- Au lieu d’une grass root install, il y avait un long mur de migration à passer.
- La clé, c’est que vendre aux devs avec un GTM direct ne marche pas, ils doivent essayer et adopter par eux-mêmes.
- Les développeurs vont acheter un outil de dev, mais tu ne peux pas leur vendre.

horcrux
[https://github.com/jesseduffield/horcrux](https://github.com/jesseduffield/horcrux)

- Permet de chiffrer un fichier en plusieurs morceaux, et il faut avoir un certain nombre de fragments pour rassembler le fichier entier.
- Ne nécessite aucun mot de passe.

### Sécurité

Des pseudos chercheurs en sécurité utilisent Bard pour reporter un CVE pour le projet cURL
[https://hackerone.com/reports/2199174](https://hackerone.com/reports/2199174)

- Heureusement, Daniel Steinberg (le créateur de cURL) et les mainteneurs du projet ont rapidement détecté la supercherie.
- Les LLMs sont super créatifs : ils ont déjà vu dans leur corpus d’entrainement des pages de CVE, et sont donc capables d’en imaginer aussi !
- Mais imaginez le temps perdu par les mainteneurs de projet OSS s’ils doivent du coup perdre leur temps à vérifier de telles inepties ?
- Au nez et à la Bard de l’IA.

### Loi, société et organisation

Cisco achète Splunk pour 28 milliards
[https://techcrunch.com/2023/09/21/cisco-to-acquire-splunk-in-28b-mega-deal/](https://techcrunch.com/2023/09/21/cisco-to-acquire-splunk-in-28b-mega-deal/)

- Bouge cisco plus dans le software.
- "synergétique".
- Objectif : un géant de l’observabilité et la sécurité.
- Avec de l’IA parce que c’est comme ça qu’on justifie ces achats.
- Cet achat doit encore être validé par les autorités de concurrence.
- Quelque part en 2024.

Les fondations comme Eclipse ont peur du Cyber Résilience Act Européen tel que présenté jusqu’à présent
[https://newsroom.eclipse.org/news/announcements/cra-should-support-open-practices-open-source-and-development-european-open](https://newsroom.eclipse.org/news/announcements/cra-should-support-open-practices-open-source-and-development-european-open)

- Ils demandent une clarification sur les contraintes réglementaires.
- Notamment d’exclure les fondations / associations et laisser le poids sur les sociétés qui fourniraient les projets open sources des fondations dans le cadre d’un accord commercial, pas juste de le fournir en téléchargement.
- Réutiliser la validation de compliance des sociétés commerciales par les fondations.
- Autre article de la linux foundation : [https://www.linuxfoundation.org/blog/understanding-the-cyber-resilience-act](https://www.linuxfoundation.org/blog/understanding-the-cyber-resilience-act).
- Fourniture de matchs, auditing, fournir des mises à jour.
- Bouge la responsabilité de l’utilisateur vers le développeur du logiciel.
- Un individu qui ne reçoit pas de contribution ni ne fait de consulting ⇒ exclu.
- Fondations et sociétés commerciales ⇒ inclues.
- Défini des classes de logiciels de non critique à classe 1 et 2.
- Doit faire un risk assessment avant de livrer (pas de bug de sécurité, secure par défaut, security update).
- De la doc sur le process d’évaluation des risques et un SBOM notamment.
- Notifier d’une vulnérabilité en moins de 24h.
- Il y a une campagne : #FixTheCRA.

Des protestations contre l’ouverture des modèles d’IA de Meta
[https://spectrum.ieee.org/meta-ai](https://spectrum.ieee.org/meta-ai)

- Ouvrir les modèles et leurs poids permet aux acteurs de bypasser les restrictions (biais etc).
- Donc des gens de Meta protestent contre la politique open source de Meta dans ce domaine.
- L’argument, c’est qu’un modèle derrière une API peut être éteint.
- Les partisans de l’avis contraire pointent que contourner les restrictions de ChatGPT a été trivial jusqu’à présent.
- Et que l’obscurité amène à un déficit de transparence, de connaissance du public.
- Va affecter les chercheurs indépendants.
- Cela dit, ce n’est pas de l’open source pur, car les sources et comment le modèle est entrainé est peu publié.
- L’OSI travaille à une définition d’Open Source AI.

Un site pour mettre une pause à l’IA
[https://pauseai.info/](https://pauseai.info/)

- NOUS RISQUONS DE PERDRE LE CONTRÔLE
- NOUS RISQUONS L’EXTINCTION DE L’HUMANITÉ
- NOUS AVONS BESOIN D’UNE PAUSE
- NOUS DEVONS AGIR IMMÉDIATEMENT
- Il y a un agenda des manifestations à travers le monde (Londres, Bruxelles, SFO… mais où est Paris ?).
- Twitter/Discord/Facebook/TikTok/LinkedIn.
- Alors qui va gagner la course à l’extinction de l’humanité ? La guerre, le réchauffement climatique ou l’IA ?
- Sarah Connor !!!

## Outils de l’épisode

Un QWERTY adapté pour les lettres à accent
[https://altgr-weur.eu/](https://altgr-weur.eu/) (via Thomas Recloux)

## Conférences

Toutes les vidéos de Devoxx Belgique sont disponibles sur
[https://www.youtube.com/@DevoxxForever](https://www.youtube.com/@DevoxxForever).

Hacktoberfest, édition 10 [https://hacktoberfest.com/](https://hacktoberfest.com/).

La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 26 octobre 2023 : [Codeurs en Seine](https://www.codeursenseine.com/2023) - Rouen (France) <a href="https://cfp.codeursenseine.com/"> <img alt="CFP Codeurs en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-Aug-2023&color=red"></a>
- 26-27 octobre 2023 : [Agile Tour Bordeaux](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2023/"><img alt="CFP Agile Tour Bordeaux 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-July-2023&color=red"></a>
- 26-29 octobre 2023 : [SoCraTes-FR](https://socrates-fr.github.io/) - Orange (France) 
- 30-31 octobre 2023 : [Asynconf Event](https://www.asynconf.fr/) - Paris (France) & Online 
- 2-3 novembre 2023 : [Agile Tour Nantes](https://agilenantes.org/evenements/agile-tour-nantes/agile-tour-nantais-2023/) - Nantes (France) 
- 3 novembre 2023 : [XCraft](https://xcraft.fr) - Lyon (France) 
- 7 novembre 2023 : [DevFest Sophia-Antipolis](https://gdg.community.dev/events/details/google-gdg-sophia-antipolis-presents-devfest-2023/) - Sophia-Antipolis (France) <a><img alt="CFP DevFest Sophia-Antipolis " src="https://img.shields.io/static/v1?label=CFP&message=until%2030-September-2023&color=red"></a>
- 10 novembre 2023 : [BDX I/O](https://www.bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/VORL07zbTZ8CBB8kOVgq"> <img alt="CFP BDX I/O 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-July-2023&color=red"> </a>
- 15 novembre 2023 : [DevFest Strasbourg](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/public/event/I0SQmndJ7vrnWeBdEuTQ"><img alt="CFP DevFest Strasbourg 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2023&color=red"></a>
- 16 novembre 2023 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://devfesttoulouse.fr/#le-cfp"><img alt="CFP DevFest Toulouse 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-June-2023&color=red"></a>
- 18-19 novembre 2023 : [Capitole du Libre](https://capitoledulibre.org/) - Toulouse (France) <a hret="https://cfp.capitoledulibre.org/cdl-2023/cfp"><img alt="CFP Capitole du libre" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-August-2023&color=red"></a>
- 23 novembre 2023 : [DevOps D-Day #8](https://www.devopsdday.com/) - Marseille (France) <a href="https://hopscotch.key4events.com/abstract.aspx?e=321&c=2683"><img alt="CFP DevOps D-Day #8" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-July-2023&color=red"></a>
- 23 novembre 2023 : [Agile Grenoble](https://agile-grenoble.org/) - Grenoble (France) <a href="https://sessionize.com/agile-grenoble-2023/"><img alt="CFP Agile Grenoble" src="https://img.shields.io/static/v1?label=CFP&message=until%202-July-2023&color=red"></a>
- 30 novembre 2023 : [PrestaShop Developer Conference](https://events.prestashop.com/prestashop-developer-conference) - Paris (France) <a href="https://hopscotch.key4events.com/abstract.aspx?e=321&c=2683"><img alt="CFP PrestaShop Developer Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-September-2023&color=red"></a>
- 30 novembre 2023 : [WHO run the Tech](https://whorunthetech.com/) - Rennes (France) <a href="https://conference-hall.io/public/event/Pe62MIv1mSH9KF7nDGRA"><img alt="CFP Who Run The Tech #8" src="https://img.shields.io/static/v1?label=CFP&message=until%207-September-2023&color=red"></a>
- 6-7 décembre 2023 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) <a href="https://sessionize.com/open-source-experience-2023/"><img alt="CFP [Open Source Experience 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-june-2023&color=red"></a>
- 6-8 décembre 2023 : [API Days Paris](https://www.apidays.global/paris/) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP API Days Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-November-2023&color=green"></a>
- 7 décembre 2023 : [Agile Tour Aix-Marseille](https://atmrs.esprit-agile.com/) - Gardanne (France) <a href="https://sessionize.com/agile-tour-aix-marseille-2023/"><img alt="CFP [Agile Tour Aix-Marseille" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-september-2023&color=red"></a>
- 7-8 décembre 2023 : [TechRocks Summit](https://events.tech.rocks/summit-2023/fr/registration/ticketing) - Paris (France) 
- 8 décembre 2023 : [DevFest Dijon](https://developers-group-dijon.fr/#devfest) - Dijon (France) <a href="https://conference-hall.io/public/event/YfMYBkCIuy2dMjdhRZlX"><img alt="CFP DevFest Dijon" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-october-2023&color=green"></a>
- 31 janvier 2024-3 février 2024 : [SnowCamp](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/organizer/event/Bq5k5rbMXGynAls6PjRB"><img alt="CFP SnowCamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2023&color=green"></a>
- 1 février 2024 : [AgiLeMans](https://agilemans.org/) - Le Mans (France) <a href="https://sessionize.com/8ieme-journee-agile-au-mans-france/"><img alt="CfP AgiLeMans" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-December-2023&color=green"></a>
- 15-16 février 2024 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/speaker/event/J2VpXPXWngD69u0nrA3R"><img alt="CFP Touraine Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2023&color=green"></a>
- 6-7 mars 2024 : [FlowCon 2024](https://my.weezevent.com/flowcon-2024) - Paris (France) 
- 14-15 mars 2024 : [pgDayParis](https://2024.pgday.paris/) - Paris (France) 
- 19-22 mars 2024 : [KubeCon + CloudNativeCon Europe 2024](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe-2024/) - Paris (France) <a href="https://sessionize.com/kubecon-cloudnativecon-europe-2024/"><img alt="CFP Kubecon EU" src="https://img.shields.io/static/v1?label=CFP&message=18-Sep-2023%20to%2026-Nov-2023&color=green"> </a>
- 28-29 mars 2024 : [SymfonyLive Paris 2024](https://live.symfony.com/2024-paris/) - Paris (France) 
- 17-19 avril 2024 : [Devoxx France](https://www.devoxx.fr/) - Paris (France) 
- 18-20 avril 2024 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 25-26 avril 2024 : [MiXiT](https://mixitconf.org/fr/) - Lyon (France) 
- 25-26 avril 2024 : [Android Makers](https://androidmakers.droidcon.com/) - Paris (France) 
- 8-10 mai 2024 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) 
- 24 mai 2024 : [AFUP Day Nancy](https://event.afup.org/afup-day-2024/afup-day-2024-nancy/) - Nancy (France) <a href="https://afup.org/event/afupday2024nancy"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=green"></a>
- 24 mai 2024 : [AFUP Day Poitiers](https://event.afup.org/afup-day-2024/afup-day-2024-poitiers/) - Poitiers (France) <a href="https://afup.org/event/afupday2024poitiers"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=green"></a>
- 24 mai 2024 : [AFUP Day Lille](https://event.afup.org/afup-day-2024/afup-day-2024-lille/) - Lille (France) <a href="https://afup.org/event/afupday2024lille"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=green"></a>
- 24 mai 2024 : [AFUP Day Lyon](https://event.afup.org/afup-day-2024/afup-day-2024-lyon/) - Lyon (France) <a href="https://afup.org/event/afupday2024lyon"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=green"></a>
- 6-7 juin 2024 : [DevFest Lille](https://devfest.gdglille.org/) - Lille (France) 
- 19-20 septembre 2024 : [API Platform Conference](https://api-platform.com/con/) - Lille (France) & Online 
- 7-11 octobre 2024 : [Devoxx Belgium](https://devoxx.com/#/) - Antwerp (Belgium) 
- 10-11 octobre 2024 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

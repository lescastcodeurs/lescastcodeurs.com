---
title: LCC 312 - Dans la ferme de Mathurin IA IA IO !
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 312
mp3_length: 81999832
tweet: Dans la ferme de Mathurin IA IA IO ! #GoogleIO #OpenAI #Claude #Grok #Redis #ChooseFrance #Quarkus #Hibernate #SpringAI #JakartaData #Chicory #Git #IntelliJ #ASDF #BLD #S3 #Keycloak
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans ce long.... épisode, Emmanuel, Guillaume et Arnaud discutent de l'actualité avec Chicori (un runtime WASM en Java), Jakarta Data, Quarkus 3.10, Spring AI, Hibernate 6.5, mais aussi quelques retours aux basiques (timezones, rate limiting, ...). Gros focus sur les nouveautés annoncées à Google I/O 2024 et dans l'écosystème IA en général avec les annonces d'OpenAI, Claude, Grok et d'autres. Différents outils sont aussi couverts comme Git, IntelliJ, ASDF, BLD, S3. Et enfin des sujets sur la haute disponibilité de Keycloak, la ré-indexation sans downtime, les challenges des implémentations alternatives, le mode vigilant dans GitHub, Redis et les changements de license, et les investissements de Microsoft et AWS en France dans le cadre du programme #ChooseFrance.
N’hésitez pas à nous soumettre vos questions sur <https://lescastcodeurs.com/ama> nous y répondrons dans les prochains épisodes.


Enregistré le 17 mai 2024

Téléchargement de l’épisode [LesCastCodeurs-Episode-312.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-312.mp3)

## News


### Langages

Un runtime WASM en Java
[https://github.com/dylibso/chicory](https://github.com/dylibso/chicory)

- Projet tout nouveau, encore loin de la maturité
- Mais intéressant à suivre pour exécuter du code WebAssembly dans une application Java
- le projet n’a pas 15 jours non plus quand même :)
- Faire tourner des plugins WASM dans la JVM (e.g. plugins)

On peut faire des heap dump en cas de OutOfMemoryException en compilation native [https://quarkus.io/blog/heapdump-oome-native/](https://quarkus.io/blog/heapdump-oome-native/)

- depuis JDK 21
- Un exemple avec Quarkus 
- Et le GC epsilon

100 exercices pour se mettre à Rust [https://rust-exercises.com/](https://rust-exercises.com/)

### Librairies

Hibernate 6.5 est sorti [https://in.relation.to/2024/04/25/orm-650/](https://in.relation.to/2024/04/25/orm-650/)

- cache full pour les entités et leur collections (le défaut est shallow)
- Java record pour les @IdClass
- Les filtres peuvent être auto activés par défaut (vs à faire sur chaque session). Les filtres sont pas mal pour gérer par exemple des soft delete 
- Keybased pagination pour éviter les trous de résultant en cas de modification d’entités en parallèle de.une recherche paginée. S.appuie sur une clé unique et ordonnée genre ISBN
- Une tech preview de Jakarta Data

En parlant de Jakarta Data, deux articles sur le sujet [https://in.relation.to/2024/04/01/jakarta-data-1/](https://in.relation.to/2024/04/01/jakarta-data-1/) [https://in.relation.to/2024/04/18/jakarta-data-1/](https://in.relation.to/2024/04/18/jakarta-data-1/)

- concept de repository pas lié à une entité mais à une relation logique entre les recherches 
- interagit via stateless session et est un bean CDI
- Code généré bien sur 
- 4 opérateur crud et les requêtes save est up sert
- Type sage au sens ou le nom des méthodes n’est pas la logique de recherche
- Annotation et nom des paramètres et c’est type safe via un annotation processor 
- ou string dans @Query qui est type safe aussi via le processeur
- discute plus de type safety et pagination 

Quarkus 3.10 avec quelques nouveautés [https://quarkus.io/blog/quarkus-3-10-0-released/](https://quarkus.io/blog/quarkus-3-10-0-released/)

- flyway 10 arrive avec support natif
- Hibernate search supporte le standalone POJO mapper notamment pour elastic search (pas que ORM)
- Modification des propriétés `Quarkus.package` automatiquement remplacées par `quarkus update`
- et Quarkus 3.9 a fait son grand renommage réactif [https://quarkus.io/blog/quarkus-3-9-1-released/](https://quarkus.io/blog/quarkus-3-9-1-released/) 
- Clarifier que les extensions réactive n’imposent pas des apis réactives et seulement leur cœur implémenté en réactif ou offre optionellement des apis reacrive
- Les gens pensaient à tors que les réactives imposaient le modèle de programmation
- la encore quarkus update à la rescousse

Un article sur l’api structured output pour Spring AI [https://spring.io/blog/2024/05/09/spring-ai-structured-output](https://spring.io/blog/2024/05/09/spring-ai-structured-output)

- un article descriptif sur quand cette api est utilisée
- Et les détails de son usage 

Comment passer une TimeZone dans spring boot et ce que cela impacte en terme de composants [https://www.baeldung.com/spring-boot-set-default-timezone](https://www.baeldung.com/spring-boot-set-default-timezone)

- du basique mais toujours utile
- Task ou app
- Programmatiquement
- Sur certains lifecycles de Spring

### Infrastructure

Un article et la vidéo de Devoxx France sur la haute disponibilité de Keycloak, comment c’est implémenté [https://www.keycloak.org/2024/05/keycloak-at-devoxx-france-2024-recap](https://www.keycloak.org/2024/05/keycloak-at-devoxx-france-2024-recap)

- l’infra d’identité est une infra clé 
- Donc gérer la haute disponibilité est critique
- C’est un article qui pointe sur une vidéo de Devoxx France et la doc de keycloak sur comment tout cela est implémenté 


### Cloud

Comment se ruiner avec des buckets S3 
[https://medium.com/@maciej.pocwierz/how-an-empty-s3-bucket-can-make-your-aws-bill-explode-934a383cb8b1](https://medium.com/@maciej.pocwierz/how-an-empty-s3-bucket-can-make-your-aws-bill-explode-934a383cb8b1)

- Amazon fait payer pour les requêtes non autorisées
- Il suffit de connaître le nom d’un bucket pour faire payer son propriétaire 
- Amazon travaille pour fournir une solution / un fix. 
- il est tombé par hasard sur un nom de bucket utilisé « pour de faux » par un outil open source populaire
- Bien rajouter un suffixe à ses buckets peut réduire le risque
- Mais pas l’éliminer  
- un fix a été livré par amazon [https://aws.amazon.com/about-aws/whats-new/2024/05/amazon-s3-no-charge-http-error-codes/](https://aws.amazon.com/about-aws/whats-new/2024/05/amazon-s3-no-charge-http-error-codes/)


### Data et Intelligence Artificielle

Guillaume résume GoogleIO [https://x.com/techcrunch/status/1790504691945898300?s=61&amp;t=WImtt07yTQMhhoNPN6lYEw](https://x.com/techcrunch/status/1790504691945898300?s=61&amp;t=WImtt07yTQMhhoNPN6lYEw)

- AI overview plus besoin d’aller sur les sites 

Google I/O 2024

- Google I/O 2024 résumé en vidéo de 10 minutes [https://www.youtube.com/watch?v=WsEQjeZoEng](https://www.youtube.com/watch?v=WsEQjeZoEng) et en 100 bullet points [https://blog.google/technology/ai/google-io-2024-100-announcements/](https://blog.google/technology/ai/google-io-2024-100-announcements/)
- Message de Sundar Pichai [https://blog.google/inside-google/message-ceo/google-io-2024-keynote-sundar-pichai/#creating-the-future](https://blog.google/inside-google/message-ceo/google-io-2024-keynote-sundar-pichai/#creating-the-future)
- Project Astra, un assistant universel, sur smartphone avec qui on peut avoir une conversation normale et à qui montrer avec la caméra ce qui nous entoure [https://www.theverge.com/2024/5/14/24156296/google-ai-gemini-astra-assistant-live-io](https://www.theverge.com/2024/5/14/24156296/google-ai-gemini-astra-assistant-live-io)
- Nouveau modèle Gemini 1.5 Flash, quasi aussi performant que le nouveau Gemini 1.5 Pro, mais beaucoup plus rapide (premiers tokens dans la seconde) et aussi moins cher [https://blog.google/technology/developers/gemini-gemma-developer-updates-may-2024/](https://blog.google/technology/developers/gemini-gemma-developer-updates-may-2024/)
- Gemini 1.5 Pro est Gemini 1.5 Flash sont disponibles avec une fenêtre de contexte d’un million de tokens, mais il y a une liste d’attente pour tester une fenêtre de 2 millions de tokens [https://aistudio.google.com/app/waitlist/97595554](https://aistudio.google.com/app/waitlist/97595554) [https://cloud.google.com/earlyaccess/cloud-ai?e=48754805&amp;hl=en](https://cloud.google.com/earlyaccess/cloud-ai?e=48754805&amp;hl=en)
- PaliGemma un nouveau modèle de vision ouvert dans la famille Gemma (pour faire du Q&amp;A du sous-titrage) et preview de Gemma 2, avec une version à 27 milliards de paramètres [https://developers.googleblog.com/en/gemma-family-and-toolkit-expansion-io-2024/](https://developers.googleblog.com/en/gemma-family-and-toolkit-expansion-io-2024/)
- Gemini disponible dans les IDEs : Android Studio, IDX, Firebase, Colab, VSCode, Cloud and Intellj
- Gemini AI Studio enfin disponible en Europe
- Gemini supporte le parallel function calling et l’extraction de frame dans les vidéos
- Trillium, la 6ème version des TPU (Tensor Processing Unit), les processeurs spécifiques ML dans Google Cloud, 5 fois plus puissant que la génération précédente et 67% plus efficace en énergie [https://cloud.google.com/blog/products/compute/introducing-trillium-6th-gen-tpus](https://cloud.google.com/blog/products/compute/introducing-trillium-6th-gen-tpus)
- Le projet NotebookLM rajoute une fonctionnalité de Audio Overview qui permet de discuter avec son corpus de documents avec une conversation vocale [https://notebooklm.google.com/](https://notebooklm.google.com/)
- On peut appliquer le “grounding” avec Google Search pour l’API Gemini, pour que le modèle Gemini puisse chercher des informations complémentaires dans Google Search [https://cloud.google.com/blog/products/ai-machine-learning/vertex-ai-io-announcements](https://cloud.google.com/blog/products/ai-machine-learning/vertex-ai-io-announcements)
- Annonce de Imagen 3, la future version de du modèle de génération d’images Imagen qui améliore la qualité et possède un très bon support du texte dans les images (objectif de disponibilité à l’été) [https://blog.google/technology/ai/google-generative-ai-veo-imagen-3/#Imagen-3](https://blog.google/technology/ai/google-generative-ai-veo-imagen-3/#Imagen-3) 
- [https://deepmind.google/technologies/imagen-3/](https://deepmind.google/technologies/imagen-3/)
- DeepMind annonce Veo, un nouveau modèle de génération de vidéo très convaincant qui peut faire des vidéos en 1080p de 60s, mais en combinant plusieurs prompts successifs, il peut générer des vidéos plus longues qui s’enchainent [https://deepmind.google/technologies/veo/](https://deepmind.google/technologies/veo/)
- VideoFX, ImageFX et MusicFX, des expérimentations de Google AI intégrant Imagen 3 et Veo (pas encore disponibles en Europe) [https://blog.google/technology/ai/google-labs-video-fx-generative-ai/](https://blog.google/technology/ai/google-labs-video-fx-generative-ai/)
- Gemini Advanced [https://blog.google/products/gemini/google-gemini-update-may-2024/#context-window](https://blog.google/products/gemini/google-gemini-update-may-2024/#context-window)
  - Les utilisateurs de Gemini Advanced (l’application web) utilisent Gemini 1.5 Pro avec la fenêtre de contexte de 1 million de tokens, la possibilité de charger des documents de Google Drive, et bientôt la possibilité de générer des graphiques. 
  - Gemini Advanced rajoute aussi la capacité de générer des itinéraires de voyage (avec intégration de Google Flights, etc)
  - Fonctionnalité Gemini Live pour avoir une conversation vocale naturelle avec Gemini [https://blog.google/products/gemini/google-gemini-update-may-2024/#gemini-live](https://blog.google/products/gemini/google-gemini-update-may-2024/#gemini-live)
  - Gem : des plugins pour Gemini Advanced pour créer ses propres assistants personnalisés [https://blog.google/products/gemini/google-gemini-update-may-2024/#personalize-gems](https://blog.google/products/gemini/google-gemini-update-may-2024/#personalize-gems)
- Ask Photos, on peut poser à Google Photos des questions plus complexes comme “quelle est ma plaque d’immatriculation” et Photos devine que parmi toutes les photos de voitures lequelle est certainement la nôtre et extrait le numéro de plaque [https://blog.google/products/photos/ask-photos-google-io-2024/](https://blog.google/products/photos/ask-photos-google-io-2024/)
- Même dans Google Messages vous pourrez échanger avec Gemini
- Google Search [https://blog.google/products/search/generative-ai-google-search-may-2024/](https://blog.google/products/search/generative-ai-google-search-may-2024/)
  - Rajout d’un modèle Gemini spécial search intégré qui permet à Google Search de répondre aux questions de la barre de recherche avec une raisonnement multi-étapes, en étant capable de faire de la planification, en mode multimodal (texte, image, vidéo, audio)
  - Planning de repas et de voyage, supporté dans Gemini, va arriver aussi dans Search
- Gemini 1.5 Pro est disponible dans le panneau latéral de Gmail, Docs, Sheets, Drive [https://blog.google/products/workspace/google-gemini-workspace-may-2024-updates/](https://blog.google/products/workspace/google-gemini-workspace-may-2024-updates/)
- SynthID va même fonctionner pour du texte [https://deepmind.google/discover/blog/watermarking-ai-generated-text-and-video-with-synthid/](https://deepmind.google/discover/blog/watermarking-ai-generated-text-and-video-with-synthid/)
- Gemini Nano bientôt disponible dans les prochaines version de Chrome, pour utiliser le LLM directement dans le navigateur
- Android
  - Seconde béta d’Android 15 [https://android-developers.googleblog.com/2024/05/the-second-beta-of-android-15.html](https://android-developers.googleblog.com/2024/05/the-second-beta-of-android-15.html)
  - Private space pour garder des apps secures avec un niveau d’authentification supplémentaire
  - Google collabore avec Samsung et Qualcomm sur la réalité augmentée dans Android [https://developers.googleblog.com/en/google-ar-at-io-2024-new-geospatial-ar-features-and-more/](https://developers.googleblog.com/en/google-ar-at-io-2024-new-geospatial-ar-features-and-more/)
  - Project Gameface arrive sur Android (pour diriger Android avec les yeux, avec les expressions du visage, pour l’accessibilité) [https://developers.googleblog.com/en/project-gameface-launches-on-android/](https://developers.googleblog.com/en/project-gameface-launches-on-android/)
  - Gemini Nano va passer en multimodal, pas juste du texte
  - Circle to search étendu à 100 millions de téléphones supplémentaires supportant Nano et va permettre de poser des questions, par exemple pour l’aide aux devoirs des enfants [https://blog.google/products/android/google-ai-android-update-io-2024/#circle-to-search](https://blog.google/products/android/google-ai-android-update-io-2024/#circle-to-search)
  - Detect phone scam on device with Gemini Nano
  - Talkback, l’application pour l’accessibilité dans Android, va tirer parti de la multimodalité de Gemini Nano
  - Bientôt de la génération d’image qu’on pourra intégrer dans ses mails, ses messages
- Wear OS [https://android-developers.googleblog.com/2024/05/whats-new-in-wear-os-io-24.html](https://android-developers.googleblog.com/2024/05/whats-new-in-wear-os-io-24.html)
  - Travail sur l’économie d’énergie pour faire durer les montres plus longtemps avant la prochaine recharge. Par exemple, 20% de consommation en moins lorsqu’on court un marathon !
  - Plus de type de données pour les activités physiques
- Project IDX accessible sans liste d’attente [https://developers.googleblog.com/en/start-building-with-project-idx-today/](https://developers.googleblog.com/en/start-building-with-project-idx-today/)
- Firebase annonce 3 nouveaux produits [https://developers.googleblog.com/en/whats-new-in-firebase-io-24/](https://developers.googleblog.com/en/whats-new-in-firebase-io-24/)
  - Data Connect, un backend-as-a-service avec PostgreSQL [https://firebase.google.com/products/data-connect](https://firebase.google.com/products/data-connect)
  - App Hosting, hosting d’application Next et Angular [https://firebase.google.com/products/app-hosting](https://firebase.google.com/products/app-hosting)
  - Genkit, a GenAI framework for app developers [https://firebase.google.com/products/genkit](https://firebase.google.com/products/genkit)
- Dart 3.4 avec support de Wasm comme target de compilation  [https://medium.com/dartlang/dart-3-4-bd8d23b4462a](https://medium.com/dartlang/dart-3-4-bd8d23b4462a)

OpenAI lance son nouveau modèle: gpt-4o
[http://openai.com/index/hello-gpt-4o/](http://openai.com/index/hello-gpt-4o/)

- [https://x.com/openaidevs/status/1790083108831899854?s=46&amp;t=GLj1NFxZoCFCjw2oYpiJpw](https://x.com/openaidevs/status/1790083108831899854?s=46&amp;t=GLj1NFxZoCFCjw2oYpiJpw)
- Audio, vision et reconnaissance de texte en realtime
- Plus rapide et 50% moins cher que son prédécesseur 4-turbo

[https://claude.ai/](https://claude.ai/) est disponible en europe

- Claude, le modèle est créé par Anthropic:
- Claude est un assistant IA basé sur un grand modèle de langage entraîné selon des principes éthiques stricts. Il accorde une grande importance à l'honnêteté, l'impartialité et le respect de l'être humain.
- Son raisonnement repose sur une compréhension profonde des concepts plutôt que sur de simples associations statistiques. Il cherche activement à corriger les éventuels biais ou erreurs.
- Claude est polyvalent et peut s'adapter à différents styles de communication et niveaux de complexité selon le contexte. Il maîtrise de nombreux domaines académiques et scientifiques.
- Il est capable d'introspection sur ses propres processus de pensée et ses limitations. La vie privée et la confidentialité sont des priorités pour lui.
- Claude continue d'apprendre et de s'améliorer grâce aux interactions avec les humains. Son but est d'être un assistant fiable, éthique et bienveillant.
- quelqu'un sait comment ils font pour raisonner et pas juste LLM statistiquer? Comment ils prouvent cela ? C'est du code à part?

Grok le modèle de X/Twitter/Musk est aussi dispo en Europe 
[https://x.com/x/status/1790917272355172401?s=46&amp;t=GLj1NFxZoCFCjw2oYpiJpw](https://x.com/x/status/1790917272355172401?s=46&amp;t=GLj1NFxZoCFCjw2oYpiJpw)

- un truc unique c'est qu'il utilise les tweet comme reference sur ce qu'il dit. Par exemple demande les meilleurs Java Champions
- et c'est sur les tweet recents , probablement une sorte de RAG ou une sorte de fine tuning sur les derniers tweets, je ne sais pas

L'algorithm des modeles de diffusion expliqués [https://x.com/emmanuelbernard/status/1787565568020619650](https://x.com/emmanuelbernard/status/1787565568020619650)

- deux articles, un general et lisible
- l'autre plus abscon mais avec certains details interessants sur le downsizing
- étapes ajout de bruit à des images (learning) pour après appliquer le process opposé le reverse diffusion process
- On prédit le bruit à enlever, on l’enlève et on repère le processus. 
- Et tout cela est influencé par le prompt. 

Reindexation sans downtime des données de documentation de Quarkus, en quarkus bien sûr [https://quarkus.io/blog/search-indexing-rollover/](https://quarkus.io/blog/search-indexing-rollover/)

- utilise hibernate search
- Utilisé Elasticsearch / opensearch
- Article qui explique une des approches pour reindexer sans downtime via index alias

### Outillage

Un article qui parle de l’outil de build bld, peu connu, qui permet d’écrire ses builds simplement dans une classe Java
[https://sombriks.com/blog/0070-build-with-bld-and-why-it-matters/](https://sombriks.com/blog/0070-build-with-bld-and-why-it-matters/)


IntelliJ 2024.1 est sorti [https://blog.jetbrains.com/idea/2024/05/what-s-new-in-intellij-idea-ultimate-2024-1/](https://blog.jetbrains.com/idea/2024/05/what-s-new-in-intellij-idea-ultimate-2024-1/)

- complétion de ligne entière (deep learning)
- Assistant AI amélioré
- Spring Boot support amélioré sur bean completion et génération de diagramme 
- Support de dev containers simplifié 
- Amélioration support quarkus avec notamment icône dev ui et config des tests
- Support OpenRewrite 
- Server wiremock
- et plein d’autres choses

En version beta public, Homebrew permet de vérifier la provenance des packages (bottles)
[https://blog.trailofbits.com/2024/05/14/a-peek-into-build-provenance-for-homebrew/](https://blog.trailofbits.com/2024/05/14/a-peek-into-build-provenance-for-homebrew/)

- Basé sur le système "build provenance" de sigstore [https://docs.sigstore.dev/verifying/attestation/#validate-in-toto-attestations](https://docs.sigstore.dev/verifying/attestation/#validate-in-toto-attestations)
- qui repose sur les attestations in-toto [https://in-toto.io/](https://in-toto.io/)

Mettez à jour git en version 2.45.1 pour fixer des failles de sécurité
[https://github.blog/2024-05-14-securing-git-addressing-5-new-vulnerabilities/](https://github.blog/2024-05-14-securing-git-addressing-5-new-vulnerabilities/)

- **CVE-2024-32002 (Critique, Windows &amp; macOS) :** Les repos Git avec des sous-modules peuvent tromper Git pour lui faire exécuter un hook (élément de script) à partir du répertoire `.git/` pendant une opération de clonage, permettant l'exécution de code à distance (Remote Code Execution).
- **CVE-2024-32004 (Important, machines multi-utilisateurs) :** Un attaquant peut concevoir un repo local qui exécute du code arbitraire lors du clonage.
- **CVE-2024-32465 (Important, toutes les configurations) :** Le clonage à partir de fichiers .zip contenant des repos Git peut contourner les protections, et potentiellement exécuter des hooks malveillants.
- **CVE-2024-32020 (Faible, machines multi-utilisateurs) :** Les clones locaux sur le même disque peuvent permettre à des utilisateurs non approuvés de modifier des fichiers liés physiquement (hard link) dans la base de données des objets du repo cloné.
- **CVE-2024-32021 (Faible, machines multi-utilisateurs) :** Le clonage d'un repo local avec des liens symboliques (symlinks) peut entraîner la création de liens physiques vers des fichiers arbitraires dans le répertoire `objects/`.

### Architecture

Visualisation des algorithmes de rate limitation [https://smudge.ai/blog/ratelimit-algorithms](https://smudge.ai/blog/ratelimit-algorithms)

### Méthodologies

Le problème de l’implémentation alternative
[https://pointersgonewild.com/2024/04/20/the-alternative-implementation-problem/](https://pointersgonewild.com/2024/04/20/the-alternative-implementation-problem/)

- Article par un développeur qui a développé des Just-in-Time compiler pour différents langages
- Remarqué que développer une implémentation alternative d’un langage (par exemple) n’a jamais vraiment rencontré le succès
- Les gens préfèrent l’original à une alternative qui est dépendante de / a peine à suivre l’implémentation d’origine
- Pour son cas, sur le JIT, il a travaillé sur un JIT intégré directement dans CRuby (plutôt que faire son implémentation alternative comme TruffleRuby), et sont JIT est intégré maintenant dedans directement
- Plus facile de rejoindre / s’intégrer au projet plutôt que d’être une alternative pour laquelle il faut convaincre les gens de l’adopter

Le mode vigilant dans GitHub [https://x.com/emmanuelbernard/status/1790026210619068435](https://x.com/emmanuelbernard/status/1790026210619068435)

- c'est la suite du blog wsur la signature des commits que j'ai fait ul y a quelques temps [https://emmanuelbernard.com/blog/2023/11/27/git-signing-ssh/](https://emmanuelbernard.com/blog/2023/11/27/git-signing-ssh/)
- Maintenant, GitHub rajoute de plus en plus d'infos si les signatures ne matchent pas ou ne sont pas présentes

### Loi, société et organisation

Une perspective sur Redis et les changements de license par un devrel AWS OpenSearch [https://www.infoworld.com/article/3715247/the-end-of-vendor-backed-open-source.html](https://www.infoworld.com/article/3715247/the-end-of-vendor-backed-open-source.html)

- les sociétés regardent l’impact légal des licenses source available pour elles même en usage interne 
- Ça casse l’écosystème de spécialisations au dessus du produit ([logz.io](http://logz.io) au dessus d’elastic démarré avant le changement de license)
- Redis top 10 contribs à AWS et Alibaba er Huawei et 3 redis. Donc c’est pas redis qui contribue tout. 
- La plupart des ingénieurs de redislab ne bossent pas sur redis OSS, mais sur cloud et entreprise
- Peut être la fin des single vendor oss
- Il n’y a que les cloud providers qui peuvent fournir du OSS sans affecter leur structure du coût 
- C’est un ex AWS en fait. Maintenant indépendant 

Microsoft va investir 4 milliards en France (datacenters et IA)
[https://news.microsoft.com/fr-fr/2024/05/13/microsoft-announces-the-largest-investment-to-date-in-france-to-accelerate-the-adoption-of-ai-skilling-and-innovation/](https://news.microsoft.com/fr-fr/2024/05/13/microsoft-announces-the-largest-investment-to-date-in-france-to-accelerate-the-adoption-of-ai-skilling-and-innovation/)

- Il ne sont pas les seuls dans le cadre du programme #chooseFrance [https://www.info.gouv.fr/actualite/choose-france-un-record-de-15-milliards-deuros-dinvestissements-etrangers](https://www.info.gouv.fr/actualite/choose-france-un-record-de-15-milliards-deuros-dinvestissements-etrangers)
- Mais cela n'est pas sans laisser de questions sur l'avenir de notre activité avec les US qui externalisent désormais leur silicon valley
- [https://www.cybernetica.fr/la-france-laboratoire-de-la-silicon-valley-2-0/](https://www.cybernetica.fr/la-france-laboratoire-de-la-silicon-valley-2-0/)


## Outils de l’épisode

ASDF un gestionnaire de version multi-runtime [https://asdf-vm.com](https://asdf-vm.com)

- Arnaud l'avait recommandé mais je restais sur rvm
- apres des deboires, je suis passé a asdf, qui fonctionne
- mais pour le jdk j'utilise sdkman
- pour les javaistes ca parrait plus poussé



## Conférences

Les videos de Devoxx France sont en ligne
[https://www.youtube.com/playlist?list=PLTbQvx84FrARars1vXos7mlPdvYJmsEoK](https://www.youtube.com/playlist?list=PLTbQvx84FrARars1vXos7mlPdvYJmsEoK)



La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 16-17 mai 2024 : [Newcrafts Paris](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/newcrafts-paris-2024"><img alt="CFP Newcrafts Paris 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-Jan-2024&color=red"></a>
- 22 mai 2024 : [OpenInfra Day France](https://oideurope2024.openinfra.dev/france/) - Palaiseau (France) <a href="https://openinfrafoundation.formstack.com/forms/2024_openinfra_days_france_cfp"><img alt="CFP OpenInfra Day France" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-April-2024&color=red"></a>
- 22-25 mai 2024 : [Viva Tech](https://vivatechnology.com/) - Paris (France) 
- 24 mai 2024 : [AFUP Day Nancy](https://event.afup.org/afup-day-2024/afup-day-2024-nancy/) - Nancy (France) <a href="https://afup.org/event/afupday2024nancy"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Poitiers](https://event.afup.org/afup-day-2024/afup-day-2024-poitiers/) - Poitiers (France) <a href="https://afup.org/event/afupday2024poitiers"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Lille](https://event.afup.org/afup-day-2024/afup-day-2024-lille/) - Lille (France) <a href="https://afup.org/event/afupday2024lille"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Lyon](https://event.afup.org/afup-day-2024/afup-day-2024-lyon/) - Lyon (France) <a href="https://afup.org/event/afupday2024lyon"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 28-29 mai 2024 : [Symfony Live Paris](https://live.symfony.com/2024-paris/) - Paris (France) 
- 1 juin 2024 : [PolyCloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/public/event/0NC2WdB8KknRtX8aBgyO"><img alt="CFP PolyCloud" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-March-2024&color=red"></a>
- 6 juin 2024 : [WAX 2024](https://www.waxconf.fr) - Aix-en-Provence (France) <a href="https://conference-hall.io/public/event/fFQHasEzjy4wUYpBMrkI"><img alt="CFP WAX 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=red"></a>
- 6-7 juin 2024 : [DevFest Lille](https://devfest.gdglille.org/) - Lille (France) <a href="https://conference-hall.io/public/event/lfYn4Qk5xCAfLHrnNANa"><img alt="CFP DevFest Lille" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-April-2024&color=red"></a>
- 6-7 juin 2024 : [Alpes Craft](https://www.alpescraft.fr/) - Grenoble (France) 
- 7 juin 2024 : [Fork it! Community](https://www.forkit.community/) - Rouen (France) <a href="https://conference-hall.io/public/event/1GyOS8KvW02suD6jQmjz"><img alt="CFP Fork it community" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-April-2024&color=red"></a>
- 11 juin 2024 : [Cloud Toulouse](https://www.cloudtoulouse.com) - Toulouse (France) <a href="https://conference-hall.io/public/event/WEZYoIPUuyGlH3QfBTl9"><img alt="CFP Cloud Toulouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=red"></a>
- 11-12 juin 2024 : [OW2con](https://www.ow2con.org/view/2024/) - Paris (France) <a href="https://pretalx.com/ow2con-2024/cfp"><img alt="CFP OW2con'24 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=red"></a>
- 11-12 juin 2024 : [PGDay Lille](https://pgday.fr/) - Lille (France) <a href="https://pgday.fr/appel"><img alt="CFP PGDay Lille" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2024&color=red"></a>
- 12-14 juin 2024 : [Rencontres R](https://rr2024.sciencesconf.org/) - Vannes (France) 
- 13-14 juin 2024 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 14 juin 2024 : [DevQuest](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/public/event/geINICiIQFU0WdORU423"><img alt="DevQuest" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-April-2024&color=red"></a>
- 18 juin 2024 : [Mobilis In Mobile 2024](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/public/event/YvcuiTfRV8GsU8NVCQLS"><img alt="CFP Mobilis In Mobile 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-April-2024&color=red"></a>
- 18 juin 2024 : [BSides Strasbourg 2024](https://bsides-sxb.fr/) - Strasbourg (France) <a href="https://conference-hall.io/public/event/yzbqRyQzA5mE3IIfgHUy"><img alt="CFP BSides Strasbourg 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-March-2024&color=red"></a>
- 18 juin 2024 : [Tech & Wine 2024](https://technwine.fr/) - Lyon (France) <a href="https://conference-hall.io/public/event/8TWYUoDT3t0J1XTo1nys"><img alt="CFP Tech & Wine 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=red"></a>
- 19-20 juin 2024 : [AI_dev: Open Source GenAI & ML Summit Europe](https://events.linuxfoundation.org/ai-dev-europe/) - Paris (France) 
- 19-21 juin 2024 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxxpl24.cfp.dev/#/login"><img alt="CFP Devoxx Poland" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2024&color=red"></a>
- 26-28 juin 2024 : [Breizhcamp 2024](https://www.breizhcamp.org/) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2024/"><img alt="CFP Breizhcamp 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-April-2024&color=red"></a>
- 27 juin 2024 : [DotJS](https://www.dotjs.io/) - Paris (France) <a href="https://www.dotjs.io/cfp"><img alt="CFP DotJS 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-March-2024&color=red"></a>
- 27-28 juin 2024 : [Agi Lille](http://agilille.fr/) - Lille (France) <a href="https://sessionize.com/agilille-2024"><img alt="CFP Agi Lille 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2024&color=red"></a>
- 4-5 juillet 2024 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/public/event/32IQQ5wYijdJdXrqtYsx/"><img alt="CFP Sunny Tech 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=red"></a>
- 8-10 juillet 2024 : [Riviera DEV](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/public/event/ieJBZ8FhXHMinZmeTCJp"><img alt="CFP Riviera Dev 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-March-2024&color=red"></a>
- 6 septembre 2024 : [JUG Summer Camp](https://www.jugsummercamp.org) - La Rochelle (France) <a href="https://conference-hall.io/public/event/p1eSeAZlUj8gc8DxE8vX"><img alt="CFP JUG SUmmer Camp 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2021-June-2024&color=green"></a>
- 6-7 septembre 2024 : [Agile Pays Basque](https://agile-paysbasque.fr/) - Bidart (France) <a href="https://conference-hall.io/public/event/w59YkxhTPvNuwdaRCXKc"><img alt="CFP Agile pays basque 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2007-June-2024&color=green"></a>
- 17 septembre 2024 : [We Love Speed](https://www.welovespeed.com/) - Nantes (France) <a href="https://www.welovespeed.com/2024/cfp"><img alt="CFP We Love Speed" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-May-2024&color=green"></a>
- 19-20 septembre 2024 : [API Platform Conference](https://api-platform.com/con/) - Lille (France) & Online <a href="https://conference-hall.io/public/event/GMijW4ZrZDo6hzKeF1gk"><img alt="CFP API Platform Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-March-2024&color=red"></a>
- 25-26 septembre 2024 : [PyData Paris](https://pydata.org/paris2024) - Paris (France) <a href="https://pydata.org/paris2024/cfp"><img alt="CFP PyData Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-April-2024&color=red"></a>
- 26 septembre 2024 : [Agile Tour Sophia-Antipolis 2024](https://www.telecom-valley.fr/agile-tour-sophia-2024/) - Biot (France) <a href="https://sessionize.com/agile-tour-sophia-antipolis-2024/"><img alt="CFP Agile Tour Sophia-Antipolis 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2024&color=green"></a>
- 2-4 octobre 2024 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) <a href="https://dvma24.cfp.dev"><img alt="CFP Devoxx Morocco 2024" src="https://img.shields.io/static/v1?label=CFP&message=from%2006-May-2024-until%2007-Jul-2024&color=green"></a>
- 7-11 octobre 2024 : [Devoxx Belgium](https://devoxx.be) - Antwerp (Belgium) 
- 10 octobre 2024 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) <a href="https://conference-hall.io/public/event/WhX2AfC4tuVw5Ukdd5FW"><img alt="CFP Cloud Nord" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-June-2024&color=green"></a>
- 10-11 octobre 2024 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) <a href="https://conference-hall.io/public/event/98FptSgEGcOSQZymZkUr"><img alt="CFP Volcamp 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-May-2024&color=green"></a>
- 10-11 octobre 2024 : [Forum PHP](https://event.afup.org/) - Marne-la-Vallée (France) 
- 11-12 octobre 2024 : [SecSea2k24](https://secsea.org/) - La Ciotat (France) 
- 16 octobre 2024 : [DotPy](https://www.dotpy.io/) - Paris (France) <a href="https://www.dotpy.io/cfp"><img alt="CFP DotPy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=red"></a>
- 17-18 octobre 2024 : [DevFest Nantes](https://devfest.gdgnantes.com/en/) - Nantes (France) <a href="https://conference-hall.io/public/event/AJYPylkzTDd6j3O6ADZn"><img alt="CFP DevFest Nantes 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-June-2024&color=green"></a>
- 17-18 octobre 2024 : [DotAI](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/cfp"><img alt="CFP DotAI 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=red"></a>
- 30-31 octobre 2024 : [Agile Tour Nantais 2024](https://agilenantes.org/agile-tour-nantais-2024/) - Nantes (France) <a href="https://sessionize.com/agile-tour-nantais-2024"><img alt="CFP Agile Tour Nantais 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-July-2024&color=green"></a>
- 30-31 octobre 2024 : [Agile Tour Bordeaux 2024](https://agiletourbordeaux.fr/) - Bordeaux (France) <a href="https://sessionize.com/agile-tour-bordeaux-2024/"><img alt="CFP Agile Tour Bordeaux 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2024&color=green"></a>
- 31 octobre 2024-3 novembre 2024 : [PyCon.FR](https://www.pycon.fr/2024/) - Strasbourg (France) <a href="https://cfp.pycon.fr/pyconfr-2024/cfp"><img alt="CFP PyCon.FR" src="https://img.shields.io/static/v1?label=CFP&message=until%2021-July-2024&color=green"></a>
- 6 novembre 2024 : [Master Dev De France](https://www.masterdevfrance.com/) - Paris (France) 
- 7 novembre 2024 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse/"><img alt="CFP DevFest Toulouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2024&color=green"></a>
- 8 novembre 2024 : [BDX I/O](https://bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/9udDKH96m45FLJmqz2Uu"><img alt="CFP BDX IO 24" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-July-2024&color=green"></a>
- 13-14 novembre 2024 : [Agile Tour Rennes 2024](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2024/"><img alt="CFP Agile Tour Rennes 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2024&color=green"></a>
- 21 novembre 2024 : [DevFest Strasbourg](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/public/event/ZZv81ZNIzVzCMBxjX1xe"><img alt="CFP DevFest Strasbourg" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-July-2024&color=green"></a>
- 28 novembre 2024 : [Who Run The Tech ?](https://whorunthetech.com) - Rennes (France) <a href="https://conference-hall.io/public/event/bJDribf9r5Lf2VzBgbYQ"><img alt="CFP Who Run The Tech ? 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%204-June-2024&color=green"></a>
- 3-5 décembre 2024 : [APIdays Paris](https://www.apidays.global/paris/) - Paris (France) 
- 4-5 décembre 2024 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) 
- 22-25 janvier 2025 : [SnowCamp 2025](https://snowcamp.io/) - Grenoble (France) 
- 16-18 avril 2025 : [Devoxx France](https://www.devoxx.fr) - Paris (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

---
title: LCC 302 - Amour, Gloire et OpenAI
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 302
mp3_length: 68155343
tweet: Amour, Gloire et @OpenAI avec @java, @springframework, @vertx_project, #wasm, #misty, #deno, #angular, #karpenter, #oxide, @openrewrite, #copilot, @grok
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Emmanuel, Guillaume et Katia abordent les nouveautés Java, le lancement du langage Misty par Douglas Crockford, l'arrivée de WasmGC dans Chrome, la sortie de Spring Framework 6.1, des évolutions dans les bibliothèques comme Vert.x 4.5, et des conseils sur la création de langages de programmation.
L'épisode couvre également des actualités dans les domaines de l'infrastructure avec le premier ordinateur cloud commercial par Oxide, des annonces sur les frameworks web comme Angular v17, des réflexions sur les architectures monolithiques versus microservices, et sans oublier le soap Opéra du moins de novembre avec OpenAI en vedette.

Enregistré le 23 novembre 2023

Téléchargement de l’épisode [LesCastCodeurs-Episode-302.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-302.mp3)

## News


### Langages

Recap Javaiste
[https://www.infoq.com/news/2023/10/java-news-roundup-oct09-2023](https://www.infoq.com/news/2023/10/java-news-roundup-oct09-2023)

- La JEP 454 sur l'appel à la mémoire et les API dites natives passera en _target_ pour JDK 22, avec une façon d'ajouter les appels de méthodes restreintes sans le flag `--enable-native-access` (via un manifeste dans le JAR).
- JDK 22 prévu pour mars 2024.
- Spring Framework 6.1 est sorti.
- Tomcat a quelques CVE, donc mettez à jour !

Douglas Crockford, le papa de JSON, sort un nouveau langage dénommé Misty
[https://www.crockford.com/misty/](https://www.crockford.com/misty/)

- Utilise des caractères unicodes pour définir des chaînes de caractères avec des chevrons, ou pour les opérateurs de base (comparison, and/or).
- Support de la programmation concurrente avec les actors.

WasmGC arrive dans Chrome, par l’intermédiaire de v8
[https://v8.dev/blog/wasm-gc-porting](https://v8.dev/blog/wasm-gc-porting)

- Historiquement, il fallait compiler le port du langage lui-même (et donc son GC).
- Maintenant, on peut compiler le code (Java) dans des primitives Wasm et WasmGC.
- Java python et co ont des VM qui sont compilées pour toutes les architectures cibles (ARM, x86 etc), y compris le JIT, AOT.
- Donc, on peut définir comme backend WASM lui-même, c’est l’approche classique.
- WasmGC définit des `struct`s et des `array` avec des champs dans lesquels on peut créer des instances, lire/écrire les champs, caster dans d’autres types et ces objets sont gérés par WasmGC lui-même.
- On a un système de type du coup et des relations entre ces types.
- Donc on représenterait les objets Java en objets Wasm.
- Avantage et inconvenient des deux approches.
- Tous les codes de management d’objets ne sont plus nécessaires (y compris malloc) ⇒ gain memoire.
- En mode GC dans le langage, les liens objets du langage ↔ objets Wasm sont inefficaces, car les liens langage → Wasm définissent l’instance entière Wasm, donc des gros cycles d’objets ne sont pas GCed.
- Wasm sandbox empêche d’inspecter la stack et d’éliminer des objets plus efficacement, et il n’y a pas d’API pour aider donc seul WasmGC peut utiliser cet avantage.
- Un seul GC a des avantages : meilleure gestion de la pression mémoire.
- Mais on réutilise le GC du Web (genre V8) vs celui de Java. (c’est moins un problème pour les autres langages avec des GC moins sophistiqués).
- La fragmentation mémoire est plus proéminente quand on a des modules de type C qui peuvent garder des gros blocs mémoire “quasi-vides” (opaque). C’est managé plus finement en WasmGC.
- Sémantiques de langage est plus dur à achever vu qu’on map en concepts WasmGC, il y a de la transformation.
- Sémantiques des chaînes de caractères, nombres, etc peuvent être un peu ajustés.
- Un port utilisant WasmGC n’est pas une réécriture de tout, mais un gros morceau de la VM du langage cible est à réécrire.
- WasmGC peut optimiser comme les patterns en JVM, mais en WasmMVP c’est la toolchain avant qui fait le travail d’optimisation (p. ex. LLVM).
- Donc avec WasmGC, la toolchain fera les optimisations de langage et WasmGC fera les optimisations low-level (inlining, constant propagation, dead code elimination).
- Puis d’autres optimisations spécifiques à WasmGC comme les escape analysis. 
- Et ils parlent d’optimisations dans V8 pour approcher les appels dynamiques à la Java (pas défini à la compilation).

Écrire un langage de programmation... ça prend du temps... beaucoup de temps
[https://yorickpeterse.com/articles/a-decade-of-developing-a-programming-language/](https://yorickpeterse.com/articles/a-decade-of-developing-a-programming-language/)

- Évitez le gradual typing.
- Évitez le boostrapping de votre compilateur.
- Évitez d’écrire votre propre générateur de code, linker, etc.
- Évitez de tergiverser trop longtemps sur la syntaxe.
- La prise en charge multiplateforme est un défi.
- Les livres sur les compilateurs ne valent pas l’argent que vous dépenserez dessus.
- Faire grandir et évoluer un langage de programmation est difficile.
- La meilleure suite de tests est une application réelle.
- Ne privilégiez pas les performances sur les fonctionnalités.

### Librairies

Spring Boot rajoute le hot reload des certificats SSL pour embedded Netty et Tomcat
[https://spring.io/blog/2023/11/07/ssl-hot-reload-in-spring-boot-3-2-0](https://spring.io/blog/2023/11/07/ssl-hot-reload-in-spring-boot-3-2-0)

- Utilisez `reload-on-update: true`.
- Et écoute les changements de fichiers.
- Pas mal dans les déploiements non-immuables (pas comme Kubernetes).

VertX 4.5 est sorti
[https://vertx.io/blog/whats-new-in-vert-x-4-5/](https://vertx.io/blog/whats-new-in-vert-x-4-5/)

- Support des threads virtuels qui permet d'écrire le code synchrone pour des cas complexes et utiliser les threads locaux dans ces cas-là. Cela ne remplace pas le code de process des événements.
- Le code peut faire des `future` / `await` qui ne bloqueront pas le thread principal.
- Connection SQL dynamique : quand le host change dynamiquement dans l'application.
- Support des proxies de niveau 7 pour les clients SQL.
- Rotation des certificats à chaud.
- Des builders (HTTP, SQL connection).
- Extensions pour utiliser les coroutines Kotlin.

Integration déclarative de Langchain4j dans Quarkus
[https://quarkus.io/blog/quarkus-meets-langchain4j/](https://quarkus.io/blog/quarkus-meets-langchain4j/)

### Infrastructure

Oxide sort le premier ordinateur cloud disponible commercialement
[https://oxide.computer/blog/the-cloud-computer](https://oxide.computer/blog/the-cloud-computer)

- Pas facile de séparer le buzz de la réalité.
- On dirait un ordi purpose built avec l’efficience et le côté compact en tête.
- Ils poussent contre le mode location uniquement des cloud providers.
- En gros inspiré des cloud providers qui construisent leurs propres ordis (et même CPUs maintenant !).
- Construit le hardware et le software en co-optimisation.
- C’est un rack entier, peu de bruit de ventilateur.
- Pas de cable (seul E/S du rack).
- Donc ils ont leurs propres switch.
- Compliqué de différencier l’avantage du désavantage.

Les leçons tirées de 20 de Site Reliability Engineering par Google
[https://sre.google/resources/practices-and-processes/twenty-years-of-sre-lessons-learned/](https://sre.google/resources/practices-and-processes/twenty-years-of-sre-lessons-learned/)

- Le risque d’une mitigation doit être proportionné à la gravité de la panne.
- Les mécanismes de récupération doivent être entièrement testés avant une urgence.
- Canarisez tous les changements.
- Avoir un “gros bouton rouge”.
- Les tests unitaires ne suffisent pas, des tests d’intégration sont également nécessaires.
- CANAUX DE COMMUNICATION ! ET CANAUX DE SECOURS !! ET DES SAUVEGARDES POUR CES CANAUX DE SECOURS !!!
- Modes de dégradation intentionnel des performances.
- Tester la résilience aux catastrophes.
- Automatisez vos mitigations.
- Réduisez le temps entre les déploiements, afin de diminuer la probabilité que le déploiement tourne mal.
- Une seule version matérielle globale est un point de défaillance unique.

Karpenter une évolution d'Autoscaler pour les clusters Kubernetes
[https://blog.ippon.fr/2023/11/07/mettez-a-lechelle-vos-clusters-kubernetes-de-maniere-efficace-et-faites-des-economies-avec-karpenter/](https://blog.ippon.fr/2023/11/07/mettez-a-lechelle-vos-clusters-kubernetes-de-maniere-efficace-et-faites-des-economies-avec-karpenter/)

- Fonctionne uniquement pour AWS aujourd'hui, donc à voir la portabilité.
- Permet d'ajouter ou de supprimer des nœuds au cluster Kubernetes en dynamique pour rightsizer ses clusters.
- Bypass les API kube pour la creation d'instance et utilise les APIs AWS EC2 directement.
- Permet des nœuds hétérogènes (pas homogène comme Autoscaler).
- Et se rightsize rapidement (p. ex. 30s pour éteindre un nœud).
- Besoin d'applis cloud-natives, car elles vont être baladées.

### Web

Deno !
[https://www.infoq.com/news/2023/10/deno-jupyter-integration](https://www.infoq.com/news/2023/10/deno-jupyter-integration)

- Dev experience, jupyter notebook integration.
- Améliorations sur Visual Studio Code extension (compatible avec NodeJS).
- L'exécution native sur Jupyter de Javascript et Typescript permet d'effectuer des analyses de données, construire des modèles d'apprentissage automatique et générer des rapports interactifs avec Deno.
- Visualisations dynamiques avec D3 dans le notebook.
- Connection à Deno KV.
- Plusieurs améliorations sur le testing, APIs etc

Lancement du nouveau site [angular.dev](http://angular.dev) et de la version v17 du framework
[https://blog.angular.io/announcing-angular-dev-1e1205fa3039](https://blog.angular.io/announcing-angular-dev-1e1205fa3039)

- Nouvelle doc, nouveaux tutoriels, et bac à sable.
- Un nouveau logo aussi.
- Mais cette version v17 est la continuation d’Angular, pas une toute nouvelle version qui casse tout.
- [Le nouveau “control flow” devient GA, et propose des conditionals (`if`, `else`...)](https://blog.angular.io/meet-angulars-new-control-flow-a02c6eee7843).
- [Le blog d’Angular mentionne les nouveautés, au-delà du revamp de la documentation](https://blog.angular.io/introducing-angular-v17-4d7033312e4b).
- Cédric Exbrayat mets les mains dans le cambouis et couvre les nouveautés techniques [dans le blog de Ninja Squad](https://blog.ninja-squad.com/).
- Et les nouveautés aussi du côté de la CLI [https://blog.ninja-squad.com/2023/11/09/angular-cli-17.0/](https://blog.ninja-squad.com/2023/11/09/angular-cli-17.0/).
- Beaucoup de focus sur l’apprentissage et la manipulation concrète avec le bac à sable et les tutoriels.
- Le site lui-même est maintenant open source (il ne l’était pas avant ?).
- Le logo est nouveau et adaptable par les communautés.

### Outillage

Il est possible de signer et notariser des applications pour macOS sur des machines non-Apple
[https://gregoryszorc.com/blog/2022/08/08/achieving-a-completely-open-source-implementation-of-apple-code-signing-and-notarization/](https://gregoryszorc.com/blog/2022/08/08/achieving-a-completely-open-source-implementation-of-apple-code-signing-and-notarization/)

- Implémenté en Rust.
- Pratique pour les pipelines CI/CD basés sur Linux.
- À priori, il y a des outils similaires pour le monde Windows, qui permet de signer sur une machine non-Windows : [https://github.com/mtrojnar/osslsigncode](https://github.com/mtrojnar/osslsigncode).

Lors de son Github Universe, Copilot fait le show !
[https://github.blog/2023-11-08-universe-2023-copilot-transforms-github-into-the-ai-powered-developer-platform/](https://github.blog/2023-11-08-universe-2023-copilot-transforms-github-into-the-ai-powered-developer-platform/)

- Copilot Chat sera GA en décembre, il utilise GPT4, il permet de guider le développeur, de générer du code, de détecter des erreurs et aide à les corriger, d’expliquer le code.
- Intégration à venir de Copilot Chat dans les IDEs de JetBrains.
- Copilot Chat va être intégré sur [github.com](http://github.com) et dans l’appli mobile aussi.
- Introduction de GitHub Copilot Enterprise pour les sociétés, qui permettra de spécialiser le modèle sur le code de l’entreprise.
- Intégration de Copilot ans Workspace, donc quand on voudra adresser un bug, créer un pull request, Copilot pourra nous aider étape par étape, suggérer un plan d’action.
- Copilot Enterprise permettra de faire des recherches avec le contexte entier du code de l’entreprise, donc idéalement meilleur que le focus sur un repo de Copilot.

Un guide sur OpenRewrite
[https://feeds.feedblitz.com/~/819402521/0/baeldung~A-Guide-to-OpenRewrite](https://feeds.feedblitz.com/~/819402521/0/baeldung~A-Guide-to-OpenRewrite)

- Permet de refactorer le code via des règles.
- Mise à jour des dépendances, enlever l'utilisation d’API dépréciées, migration d’une bibliothèque à une autre, etc.
- Migration Java, migration framework, transformations spécifiques à votre société.
- OpenRewrite vient avec un écosystème de recettes.
- Intégration via Maven ou Gradle.
- La suite montre des exemples de migrations.

### Architecture

Article intéressant sur Monolithe vs Microservices !
[https://www.infoq.com/articles/monolith-versus-microservices/](https://www.infoq.com/articles/monolith-versus-microservices/)

- Le débat monolithe vs microservices. Les monolithes reviennent, par exemple [Spring Modulith](https://spring.io/projects/spring-modulith).
- Les microservices sont la solution à la complexité plutôt que la cause de celle-ci. Toutes les applications deviendront complexes ; au-delà d'un certain point, les microservices nous aideront à gérer cette complexité.
- Les microservices comportent des coûts et des avantages. Si les avantages ne l'emportent pas sur les coûts, vous n'aurez pas une expérience positive avec les microservices.
- Nous pouvons arrêter notre transition vers les microservices quelque part au milieu du spectre, ce que j'aime appeler le modèle hybride. À ce stade, nous pouvons avoir quelques gros services mélangés à quelques petits services. Nous pouvons avoir le meilleur des deux mondes : la simplicité et la commodité du monolithe combinées à la flexibilité et à la scalabilité des microservices.
- Il n'y a pas de choix binaire entre monolithique et microservices. En réalité, il existe un spectre de possibilités entre les deux. Si vous vous êtes fixé à l'une des extrémités du spectre, vous passez à côté de la grande variété d'architectures intermédiaires.
- Nous devrions cesser de parler de monolithe contre microservices et plutôt avoir un débat plus nuancé sur la taille appropriée des services.
- Les microservices mettent sur le devant de la scene la complexification du système, les monolithes le cachent sous le tapis.
- Les microservices permettent de gérer cette complexité.
- Automatisation est la clé dans l’adoption des microservices.
- Bien aligner son architecture et son domain ou alors la douleur arrive.

### Sécurité

Une explication de la CVE sur HTTP/2
[https://quarkus.io/blog/cve-2023-44487/](https://quarkus.io/blog/cve-2023-44487/)

- En fonction de l’implémentation, le risque est plus ou moins grand (de plus de CPU à un full DDOS).
- Au cœur du problème est la capacité d’envoyer pleins de requêtes en parallèle sur le meme pipeline HTTP/2.
- Les serveurs ont en général une limite aux streams en parallèle (genre 100).
- La CVE est exploitée côté client en ouvrant et fermant rapidement un stream, c’est plus léger sur le client, le serveur a un délai dans son processing.
- Ce qui permet de bypasser la limite et affamer les resources du serveur.
- C’est catastrophique en cas de one thread per request (thread starvation).
- En event loop, c’est une queue plus grande (donc le cas de quarkus).
- Pour mitiger, quarkus regarde le nombre de _stream close requests_ par seconde pour détecter les abus (200 requêtes de fermeture sur une fenêtre de 30s).

### Data / IA

Elon Musk annonce son LLM, appelé Grok
<https://x.ai/>

- Connectivité en temps réel avec Twitter !
- Fenêtre de contexte de 25k characters.
- Le LLM garderait le contexte de la conversation (au lieu d’avoir à toujours renvoyer toute la discussion dans le contexte, à cause du côté sans état des LLMs habituellement).
- Le style, la personnalité, du LLM, serait assez humoristique, voire carrément sarcastique, à la Musk... et déjà sur Twitter une personne commentait en disant que c’était le LLM “anti-woke”.
- Grok serait disponible pour les utilisateurs payants de Twitter.

OpenAI fait 4 nouvelles annonces
[https://openai.com/blog/new-models-and-developer-products-announced-at-devday](https://openai.com/blog/new-models-and-developer-products-announced-at-devday)

- GPT-4 Turbo : leur dernier et plus puissant LLM. Il offre un contexte de 128k tokens, des prix plus bas et des quotas plus élevés. 128k c'est comme Claude.
- Assistants API : une solution permettant de créer des mini-assistants personnalisés et de les exposer via une API. L'objectif est de faciliter l'intégration des solutions GenAI dans les applications, avec des fonctionnalités de gestion des conversations, d'interprétation de code et de RAG.
- API pour DALL•E 3 : un modèle de 3e génération pour la génération d'images.
- GPTs : des versions personnalisées de ChatGPT, faciles à développer même sans compétences en programmation. Une place de marché sera disponible pour monétiser ces "GPTs".
- Merci Didier et son X de résumer.
- [Un article plus complet de SFEIR](https://www.sfeir.dev/ia/quand-lesprit-de-noel-sinvite-a-lopenai-devday/).
- Protection juridique en cas d’attaque de droits d’auteur.

### Loi, société et organisation

Les acteurs et l'IA, deal pour arrêter la grève
[https://www.bbc.com/news/entertainment-arts-67364587](https://www.bbc.com/news/entertainment-arts-67364587)

- Les acteurs et les grands studios d'Hollywood ont conclu un accord le 8 novembre pour mettre fin à une grève qui a paralysé la production de films et de séries aux États-Unis pendant plusieurs mois.
- L'accord prévoit une nouvelle convention collective de trois ans pour les acteurs (hormis les vedettes, les acteurs n'arrivent pas à gagner leur vie avec le streaming).
- Revalorisation importante des salaires minimums ainsi que des garde-fous contre l'IA. Un système de primes pour les rediffusions en streaming.
- Double mouvement social historique : les acteurs sont entrés en grève mi-juillet, les scénaristes depuis début mai. La paralysie du secteur a coûté au moins 6 milliards de dollars.
- Les acteurs craignaient que les studios utilisent l'IA pour cloner leur voix et leur image, les réutiliser à perpétuité, sans compensation ni consentement. Les conditions entourant les droits des studios sur l’image des acteurs stars après leur mort a été négocié.

Chute de WeWork, dépôt de bilan
[https://www.maddyness.com/2023/11/06/wework-impact-coworking-france/](https://www.maddyness.com/2023/11/06/wework-impact-coworking-france/)

- La disparition annoncée du géant mondial du coworking marque un tournant pour le secteur, y compris en France.
- Asphyxié par une dette de près de 3 milliards de dollars.
- Chute interminable entamée en 2019.
- WeWork était le leader mondial du secteur et un pionnier du coworking.
- WeWork propose 15 établissements en France, tous situés à Paris.
- Pourtant, la demande pour le coworking ne cesse d’exploser.
- Startups domicilient leur siège (Qonto par exemple) dans un espace de co-working.
- Le modèle du coworking n’est pas remis en cause. WeWork, c’est un phénomène à part. Il y a eu une mauvaise gestion de départ d’une licorne qui croît à toute vitesse, en ne faisant absolument pas attention à son modèle économique de base (dit Clément Alteresco, CEO de Morning).
- Mauvaise publicité pour le marché et les concurrents, qui considèrent qu'ils vont s'en sortir.

Les Français, les utilisateurs twitter le plus violents d'Europe?
[https://www.huffingtonpost.fr/france/article/les-francais-sont-les-utilisateurs-de-twitter-les-plus-violents-d-europe_225331.html](https://www.huffingtonpost.fr/france/article/les-francais-sont-les-utilisateurs-de-twitter-les-plus-violents-d-europe_225331.html)

- Les signalements de contenus, suppressions et suspensions pour propos violents et haineux au sein de X sont les plus nombreux en France, loin devant l’Allemagne et l’Espagne.
- 16.288 suppressions de messages contre 7.160 en Allemagne et 7.743 en Espagne.
- X explique avoir une _« équipe internationale et inter-fonctionnelle »_ de _« modérateurs humains »_, qui travaillent _« 24 heures sur 24 avec la capacité de couvrir plusieurs langues »_.

Sam Altman PDG d’OpenAI est débarqué par son conseil de surveillance
[https://thealgorithmicbridge.substack.com/p/why-openai-fired-sam-altman-and-what](https://thealgorithmicbridge.substack.com/p/why-openai-fired-sam-altman-and-what)

- Ça a surpris le monde la silicone valley dans lequel Altman est adulé.
- Un ancien cofondateur a aussi été écarté à un poste périphérique, mais a décidé de quitter le navire.
- C’est dû à des tensions dans la boîte entre la partie lucrative et non lucrative d’OpenAI.
- Le conseil travaille pour une AI sûre et pour le bien de l’humanité.
- Sam Altman avait fait prendre le virage for du business depuis quelques années.
- Il n’a selon le communiqué pas été franc et transparent avec son conseil de surveillance.  
- Microsoft qui a misé sur ce cheval (OpenAI) n’était pas au courant, ni la plupart des employés d’OpenAI.
- Quelques employés de OpenAI ont déjà démissionné.
- La réduction des recherches fondamentales vs la productization a surement joué un rôle. 
- [Et il n’est pas le seul à partir](https://x.com/hellokillian/status/1725797467315486902)
- Encore mieux que Dallas, [le board négocie son retour au bout de 24h](https://www.theverge.com/2023/11/18/23967199/breaking-openai-board-in-discussions-with-sam-altman-to-return-as-ceo).
- [Et le board saute](https://twitter.com/rowancheung/status/1726342477874102604)
- Finalement, [Satya Nadella annonce que Sam Altman et Greg Brockman rejoignent Microsoft dans une nouvelle équipe de recherche IA](https://twitter.com/satyanadella/status/1726509045803336122).
- Et finalement avec un nouveau board, [Sam Altman retourne chez open AI](https://x.com/sama/status/1727207458324848883?s=20).

Les groupes "Responsible AI" chez Google, Microsoft et plus récemment Meta sont détruits
[https://www.theverge.com/2023/11/18/23966980/meta-disbanded-responsible-ai-team-artificial-intelligence](https://www.theverge.com/2023/11/18/23966980/meta-disbanded-responsible-ai-team-artificial-intelligence) 

- Même débat chez OpenAI en fait.
- Difficile de comprendre les raisons, à part que la course s'est accélérée.
- L'article cite les gouvernements qui veulent réguler, mais je ne comprends pas en quoi cela influence.

## Conférences

Retrouvez les conférences sur le site [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda) par [Aurélie Vache](https://github.com/scraly).

## Nous contacter 

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

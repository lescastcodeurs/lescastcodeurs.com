---
title: LCC 238 - Registries, registries, registries !
author: 'Emmanuel Bernard'
layout: blog-post
episode: 238
mp3_length: 85017000
tweet: Registries, registries, registries #typescript #kotlin #springone #equipes #code #api
# tweet size: 91-93 -> 99-101 #######################################################################
---
Antonio, Guillaume et Emmanuel discutent de registries et de registries et de registries. Et sinon TypeScript 4, Kotlin 1.4, Spring One, comment gérer des équipes, lire du code, des APIs. Bref pleins de choses intéressantes :)

Enregistré le 10 septembre 2020

Téléchargement de l'épisode [LesCastCodeurs-Episode-238.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-238.mp3)

## News

### Langages

[jdk/jdk repository transition to Git, GitHub and Skara is done](https://mail.openjdk.java.net/pipermail/jdk-dev/2020-September/004694.html)

[Ca rale contre G1 en default dans Java 11](https://twitter.com/headius/status/1297992914832769024)  

* throughput degradés
* [RubyKon Benchmark 2020: CRuby vs JRuby vs TruffleRuby](https://pragtob.wordpress.com/2020/08/24/the-great-rubykon-benchmark-2020-cruby-vs-jruby-vs-truffleruby)
* [Rubykon is Go AI written in Ruby using Monte Carlo Tree Search](https://github.com/PragTob/rubykon)
* Ce n'est pas un benchmark representatif de la plupart des applis (car très peu d'IO) mais beaucoup de CPU
* Utilise beaucoup de tableaux, peu de collection, pas de string...
* TruffleRuby still has the best “warm” performance

[Les blocs de texte de java 15 qui sort ce mois ci](https://www.lilian-benoit.fr/2020/09/Text_Blocks.html)

* Simplifier l’écriture des chaines de caractères sur plusieurs lignes
* [JEP 378: Text Blocks](https://openjdk.java.net/jeps/378)
* Délimiteur trois guillemet ( """ )

[Typescript 4 est sorti](https://www.theserverside.com/news/252488030/Microsoft-makes-TypeScript-4-generally-available)

* Partial semantic mode : Temps de démarrage plus rapides du projet par analyse partielle (vs toutes les dépendances) (dans l’IDE?)
* Variadic tuple type (tuple de taille définie et de types définis et hétérogènes)
* Dont rest élément où l’on veut.
* Tuple labels comme des named parementers
* Class property inference from constructor
* Catch as unknown au lieu de any (downcastong)
* En fait le compilateur fournit les outils à l’IDE

[Kotlin 1.4](https://blog.jetbrains.com/fr/kotlin/2020/08/kotlin-1-4-est-disponible-et-met-l-accent-sur-la-qualite-et-la-performance)

* Amélioration de la qualité. Stabilité et performances dans l’IDE
* Corrige notamment des lenteurs ou blocages dans l’IDE
* [Debugger de Coroutines](https://kotlinlang.org/docs/reference/whatsnew14.html#coroutine-debugger)
* Nouveau compilateur pour centraliser le code entre les différentes plateformes
* Sam pour les interfaces kotlin (Single Abstract Method)
* Kotlin 1.4.0 comes with a variety of different language features and improvements. They include:
    * SAM conversions for Kotlin interfaces
    * Mixing named and positional arguments
    * Trailing comma
    * Callable reference improvements
    * break and continue inside when included in loops
    * Explicit API mode for library authors
    * kotlin.serialisation en 1.0 RC


### Librairies

[Camel 3.5](https://camel.apache.org/blog/2020/09/Camel35-Whatsnew)

* Lambda builder
* Spring Boot 2.3.3
* junit 5
* route template (parameterized routes)
* faster refleciton free startup
* new components

### Infrastructure

[Docker limite le nombre d’image par 6 heures](https://www.reddit.com/r/opensource/comments/iken0d/changes_to_dockers_policies_crosspost_from_rdocker/)

* The second policy update is regarding limits on the number of image pulls. A pull is defined as up to two GET requests to the registry URL path ‘/v2/*/manifests/*’. Again, starting November 1, 2020:
* Anonymous users will have an upper limit of 100 image pulls in a six hour period
* Accounts authenticated with a DockerID will have an upper limit of 200 image pulls in a six hour period
* Pro and Team subscriptions do not have limits 
* la question c’est image == layer donc 100 peut arriver vite pendant un lab

[Github son propre container registry](https://github.blog/2020-09-01-introducing-github-container-registry)

* suite de GitHub packages [prix](https://github.com/features/packages#pricing)
* en beta gratuite pour l'instant

[GitLab réduit les minutes de runners pour les comptes gratuits](https://gitlab.com/gitlab-org/gitaly/-/issues/3109)

* "We are updating the CI/CD minutes limit in the Free tier to 400 minutes per group per month."
* le marketing du gratuit / freemium en perte de vitesse pour les developpeurs?

[Packages et registries en gratuit dans GitLab](https://twitter.com/k33g_org/status/1301410929926643712?s=21)

* apres les registries de containers, ils ajoutent:  Maven, npm, PyPi, NuGet, Composer, Conan et Go

### Cloud

[Google cloud function supporte Java 11 depuis mi août](https://cloud.google.com/functions/docs/release-notes#August_14_2020)

* [Environnement d'exécution Java 11](https://cloud.google.com/functions/docs/concepts/java-runtime)

[Azure spring cloud en GA](https://azure.microsoft.com/en-gb/blog/azure-spring-cloud-a-fully-managed-service-for-spring-boot-apps-is-now-generally-available)

* Hosting, monitoring d’app spring boot
* "Automatically wire your apps with the Spring service runtime. Once deployed you can easily monitor application performance, fix errors, and rapidly improve applications"
* mais ca reste un peu marketing et pas détaillé

### Web

[Kotlin Multiplateforme mobile en alpha](https://blog.jetbrains.com/kotlin/2020/08/kotlin-multiplatform-mobile-goes-alpha)

* Kotlin Multiplatform Mobile (KMM) est un SDK cross plateforme (iOS et Android)
* Intégration complète dans Android Studio pour le dev
* Refonte des compilos pour avoir une base commune entre le Kotlin / Kotlin JS et Kotlin Native
* partager la business logic et laisser la UI et anvigation en natif iOS ou Android.


### Outillage

[Comment fonctionne Time-based One Time Passwords](https://blog.digitalbunker.dev/2020/08/27/how-do-time-based-one-time-password-totp-services-work)

* un secret partage
* un compteur basé sur (t-t0)/tx
* sha1 le tout
* tronqué pour avoir 6 chiffres

[GitPod (un concurrent à Eclipse Che à priori) devient open source](https://www.gitpod.io)


### Méthodologies

[Si tu deprecies, je te fais caca dessus](https://medium.com/@steve.yegge/dear-google-cloud-your-deprecation-policy-is-killing-you-ee7525dc05dc)

* lecture interessante entre la balance entre la dépréciation, retirer le support vs garder les choses pour toujours
* Google et son monorepo et son clean code amène a des dépréciations plus élevées que l'industrie
* "Backwards compatibility keeps systems alive and relevant for decades"
* emacs, android, java
* deprecition mais garder à vie
* vs android qui a un code de merde et pleins de if mais qui est backward compatible
* les developpeurs s'en vont quand la compatibilité casse
* [emmanuel] mais des projets cassent des choses tout le temps sans que le utilisateurs ne soient mecontents - par exemple Spring Boot
* petites depreciations, tooling, documentation
* pas de big bang qui fracture ta plateforme et les utilisteurs ne migrent qu'au dernier moment
* exacerbé dans le monde des services

[Principes pour un meilleur design](https://reflexio.debec.eu/principles-for-better-design)

* Améliorations incrémentales: peut pas faire parfait directement
* Reutiliser l’existant: il y a des raisons aux solutions existantes? Vous atteignez la limite du design précédent?
* Les cinq pourquoi pour trouver la cause et possiblement trouver une autre solution meilleure (et peut etre plus simple)
* KISS : la perfection est quand il n’y a plus rien a enlever, pas ratjouer (Antoine de St Exupéry)
* Parfait est l’ennemie du bon
* (e.g principe du 80% 20% - en temps)
* Reculer le moment de la complexité
* pas un article révolutionaire mais un bon rappel. Prenez un café et lisez le douvement et réflechissez à chaque section

[Reading Code is a Skill](https://trishagee.com/2020/09/07/reading-code-is-a-skill)

* On n’écrit pas du code illisible par pur plaisir, en général le code / les pratiques / le métier / l’équipe a beaucoup évolué dans le temps
* Le code lisible c’est subjectif, et il ne sert à rien de blamer les précédents auteurs
* Donc plutôt que de se plaindre -> apprendre à lire du code

[Scaler l’equipe d’engineering avec la propriété distribuée](https://bradfordcross.com/scaling-engineering-teams-with-distributed-ownership)

* equipe fonctionne quand elle a une mission comprise et auquel elle croit, quand elle gagne (alignée avec les besoins de l’entreprise, mesure le succes, reconnu pour ce succès), quand les individus progressent
* entre 5 et 10 est la limite a la quelle une equipe part en chaos sans organisation
* centralisation: probleme planning, stand up etc
* decentralisation sans plan: conflits, ralenti, desaligne => chaos
* embaucher les type A (NDLR risque mono culture) ; embauche que si surcahrgé et montre resultats top (donc une equipe qui montre qu’elle fonctionne deja). sinon risque equipe disfonctionelle qui grossi (modifié) 
* La delegation vient avec la gouvernance pour appliquer les règles globales de l’équipe (code qualite, dette technique etc)
* il encourage d’investir dans la core ip de l’appli vs rajouter des fonctionalités. Toujours sur quelle est la valeur
* The person doing the work owns the execution, even though they may not own the direction. Rather than top down execution driven by meetings, we rely on bottom up execution based on top down direction and review.
* Engineering Manager vs TEch Lead - As the team scales through, it’s important that someone is responsible for organizing the team, process, and ensuring people are happy, productive, and growing, and someone else is responsible for the technical direction and systems of responsibility like code reviews, deploys, and so on.
* Scrum, agile poker etc est trop centralisé dans une approche avec un ratio senoir / junior coherant what I consider to be a more modern and decentralized approach, Engineering Managers work with engineers, who take ownership of chunks of work, decompose them into tasks, estimate, and get the team and manager to review async or in a planning meeting. Everything is tied to the team KPIs, which are tied to the company KPIs, but we don’t need any fancy formats like user stories, etc. Engineers are even more empowered to think about customers, product, and business value in this model — they are looking at how they can impact team KPIs, and empowered to push managers for the work they think is most impactful on the KPIs. The tech lead owns the technical queue — tech debt, testing issues, infrastructure, etc.
* The Approval Matrix with Round Robin Pattern - utile sur les choses trop concentrées ou sur les sujets que personne ne veut
training process pour onboarder
* round robin pour forcer le changment et eviter les code review overloards et autres bug fixers
* Pour taches de plus de 1 semaine, design document d’une page revue (sign off component lead) sanity checking, important issues and standards. Not micro management

### Sécurité

[Docker desktop ajoute la commande scan analyser les problèmes de secu via Snyk](https://docs.docker.com/engine/scan)

* scan des images locales
* en CLI
* s'appuie sur Snyk avec une partie gratuite via compte docker , sinon [prix](https://snyk.io/plans/)
* [snyk](https://snyk.io) continuously find and fix vulnerabilities in open source libraries and containers
* marche pas pour les images alpine

[Et SonarQube (sonarcloud pour l’instant) ajoute de l’analyse de sécurité via le rachat de RIPS-TECH fait il y a quelques temps](https://community.sonarsource.com/t/java-a-new-security-engine-taking-the-best-of-sonarsource-and-rips-technologies/30428)

* Déjà présent dans SonarCloud 2
* Sera inclue dans SonarQube 8.5
* [Sonar rachète de RIPS en mai 2020](https://blog.ripstech.com/2020/rips-acquired-by-sonarsource/)

[GitHub qui se lance dans le code scann](https://github.blog/2020-08-27-secure-at-every-step-putting-devsecops-into-practice-with-code-scanning)

* GitHub, all your base are belong to us
* Oui d’où mon tweet sur le SPOF. Sachant que plus ils en font, moins c’est stable.
* ils mettes les true positive "sûr" dans l'analyse de la PR


### Loi, société et organisation

[Apple également dans le viseur de Facebook pour sa taxe de 30%](https://www.lemonde.fr/pixels/article/2020/08/28/apple-bloque-une-mise-a-jour-de-facebook-visant-a-informer-les-utilisateurs-de-la-taxe-apple_6050218_4408996.html)

* l'app store ne permet pas de dire que les prix incus la marge d'apple de 30%
* debat sur des cas specifiques: genre argent pour des gens qui organisent des evenements (ou pire une charité)
* mais c'est l'argument "penser aux petits enfants". Facebook, j'imagine a des plans de se faire de l'argent sur certaines de ces ventes.

[La CNIL publie son livre blanc sur les assistants vocaux](https://www.cnil.fr/fr/votre-ecoute-la-cnil-publie-son-livre-blanc-sur-les-assistants-vocaux)

* 84 pages, articles, interviews..
* Super pour aider "les personnes en situation de dépendance, qu’elles soient âgées ou handicapées"
* Mais pose des questions "du point de vue de la protection des données"
* "fortement ancrée dans notre intimité" "de nombreuses informations sur l’émetteur d’un message oral. Âge, genre, condition physique, accent, origine géographique et socio-culturelle, éducation, état de santé
* ou émotionnel, mais également identité"
* "captent nos habitudes de vie pour enrichir un profil"
* "Ce livre blanc propose quelques pistes de réflexion sur l’usage des données par les assistants vocaux"
* Quels usages: DEMANDE DE LA MÉTÉO / RECHERCHER UNE INFORMATION / ÉCOUTER DE LA MUSIQUE
* Mythes et réalités des assistants vocaux (vrai/faux) : écoutent en permanence / utilisent nos données pour mieux nous profiler / interface très prisée des enfants 


[Une cour d’appel américaine déclare la surveillance de masse de la population dénoncée par Edward Snowden illégale](https://www.reuters.com/article/us-usa-nsa-spying-idUSKBN25T3CK)

* L'affaire Snowden a déjà 7 ans
* La cour de justice américaine déclare illégale les écoutes effecutée par la NSA
* La collecte de millions de coup de fil "may have been unconstitutional"
* Tweet de Snowden [I never imagined that I would live to see our courts condemn the NSA's activities](https://twitter.com/snowden/status/1301251393832050688)


## Outils de l'épisode

Roulettes sous ma chaise

## Conférences

[Codeurs En Seine 2020 - Edition en ligne](https://twitter.com/codeursenseine/status/1301064575786405888?s=21) - [CFP](http://cfp.codeursenseine.com) jusqu'au 15 septembre

* En novembre, les mardis à 19h et les jeudis à 21h
* 45 minutes de conférences + environ 15 minutes de questions
* En ligne sur Twitch + rediffusion Youtube

[La prochaine édition du Fosdem se fera en ligne](https://fosdem.org/2021/news/2020-09-01-dates-fosdem-2021)

* 6 e 7 février 2021
* CFP bientot annoncé

[Volcamp  Annulé](https://www.volcamp.io)

* Reporté au jeudi 14 et vendredi 15 octobre 2021

[Big Data reste programmé](https://www.bigdataparis.com/2020)

* 14 et 15 septembre 2020
* Physiquement Porte de Versailles à Paris
* Ou depuis votre ordinateur ou smartphone


## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

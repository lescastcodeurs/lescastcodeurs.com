---
title: LCC 344 - Feature flags - 2^n raisons de ne pas dormir la nuit
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 344
youtube: 9nHvt7nX3bU
mp3_length: 58131431
tweet: Feature flags - 2^n raisons de ne pas dormir la nuit #IA #LLM #ModelesDeDiffusion #DiffusionModels #Opus55 #GPT6 #GoogleArgon #Jev 
# tweet size: 91-93 -> 99-101 #######################################################################
---
Les feature flags, c'est pratique jusqu'à ce que 2^n combinaisons vous réveillent à 3h du matin. Dans ce live, on parle de dette technique et de résilience cloud (la HA ne suffit pas !). Côté Java : fin de la gratuité d'Oracle JDK 21, Quarkus 4 Beta, Hibernate ORM 8 et Spring AI. Et aussi Opus 5.5 contre GPT-6 en pleine guerre des prix, les « decision models » comme Jev, et des attaques ciblées contre les mainteneurs Rust.

Enregistré le 13 octobre 2026

Téléchargement de l’épisode [LesCastCodeurs-Episode-344.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-344.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=9nHvt7nX3bU).

## News


### Langages

Pour les développeurs Go, une bonne resource sur la concurrence: Go concurrency distilled
[antonz.org/go-concurrency-distilled](https://antonz.org/go-concurrency-distilled/)

Un nouveau formateur de code Java
[foojay.io/today/my-love-hate-relationship-with-java-formatters](https://foojay.io/today/my-love-hate-relationship-with-java-formatters/)

Java 21 : le compte à rebours de la fin des mises à jour gratuites d'Oracle JDK
[foojay.io/today/the-java-21-doomsday-clock-countdown](https://foojay.io/today/the-java-21-doomsday-clock-countdown/)


### Librairies

Zazr, un fork de Vavr, mais plus moderne avec record, pattern matching, virtual thread, et autres fonctionnalités récentes de Java 25
[zazr.dev/blog/meet-zazr](https://zazr.dev/blog/meet-zazr/)

Quarkus 4.0.0.Beta1 et Quarkus 3.40 LTS : la voie vers Quarkus 4
[quarkus.io/blog/quarkus-4-0-0-beta1-released](https://quarkus.io/blog/quarkus-4-0-0-beta1-released/) [quarkus.io/blog/quarkus-3-40-released](https://quarkus.io/blog/quarkus-3-40-released/)

Hibernate ORM 8.0 : Beta2 et Beta3 sur la voie de Jakarta Persistence 4.0
[in.relation.to/2026/09/23/orm-80-beta2](https://in.relation.to/2026/09/23/orm-80-beta2/) [in.relation.to/2026/10/01/orm-80-beta3](https://in.relation.to/2026/10/01/orm-80-beta3/)

Spring AI 2.1.0-M1 et Spring Boot 4.2.0-M2 : les fournisseurs de modèles dictent l'architecture
[spring.io/blog/2026/09/25/spring-ai-2-1-0-M1-available-now](https://spring.io/blog/2026/09/25/spring-ai-2-1-0-M1-available-now) [spring.io/blog/2026/09/25/spring-boot-4-2-0-M2-available-now](https://spring.io/blog/2026/09/25/spring-boot-4-2-0-M2-available-now)

Quarkus Desktop : applications AWT/Swing en exécutable natif GraalVM
[quarkus.io/blog/quarkus-desktop](https://quarkus.io/blog/quarkus-desktop/)


### Infrastructure

OpenTelemetry partout : Atlassian migre sa plateforme de métriques de gostatsd vers OTel
[cncf.io/blog/2026/09/17/opentelemetry-everywhere-migrating-a-metrics-platform-at-scale](https://www.cncf.io/blog/2026/09/17/opentelemetry-everywhere-migrating-a-metrics-platform-at-scale/)

Docker Sandbox Kit : une spec ouverte pour empaqueter agent IA et permissions, apportée à la CNCF
[docker.com/blog/docker-sandbox-kit-spec-cncf](https://www.docker.com/blog/docker-sandbox-kit-spec-cncf/)


### Cloud

Cloudflare K2 : event streaming serverless sur R2, en beta publique
[blog.cloudflare.com/cloudflare-k2-streams](https://blog.cloudflare.com/cloudflare-k2-streams/)


### Web

Sortie de Angular 22.2
[blog.ninja-squad.com/2026/09/23/what-is-new-angular-22.2](https://blog.ninja-squad.com/2026/09/23/what-is-new-angular-22.2)

Safari 27.0 : serveur MCP pour agents, select stylable et 844 correctifs
[webkit.org/blog/18325/webkit-features-for-safari-27-0](https://webkit.org/blog/18325/webkit-features-for-safari-27-0/)

SvelteKit 3 en release candidate : migration vers Vite et fin de $lib
[svelte.dev/blog/sveltekit-3-release-candidate](https://svelte.dev/blog/sveltekit-3-release-candidate) [infoq.com/news/2026/09/sveltekit-3-vite](https://www.infoq.com/news/2026/09/sveltekit-3-vite/)


### Data et Intelligence Artificielle

Une revue de Jev le modele "systeme 1" [flaviocopes.com/jev](https://flaviocopes.com/jev/)

Decision models multimodaux avec Jev, DiffusionGemma et LangChain4j
[glaforge.dev/posts/2026/09/24/multimodal-decision-models-with-diffusiongemma-jev-and-langchain4j](https://glaforge.dev/posts/2026/09/24/multimodal-decision-models-with-diffusiongemma-jev-and-langchain4j/) [infoq.com/news/2026/10/typesafe-ai-jev-released](https://www.infoq.com/news/2026/10/typesafe-ai-jev-released/)

Claude Opus 5.5 et GPT-6 Sol/Luna : la bataille se déplace sur le prix
[anthropic.com/news/claude-opus-5-5](https://www.anthropic.com/news/claude-opus-5-5) [simonwillison.net/2026/Sep/22/opus-and-sol-and-luna](https://simonwillison.net/2026/Sep/22/opus-and-sol-and-luna/)

Debezium 3.7 : nouveaux connecteurs, CLI officielle et Debezium Server natif
[debezium.io/blog/2026/09/29/debezium-3-7-final-released](https://debezium.io/blog/2026/09/29/debezium-3-7-final-released/)


### Outillage

ja de Netflix : JPMS au quotidien sans Maven ni Gradle ?
[github.com/Netflix/ja](https://github.com/Netflix/ja) [netflixtechblog.com/leave-the-class-path-in-the-rearview-mirror](https://netflixtechblog.com/leave-the-class-path-in-the-rearview-mirror-67a85b15b6be)

Tests E2E Playwright filmés par Claude Code : filmer est facile, prouver ne l'est pas
[sfeir.dev/ia/tests-e2e-playwright-filmes-par-claude-code-filmer-est-facile-prouver-ne-lest-pas](https://www.sfeir.dev/ia/tests-e2e-playwright-filmes-par-claude-code-filmer-est-facile-prouver-ne-lest-pas/)


### Architecture

Le "feature flag" de trop, c'est l'explosion combinatoire
[codecraftdiary.com/2026/09/13/feature-flag-graveyard-technical-debt](https://codecraftdiary.com/2026/09/13/feature-flag-graveyard-technical-debt/)

Haute disponibilité n'est pas résilience dans le cloud [infoq.com/articles/high-availability-not-resilience-cloud](https://www.infoq.com/articles/high-availability-not-resilience-cloud/)


### Méthodologies

Cloudflare lance un concours pour construire la prochaine plateforme Git pour les agents
[blog.cloudflare.com/next-git-platform-on-cloudflare](https://blog.cloudflare.com/next-git-platform-on-cloudflare/)


### Sécurité

Branch Target Reuse : une variante Spectre v2 qui vise les compilateurs JIT, GraalVM compris
[vusec.net/projects/btr](https://www.vusec.net/projects/btr/) [theregister.com/security/2026/09/30/spectre-bug-is-back-this-time-to-haunt-jit-engines](https://www.theregister.com/security/2026/09/30/spectre-bug-is-back-this-time-to-haunt-jit-engines/5299937)

Attaques ciblées contre les mainteneurs Rust : la supply chain vise désormais les humains
[blog.rust-lang.org/2026/09/17/targeted-attacks](https://blog.rust-lang.org/2026/09/17/targeted-attacks/) [blog.rust-lang.org/2026/09/21/github-actions-leaking-secrets-when-miri-output-is-cached](https://blog.rust-lang.org/2026/09/21/github-actions-leaking-secrets-when-miri-output-is-cached/)


### Loi, société et organisation

Détecteurs d'IA au cribe [sciencesetavenir.fr/high-tech/intelligence-artificielle/les-detecteurs-d-ia-au-crible-d-une-etude-scientifique_195137](https://www.sciencesetavenir.fr/high-tech/intelligence-artificielle/les-detecteurs-d-ia-au-crible-d-une-etude-scientifique_195137)


## Outils de l’épisode

Un petit peu de fun, ça fait du bien, avec ce site qui vous permet de charger n'importe quelle page web et de la détruire à coup de fusil ou de bazooka en dirigeant un petit personnage dans la page
[destroy.spritefusion.com](https://destroy.spritefusion.com/)



## Rubrique débutant

Claude . dev est sorti ! [lnkd.in/p/…](https://lnkd.in/p/e6eNss4K)



## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

---
title: LCC 345 - Rust in peace, Java ressuscite
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge'
layout: blog-post
episode: 345
youtube: a5M62DyWImM
mp3_length: 64934237
tweet: Rust in peace, Java ressuscite #Java #Rust #JDK28 #TypeScript #DuckDB #Mistral #PHP #IA #MCP
# tweet size: 91-93 -> 99-101 #######################################################################
---
Réécrire en Java plutôt qu'en Rust, ça tient la route ? Notre controverse du jour part d'un benchmark pour en débattre. Au programme : les value classes de JDK 28 et ce qu'elles cassent, la Structured Concurrency enfin finalisée, TypeScript porté en Rust, DuckDB 2.0 en client-serveur et un modèle Mistral à 1000 milliards de paramètres. Mais aussi des failles PHP, un harnais d'agent qui vaut (ou pas) son coût et bien plus encore.

Enregistré le 13 novembre 2026

Téléchargement de l’épisode [LesCastCodeurs-Episode-345.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-345.mp3)
ou en vidéo [sur YouTube](https://www.youtube.com/watch?v=a5M62DyWImM).

## News


### Langages

JDK 28 et JEP 401 : ce que les value classes de Valhalla cassent pour les mainteneurs [inside.java/2026/10/27/quality-heads-up](https://inside.java/2026/10/27/quality-heads-up/) [openjdk.org/jeps/401](https://openjdk.org/jeps/401)

JDK 28 : Structured Concurrency finalisée (JEP 543) et compilation AOT de code dans le cache HotSpot (JEP 544) [openjdk.org/jeps/543](https://openjdk.org/jeps/543) [openjdk.org/jeps/544](https://openjdk.org/jeps/544)

Les changements de la concurrence structurée par InfoQ [infoq.com/news/2026/10/jep-543-jdk-28](https://www.infoq.com/news/2026/10/jep-543-jdk-28/)

La controverse du jour - Réécrire en Java plutôt qu’en Rust : le benchmark Codename One contre Wordcraft
[foojay.io/today/rewrite-everything-in-java-not-rust](https://foojay.io/today/rewrite-everything-in-java-not-rust/)

TornadoVM 8.0 : TC, un compilateur pur Java qui remplace Graal et JVMCI
[tornadovm.org/blogs/tornadovm-8-0-0-tc-tornadovm-compiler](https://www.tornadovm.org/blogs/tornadovm-8-0-0-tc-tornadovm-compiler) [github.com/beehive-lab/TornadoVM/…/v8.0.0](https://github.com/beehive-lab/TornadoVM/releases/tag/v8.0.0)

Bye bye les primitives dans les switch, instanceof, les type patterns:
[mail.openjdk.org/archives/…/…](https://mail.openjdk.org/archives/list/amber-spec-experts@openjdk.org/thread/UYEK3PGOHN6R56AHJTSLPGAY363K666S/)


### Librairies

Un nouvel acteur dans les librairies pour créer des serveurs MCP
[linkedin.com/pulse/tachyon-mcp-10-out-konstantin-pavlov-ynrle](https://www.linkedin.com/pulse/tachyon-mcp-10-out-konstantin-pavlov-ynrle/)

Quarkus Almanac pour voir les changements entre deux versions [quarkus.io/blog/quarkus-almanac](https://quarkus.io/blog/quarkus-almanac/)


### Infrastructure

Fin des secondes intercalaires : l’UTC devient continu à partir de mai 2027
[euronews.com/next/…/global-timekeeping-rules-change-leap-second-scrapped-from-2027](https://www.euronews.com/next/2026/10/16/global-timekeeping-rules-change-leap-second-scrapped-from-2027)



### Web

Faites tourner du Java dans le navigateur avec TeaVM (compile en JavaScript et WebAssembly)
[https://foojay.io/today/java-in-the-browser-with-teavm/](https://foojay.io/today/java-in-the-browser-with-teavm/)

TypeScript en Rust avec tsrs, et TypeScript 7.1 beta toujours plus rapide
[blog.cloudflare.com/typescript-rust-port](https://blog.cloudflare.com/typescript-rust-port/) [devblogs.microsoft.com/typescript/announcing-typescript-7-1-beta](https://devblogs.microsoft.com/typescript/announcing-typescript-7-1-beta/)

CheerpJ 5 : Java 21 et 25 dans le navigateur, sans plugin
[foojay.io/today/cheerpj-5-java-21-25-in-the-browser](https://foojay.io/today/cheerpj-5-java-21-25-in-the-browser/)


### Data et Intelligence Artificielle

Philippe Charrière nous emmène à la découverte d'Agent Client Protocol (ACP) qui permet de connecter n'importe quel agent qui l'implémente à un IDE/ADE qui le supporte
[k33g.org/p/20261031-acp-from-scratch](https://k33g.org/p/20261031-acp-from-scratch)

Modèles « System One » : OpenAI Decisions API et retour d’Ippon sur Jev
[techcrunch.com/2026/10/22/openai-makes-its-jev-competitor-widely-available-as-decision-model-competition-heats-up](https://techcrunch.com/2026/10/22/openai-makes-its-jev-competitor-widely-available-as-decision-model-competition-heats-up/) [blog.ippon.fr/2026/10/19/jev-modele-system-one-llm](https://blog.ippon.fr/2026/10/19/jev-modele-system-one-llm/)

Mistral Large 4 « Le Chonk » : les poids ouverts d’un modèle à 1000 milliards de paramètres
[mistral.ai/news/mistral-large-4-oss](https://mistral.ai/news/mistral-large-4-oss/)

Agent Skills donné à l’Agentic AI Foundation : un standard neutre
[anthropic.com/news/donating-agent-skills-to-the-agentic-ai-foundation](https://www.anthropic.com/news/donating-agent-skills-to-the-agentic-ai-foundation)

DuckDB 2.0.0 LTS : le mode client-serveur Quack arrive
[duckdb.org/2026/10/21/announcing-duckdb-200](https://duckdb.org/2026/10/21/announcing-duckdb-200)

Evaluation &amp; amélioration itérative de prompt et pattern LLM-as-Judge : cas concret de la création d’une application pour transformer des photos de slides pris à une conférence en slide deck PDF :
[glaforge.dev/posts/…/restoring-lecture-slides-with-prompt-benchmarking-and-llm-as-judge](https://glaforge.dev/posts/2026/11/10/restoring-lecture-slides-with-prompt-benchmarking-and-llm-as-judge/)


### Outillage

Introduction à ErrorProne
[foojay.io/today/introduction-to-error-prone-how-to-catch-bugs-at-compile-time](https://foojay.io/today/introduction-to-error-prone-how-to-catch-bugs-at-compile-time/)

Nouvelle version de Ghostty, avec la 1.4.0
[ghostty.org/docs/install/release-notes/1-4-0](https://ghostty.org/docs/install/release-notes/1-4-0)

Mon nouveau formateur de code préféré, Open Java Format
[glaforge.dev/posts/…/comparing-java-formatters-why-open-java-format-is-my-new-favorite](https://glaforge.dev/posts/2026/11/09/comparing-java-formatters-why-open-java-format-is-my-new-favorite/)


### Architecture

La loi de Conway pour les agents IA : repenser les microservices
[medium.com/devops-ai/conways-law-for-ai-agents-rethinking-microservices-in-the-age-of-ai…](https://medium.com/devops-ai/conways-law-for-ai-agents-rethinking-microservices-in-the-age-of-ai-6025497cb0c4)


### Méthodologies

Un harness vaut-il son coût ? Mesure sur GPT-6 Sol et Luna
[martinfowler.com/articles/are-harnesses-worth-the-cost.html](https://martinfowler.com/articles/are-harnesses-worth-the-cost.html)


### Sécurité

Le compromis de la clé eMudhra affecte sûrement vos JVM [https://glaforge.dev/posts/2026/10/21/the-emudhra-ca-compromise-why-your-jvm-is-vulnerable-and-how-to-fix-it/](https://glaforge.dev/posts/2026/10/21/the-emudhra-ca-compromise-why-your-jvm-is-vulnerable-and-how-to-fix-it/) 

Une grosse faille PHP a forcé à éteindre beaucoup de sites [https://php2shell.uk/fr/technical](https://php2shell.uk/fr/technical) [https://www.it-connect.fr/php-failles-critiques-rce-cve-2026-109618-cve-2026-109619/](https://www.it-connect.fr/php-failles-critiques-rce-cve-2026-109618-cve-2026-109619/) 


### Loi, société et organisation

Quad9 quitte la France face à une décision de justice imposant le blocage DNS
[quad9.net/news/blog/au-revoir-france](https://www.quad9.net/news/blog/au-revoir-france/)

Le logiciel propriétaire, c’est terminé ?
[eventuallycoding.com/p/le-logiciel-proprietaire-c-est-termine](https://www.eventuallycoding.com/p/le-logiciel-proprietaire-c-est-termine)



## Rubrique débutant

**L’IA, UNE AMIE QUI NOUS VEUT DU BIEN : Rencontre avec Albert Moukheiber** [youtube.com/watch?v=eglGj1zsfxA&amp;t=3880s](https://www.youtube.com/watch?v=eglGj1zsfxA&amp;t=3880s)



## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

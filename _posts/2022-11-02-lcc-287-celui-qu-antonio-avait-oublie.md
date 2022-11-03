---
title: LCC 287 - Celui qu'Antonio avait oublié!
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 287
mp3_length: 46720065
tweet: Celui que @agoncal avait oublié!
# tweet size: 91-93 -> 99-101 #######################################################################
---
Arnaud et Guillaume reviennent sur les news de ce mois avec évidement la sortie de Java 19 mais aussi GraalVM, Puppet (toujours vivant), Docker Compose et Desktop, VirtualBox, WASMTime et d'autres sujets plus orientés méthodologie comme la réalisation de Sketchnotes, les DO / DONT pour faire des messages d'erreurs dans les UIs ou encore quelques pratiques de management chez Google.

Enregistré le 21 octobre 2022

Téléchargement de l’épisode [LesCastCodeurs-Episode-287.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-287.mp3)

## News

### Langages

La version 19 de Java est sortie
[https://mail.openjdk.org/pipermail/jdk-dev/2022-September/006933.html](https://mail.openjdk.org/pipermail/jdk-dev/2022-September/006933.html)

- Au menu:
    - 405: Record Patterns (Preview)
    - 422: Linux/RISC-V Port
    - 424: Foreign Function & Memory API (Preview)
    - 425: Virtual Threads (Preview)
    - 426: Vector API (Fourth Incubator)
    - 427: Pattern Matching for switch (Third Preview)
    - 428: Structured Concurrency (Incubator)
- La vue de InfoQ [https://www.infoq.com/news/2022/09/java19-released/](https://www.infoq.com/news/2022/09/java19-released/)
- Foojay couvre 5 fonctionnalités clé [https://foojay.io/today/the-5-most-pivotal-and-innovative-additions-to-openjdk-19/](https://foojay.io/today/the-5-most-pivotal-and-innovative-additions-to-openjdk-19/)
    - virtual threads
    - structured concurrency
    - pattern matching for switch
    - foreign function and memory API
    - record pattern matching

Proposition dans Leyden des condenseurs et du décalage d’exécution dans le temps [https://openjdk.org/projects/leyden/notes/02-shift-and-constrain](https://openjdk.org/projects/leyden/notes/02-shift-and-constrain)

GraalVM JIT et Native Image rejoignent le projet OpenJDK
[https://twitter.com/graalvm/status/1582441450796900354](https://twitter.com/graalvm/status/1582441450796900354)

Google rejoint Adoptium et va utiliser la distribution Temurin pour les JDKs utilisés dans ses produits
[https://blog.adoptium.net/2022/10/adoptium-welcomes-google/](https://blog.adoptium.net/2022/10/adoptium-welcomes-google/)

“Paving the on-ramp” : Brian Goetz discute de changements au langage Java pour faciliter l’apprentissage pour les nouveaux arrivants
[https://openjdk.org/projects/amber/design-notes/on-ramp](https://openjdk.org/projects/amber/design-notes/on-ramp)

### Librairies

Spring Boot 3.0.0 RC1 is out
[https://spring.io/blog/2022/10/20/spring-boot-3-0-0-rc1-available-now](https://spring.io/blog/2022/10/20/spring-boot-3-0-0-rc1-available-now)

- Vous pouvez maintenant convertir vos applications Spring Boot en exécutables natifs en utilisant les plugins standard Spring Boot Maven ou Gradle sans avoir besoin d’une configuration spéciale.


### Infrastructure

(re)découvrir puppet
[https://blog.stephane-robert.info/post/introduction-puppet/](https://blog.stephane-robert.info/post/introduction-puppet/),
[https://blog.stephane-robert.info/post/puppet-env-developpement/](https://blog.stephane-robert.info/post/puppet-env-developpement/)

- Tutoriel en français sur puppet que l’auteur Stéphane ROBERT écrit dans le cadre d’une migration Puppet vers Ansible
- L’auteur revient sur les concepts (manifests, classes, modules), et explique comment utiliser vagrant pour développer en local un projet utilisant puppet.

Docker Compose v2.11.0 est disponible
[https://github.com/compose-spec/compose-spec/blob/master/build.md#platforms](https://github.com/compose-spec/compose-spec/blob/master/build.md#platforms)

- La commande build permet de construire des images multi-architectures.

Docker Desktop 4.13.0
[https://docs.docker.com/desktop/release-notes/#docker-desktop-4130](https://docs.docker.com/desktop/release-notes/#docker-desktop-4130)

- `docker dev`  permet de gérer ses Dev Environments via la CLI

Sortie de VirtualBox 7.0, avec prise en charge complète du chiffrement des VMs, nouvelle accélération Direct3D, elle apporte le premier client #Mac ARM et le TPM de #Windows 11 [https://virtualisation.developpez.com/actu/337578/Sortie-de-VirtualBox-7-0-avec-prise-en-ch[…]rte-le-premier-client-Mac-ARM-et-le-TPM-de-Windows-11/](https://virtualisation.developpez.com/actu/337578/Sortie-de-VirtualBox-7-0-avec-prise-en-charge-complete-du-chiffrement-des-MV-nouvelle-acceleration-Direct3D-elle-apporte-le-premier-client-Mac-ARM-et-le-TPM-de-Windows-11/)

### Web

WASMtime 1.0 [https://bytecodealliance.org/articles/wasmtime-1-0-fast-safe-and-production-ready](https://bytecodealliance.org/articles/wasmtime-1-0-fast-safe-and-production-ready)

Comment écrire un bon message d’erreur sur une UI?
[https://medium.com/wix-ux/when-life-gives-you-lemons-write-better-error-messages-46c5223e1a2f](https://medium.com/wix-ux/when-life-gives-you-lemons-write-better-error-messages-46c5223e1a2f)

- Un mauvais message d’erreur :
    - Ton inapproprié
    - Jargon technique
    - Rejetant le blâme
    - Générique sans raison
- Un bon message d’erreur:
    - Dire ce qui s’est passé et pourquoi
    - Rassurer
    - Faire preuve d’empathie
    - Aidez-les à régler le problème
    - Donnez toujours une issue

### Outillage

Amélie Benoit partage un article d’initiation au sketchnote
[https://amelie.tech/fr/blog/sketchnote-initiation/](https://amelie.tech/fr/blog/sketchnote-initiation/)

- Définition : un dessin, une représentation visuelle d’une prise de note, mêlant dessin et texte
- Pas de stress, suffit juste de savoir écrire, dessiner des carrés, cercles, triangles. Pas besoin d’être un artiste !
- À quoi ça sert ? pour soi-même pour s’approprier de l’information, synthétiser ce que l’on apprend, mais aussi pour partager avec les autres
- On peut faire des sketchnotes pour tout et n’importe quoi !
- Amélie décrit ensuite les bases, avec les pictogrammes, le texte, les puces, les flèches, comment créer des conteneurs (pour des titres par exemple), comment rendre un sketchnote plus joli et comment hiérarchiser le contenu
- Enfin, quelques ressources utiles, en particulier les livres de Mike Rohde qui est l’inventeur du concept

Nouvelle UI pour Maven Central search [https://central.sonatype.dev/](https://central.sonatype.dev/)

maven-test-profiler : Maven extension pour trouver les tests les plus lents
[https://t.co/d5YpXODWf8](https://t.co/d5YpXODWf8)

### Architecture

Netflix construit un système de queue basse latence et haut volume à partir de composants open source [https://www.infoq.com/news/2022/10/netflix-timestone-priority-queue/](https://www.infoq.com/news/2022/10/netflix-timestone-priority-queue/)

### Méthodologies

Google a publié un ensemble de pratiques, d’outils et d’articles pour les managers [https://rework.withgoogle.com/guides/](https://rework.withgoogle.com/guides/)

### Sécurité

CVE dans Kafka - un client non authentifié peut faire un OOME dans le broker [https://github.com/advisories/GHSA-c9h3-c6qj-hh7q](https://github.com/advisories/GHSA-c9h3-c6qj-hh7q)

Signal retire le support des SMS sur Android [https://t.co/u9XZ7XM7rT](https://t.co/u9XZ7XM7rT)


## Conférences

Codeurs en Seine 2022 - Programme et Inscriptions

- Ça y est, le programme est disponible et les inscriptions sont ouvertes.
- Les inscriptions (c’est gratuit et c’est à Rouen le 17 novembre) : [https://www.codeursenseine.com/2022/inscription](https://www.codeursenseine.com/2022/inscription).
- Le magnifique programme est la : [https://www.codeursenseine.com/2022/programme](https://www.codeursenseine.com/2022/programme).


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

* 3-4 novembre 2022 : [Agile Tour Nantes 2022](https://agilenantes.org/evenements/agile-tour-nantes/agile-tour-nantais-2022/) - Nantes (France)
* 8-9 novembre 2022 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) <a href="https://sessionize.com/open-source-experience-2022/"><img alt="CFP Open Source Experience" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-Jun-2022&color=red"> </a>
* 15-16 novembre 2022 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/agile-tour-toulouse-2022/"><img alt="CFP Agile Tour Toulouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-Jun-2022&color=red"> </a>
* 17 novembre 2022 : [Codeurs en Seine](https://www.codeursenseine.com/) - Rouen (France) <a href="[https://sessionize.com/agile-tour-toulouse-2022/](https://conference-hall.io/public/event/Uv6XULhgmt7z2YuoJ8nq)"><img alt="CFP codeur en seine" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-Sept-2022&color=red"> </a>
* 17 novembre 2022 : [lbc² by leboncoin](https://www.lbc2.fr/) - Paris (France)
* 18 novembre 2022 : [DevFest Strasbourg](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/speaker/event/wgaja45IBdGT4sw4CXDB"><img alt="CFP Devfest Strasbourg" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-Jun-2022&color=red"> </a>
* 18-19 novembre 2022 : [GreHack](https://grehack.fr/) - Grenoble (France) <a href="https://easychair.org/cfp/GreHack2022"><img alt="CFP" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-Aug-2022&color=red"> </a>
* 19-20 novembre 2022 : [Capitole du Libre](https://capitoledulibre.org/) - Toulouse (France) <a href="https://cfp.capitoledulibre.org/cdl-2022/cfp"><img alt="CFP Capitole du Libre de Toulouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2026-Sep-2022&color=red"> </a>
* 23-25 novembre 2022 : [Agile Grenoble 2022](http://agile-grenoble.org/) - Grenoble (France)
* 1 décembre 2022 : [Devops DDay #7](https://2022.devops-dday.com/) - Marseille (France) <a href="https://conference-hall.io/public/event/eKYGzptI6y44zoS8sGUz"><img alt="CFP Devops DDay" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2022&color=red"> </a>
* 2 décembre 2022 : [BDX I/O](https://www.bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/OJC5Ou5YJodfetgSJCa3"><img alt="CFP BDX I/O" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-Jul-2022&color=red"> </a>
* 2 décembre 2022 : [DevFest Dijon 2022](https://www.linkedin.com/posts/developers-group-dijon_apr%C3%A8s-des-%C3%A9changes-avec-google-le-developers-activity-6973555910140903424-rjRH/) - Dijon (France) <a href="[https://conference-hall.io/public/event/ZGJWM1x64evaNUzycEzn](https://conference-hall.io/public/event/cXWCepNzXVWwb1i6ktVA)"><img alt="CFP DevFest Dijon 2022" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-October-2022&color=red"> </a>
* 14-16 décembre 2022 : [API Days Paris](https://www.apidays.global/paris/) - Paris (France) & Online
* 15-16 décembre 2022 : [Agile Tour Rennes](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2022/"><img alt="Agile Tour Rennes" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2022&color=green"> </a>
* 19-20 janvier 2023 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/speaker/event/3lWSdH0pfZkHEAL7RWSJ"><img alt="Touraine Tech 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%20September-30%20to%20November-27-2022&color=green"> </a>
* 25-28 janvier 2023 : [SnowCamp](https://snowcamp.io/fr/) - Grenoble (France) <a href="https://conference-hall.io/public/event/ZGJWM1x64evaNUzycEzn"><img alt="CFP SnowCamp 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2022&color=red"> </a>
* 2 février 2023 : [Very Tech Trip](https://conference-hall.io/public/event/hoyBWUXe43dnoiBekZaB) - Paris (France) <a href="https://conference-hall.io/public/event/hoyBWUXe43dnoiBekZaB"><img alt="CFP Very Tech Trip 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-November-2022&color=green"> </a>
* 9-11 février 2023 : [World AI Cannes](https://worldaicannes.com/) - Cannes (France)
* 7 mars 2023 : [Kubernetes Community Days France](https://community.cncf.io/events/details/cncf-kcd-france-presents-kubernetes-community-days-france-2023/) - Paris (France) <img alt="CFP KCD Paris" src="https://img.shields.io/static/v1?label=CFP&message=from%20September-15%20to%20October-31-2022&color=green">
* 23-24 mars 2023 : [SymfonyLive Paris](https://live.symfony.com/2023-paris/) - Paris (France) <a href="https://live.symfony.com/2023-paris/cfp"><img alt="CFP SymfonyLive Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-December-2022&color=green"></a>
* 12-14 avril 2023 : [Devoxx France](https://www.devoxx.fr/) - Paris (France)


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

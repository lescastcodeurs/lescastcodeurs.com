---
title: LCC 308 - Après c'est avant
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 308
mp3_length: 59735373
tweet: Après c'est avant #java #netflix #tdah #llmattaque
# tweet size: 91-93 -> 99-101 #######################################################################
---

Cet épisode discute du retour d'expérience Java de Netflix, de jQuery, de gouvernance open source, d'Elon Musk, de Kubernetes, de Mistral (gagnant ?), d'attaques des LLMs, de développement de carrière et de Trouble du Déficit de l'Attention avec ou sans Hyperactivité.

Enregistré le 15 mars 2024

Téléchargement de l’épisode [LesCastCodeurs-Episode-308.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-308.mp3)

## News

Les Cast Codeurs veulent essayer quelque chose de nouveau et le sondage montre que vous aussi.
On lance donc une section "Ask Me Anything" (AMA) !
Posez-nous une question sur <https://lescastcodeurs.com/ama> et nous prendrons certaines questions pour y répondre.
Lancez-vous, on pense que cette section pourra être sympa :).

### Langages

Retour d'expérience de Netflix sur ZGC
[https://netflixtechblog.com/bending-pause-times-to-your-will-with-generational-zgc-256629c9386b](https://netflixtechblog.com/bending-pause-times-to-your-will-with-generational-zgc-256629c9386b)

- Moins de tail latency ce qui veut dire moins de charge sur le système (moins de retries).
- Aussi plus facile de trouver les vrais problèmes de latence (plus cachés dans les latences de GC).
- Et sans consommation supérieure de CPU pour les mêmes perfs, malgré les barrières différentes de ZGC.
- Pas de tuning explicite de leur part (enfin presque).
- Même si les pointeurs ne sont pas compressés, l'efficacité du GC compense. 


### Librairies

Sortie de Spock 2.4-M2
[https://spockframework.org/spock/docs/2.4-M2/release_notes.html](https://spockframework.org/spock/docs/2.4-M2/release_notes.html)

- Support de plusieurs librairies de mocking.
- Meilleur support dans les IDEs.
- Et plein d’autres petites améliorations.

jQuery 4 est sorti ! jQuery est de retour !
[https://www.infoq.com/news/2024/03/jquery-4-beta-release-note/](https://www.infoq.com/news/2024/03/jquery-4-beta-release-note/)

- On parle régulièrement du dernier framework JavaScript à la mode, mais jQuery est toujours là.
- Première release majeure depuis 8 ans.
- Suppression de plein de features qui étaient dépréciées et maintenant souvent fournie par défaut par les moteurs JavaScript des navigateurs.
- jQuery continue d’être téléchargé de plus en plus au fil du temps, mais peut-être parce qu’il bénéficie du succès des projets qui l’utilisent, tels que Cypress, WordPress ou Drupal.

Quarkus sort sa deuxième LTS
[https://quarkus.io/blog/quarkus-3-8-released/](https://quarkus.io/blog/quarkus-3-8-released/)

- Explique les changements importants depuis la LTS 3.2.


### Infrastructure

Linkerd, ou plutôt la boîte derrière, va faire payer pour accéder aux builds stable du projet. Cela crée des conversations au sein de la CNCF
[https://www.techtarget.com/searchitoperations/news/366571035/Linkerd-paywall-prompts-online-debate-CNCF-TOC-review](https://www.techtarget.com/searchitoperations/news/366571035/Linkerd-paywall-prompts-online-debate-CNCF-TOC-review)

- Deploy envoy, c’est plus dur.
- Buoyant est le principal contributeur derrière Linkerd.
- Et ils ont décidé de mettre les distributions stables derrière un paywall.
- Pour les sociétés de plus de 50 employés ($2000 par cluster).
- Les gens se trouvent floués, car ils ont aidé au succès et ensuite se retrouvent piégés.
- La licence reste ASL, mais la version stable est derrière un paywall, comme Red Hat Enterprise Linux récemment.
- Un autre exemple de projet open source qui vire commercial.
- Questionne la gouvernance open source, la CNCF va enquêter et peut-être durcir ses critères de graduation.
- Weaveworks (FluxCD) a aussi fermé ces dernières semaines.

Cloudflare a réécrit un proxy HTTP en Rust
[https://blog.cloudflare.com/how-we-built-pingora-the-proxy-that-connects-cloudflare-to-the-internet/](https://blog.cloudflare.com/how-we-built-pingora-the-proxy-that-connects-cloudflare-to-the-internet/)

- Ils ont utilisé Nginx pendant longtemps.
- Mais le single-worker model ne permettait pas certaines optimisations.
- Et ils ont des besoins spécifiques. 
- Bref ils ont réécrit en Rust, multithreaded et avec work stealing.
- Et ils sont contents.

Le guide du “hater” sur Kubernetes
[https://paulbutler.org/2024/the-haters-guide-to-kubernetes/](https://paulbutler.org/2024/the-haters-guide-to-kubernetes/)

- L’auteur se plaint régulièrement de Kubernetes pour sa grande complexité, mais reconnait que c’est quand même un grand morceau de technologie.
- À utiliser surtout quand on a besoin:
  - d’exécuter plusieurs processus/serveurs/tâches planifiées,
  - de les exécuter de manière redondante et répartir la charge entre eux,
  - de les configurer, ainsi que les relations entre eux, sous forme de code.
- L’auteur liste ensuite les fonctionnalités qu’il utilise, celles auxquelles il fait attention quand il les utilise, et celles qu’il préfère éviter :
  - Utilise : deployments, services, cron jobs, config maps et secrets.
  - Attention : stateful set, persistent volume et RBAC.
  - Évite : le YAML à la main, les opérateurs et resources customs, Helm, tout ce qui est mesh, les resources ingress, essayer de répliquer la stack K8S complète localement sur sa machine.


### Data et Intelligence Artificielle

Mistral AI et Microsoft passent un accord sur le modèle le plus puissant de Mistral, et certains ne sont pas content
[https://www.latribune.fr/technos-medias/informatique/l-alliance-entre-mistral-et-micr[…]usion-de-l-independance-technologique-europeenne-991558.html](https://www.latribune.fr/technos-medias/informatique/l-alliance-entre-mistral-et-microsoft-met-fin-a-l-illusion-de-l-independance-technologique-europeenne-991558.html)

- Mistral avançait son approche open source.
- Mais son modèle le plus puissant ne l’est pas.
- Ils ont un partenariat exclusif avec Microsoft pour le distribuer.
- Et MS rentre dans le capital.
- Au revoir l’indépendance de l’IA européenne.
- Au revoir les grands modèles open source.
- Cela va à l’encontre du lobby et de son positionnement auprès de la commission européenne.
- Ça fait grincer des dents à Bruxelles, qui avait allégé les contraintes sur les modèles fondamentaux à la demande de Mistral qui menaçait de devoir s’allier avec Microsoft si ce n’était pas le cas.
- Mistral était un fer de lance des modèles open sources pour éviter les biais.
- Ils en garderont, mais pas les modèles specialisés ou optimisés.
- Cela reste une bonne decision économique pour Mistral.

Infinispan 15 est sorti
[https://infinispan.org/blog/2024/03/13/infinispan-15](https://infinispan.org/blog/2024/03/13/infinispan-15)

- JDK 17.
- Redis Hot Replacement donnant : multi-threads, clustering, réplication cross-site, diff stores de persistence en disk, avoir des caches différents en namespace différentes avec des règles appliquées à chaque cas d’usage.
- Recherche Vectorielle et stockage des embeddings.  
- Integration avec Langchain (Python), Langchain4j, et Quarkus Langchain.
- Améliorations du search, replication cross site, la console, tracing, l’opérateur Kubernetes… 
- Support du Protobuf 3 avec la release de Protostream 5 et meilleur API.


### Outillage

Ne pas signer ses commits cryptographiquement ?
[https://blog.glyph.im/2024/01/unsigned-commits.html](https://blog.glyph.im/2024/01/unsigned-commits.html)

- L’article cite comme seul avantage d’avoir le petit badge vert sur Github indiquant “vérifié”.
- **Responsabilité future inconnue et potentiellement illimitée** pour les conséquences de l’exécution du code dans un commit que vous avez signé.
- **Renforcement implicite de GitHub en tant qu’autorité de confiance centralisée** dans le monde de l’open source.
- **Introduction de problèmes de fiabilité inconnus** dans l’infrastructure qui repose sur les signatures de commit.
- **Une violation temporaire de vos identifiants GitHub entraîne désormais des conséquences potentiellement permanentes** si quelqu’un parvient à y introduire une nouvelle clé de confiance.
- **Nouveau type de surcharge de processus continu** : les clés de signature de commit deviennent une nouvelle infrastructure permanente à gérer, avec de nouvelles questions comme « que faire des clés expirées », « à quelle fréquence dois-je les renouveler », etc.
- On peut empêcher de pousser des commits non signés.


### Sécurité

Des modèles avec des backdoors uploadés sur hugging faces non détectés
[https://arstechnica.com/security/2024/03/hugging-face-the-github-of-ai-hosted-code-that-backdoored-user-devices/](https://arstechnica.com/security/2024/03/hugging-face-the-github-of-ai-hosted-code-that-backdoored-user-devices/)

- Par les chercheurs de JFrog.
- Une centaine ont été détectés, dont 10 malicieux.
- Des tests de chercheurs, mais un faisant un reverse SSH.
- S’appuie sur le format de serialisation pickle en Python. Populaire, mais reconnu comme dangereux.

Une première side attack channel sur les LLMs
[https://arstechnica.com/security/2024/03/hackers-can-read-private-ai-assistant-chats-even-though-theyre-encrypted/](https://arstechnica.com/security/2024/03/hackers-can-read-private-ai-assistant-chats-even-though-theyre-encrypted/)

- Cela s’appuie sur la taille des packets chiffrés envoyés et leur timing pour détecter la longueur des tokens.
- Ensuite un LLM spécialisé reconstruit la suite de mots la plus probable vu la longueur.
- C’est dû à l’UX qui envoie les tokens au fil de l’eau.
- C’est facilement corrigeable en rendant les paquets de taille fixe et en ajoutant du hasard de délai d’envoi… 
- Mais c’est rigolo comment les LLMs peuvent amplifier les side-channel attacks.


### Architecture

Netflix et Java
[https://www.infoq.com/presentations/netflix-java/](https://www.infoq.com/presentations/netflix-java/)

- Netflix est un java shop.
- La "stack Netflix" connue du public a beaucoup évolué.
- Pleins de microservices.
- Gen1 : Groovy en gateway frontend for backend, RxJava et Hystrix.
- Gen2 : GraphQL et GraphQL fédéré ; plus de réactif dans la gateway.
- Java 17 : 2800 apps java.
- Utilisent Azul JDK.
- Avaient du Java 8 sur du Guice et des app custom.
- Utilisent G1, Java 17 = -20% CPU et Shenandoah pour la gateway Zuul.
- Plans pour Java 21 (ZGC, virtual threads).
- Après spéculatif.
- Ils ont standardisé sur Spring Boot il n’y a pas si longtemps.

Un long article sur les microservices
[https://mcorbin.fr/posts/2024-02-12-microservice/](https://mcorbin.fr/posts/2024-02-12-microservice/)

- Encore un me direz vous !
- Oui, mais si vous êtes en pleine crise existentielle avec votre équipe, c’est du bon matériel.
- Il va sur les points importants comme synchrone vs asynchrone, les patterns de communication, la copie de données, comment tester le "monolithe" ou plutôt comment ne pas le faire…
- C’est un peu long mais, ça recadre bien.


### Méthodologies

Opinion: est-ce qu’on peut devenir dev à partir de 40 ans
[https://www.codemotion.com/magazine/dev-life/can-you-become-a-programmer-after-40/?utm_source=ActiveCampaign&utm_medium=email&utm_content=5+Frontend+Trends+we+Didn+t+See+Coming+in+2024&utm_campaign=NL_EN_240215+%28Copy%29&vgo_ee=sFCRn4bbw8NuvJwlxj4PgXiVS4eICnA1ZPdkH4DGKyhNNwh6NQ%3D%3D%3Au3g96%2Fz3Uf7kZHAF7tezy9Y0ZJ6paAsE](https://www.codemotion.com/magazine/dev-life/can-you-become-a-programmer-after-40/?utm_source=ActiveCampaign&utm_medium=email&utm_content=5+Frontend+Trends+we+Didn+t+See+Coming+in+2024&utm_campaign=NL_EN_240215+%28Copy%29&vgo_ee=sFCRn4bbw8NuvJwlxj4PgXiVS4eICnA1ZPdkH4DGKyhNNwh6NQ%3D%3D%3Au3g96%2Fz3Uf7kZHAF7tezy9Y0ZJ6paAsE)

- Programmeur de CSS à 40 ans, je sais pas 😜
- L’auteur regrette les pubs pour devenir dev à 40 ans facilement.
- Développeur, c’est beaucoup de connaissance et de travail et ce doit être un choix éclairé, pas un choix pas default ou facile.
- Il décrit certains biais comme un 20 ans sans expérience est plus pardonné qu’à 40, le temps à y consacrer est différent…
- Compensé par des actes de motivation (GitHub, participation open source, meetups…).
- Mais le temps d’apprendre de ses erreurs n’a pas vraiment de court-circuit.
- Bref, une formation, c’est bien mais pas suffisant.

Navigate your own way
[https://www.infoq.com/presentations/lessons-opportunities-carrier/](https://www.infoq.com/presentations/lessons-opportunities-carrier/)

- IBMer for 21 years. I’m a Java champion.
- Réfléchir à sa carrière en mode time box, chercher sa promotion ? Tu peux décider ton chemin.
- Momentum pandémie ça lui a fait beaucoup réfléchir sur sa vie et où elle était. Moment où elle quittait IBM pour aller vers RH (cœur se brise).
- Essentiels pour prendre ton propre chemin. 
- Se connaître soit-même, reconnaître les différences avec les autres. 
- Connaître tes valeurs : qu’est-ce qui est important pour toi, qu’est-ce qui te motive ou te démotive. Écrire des mots. 
- Se fixer des objectifs avec l’aide des autres.
- Repousser ses limites sur des sujets dont tu penses que ce n’est pas possible pour toi.
- Participe activement, entoure-toi bien.
- Un talk très personnel et inspirant.

Un article sur le trouble TDAH chez le développeur adulte
[https://rlemaitre.com/fr/posts/2023/11/hacker-le-tdah-strat%C3%A9gies-pour-le-d%C3%A9veloppeur-moderne/](https://rlemaitre.com/fr/posts/2023/11/hacker-le-tdah-strat%C3%A9gies-pour-le-d%C3%A9veloppeur-moderne/)

- Diagnostiqué à 44 ans.
- Schéma d’inattention et d’hyperactivité/impulsivité qui interfère avec le fonctionnement.
- Affecte le fonctionnement social scolaire ou professionnel.
- Non diagnostiqué : burn out, anxiété ou depression.
- Souvent non diagnostiqué jusqu’à ce que ses propres enfants soient diagnostiqués. 
- Mais cela amène du positif : hyperfocus, résolution créative de problèmes, adaptation rapide aux changements qui sont du pain béni. 
- Le négatif, c’est la gestion du temps, l’organisation, l’instabilité.
- Discute ensuite les phénomènes dans le cerveau.
- Et donne des techniques et des pièges à éviter.
- Vous avez sûrement des collègues TDAH ou, l’êtes-vous vous-même.


## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 14-15 mars 2024 : [pgDayParis](https://2024.pgday.paris/) - Paris (France) 
- 17-18 mars 2024 : [Cloud Native Rejekts EU 2024](https://cloud-native.rejekts.io/) - Paris (France) 
- 19 mars 2024 : [AppDeveloperCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/appdevelopercon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [ArgoCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/argocon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [BackstageCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/backstagecon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Cilium + eBPF Day](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cilium-ebpf-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Cloud Native AI Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cloud-native-ai-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Cloud Native StartupFest Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cloud-native-startupfest/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP Cloud Native Startup Fest Europe" src="https://img.shields.io/static/v1?label=CFP&message=until%207-February-2024&color=red"></a>
- 19 mars 2024 : [Cloud Native Wasm Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cloud-native-wasm-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Data on Kubernetes Day](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/data-on-kubernetes-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Istio Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/istio-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Kubeflow Summit Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/kubeflow-summit/#about) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Kubernetes on Edge Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/kubernetes-on-edge-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Multi-Tenancy Con](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/multi-tenancycon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Observabiity Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/observability-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [OpenTofu Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/opentofu-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Platform Engineering Day](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/platform-engineering-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [ThanosCon Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/thanoscon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [PaaS Forward by OVHcloud | Rancher by SUSE](https://kccnceu2024.sched.com/event/1Z1yp) - Paris (France) 
- 19-21 mars 2024 : [CloudNativeHacks](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/program/cloudnativehacks/) - Paris (France) 
- 19-21 mars 2024 : [IT & Cybersecurity Meetings](https://www.it-and-cybersecurity-meetings.com/) - Paris (France) 
- 19-22 mars 2024 : [KubeCon + CloudNativeCon Europe 2024](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe-2024/) - Paris (France) <a href="https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/attend/scholarships/"><img alt="Scholarship" src="https://img.shields.io/static/v1?label=Scholarship&message=until%2007-January-2024&color=yellow" /></a>
- 21 mars 2024 : [IA & Data Day Strasbourg](https://iadataday.capitale.dev) - Strasbourg (France) <a href="https://conference-hall.io/public/event/zmQmuXOT5r6xcLvcH59j"><img alt="CFP IA & Data Day Strasbourg" src="https://img.shields.io/static/v1?label=CFP&message=until%205-February-2024&color=red"></a>
- 22-23 mars 2024 : [Agile Games France](https://agilegamesfrance.fr/doku.php?id=evenement_2024) - Valence (France) 
- 26-28 mars 2024 : [Forum INCYBER Europe](https://europe.forum-incyber.com/) - Lille (France) 
- 27 mars 2024 : [La Conf Data | IA](https://lagrosseconf.com/) - Paris (France) 
- 28-29 mars 2024 : [SymfonyLive Paris 2024](https://live.symfony.com/2024-paris/) - Paris (France) <a href="https://live.symfony.com/2024-paris/cfp"><img alt="CFP SymfonyLive Paris 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-December-2023&color=red"></a>
- 28-30 mars 2024 : [DrupalCamp Roazhon](https://rennes2024.drupalcamp.fr/) - Rennes (France) 
- 4 avril 2024 : [SoCraTes Rennes 2024](https://socrates-rennes.github.io/) - Rennes (France) 
- 4-6 avril 2024 : [Toulouse Hacking Convention](https://thcon.party/) - Toulouse (France) <a href="https://thcon.party/cfp/#intra"><img alt="CFP THC 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-January-2024&color=red"></a>
- 8 avril 2024 : [Lyon Craft](https://lyon-craft.fr/) - Lyon (France) 
- 9 avril 2024 : [Unconf HackYourJob](https://www.helloasso.com/associations/hackyourjob-community-lyon/evenements/unconf-avril-2024) - Lyon (France) 
- 11 avril 2024 : [CI/CDay](https://www.cicday.com/) - Paris (France) 
- 17-19 avril 2024 : [Devoxx France](https://www.devoxx.fr/) - Paris (France) <a href="https://devoxxfr2024.cfp.dev/"><img alt="CFP Devoxx France" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-January-2024&color=red"></a>
- 18-20 avril 2024 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr24.cfp.dev/"><img alt="CFP Devoxx Greece 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-December-2023&color=red"></a>
- 22 avril 2024 : [React Connection 2024](https://reactconnection.io/) - Paris (France) <a href="https://conference-hall.io/public/event/J4B6tn2Vas37pLaU0pIo"><img alt="CFP React Connection 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%203-February-2024&color=red"></a>
- 23 avril 2024 : [React Native Connection 2024](https://reactnativeconnection.io/) - Paris (France) <a href="https://conference-hall.io/public/event/pdyGi2RB4aYQnp7gdGhc"><img alt="CFP React Native Connection 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%203-February-2024&color=red"></a>
- 25-26 avril 2024 : [MiXiT](https://mixitconf.org/fr/) - Lyon (France) <a href="https://mixitconf.org/fr/"><img alt="CFP MiXiT" src="https://img.shields.io/static/v1?label=CFP&message=from%2016-Dec-2023-until%2019-Jan-2024&color=red"></a>
- 25-26 avril 2024 : [Android Makers](https://androidmakers.droidcon.com/) - Paris (France) <a href="https://sessionize.com/androidmakers-by-droidcon-2024"><img alt="CFP Android Makers by droidcon 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2024&color=green"></a>
- 3-4 mai 2024 : [Faiseuses Du Web 3](https://buttondown.email/faiseusesduweb/archive/) - Dinan (France) 
- 8-10 mai 2024 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk24.cfp.dev/#/"><img alt="CFP Devoxx UK 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-January-2024&color=red"></a>
- 16-17 mai 2024 : [Newcrafts Paris](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/newcrafts-paris-2024"><img alt="CFP Newcrafts Paris 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-Jan-2024&color=red"></a>
- 22-25 mai 2024 : [Viva Tech](https://vivatechnology.com/) - Paris (France) 
- 24 mai 2024 : [AFUP Day Nancy](https://event.afup.org/afup-day-2024/afup-day-2024-nancy/) - Nancy (France) <a href="https://afup.org/event/afupday2024nancy"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Poitiers](https://event.afup.org/afup-day-2024/afup-day-2024-poitiers/) - Poitiers (France) <a href="https://afup.org/event/afupday2024poitiers"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Lille](https://event.afup.org/afup-day-2024/afup-day-2024-lille/) - Lille (France) <a href="https://afup.org/event/afupday2024lille"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Lyon](https://event.afup.org/afup-day-2024/afup-day-2024-lyon/) - Lyon (France) <a href="https://afup.org/event/afupday2024lyon"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 28-29 mai 2024 : [Symfony Live Paris](https://live.symfony.com/2024-paris/) - Paris (France) 
- 1 juin 2024 : [PolyCloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/public/event/0NC2WdB8KknRtX8aBgyO"><img alt="CFP PolyCloud" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-March-2024&color=green"></a>
- 6-7 juin 2024 : [DevFest Lille](https://devfest.gdglille.org/) - Lille (France) <a href="https://conference-hall.io/public/event/lfYn4Qk5xCAfLHrnNANa"><img alt="CFP DevFest Lille" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-April-2024&color=green"></a>
- 6-7 juin 2024 : [Alpes Craft](https://www.alpescraft.fr/) - Grenoble (France) 
- 7 juin 2024 : [Fork it! Community](https://www.forkit.community/) - Rouen (France) <a href="https://conference-hall.io/public/event/1GyOS8KvW02suD6jQmjz"><img alt="CFP Fork it community" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-April-2024&color=green"></a>
- 11-12 juin 2024 : [OW2con](https://www.ow2con.org/view/2024/) - Paris (France) <a href="https://pretalx.com/ow2con-2024/cfp"><img alt="CFP OW2con'24 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=green"></a>
- 12-14 juin 2024 : [Rencontres R](https://rr2024.sciencesconf.org/) - Vannes (France) 
- 13-14 juin 2024 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 14 juin 2024 : [DevQuest](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/public/event/geINICiIQFU0WdORU423"><img alt="DevQuest" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-April-2024&color=green"></a>
- 18 juin 2024 : [Tech & Wine 2024](https://technwine.fr/) - Lyon (France) <a href="https://conference-hall.io/public/event/8TWYUoDT3t0J1XTo1nys"><img alt="CFP Tech & Wine 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=green"></a>
- 19-20 juin 2024 : [AI_dev: Open Source GenAI & ML Summit Europe](https://events.linuxfoundation.org/ai-dev-europe/) - Paris (France) 
- 19-21 juin 2024 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxxpl24.cfp.dev/#/login"><img alt="CFP Devoxx Poland" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2024&color=red"></a>
- 27 juin 2024 : [DotJS](https://www.dotjs.io/) - Paris (France) <a href="https://www.dotjs.io/cfp"><img alt="CFP DotJS 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-March-2024&color=green"></a>
- 27-28 juin 2024 : [Agi Lille](http://agilille.fr/) - Lille (France) <a href="https://sessionize.com/agilille-2024"><img alt="CFP Agi Lille 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2024&color=red"></a>
- 4-5 juillet 2024 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/public/event/32IQQ5wYijdJdXrqtYsx/"><img alt="CFP Sunny Tech 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=green"></a>
- 8-10 juillet 2024 : [Riviera DEV](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/public/event/ieJBZ8FhXHMinZmeTCJp"><img alt="CFP Riviera Dev 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-March-2024&color=green"></a>
- 6 septembre 2024 : [JUG Summer Camp](https://www.jugsummercamp.org) - La Rochelle (France) 
- 19-20 septembre 2024 : [API Platform Conference](https://api-platform.com/con/) - Lille (France) & Online <a href="https://conference-hall.io/public/event/GMijW4ZrZDo6hzKeF1gk"><img alt="CFP API Platform Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-March-2024&color=green"></a>
- 2-4 octobre 2024 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) 
- 7-11 octobre 2024 : [Devoxx Belgium](https://devoxx.be) - Antwerp (Belgium) 
- 10 octobre 2024 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) 
- 10-11 octobre 2024 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) 
- 10-11 octobre 2024 : [Forum PHP](https://event.afup.org/) - Marne-la-Vallée (France) 
- 16 octobre 2024 : [DotPy](https://www.dotpy.io/) - Paris (France) <a href="https://www.dotpy.io/cfp"><img alt="CFP DotPy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=green"></a>
- 17-18 octobre 2024 : [DevFest Nantes](https://devfest.gdgnantes.com/en/) - Nantes (France) 
- 17-18 octobre 2024 : [DotAI](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/cfp"><img alt="CFP DotAI 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=green"></a>
- 6 novembre 2024 : [Master Dev De France](https://www.masterdevfrance.com/) - Paris (France) 
- 7 novembre 2024 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) 
- 8 novembre 2024 : [BDX I/O](https://bdxio.fr/) - Bordeaux (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

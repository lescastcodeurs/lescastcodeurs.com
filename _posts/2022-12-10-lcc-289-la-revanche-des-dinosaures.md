---
title: LCC 289 - La revanche des dinosaures
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 289
mp3_length: 66044398
tweet: La revanche des dinosaures #collections #SRE #performance #git #vieux #copilot
# tweet size: 91-93 -> 99-101 #######################################################################
---
Guillaume et Emmanuel discutent les nouvelles de novembre/décembre : spring boot 3, AWS SnapStart, GitHub Copilot en procès…
Et aussi des articles de fond : performance, SRE et l’auto résilience, comment utiliser Git, le Devops pour les décideurs, l’âge et la tech et d’autres sujets encore.

Enregistré le 9 décembre 2022

Téléchargement de l’épisode [LesCastCodeurs-Episode-289.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-289.mp3)

## News


### Langages

Comment choisir ses collections ? Entre les différentes listes, maps, queues, etc.
[https://www.baeldung.com/java-choose-list-set-queue-map](https://www.baeldung.com/java-choose-list-set-queue-map)

- Un bon rappel des fonctionnalités des différentes collections (discuter le diagramme de choix).
- Et un bon rappel des ordres de grandeur d’insertion, de lecture, etc.
- Attention O(n) ne veut pas dire plus lent que O(1), ça signifie que ça scale linéairement.
- Il reste toujours bon de tester avec le volume attendu de données.
- Un bon vieux `Object[]` qu’on traverse à chaque fois peut être bien plus efficace (moins gourmand en structure memoire, moins de jump memoire, etc.).


### Librairies

Spring Boot 3 est sorti
[https://spring.io/blog/2022/11/24/spring-boot-3-0-goes-ga](https://spring.io/blog/2022/11/24/spring-boot-3-0-goes-ga)

- Java 17 de base,
- support de GraalVM Native Image (au lieu de l’ancienne expérimentation de Spring Native),
- amélioration de la traçabilité avec Micrometer et Micrometer Tracing,
- JakartaEE 9 minimum et support de JakartaEE 10.

Quarkus est 600 fois plus lent qu’un compétiteur, ou pas [https://t.co/1c2sFSY9sE](https://t.co/1c2sFSY9sE)

- discute le lien entre les résultats et l’environnement
- une erreur de code initiale
- puis une erreur de limite de système ou deux
- pour arriver au résultat
- bon retour sur l’approche méthodologique.

Spring vault 3 [https://spring.io/blog/2022/11/28/spring-vault-3-0-goes-ga](https://spring.io/blog/2022/11/28/spring-vault-3-0-goes-ga)

- Java 17,
- plus de clients supportés, comme le client réactif du JDK,
- support du versionnage des mots de passe pour les vaults clé-valeur.



### Cloud

Mais pourquoi Twitter tourne-t-il toujours malgré toutes les personnes renvoyées ?
[https://matthewtejo.substack.com/p/why-twitter-didnt-go-down-from-a](https://matthewtejo.substack.com/p/why-twitter-didnt-go-down-from-a)

- Grâce au long travail de SRE, de mise en place d’auto-réparation, de cache, de monitoring, de sur-provisioning. Donc beaucoup d’automatisation pour faire en sorte que le tout fonctionne “presque” tout seul sans trop d’intervention humaine.
- C’est un article écrit par un des SRE qui travaillait en particulier sur le cache de Twitter.

GitHub passe à un versioning par date de son API REST
[https://github.blog/2022-11-28-to-infinity-and-beyond-enabling-the-future-of-githubs-rest-api-with-api-versioning/](https://github.blog/2022-11-28-to-infinity-and-beyond-enabling-the-future-of-githubs-rest-api-with-api-versioning/)

- au lieu de continuer avec une v4, v5, etc, utilisation de date comme 2022-12-25,
- chacune de ces versions serait supportée a minima 2 ans,
- on peut spécifier la version avec un header HTTP spécial,
- pas de changement pour l’API GraphQL par contre,
- Stripes va encore plus loin en se rappelant la version utilisée au premier appel et le fixe par défaut,
- les appels sans version explicite utilisent celle-là, et on peut la faire évoluer globalement.

Amazon SnapStart pour Lambda [https://aws.amazon.com/blogs/aws/new-accelerate-your-lambda-functions-with-lambda-snapstart/](https://aws.amazon.com/blogs/aws/new-accelerate-your-lambda-functions-with-lambda-snapstart/)

- démarrer plus rapidement les lambdas,
- a une phase `Init` exécutée pour préparer la lambda,
- snapshot Firecracker VM pas juste CRaC,
- remplace les seeds et le réseau et le disque,
- réduit les temps de démarrage,
- testé [avec Quarkus](https://quarkus.io/blog/quarkus-support-for-aws-lambda-snapstart/)
- testé [avec Micronaut](https://twitter.com/sdelamo/status/1597535515758452736?s=46&amp;t=iQ7IEvuv4e4eD1oM-Hi1IA)
- et avec Spring Boot.


### Outillage

Petit tip Git de Minko Gechev (monsieur Angular)
[https://twitter.com/mgechev/status/1594758205237706752](https://twitter.com/mgechev/status/1594758205237706752)

- On peut faire un `git clone [repo] —depth 1` pour dire qu’on ne veut que la dernière révision, et non pas tout l’historique du repo.
- C’est pratique en particulier dans une CI pour gagner du temps lorsqu’on a un gros repo avec beaucoup de révisions.

Si vous luttez toujours avec git, ce guide très détaillé peut vous aider.
[https://github.com/k88hudson/git-flight-rules](https://github.com/k88hudson/git-flight-rules)

- Il s’agit d’un énorme “Comment faire ?” qui est même traduit en plusieurs langues, [dont le français](https://github.com/k88hudson/git-flight-rules/blob/master/README_fr.md).

Faire tourner ses Github Actions en local avec le projet open source `act`
[https://github.com/nektos/act](https://github.com/nektos/act)

- Pratique de vérifier en local le fonctionnement de son pipeline avant de le pousser sur Github en prod.
- Utilise Docker sous le capot pour faire tourner chaque étape.
- Peut marcher sur podman, mais pas garanti pour l’instant.

Comment transformer n’importe quel site web ou webapp en application autonome
[https://glaforge.appspot.com/article/turning-a-website-into-a-desktop-application](https://glaforge.appspot.com/article/turning-a-website-into-a-desktop-application)

- utilisation d’une fonctionnalité de Chrome : la création de raccourci avec ouverture dans une fenêtre “sans chrome”,
- fonctionne sur tous les OS,
- utilise le favicon comme icône pour l’application,
- le site web se retrouve dans votre barre des tâches comme une application normale, et on peut faire un `ALT/CMD-Tab` pour aller vers son application, etc.


### Architecture

Six patterns pour les architectures event-driven [https://medium.com/wix-engineering/6-event-driven-architecture-patterns-part-1-93758b253f47](https://medium.com/wix-engineering/6-event-driven-architecture-patterns-part-1-93758b253f47)

- De Wix.
- Il y a trois patterns dans cet article.
- Consume and project : vue dématérialisée copie des données chaudes consommées par beaucoup. Et ces vues sont focalisées sur un consommateur. Kafka et CDC au milieu pour découpler.
- Event-driven de bout en bout : websocket utilise pour envoyer les demandes. Le web socket serveur copie dans Kafka. Ces consommateurs font le job et un message est envoyé via le web socket serveur. Résilience, découplage.
- K/V store : et en particulier avec kafka qui permet d’être consommé en key/value basse latence et en consommation d’évènement.
- Peut être intéressant, mais pas si simple de comprendre les usages dans cet article.


### Méthodologies

Un article sur quoi et pourquoi le DevOps (englobant les bonnes pratiques du moment) [https://enix.io/fr/blog/devops-benefices-difficultes/](https://enix.io/fr/blog/devops-benefices-difficultes/)

- Les techs ne vont pas apprendre grand-chose.
- Mais c’est un article pour les managers ou plutôt les execs pour les aider à voir la valeur de DevOps.
- Souvent plus facile de montrer la valeur par du contenu extérieur à l’entreprise, car perçu comme neutre.
- Autres articles sur Kubernetes pour les execs : [https://enix.io/fr/blog/kubernetes-benefices-difficultes/](https://enix.io/fr/blog/kubernetes-benefices-difficultes/).

Amazon et la methode “working backwards” pour un produit [https://www.productplan.com/glossary/working-backward-amazon-method/](https://www.productplan.com/glossary/working-backward-amazon-method/)

- imaginer le produit prêt à être mis en production,
- écrire la press release,
- évaluer l’opportunité (doit-on le construire),
- découvrir les solutions pour le faire et avoir l’approbation des décideurs,
- construire la roadmap,
- construire le backlog.


### Sécurité

1.5 million de lignes de code dans Android sont maintenant en Rust
[https://security.googleblog.com/2022/12/memory-safe-languages-in-android-13.html?m=1](https://security.googleblog.com/2022/12/memory-safe-languages-in-android-13.html?m=1)

- de plus en plus de code memory safe (Java, Kotlin, Rust),
- mais la majorité de nouveau code reste quand meme Java et C++,
- et une correlation de baisse de vulnérabilités liées à la sureté de mémoire (moins de code de programme memory unsafe),
- ou maturation du code avec moins de vulns ?,
- autres efforts : outils de sécurisation de la memoire en C/C++, fuzzing,
- zéro vuln memoire dans le code Rust en 2 ans et en moyenne une par kLOC dans le code historique,
- Java -> JNI, Rust - unsafe pour les accès resource.


### Loi, société et organisation

Les dinosaures de la tech commencent à 40 ans ? [https://www.linkedin.com/pulse/non-nous-ne-sommes-pas-des-dinosaures-de-la-tech-pass%C3%A9-ramade/](https://www.linkedin.com/pulse/non-nous-ne-sommes-pas-des-dinosaures-de-la-tech-pass%C3%A9-ramade/)

- Commentaire intéressant de Benjamin Marron qui explique “s’être restreint aux technos de son cœur d’activité, car trop de veille technologique hétérogène l’avait épuisé et avait renforcé son sentiment d’être complètement obsolète et dépassé” [https://twitter.com/bmarron/status/1596136098828148736](https://twitter.com/bmarron/status/1596136098828148736)
- Âge median des devs entre 28 et 31 ans chez Google, Microsoft et Facebook.
- Mais 50 ans, c’est 30% de la force de travail.
- Avantages des seniors:
  - expérience,
  - mentorat, comm, interaction interpersonnelle (Atlassian a une personne de 40+ ans dans chaque équipe),
  - rétention : moins de changement de travail tous les 3 ans,
  - flexibilité : les vieux ont leurs enfants partis,
  - aide à faire des produits pour les personnes de même âge,
- Pas souvent dans les politiques de DSI.

GitHub copilot menacé par un procès [https://www.infoq.com/news/2022/11/lawsuit-github-copilot/?utm_source=twitter&amp;utm_medium=link&amp;utm_campaign=calendar](https://www.infoq.com/news/2022/11/lawsuit-github-copilot/?utm_source=twitter&amp;utm_medium=link&amp;utm_campaign=calendar)

- aux États-Unis,
- _class action_ contre GitHub copilot, Microsoft et OpenAI
- violation de copyright et notamment des licenses open source,
- hypothèse est qu’humain ou AI on la même responsabilité face à la license,
- discussion autour de fair use VS rupture de contrat, DMCA, etc.,
- piratage de logiciel à une échelle sans précédant,
- peut avoir des conséquences fortes sur l’IA et son utilisation des sources ouvertes pour construire du contenu,
- et Antonio va devoir recoder à la main.


## Rubrique débutant

Différentes méthodes d’interpolation des chaines en Java [https://www.baeldung.com/java-string-interpolation](https://www.baeldung.com/java-string-interpolation)

- la concatenation avec `+`,
- la methode `format()` souvent intimidante mais plus optimisée et sûre,
- `StringBuilder` le plus flexible notamment dans les cas de `if` (et autres variations), plus rapide mais moins sûr que format,
- `MessageFormat` pour les chaines de caractère utilisateur (multi-langage),
- Apache Commons (pas sûr qu’il y ait encore beaucoup d’usage avec les JDK modernes).


## Conférences

La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

* 1 décembre 2022 : [Devops DDay #7](https://2022.devops-dday.com/) - Marseille (France) <a href="https://conference-hall.io/public/event/eKYGzptI6y44zoS8sGUz"><img alt="CFP Devops DDay" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2022&color=red"> </a>
* 2 décembre 2022 : [BDX I/O](https://www.bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/OJC5Ou5YJodfetgSJCa3"><img alt="CFP BDX I/O" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-Jul-2022&color=red"> </a>
* 2 décembre 2022 : [DevFest Dijon 2022](https://www.linkedin.com/posts/developers-group-dijon_apr%C3%A8s-des-%C3%A9changes-avec-google-le-developers-activity-6973555910140903424-rjRH/) - Dijon (France) <a href="https://conference-hall.io/public/event/cXWCepNzXVWwb1i6ktVA"><img alt="CFP DevFest Dijon 2022" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-October-2022&color=red"> </a>
* 14-16 décembre 2022 : [API Days Paris](https://www.apidays.global/paris/) - Paris (France) & Online
* 15-16 décembre 2022 : [Agile Tour Rennes](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2022/"><img alt="Agile Tour Rennes" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2022&color=red"> </a>
* 19 janvier 2023 : [Archilocus](https://www.archilocus.tech/about) - Bordeaux (France) <a href="https://conference-hall.io/public/event/qII4ZCroLOcGUtnr0W3M"><img alt="Archilocus Winter 2023" src="https://img.shields.io/static/v1?label=CFP&message=December-31-2022&color=green"> </a>
* 19-20 janvier 2023 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/speaker/event/3lWSdH0pfZkHEAL7RWSJ"><img alt="Touraine Tech 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%20September-30%20to%20November-27-2022&color=red"> </a>
* 25-28 janvier 2023 : [SnowCamp](https://snowcamp.io/fr/) - Grenoble (France) <a href="https://conference-hall.io/public/event/ZGJWM1x64evaNUzycEzn"><img alt="CFP SnowCamp 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2022&color=red"> </a>
* 2 février 2023 : [Very Tech Trip](https://conference-hall.io/public/event/hoyBWUXe43dnoiBekZaB) - Paris (France) <a href="https://conference-hall.io/public/event/hoyBWUXe43dnoiBekZaB"><img alt="CFP Very Tech Trip 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-November-2022&color=red"> </a>
* 2 février 2023 : [AgiLeMans](https://www.agilemans.org/) - Le Mans (France) <a href="https://sessionize.com/7ieme-journee-agile-au-mans-france-e/"><img alt="CFP Very Tech Trip 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-December-2022&color=red"> </a>
* 9-11 février 2023 : [World AI Cannes](https://worldaicannes.com/) - Cannes (France)
* 16-19 février 2023 : [PyConFR](https://www.pycon.fr/2023/) - Bordeaux (France) <a href="https://cfp-2023.pycon.fr/"><img alt="CFP PyConFr 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-Janvier-2023&color=green"> </a>
* 7 mars 2023 : [Kubernetes Community Days France](https://community.cncf.io/events/details/cncf-kcd-france-presents-kubernetes-community-days-france-2023/) - Paris (France) <img alt="CFP KCD Paris" src="https://img.shields.io/static/v1?label=CFP&message=from%20September-15%20to%20November-13-2022&color=red">
* 23-24 mars 2023 : [SymfonyLive Paris](https://live.symfony.com/2023-paris/) - Paris (France) <a href="https://live.symfony.com/2023-paris/cfp"><img alt="CFP SymfonyLive Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-December-2022&color=yellow<"></a>
* 23-24 mars 2023 : [Agile Niort](https://agileniort.fr/) - Niort (France) <a href="https://sessionize.com/agile_niort_2023"><img alt="CFP AgileNiort" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-December-2022&color=green"></a>
* 1-2 avril 2023 : [JdLL](https://jdll.org/) - Lyon 3e (France) <a href="https://jdll.org/participer"><img alt="CFP JDLL" src="https://img.shields.io/static/v1?label=CFP&message=until 31-January2023&color=green"></a>
* 5-7 avril 2023 : [FIC](https://europe.forum-fic.com) - Lille Grand Palais (France)
* 12-14 avril 2023 : [Devoxx France](https://www.devoxx.fr/) - Paris (France) <a href="https://cfp.devoxx.fr/"><img alt="CFP Devoxx France" src="https://img.shields.io/static/v1?label=CFP&message=from%20November-21%20to%20January-8-2023&color=green"></a>
* 10-12 mai 2023 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk23.cfp.dev/#/"><img alt="CFP Devoxx UK 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2023&color=green"></a>
* 12 mai 2023 : [AFUP Day](https://event.afup.org/) Lille & Lyon (France) <a href="https://event.afup.org/"><img alt="CFP AFUP Day 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-November-2022&color=red"></a>
* 25-26 mai 2023 : [Newcrafts Paris](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/newcrafts-paris-2023"><img alt="CFP Newcrafts Paris 2023" src="https://img.shields.io/static/v1?label=CFP&message=from%2001-December-2022%20to%2012-February-2023&color=green"></a>
* 29-30 juin 2023 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/public/event/Jnevkv3bLyxZOyYyiWSC"><img alt="CFP Sunny Tech 2023" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2023&color=green"></a>
* 12-13 octobre 2023 : [Volcamp 2023](https://www.volcamp.io/) - Clermont Ferrand (France)


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

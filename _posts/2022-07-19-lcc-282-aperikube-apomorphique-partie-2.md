---
title: LCC 282 - Apérikube apomorphique - partie 2
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 282
mp3_length: 37235666
tweet: Apérikube apomorphique - partie 2
# tweet size: 91-93 -> 99-101 #######################################################################
---
Cet épisode marathon sera découpé en deux morceaux pour éviter à vos oreilles une écoute marathon.
Cette deuxième partie couvre des sujets d'architecture et de loi société et organisation ainsi que les conférences à venir.
Logging, Migration Java 8 vers 11, Xerox Park, (manque de) sécurité, courbes elliptiques, sondage développeurs.


Enregistré le 8 juillet 2022

Téléchargement de l'épisode [LesCastCodeurs-Episode-282.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-282.mp3)

## News

### Architecture

Pour ou contre le logging [Contre](https://blog.sebastian-daschner.com/entries/the-case-against-logging) puis [pour](https://tersesystems.com/blog/2022/06/12/the-case-for-logging/) 

* tous les langages et plateformes utilisent les logs
* debugging, tracing, journaling, monitoring, and printing errors
* impact sur les performances (allocation supérieure sur un log que sur le code métier
* log = mémoire, CPU (GC), I/O
* risque de securité (dépendances et fonctionnalités sans besoin)
* format des log: pour lecture humaine main volume impose traitement automatique
* log level la bonne abstraction (souvent trop et pas ce que l’on veut à la fois
* debugging -> utiliser un debugger ; journaling -> event sourcing ou solution dédiée ; tracing > open tracing ; monitoring -> monitoring solution via metrics et health check
* bons usages de logging: en dev (println), fin de jobs automatiques, erreurs non récupérables ou innatendues, pas les erreurs utilisateur (logger les erreurs qui cachent un bug),
* dans les container, Sébastien utilise System.out et System.err vu que les logs sont gérés par la plateforme
* la réponse pour maintenant
* les logs peuvent etre structurés
* performance, on peut éviter les concatenations de String (parameterized logging), memory allocation est bien meilleure depuis 2012 (e.g. Shenandoah), vu des problèmes dans des cas plus rare de genre MDC.getCopyOfContextMap
* disk I/O: ok mais disque cape a 200 MiB/s donc bon…: si c;est le cas, sépare I/O log du reste (disque vs network par exemple)
* gros fan de logs structures via JSON ; log line sur console et JSON en fichier
* log plus de manière conditionelle
* tracing théoriquement bon mais limite dans son contexte métier et peu d’infos passables
* system.out problème de scalabilité d’usage, etc et appel blocant println (async usage n’est pas bon)

[LinkedIn et sa migration de Java 8 à 11](https://engineering.linkedin.com/blog/2022/linkedin-s-journey-to-java-11)

* 1000 apps sur 320k hosts
* Migration Java 8 vers 11 avec en vue G1
* regardé depuis 2018
* Jetty, Hadoop, Play, Samza: focalisé sur Jetty
* 1. Mettre a jour le système de build, 2. Faire des tests de performance 3. Automatiser la migration
* mise. a jour vers gradle 5
* G1 80% des applis CMS 20%
* pris 20 apps representatives
* focalisé sur les applications avec les tailles de piles les plus grosses
* de équipera jusquà 200% plus de latence et throughput: zones G1, Shenandoah et ZGC
* automatisé la migration du reste et tourné les builds de tests qui ont identifié les problèmes de migration
* quelques problèmes: suppression de certaines classes Java EE, changement du type de classloader par défaut, casting de classe plus stricte
* ils ont utilisé -release 8 et ont limité les usages des features Java 11
* les options de CLI de la JVM ont beaucoup changé
* LinkedIn fait du microsercices ce qui veut dire que beaucoup de repositories sont liés à d’autre par un graphe de dépendance: euh c’est pas le principe des microservices d’éviter ça???
* mise a jour de 500 librairies 3/4 de l’année
* Quelques challenges vus
* La JVM respecte groups et donc moins de thread GC sont crées
* aussi ils pouvaient piquer des cycles CPUs avant et plus maintenant
* Java 11 a un usage de mémoire hors pile plus important
* reduction de latence p99 par 10% et le throughput par 20% sans changer le type de GC
* C’est un bon retour qui sent le type de développement de la vrai vie


### Méthodologies

[Un article sur Xerox park et comment ils ont inventé le futur](https://spectrum.ieee.org/xerox-parc)

* article de 1985
* Xerox achète un constructeur de mainframe, et ils ont crée un lab de recherche pour aider les usages
* Macintosh et la souris et les fenêtres, les cartes météos colorées, imprimante laser, réseaux d’ordinateurs, lasers semi-conducteurs qui lisent les disques optiques, langages de programmation structurés
* developer l’architecture de l’information
* project proposes et faite en bottom up
* PARC construisait ses propres hardware ce qui a créer des inventions et qui devaient etre construits pour 100 utilisateurs (scale)
* recherche en construisant concrètement, pas en papier théorique académique
* bit map, distributed computing, email, frame buffer, LAN, object oriented programming
* Cree Alto un ordinateur « personnel » qui a permis aux chercheurs de tester leurs idées, beaucoup en avaient un.
* donc ils ont du inventer le LAN et Ethernet (packet) via une personne avec passe de radio amateur (medium partagé et non reliable
* premier projet distribué. (Un protocole d’impression)
* antialiasing : ils amélioraient en testant pour de vrai
* un gars a construit un proto de souris pour prouver que les curseurs étaient plus efficace: tests avec des dans la rue et IO a perdu :D
* concept de modal (insert, delete) vers comportement non modal, plus simple pour l’utilisateur
* small talk: un langage si simple qu’un enfant peut l’utiliser (simulation based programming)
* overlapping windows ont été développées en small talk
* autre groupe strong type system
* Xerox ne savait pas convertir ces recherches en produits et les amener sur le marcher (sauf l’imprimante laser)

### Sécurité

[Travis CI fuit encore des mots de passe](https://arstechnica.com/information-technology/2022/06/credentials-for-thousands-of-open-source-projects-free-for-the-taking-again/)

* permet d’accéder au compte privé des développeurs open source qui ont mis en place travisCI
* c’est la quatrième fois
* token offre accès lecture et écriture aux repos
* risque d’attaque de supply chain
* tokens github, AWS ou DockerHub apr exemple mais aussi les bases de données utilisées dans la CI
* via l’API TravisCI

[HDMI peut-être un vecteur d’attaque et d’infection de vos ordinateurs](https://git.cuvoodoo.info/kingkevin/board/src/branch/hdmi_firewall/README.md)

* Un hack d’un adaptateur HDMI peut potentiellement infecter un video-projecteur, et qui à son tour pourra réinfecter les prochains ordinateurs qui s’y connecteront
* Cet article propose de construire une sorte de connecteur qui sert de firewall HDMI pour éviter ce genre d’infection
* il y a des préservatifs USB aussi qui ne laissent passer que la puissance et pas les données

[Un guide pour protéger son macOS](https://www.bejarano.io/hardening-macos/)

* Une suite de conseils comme de faire une installation toute fraiche, de mettre les mises à jour logicielle automatiques, n’autoriser que les applications signées, appliquer le chiffrement du disque…
* Mais aussi utiliser par exemple un gestionnaire de mot de passe, éviter les extensions de navigateur, faire tourner un firewall
* Et des liens vers des guides de sécurités plus avancés
* un truc que je n’ai pas fait mais qui me tente c’est un outbound firewall comme little snitch ou lulu

[Comment choisir un algorithme de courbes elliptiques](https://soatok.blog/2022/05/19/guidance-for-choosing-an-elliptic-curve-signature-algorithm-in-2022/)

* un article qui détaille le pour et le contre de certaines courbes elliptiques
* cas d’usage, notamment gouvernemental
* faiblesses (timing attaques etc)
* pour les curieux mais la première courbe citée est celle la plus utilisée en ce moment


### Loi, société et organisation

[Stackoverflow sort son sondage sur les développeurs](https://survey.stackoverflow.co/2022)

* 70% apprennent a coder en ligne (les plus de 45 ans dans les bouquins)
* stackoverflow derrière la doc technique puis les blogs ; video 60% des gens ; podcast 7,21% damn!
* presque 60% ont moins de 10 ans d’expérience ; si t’es pas VP ou CxO a 17 ans d’expérience, tu as raté ta vie
* 9% cloud infra engineers
* 22% ont neuro atypiques 
* Docker passe dans la catégorie outil fondamental (69% d’usage)
* les frameworks 3D genre Unity 3D ou Unreal Engine sont des outils que des non développeurs pro apprennent
* Rust technologie la plus aimée, Rust et Python en plus demandées
* Java 6eme position mais 4ème pour ceux qui apprenent
*  [Angular.is](http://angular.is/)  en framework le plus redouté /  [react.is](http://react.is/)  le plus demandé
* Docker et Kube sont les plus aimés et demandé
* indépendants on augmenté de 5% et 4% pour les temples pleins
* 85% des dev sont dans une orga partiellement distancié le
* 62% des devs pro cherchent des réponses pendant plus de 30 minutes par jour, 25% 11h
* Azure prend la deuxième place des cloud, OVH 3,7%
* Spring framework le plus populaire de Java
* VSCode 74%, IntelliJ 28%, vim 23%, Eclipse 12%, EMacs 4,5%
* pleins d’outils asynchrone (tickets etc) que je ne connais pas
* salaires ont augmenté de 23% en median

[JavaScript change de licence open source](https://hacks.mozilla.org/2022/06/the-specification-for-javascript-has-a-new-license/)

* toujours la licence Ecma international license, assez restrictive qui interdit le fork, mais avec certaines provisions pour l’intégration et la reproduction
* mais aussi une nouvelle licence dérivée de la W3C Document & Software License, un peu plus ouverte, qui permet d’intégrer et s’intégrer plus facilement avec les autres standards du Web

## Conférences

de la part de Youen

Cette année Codeurs en Seine, c’est le 17 novembre et le [cfp est ouvert](https://cfp.codeursenseine.com/)  
N’hésitez pas à amener un peu de JVM dans l’appel à orateur. (ca commence à se faire rare).
Pour rappel : codeurs en seine c’est 1000 personnes autour des métiers du développement dans une des plus grande salle de Rouen, le kindarena.

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

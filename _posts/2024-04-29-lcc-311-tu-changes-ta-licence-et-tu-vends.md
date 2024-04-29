---
title: LCC 311 - Tu changes ta licence et tu vends
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 311
mp3_length: 54284740
tweet: Tu changes ta licence et tu vends #Angular #Wiz #Redis #XZ #Keycloak #Jilt #JFR #Valkey #Grok #Albert #VSCode #JavaOne #IBM #Hashicorp #Oracle #Apple #AMA
# tweet size: 91-93 -> 99-101 #######################################################################
---
Cet épisode news revient sur le rachat de Hashicorp par IBM, sur le changement de license Redis, sur le bug macos 14.4 et Java, sur la faille de de chaine d'approvisionnement sur XZ.
Et nous débutons notre subrique Ask Me Anything. 
N'hésitez pas à nous soumettre vos question sur <https://lescastcodeurs.com/ama>.

Enregistré le 26 avril 2024

Téléchargement de l’épisode [LesCastCodeurs-Episode-311.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-311.mp3)

## News

### Langages

Attendez peut-être avant d’upgrader macOS à la version 14.4, si vous faites du Java ! Attention le crash !
[https://blogs.oracle.com/java/post/java-on-macos-14-4](https://blogs.oracle.com/java/post/java-on-macos-14-4)

- Bug à suivre [https://bugs.java.com/bugdatabase/view_bug?bug_id=8327860](https://bugs.java.com/bugdatabase/view_bug?bug_id=8327860)
- À été fixé en 14.4.1 [https://blogs.oracle.com/java/post/java-on-macos-14-4](https://blogs.oracle.com/java/post/java-on-macos-14-4)
- c'était lié à un changement de comportement dans l'execution de code dynamique (compilé après le lancement du process)
- Au lieu de recevoir signal, SIGBUS or SIGSEGV et de le gérer
- SIGKILL était lancé et forcément ça marchait moins bien
- Apple a corrigé le comportement

Article de Gunnar Morling sur la nouvelle API de “gatherer” de Java 22, pour améliorer les streams, ici en montrant une implémentation d’un “zipper” qui assemble les éléments de 2 streams 2 à 2
[https://www.morling.dev/blog/zipping-gatherer/](https://www.morling.dev/blog/zipping-gatherer/)

- on a parlé des gatherers déjà qui permet de faire de faire des opérateurs intermediaries custom par rapport à ce que je JDK offre
- ici Gunnar montrer un zipper qui n'est pas présent par défaut

Julien Ponge est Java champion, félicitations !

JFR 9 est sorti [https://hirt.se/blog/?p=1477](https://hirt.se/blog/?p=1477)

- peut tourner dans Eclispe 
- Support de arm64 pour Linux et macOS
- Dark mode !
- Des améliorations de performance 
- Support graalvm native image
- Nouveau afficheur de flame graph 
- G1 pause target compliance


### Librairies

Nouvelle version de Jilt, l’annotation processor qui implémente les builders
[https://www.endoflineblog.com/jilt-1_5-released](https://www.endoflineblog.com/jilt-1_5-released)

- Evite les hacks à la Lombok
- Une nouvelle méthode toBuilder() pour obtenir un builder d’un bean déjà configuré
- Support des méta-annotations, histoire de pas répéter sur chaque type comment on souhaite définir ses builders
- Possibilité de mettre l’annotation @Builder sur les constructeurs privés
- Support agnostique de @Nullable quel que soit l’origine de cette annotation


### Infrastructure

IBM pourrait racheter Hashicorp [https://www.reuters.com/markets/deals/ibm-nearing-buyout-deal-hashicorp-wsj-reports-2024-04-23/](https://www.reuters.com/markets/deals/ibm-nearing-buyout-deal-hashicorp-wsj-reports-2024-04-23/)

- rien n’est fait
- Hashicorp qui a été dans la tourmente après le passage de Terraform en closed source
- mais les revenus sont là. 
- C’est fait [https://www.hashicorp.com/blog/hashicorp-joins-ibm](https://www.hashicorp.com/blog/hashicorp-joins-ibm)



### Web

Google intègre son framework interne Wiz dans Angular
[https://blog.angular.io/angular-and-wiz-are-better-together-91e633d8cd5a](https://blog.angular.io/angular-and-wiz-are-better-together-91e633d8cd5a)

- Wiz est un framework interne à Google utilisé dans des produits comme Google Search ou Photos, très axé sur la performance
- Wiz va amener plus de performance à Angular, tout en gardant la super interactivité d’Angular
- Wiz historiquement sur la perf et peu d'interactions utilisateur, angular sur interactions riches et super experience developer
- Wiz server side rendering first et streamé, ce qui élimine le javascript dans le chemin de charge initial
- des fonctions comme deferred views sont venu vers angular et signals sont venu a wiz
- vont merger au fur et a mesure des prochaines années via Angular comme receptacle open


### Data et Intelligence Artificielle

Redis aussi se met à changer sa licence pour une licence pas tout à fait open source. Un fork nommé Valkey, animé par des mainteneurs de Redis, rejoint la fondation Linux
[https://www.linuxfoundation.org/press/linux-foundation-launches-open-source-valkey-community](https://www.linuxfoundation.org/press/linux-foundation-launches-open-source-valkey-community)

- AWS, Google, Oracle, Ericsson et Snap sont nommés dans l'effort
- Open Source fight back mais via des grands acteurs qui ont un interet dans la version "gratuite" pour le cloud
- les infos de Redis [https://redis.com/blog/redis-adopts-dual-source-available-licensing/](https://redis.com/blog/redis-adopts-dual-source-available-licensing/)
- En gros releasé sous SSPL (comme MongoDB) ou une license spécifique Redis
- RSAL est source available license (dont pas open source) et SSPL est pas reconnu comme open source par l'OSI car elle impose des restrictions à l'usage
- du coup certaines fonctions closed sources deviennent source available
- Met les cloud provider en cause du problème, ils font de l'argent et commodetize Redis sans redonner du revenu aux développeurs de Redis
- est-ce que les gens seront ok de continuer a coder pour du code pas open, juste disponible
- et évidemment ca casse l'écosystème redis ou open source qui voulait utiliser redis en tant qu'open 
- pas autorisé de faire du support sur un produit qui derive de redis sans payer une license si c'est "compétitif"

Elon Musk tient sa promesse et ouvre son Large Language Model, Grok
[https://x.ai/blog/grok-os](https://x.ai/blog/grok-os)

- Modèle de 314 milliards de paramètres (Pi !)
- Architecture MoE (Mixture of Experts) qui fait qu’il n’y a que 25% des neurones actifs à l’inférence (efficace et rapide)
- C’est un modèle “pre-trained”, de base, non-finetuné, donc pas très utilisable en l’état (il faut le finetuner en mode “instruct” et/ou “chat” pour qu’il soit vraiment utilisable)
- Le code dans le repo Github, ainsi que les poids du réseau de neurones, sont OSS sous licence Apache 2
- L’entrainement a été effectué avec JAX et Rust !
- La cut-off date est Octobre 2023

### Outillage

Oracle lance son extension VSCode pour Java [https://devclass.com/2024/03/19/java-22-is-out-and-oracle-is-pushing-its-own-extension-for-vs-code-over-not-very-good-red-hat-alternative/](https://devclass.com/2024/03/19/java-22-is-out-and-oracle-is-pushing-its-own-extension-for-vs-code-over-not-very-good-red-hat-alternative/)

- une extension en competition avec l'extension officielle et historique Java faite par MS et Red Hat
- Oracle estime l'extension pas tres bonne cafr basée sur le compilateur Eclipse
- 33M de telechargements quand même
- La nouvelle s'appuie sur javac donc proche de la verite par definition et en avance par definition de la facon dont Oracle release quand il veut
- aligné avec le timing de simplification de Java pour les débutants

### Sécurité

Rémi Forax nous partage cet article sur les puces M1/M2/M3 d’Apple, qui utilisent un nouveau “prefetcher” un peu trop agressif qui permet de leaker les clés utilisées lors des opérations cryptographiques :
[https://arstechnica.com/security/2024/03/hackers-can-extract-secret-encryption-keys-from-apples-mac-chips/](https://arstechnica.com/security/2024/03/hackers-can-extract-secret-encryption-keys-from-apples-mac-chips/)

- comme d'hab pour les side channels attaques de de type c'est su un autre process peut tourner sur la machine et être adversaire
- lié a un data dependent memory fetcher
- dans ce cas, un champ est soit une valeur, soit un pointeur et Appel pre-fetch dans le cas où c'est un pointeur
- et c'est attaquable en injectant des variables qui ressemblent a des pointeurs vers des données controlées et on peut en déduire la clés secrete si cette variable et la clé ont des opérations
- mais le code peut désactiver cette optimisation si j'ai bien compris

L’histoire d’une porte dérobée dans le projet open source XZ qui a failli mettre à mal toutes les connexions sous Open SSH, avec pour tâche de fond la fragilité de projets open source maintenu par des individuels bénévoles à bout de souffle
[https://uwyn.net/@rusty@piaille.fr/112190942187106096](https://uwyn.net/@rusty@piaille.fr/112190942187106096)

- ArsTechnica détaille l’histoire [https://arstechnica.com/security/2024/04/what-we-know-about-the-xz-utils-backdoor-that-almost-infected-the-world/](https://arstechnica.com/security/2024/04/what-we-know-about-the-xz-utils-backdoor-that-almost-infected-the-world/)
- [https://www.minimachines.net/actu/la-menace-xz-ou-comment-le-ciel-a-failli-tomber-sur-nos-tetes-125967](https://www.minimachines.net/actu/la-menace-xz-ou-comment-le-ciel-a-failli-tomber-sur-nos-tetes-125967)

Les impacts de laisser trainer son secret client dans les connections Keycloak [https://medium.com/@benjaminbuffet/dis-keycloack-cest-grave-si-je-laisse-tra%C3%AEner-mon-client-secret-d371a0f657ee](https://medium.com/@benjaminbuffet/dis-keycloack-cest-grave-si-je-laisse-tra%C3%AEner-mon-client-secret-d371a0f657ee)

- un article qui explique les raison plutôt que de dire c'est mal car c'est secret
- quand on utilise un mot de passe du client (et pas un JWT signé ou une clé privé)
- si ca se perd, c'est l'usurpation de l'identité d'un utilisateur via son usage de client qui est en jeu (donc joué en tant que)
- ou usurper l'identité client en tant que telle (plus facile)
- et quelques conseils pour réduire ce risque

### Loi, société et organisation

JavaOne serait de retour pour de vrai ?
[https://www.oracle.com/javaone/](https://www.oracle.com/javaone/)

- En mars 2025, c’est dans un an, on a le temps !
- Ça se déroulera sur le campus d’Oracle dans la Silicon Valley
- peu d'infos et de détail, pas sur que cela soit le JavaOne de nos souvenirs.

Des infos concretes sur l'IA souveraine Albert [https://x.com/emile_marzolf/status/1783072739630121432](https://x.com/emile_marzolf/status/1783072739630121432)

### AMA, Ask Me Anything

Hamza:

"Comment être un rockstar dans le domaine, s’il vous plaît une réponse détaillée sur le plan d’action veille, auto formation, side projets …… depuis vos expériences personnelles. Merci d’avance "

## Conférences

La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 3-4 mai 2024 : [Faiseuses Du Web 3](https://faiseusesduweb.eu.org) - Dinan (France) 
- 8-10 mai 2024 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk24.cfp.dev/#/"><img alt="CFP Devoxx UK 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-January-2024&color=red"></a>
- 16-17 mai 2024 : [Newcrafts Paris](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/newcrafts-paris-2024"><img alt="CFP Newcrafts Paris 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-Jan-2024&color=red"></a>
- 22 mai 2024 : [OpenInfra Day France](https://oideurope2024.openinfra.dev/france/) - Palaiseau (France) <a href="https://openinfrafoundation.formstack.com/forms/2024_openinfra_days_france_cfp"><img alt="CFP OpenInfra Day France" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-April-2024&color=red"></a>
- 22-25 mai 2024 : [Viva Tech](https://vivatechnology.com/) - Paris (France) 
- 24 mai 2024 : [AFUP Day Nancy](https://event.afup.org/afup-day-2024/afup-day-2024-nancy/) - Nancy (France) <a href="https://afup.org/event/afupday2024nancy"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Poitiers](https://event.afup.org/afup-day-2024/afup-day-2024-poitiers/) - Poitiers (France) <a href="https://afup.org/event/afupday2024poitiers"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Lille](https://event.afup.org/afup-day-2024/afup-day-2024-lille/) - Lille (France) <a href="https://afup.org/event/afupday2024lille"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Lyon](https://event.afup.org/afup-day-2024/afup-day-2024-lyon/) - Lyon (France) <a href="https://afup.org/event/afupday2024lyon"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 28-29 mai 2024 : [Symfony Live Paris](https://live.symfony.com/2024-paris/) - Paris (France) 
- 1 juin 2024 : [PolyCloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/public/event/0NC2WdB8KknRtX8aBgyO"><img alt="CFP PolyCloud" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-March-2024&color=red"></a>
- 6 juin 2024 : [WAX 2024](https://www.waxconf.fr) - Aix-en-Provence (France) <a href="https://conference-hall.io/public/event/fFQHasEzjy4wUYpBMrkI"><img alt="CFP WAX 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=green"></a>
- 6-7 juin 2024 : [DevFest Lille](https://devfest.gdglille.org/) - Lille (France) <a href="https://conference-hall.io/public/event/lfYn4Qk5xCAfLHrnNANa"><img alt="CFP DevFest Lille" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-April-2024&color=red"></a>
- 6-7 juin 2024 : [Alpes Craft](https://www.alpescraft.fr/) - Grenoble (France) 
- 7 juin 2024 : [Fork it! Community](https://www.forkit.community/) - Rouen (France) <a href="https://conference-hall.io/public/event/1GyOS8KvW02suD6jQmjz"><img alt="CFP Fork it community" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-April-2024&color=red"></a>
- 11 juin 2024 : [Cloud Toulouse](https://www.cloudtoulouse.com) - Toulouse (France) <a href="https://conference-hall.io/public/event/WEZYoIPUuyGlH3QfBTl9"><img alt="CFP Cloud Toulouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=green"></a>
- 11-12 juin 2024 : [OW2con](https://www.ow2con.org/view/2024/) - Paris (France) <a href="https://pretalx.com/ow2con-2024/cfp"><img alt="CFP OW2con'24 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=red"></a>
- 11-12 juin 2024 : [PGDay Lille](https://pgday.fr/) - Lille (France) <a href="https://pgday.fr/appel"><img alt="CFP PGDay Lille" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2024&color=red"></a>
- 12-14 juin 2024 : [Rencontres R](https://rr2024.sciencesconf.org/) - Vannes (France) 
- 13-14 juin 2024 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 14 juin 2024 : [DevQuest](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/public/event/geINICiIQFU0WdORU423"><img alt="DevQuest" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-April-2024&color=red"></a>
- 18 juin 2024 : [Mobilis In Mobile 2024](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/public/event/YvcuiTfRV8GsU8NVCQLS"><img alt="CFP Mobilis In Mobile 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-April-2024&color=red"></a>
- 18 juin 2024 : [BSides Strasbourg 2024](https://bsides-sxb.fr/) - Strasbourg (France) <a href="https://conference-hall.io/public/event/yzbqRyQzA5mE3IIfgHUy"><img alt="CFP BSides Strasbourg 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-March-2024&color=red"></a>
- 18 juin 2024 : [Tech & Wine 2024](https://technwine.fr/) - Lyon (France) <a href="https://conference-hall.io/public/event/8TWYUoDT3t0J1XTo1nys"><img alt="CFP Tech & Wine 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=green"></a>
- 19-20 juin 2024 : [AI_dev: Open Source GenAI & ML Summit Europe](https://events.linuxfoundation.org/ai-dev-europe/) - Paris (France) 
- 19-21 juin 2024 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxxpl24.cfp.dev/#/login"><img alt="CFP Devoxx Poland" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2024&color=red"></a>
- 26-28 juin 2024 : [Breizhcamp 2024](https://www.breizhcamp.org/) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2024/"><img alt="CFP Breizhcamp 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-April-2024&color=red"></a>
- 27 juin 2024 : [DotJS](https://www.dotjs.io/) - Paris (France) <a href="https://www.dotjs.io/cfp"><img alt="CFP DotJS 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-March-2024&color=red"></a>
- 27-28 juin 2024 : [Agi Lille](http://agilille.fr/) - Lille (France) <a href="https://sessionize.com/agilille-2024"><img alt="CFP Agi Lille 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2024&color=red"></a>
- 4-5 juillet 2024 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/public/event/32IQQ5wYijdJdXrqtYsx/"><img alt="CFP Sunny Tech 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=red"></a>
- 8-10 juillet 2024 : [Riviera DEV](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/public/event/ieJBZ8FhXHMinZmeTCJp"><img alt="CFP Riviera Dev 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-March-2024&color=red"></a>
- 6 septembre 2024 : [JUG Summer Camp](https://www.jugsummercamp.org) - La Rochelle (France) 
- 6-7 septembre 2024 : [Agile Pays Basque](https://agile-paysbasque.fr/) - Bidart (France) <a href="https://conference-hall.io/public/event/w59YkxhTPvNuwdaRCXKc"><img alt="CFP Agile pays basque 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2024&color=green"></a>
- 19-20 septembre 2024 : [API Platform Conference](https://api-platform.com/con/) - Lille (France) & Online <a href="https://conference-hall.io/public/event/GMijW4ZrZDo6hzKeF1gk"><img alt="CFP API Platform Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-March-2024&color=red"></a>
- 26 septembre 2024 : [Agile Tour Sophia-Antipolis 2024](https://www.telecom-valley.fr/agile-tour-sophia-2024/) - Biot (France) <a href="https://sessionize.com/agile-tour-sophia-antipolis-2024/"><img alt="CFP Agile Tour Sophia-Antipolis 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2024&color=green"></a>
- 2-4 octobre 2024 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) 
- 7-11 octobre 2024 : [Devoxx Belgium](https://devoxx.be) - Antwerp (Belgium) 
- 10 octobre 2024 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) 
- 10-11 octobre 2024 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) <a href="https://conference-hall.io/public/event/98FptSgEGcOSQZymZkUr"><img alt="CFP Volcamp 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-May-2024&color=green"></a>
- 10-11 octobre 2024 : [Forum PHP](https://event.afup.org/) - Marne-la-Vallée (France) 
- 11-12 octobre 2024 : [SecSea2k24](https://secsea.org/) - La Ciotat (France) 
- 16 octobre 2024 : [DotPy](https://www.dotpy.io/) - Paris (France) <a href="https://www.dotpy.io/cfp"><img alt="CFP DotPy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=green"></a>
- 17-18 octobre 2024 : [DevFest Nantes](https://devfest.gdgnantes.com/en/) - Nantes (France) <a href="https://conference-hall.io/public/event/AJYPylkzTDd6j3O6ADZn"><img alt="CFP DevFest Nantes 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-June-2024&color=green"></a>
- 17-18 octobre 2024 : [DotAI](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/cfp"><img alt="CFP DotAI 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2024&color=green"></a>
- 30-31 octobre 2024 : [Agile Tour Nantais 2024](https://agilenantes.org/agile-tour-nantais-2024/) - Nantes (France) <a href="https://sessionize.com/agile-tour-nantais-2024"><img alt="CFP Agile Tour Nantais 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-July-2024&color=green"></a>
- 31 octobre 2024-3 novembre 2024 : [PyCon.FR](https://www.pycon.fr/2024/) - Strasbourg (France) 
- 6 novembre 2024 : [Master Dev De France](https://www.masterdevfrance.com/) - Paris (France) 
- 7 novembre 2024 : [DevFest Toulouse](https://devfesttoulouse.fr/) - Toulouse (France) <a href="https://sessionize.com/devfest-toulouse/"><img alt="CFP DevFest Toulouse" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2024&color=green"></a>
- 8 novembre 2024 : [BDX I/O](https://bdxio.fr/) - Bordeaux (France) 
- 13-14 novembre 2024 : [Agile Tour Rennes 2024](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2024/"><img alt="CFP Agile Tour Rennes 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2024&color=green"></a>
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

---
title: LCC 237 - Tu as fais ta demande de hissage ?
author: 'Emmanuel Bernard'
layout: blog-post
episode: 237
mp3_length: 80386492
tweet: Tu as fais ta demande de hissage ? #github #go #arm #mauvaisesnouvelles
# tweet size: 91-93 -> 99-101 #######################################################################
---
Arnaud et Emmanuel vous commentent l'actualité au cœur de l'été. Do Go, du sansserveur, du arm, de la feuille de route, beaucoup de GitHub et bien sûr sans oublier notre rubrique impact du code sur la société.

Enregistré le 14 août 2020

Téléchargement de l'épisode [LesCastCodeurs-Episode-237.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-237.mp3)

## News

### Langages

[Tip pour récupérer facilement le nom de fichier à partir d'un chemin en Java11](https://adambien.blog/roller/abien/entry/java_11_extract_file_name)   

[Golang 1.15](https://golang.org/doc/go1.15)   

* Meilleure allocation des petits objets en cas de grands nombre de cœurs.
* macOS < 1.12 et app 32 bits dépréciées.
* Derniers tours de roue pour ton pentium 4
* Amélioration du linker en mémoire et cpu sur certaines archi (modifié)
* Possibilité d.embarquer la time zone db. (Quid des évolutions, à recompiler)
* C’est marrant la dépréciation « aggressive » de certaines architectures

[Golang, un draft pour gérer nativement le packaging de resources statiques](https://go.googlesource.com/proposal/+/master/design/draft-embed.md)   

[Redmonk sort son nouveau classement](https://redmonk.com/sogrady/2020/07/27/language-rankings-6-20/), Java #3, Kotlin #19 (un des plus grosses croissances en 5 ans)   

### Librairies

[C’est la fin de Thorntail, né Wildfly Swarm](https://thorntail.io/posts/the-end-of-an-era/)   

* WildFly ajoute le support de MicroProfile
* support uberjar dans WildFly arrive
* Quarkus s'est appuyé sur les expériences et les développeurs de Thorntail

[Comparatif Spring et Micronaut - update](https://tbuss.de/posts/2020/2-micronaut-revisited/)   
[ServerLess - Créer une recherche pour son blog (sur GitHub avec Hugo) avec Quarkus, GraalVM et AWS Lambda](https://www.morling.dev/blog/how-i-built-a-serverless-search-for-my-blog/)   

* search pour un site statique
* crée l'index à la compilation
* reveille la lambda quand le champ de recherche est selectionné
* GraalVM
* retour sur mettre en place une lambda en evitant de se faire déplummer
* mettre les bons privileges dans AWS lamnbda est compliqué
* plus de CPU si plus de RAM


### Infrastructure

[Arm à vendre, Apple pas intéressé mais NVidia peut-être](https://www.macrumors.com/2020/07/31/nvidia-talks-to-acquire-arm/)   


### Cloud

[Docker vient d’annoncer de nouveaux Terms Of Services incluant une nouvelle retention policy pour les images publiées sur DockerHub](https://www.docker.com/pricing/retentionfaq)   

* 6 mois de limite de retentions ur le plan gratuit
* si pas de push ni de pull dans cette période

### Patreon

[Aider les cast codeurs sur PAtreon](https://patreon.comn/lescastcodeurs.)  

### Web

[Vue 3 arrive en release candidate](https://css-tricks.com/vue-3-0-has-entered-release-candidate-stage/)   

* plus performant, completement réécrit
* tres similaire en terme d'APIs de surface
* doc revisitée
* Composition API (a la react hooks)

[La roadmap Angular](https://angular.io/guide/roadmap)   

* 50% de l’engineering sur la back log. Et ensuite 20%. Vous faites plus ou moins en général sur vos projets OSS?

### Data

[rocksdb le moteur LSM de persistence de MySQL. Pourquoi et quand et quand l'utiliser...](https://www.percona.com/blog/2020/02/20/when-to-use-myrocks-in-mysql/)   

* Usage >> ram, write mostly, space concern
* [Log-structured Merge-tree](https://en.wikipedia.org/wiki/Log-structured_merge-tree)

### Outillage

[Git 2.28](https://github.blog/2020-07-27-highlights-from-git-2-28/)   
Jenkins [Controller/Agent pour remplacer Master/Slave](https://www.cloudbees.com/words-have-power-updating-industry-terms)  
[Github stocke une archive de votre code Open Source dans une ancienne mine, dans le cercle arctique, au Svalbard](https://github.blog/2020-07-16-github-archive-program-the-journey-of-the-worlds-open-source-code-to-the-arctic/)   

* 21TB sur 186 films numeriques photosensibles
* 8.8 millions de pixels par frame
* 1000 ans
* dans le permafrost d'une ancienne mine

[Créer sa page profile dans GitHub](https://www.aboutmonica.com/blog/how-to-create-a-github-profile-readme) (voir aussi [ce lien](https://css-tricks.com/the-github-profile-trick/) )   
[Github publie une description au format OpenAPI 3 de son API developer](https://github.blog/2020-07-27-introducing-githubs-openapi-description/)   
[Une roadmap publique pour GitHub](https://github.blog/2020-07-28-announcing-the-github-public-roadmap/)   
[VSCode est-il réellement open-source?](https://underjord.io/the-best-parts-of-visual-studio-code-are-proprietary.html)   

* telemetrie
* extensions come liveshare et remote ne sont pas ouvertes
* marketplace proprio aussi

### Sécurité

[Témoignage - J’ai testé pour vous : se faire usurper son identité](https://linuxfr.org/users/malizor/journaux/j-ai-teste-pour-vous-se-faire-usurper-son-identite)   

* demande de créance
* demander le contrat signé pour porter plainte
* aller a la Banque De France pour voir si vous etes fiché et faire les démarches d'ururpation d'identité
* acheter un broyeur a papier

[Les images OpenJDK Alpine sur DockerHub étendent une version 3.6 d’Alpine qui ne sont plus supportées depuis mai 2019](https://github.com/jenkinsci/docker/issues/957)  


### Loi, société et organisation

[Frances Allen, pionnière de l’informatique, est morte](https://www.lemonde.fr/disparitions/article/2020/08/10/frances-allen-pionniere-de-l-informatique-est-morte_6048608_3382.html)   

* Première femme fellow IBM
* Optimisation compilation
* Parallel computing du project blue gene (95)
* Turing award
* https://en.wikipedia.org/wiki/Frances_Allen

[Mozilla licencie 1/4 de son personnel (250 collaborateurs)](https://blog.mozilla.org/blog/2020/08/11/changing-world-changing-mozilla/)   

* Pas bien compris leur nouveau focus.
* Certains disent que les Dev tools vont être réduits.
* [le message privé](https://blog.mozilla.org/wp-content/uploads/2020/08/Message-to-Employees-Change-in-Difficult-Times.pdf)
* Firefox on users. Focus on new products and time to market.
* Ça sent que Mozilla était sclérosée et qu’il fallait un changement. Vu par le gars qui fait làreorg.

[La COO de Pinterest licenciée car elle parlait de la discrimination rampante.](https://medium.com/@francoise_93266/the-pinterest-paradox-cupcakes-and-toxicity-57ed6bd76960)   

* Décisions par un sous groupe (conversation isolées). Refusant les contre points. Et donc avec infos parcellaires.
* “the only way we get things done here is hiding things.”
* Tout était secret et donc manque de transparence e
* Découvre que sa compensation d’exécutif était différente des autres - on lui avait dit que tous étaient au même modèle
* Elle le fait corriger et se fait exclude des board meetings
* Découvres des problèmes sur le produit et les reporte : et devient l.ennemie du head of product et CEO
* Exclue des meetings de décisions
* so much for blameless retrospective
* Bro culture et même bubble
* But too few leaders ask themselves how they can proactively design their organizations to be truly equitable and make a practice of confronting bias, prejudice, and bullying. They do not put checks and balances in place, so discrimination and harassment are hard to recognize or report. Instead, they seek control. They make decisions behind closed doors, consciously and unconsciously excluding those who do not look, sound, or behave like them.
* Discuss the steps to improve in the end

[La CNIL tape publiquement sur les doigts de StopCovid.](https://www.cnil.fr/fr/application-stopcovid-la-cnil-tire-les-consequences-de-ses-controles)   

* 3 controles organisés en juin
* initialement remontait tous les contacts d'une utilisateur et pas seulement ceux susceptibles d'avoir été exposé
* respect de l'essentiel de la RGPD
* quelques trucs qui restent comme usage de Google re-captcha, anti DDOS etc

[Les GAFA auditionnés par le congrès américain](https://www.lemonde.fr/economie/article/2020/07/30/etats-unis-google-apple-facebook-et-amazon-sermonnes-par-les-politiques-americains_6047655_3234.html)   
[Apple et Epic Games - Le bras de fer de retour](https://www.clubic.com/pro/entreprises/apple/actualite-9340-fortnite-apple-retire-le-jeu-de-l-app-store-epic-porte-plainte.html) [Nineteen Eighty-Fortnite](https://youtu.be/N6B4glqJFz0)  
[Trump veut bannir TikTok des états-unis - et plus si possible - sauf ...](https://www.igen.fr/services/2020/08/ladministration-trump-songerait-bannir-tiktok-dans-le-monde-entier-116797)   


## Outils de l'épisode

[Il y a plein de site de ce genre qui permettent d’encoder / décoder du Base64, de l’URL encoded, etc, mais celui là est amusant aussi parce qu’il fait aussi un peu de crypto genre même le chiffre de Vigenère ou de César](https://kifanga.com/tools/cipher/monoalphabetic-cipher)   

## Rubrique débutant

[Bitoduc.fr : termes informatiques en français](https://bitoduc.fr/)   


## Conférences

[JUG Summer Camp le 11 septembre 2020](https://www.jugsummercamp.org/edition/11)  
[Volcamp.io les 15 et 16 octobre 2020](https://conference-hall.io/public/event/rFeIFIGPgZuNIXx2tqSb)  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

---
title: LCC 249 - Édition tu perds tes amis
author: 'Emmanuel Bernard'
layout: blog-post
episode: 249
mp3_length: 57673213
tweet: Édition tu perds tes amis #java16 #graalvm #quarkus #micronaut #licence #Elastic #BinTray #SupplyChainAttack
# tweet size: 91-93 -> 99-101 #######################################################################
---
Emmanuel Antonio et Guillaume discutent de Java 16, de GraalVM, de micronaut, de Quarkus, de licence Elastic, de BinTray qui s'en va et d'attaque de chaine de fournisseurs.
Et merci à José Paumard et Benoit Sautel pour leur crowdcast.

Enregistré le 12 février 2021

Téléchargement de l'épisode [LesCastCodeurs-Episode-249.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-249.mp3)

## News

### Langages

[Optimiser le MD5 dans la JVM](https://cl4es.github.io/2021/01/04/Investigating-MD5-Overheads.html)

* dans la tête d’une optimisation du JDK
* optimisation proposée amène des surcharges de contentions (thread local)
* donc exploration de l’alternative
* difficulté des codes intrinseques (c’est à dire quand un pattern est détecté, le code est hardcodé par platforme.
* Donc tout changement du code qui sort du pattern veut dire pas mal de taf)

[Conversion hexadecimal en Java 17](http://marxsoftware.blogspot.com/2020/12/jdk17-hex-formatting-parsing.html)

Crowdcast de José sur Java 16
et article de [Loic sur le sujet Java 16](https://www.loicmathieu.fr/wordpress/informatique/java-16-quoi-de-neuf/)

* Socket channels (Unix domain) Court circuit de la stack tcp, pas de file descriptor de mémoire
* Api vectorielle avec optimisation par plateforme
* Foreign linker api pour panama
* Et le support appel natif
* Support alpine (musl) et aarch64 pour Windows
* Record et pattern matching instanceof deviennent standard
* Illegal access passe en deny par défaut. Ça pue ;)

[Java sur Truffle dans GraalVM](https://medium.com/graalvm/java-on-truffle-going-fully-metacircular-215531e3f840)

* le GC reste sur la JVM hote qui peut etre hotspot ou SubstrateVM
* Dans le cas de SubstrateVM, ça veut dire que Java peut etre interprété dans ce mode ahead of time compiled (donc in JIT est embarqué). Pour faire tourner certains morceaux de Java “dynamique” ça peut valoir le coup
* Sinon c’est la vision de GraalVM de la VM universelle donc supporter Java “comme les autres langages” fait partie du puzzle
* Mais bon c’est dur de comprendre leur strategie

Crowdcast JavaScript GraalVM de Benoit Sautel

* [L’API Polyglot](https://www.graalvm.org/reference-manual/polyglot-programming/)
* [Appeler du Javascript depuis la JVM](https://www.graalvm.org/reference-manual/js/JavaInteroperability/)
* [Migrer depuis Nashorn](https://www.graalvm.org/reference-manual/js/NashornMigrationGuide/)
* [Démonstration et benchmark GraalJS avec Maven](https://github.com/graalvm/graal-js-jdk11-maven-demo)
* [JEP 243 Java-Level JVM Compiler Interface](https://openjdk.java.net/jeps/243)
* [Interview d’un responsable de GraalVM sur Nashorn vs GraalVM](https://jaxenter.com/graalvm-nashorn-interview-147115.html)

[JBang - comment écrire des scripts en Java](https://emmanuelbernard.com/blog/2021/01/18/jbang/)  

* pourquoi les gens écrivent des scripts dans d'autre langages que Java
* un seul fichier, pas de structure complexe y compris dans les dependances
* un demarrage juste en lançant le ficher
* crée un environnement pour l'IDE

[Element worklet, rendre JavaScript preemptif](https://jasonformat.com/element-worklet/)  

* Proposition de creation d’élément de code JavaScript qui peut tourner hors du thread principal by design.
* JS peux rendre la main mais c’est non preemptif (yield, promesses etc) et uniquement à un endroit précis
* Donc création de Element Worklet (un comme un runnable en Java) qui tourne dans un thread séparé, avec un message channel pour communiquer avec le reste
* Travaille sur un shadow dom
* par contre rien n’est détaillé sur le scheduler et la priorisation

### Librairies

[Driver JDBC Oracle sur Maven Central!](https://blogs.oracle.com/developers/new-year-goodies-oracle-jdbc-21100-on-maven-central)

* Drivers support for Virtual Threads
* Extension reactives
* GraalVM native image (mais encore des trucs a amelioerer (allow incomplete classpath)


[Micronaut 2.3](https://micronaut.io/blog/2021-01-22-2-dot-3-release.html)

* support de JMS
* résolution de la Locale
* améliorations au système d’introspection
* bannière personnalisable

[Fondation pour Grails](https://www.infoq.com/news/2021/01/oci-grails-foundation/)

* Idée des fondations était venu ensemble avec Micronaut
* Mais voulait apprendre de l’un avant de lancer l’autre
* Embrasse semver
* Le technical commutee va décider de la roadmap de ce que j’ai compris
* Intégration initiale de micronaut dans Grails 4
* Plan: TX mongo dans GORM. Groovy server pages plus modulaire, native web socket, meilleure intégration Kafka
* Plan grails 5: Groovy 3, SB 2.4, gradle 6 et Java 15

[Quarkus 1.11](https://quarkus.io/blog/quarkus-1-11-0-final-released/)

* RESTEasy Reactive
    * Annotation scanning, metamodel generation au build, base sur vert.x route
* Dev UI
    * les frameworks amènent des tâches de dev (config, list des bean CDI, database schema migration etc)
* [Massive performance without headaches](https://quarkus.io/blog/resteasy-reactive-faq/)

### Infrastructure

Les rebondissements d'Elastic vs AWS et du changement de licence

* [Clarification d'Elastic](https://www.elastic.co/blog/license-change-clarification)
    * "si vous vendez Elasticsearch directement en tant que service, vous serez impacté"
    * entre les annonces et la licence, il y a une difference
    * est-ce que tout competiteur sérieux à Elastic amènera un changement de licence?
    * est-ce que Lucene est le prochain sur la liste?
    * reflechissent à une license qui ouvre le code apres 3 à 5 ans BSL (Business Solftware License qui se transforme en ASL apres quelques années, et qui a une clause restrictive avant)
* La distribution Elastic d'Elasticsearch avait déjà un mix de ASL et de logiciels sous license proprietaire mais "source ouverte"
* AWS [forks Elasticsearch](https://aws.amazon.com/fr/blogs/opensource/stepping-up-for-a-truly-open-source-elasticsearch/)
    * Montrent les contribs ~10 sur Elasticsearch et annonce 250 contributions sur Lucene
* Les [clients Elasticsearch resteront ASL 2.0](https://twitter.com/jponge/status/1353721544997040131?s=21)
    * mais pas le client Java haut niveau qui a des dependence’s sur les classes serveur. Un nouveau client devrait arriver.
* [Retour de l'ex CTO de Chef et sa position "pro" AWS et contre Elastic](https://medium.com/sustainable-free-and-open-source-communities/free-software-is-the-only-winner-in-elastic-nv-vs-aws-9416f2a0a7f5)
    * contre point de la position des gens du Message a caractere informatif
    * 4 valeurs de l'OSS: 
        * The freedom to run the program as you wish, for any purpose
        * The freedom to study how the program works, and change it so it does your computing as you wish
        * The freedom to redistribute copies so you can help others
        * The freedom to distribute copies of your modified versions to others
        * at its heart, Open Source and Free Software are about the freedom to make the system work the way you wish
    * au dessus est la communaute et le benefce de distribution qui fait un plus group morceau de clients potentiels
    * Shay B -  By putting the core of Elasticsearch into the open, we can presume he wanted the business value benefits of Open Source — collaboration in the commons, low friction acquisition for users, and hopefully the growth of an ecosystem around it. He got it 
    * tight open core - direct, and often critical, features are only available under a proprietary license
    * co-mingle the source code for these features in the primary Elasticsearch repository
    *  Elastic NV creates a world where it is very, very difficult to collaborate only on the open source pieces. 
    * to whom does Elasticsearch belong? The community, or Elastic NV?
    * Elasticsearch [...] exists primarily to fuel the commercial ambitions of Elastic NV
    * I, as a contributor, want to change the course of Elasticsearch in ways that benefit me (and perhaps others), but does so at the expense of Elastic NV, will I get that opportunity? The answer is most likely no — you will not.
    * That truth is ultimately corrosive to sustainable communities.
    * This is the deepest, most fundamental truth about Open Source and Free Software in action. That you, as a user, have rights. That those rights are not contingent on the ability of someone else to capture value.
    * Companies who decide to build their business on Open Source cores need to get much more aggressive about their trademark policies. It should be clear and unambiguous that your trademark cannot be used for another product without your permission. If I may go further, I would make it clear that nobody but your company can create a distribution with your trademark on it at all, without your permission.

[Docker donne Docker Distribution à la CNCF](https://www.docker.com/blog/donating-docker-distribution-to-the-cncf/)  

* code déjà ouvert et utilisé par certains mais avait forké
* c'est le coeur de DockerHub et est une container registry
* objectif extensibilité pour les usages particuliers des uns et des autres (systeme de stockage etc)

### Web

[Angular CLI 11.1](https://blog.ninja-squad.com/2021/01/21/angular-cli-11.1/)  

* Support TypeScript 4.1
* nouveau plugin webpack pour le compilateur Ivy (pas d'effet visible attendu)
* scelection des CSS critiques pour un chargement initial et inlining => opt-in pour l'instant
* EcmaScript 5 polyfill a été enrichi

### Outillage

[JFrog annouce que BinTray c'est fini](https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/)

* aussi jcenter, gocenter, chartcenter etc
* fin des push 31 mars et fermeture de l'API REST et l'interface le 1er mai
* l'url jcenter continue encore un an
* si les projets utilisaient la synchro sur central, les pachkages seront là
* sinon il va falloir copier
* et les scripts font devoir evoluer
* questions sur la scalabiluté de MAven Central
* [Brian Fox de Sonatype](https://twitter.com/Brian_Fox/status/1357414525377642496) nous dit que tout va bien se passer
* [Le blog officiel de Sonatype](https://blog.sonatype.com/dear-bintray-and-jcenter-users-heres-what-you-need-to-know-about-the-central-repository).

[Attaque de suply chain par squattage de nom privés](https://medium.com/@alex.birsan/dependency-confusion-4a5d60fec610)

* chercher le nom de dépendances privées d'organisations
* publier une version "supérieure" sous le meme nom dans un repo public
* profit !

[Déployer sur Maven Central avec une action GitHub](https://bjansen.github.io/java/2021/02/03/deploying-to-maven-central-using-github-actions.html)

* Le Java action workflow fait plus que preparer Java
* avec clef GPG et tout

[JHipster Quarkus 1.0.0](https://github.com/jhipster/generator-jhipster-quarkus) contribué par Daniel Petisme et Anthony Viard

* JHipster Quarkus est un "blueprint" JHipster qui permet de surcharger la mécanique de génération pour obtenir un backend qui s'appuye sur Quarkus plutôt que Spring. Cela permet de généré rapidement une application fullstack (front + back).
* contenu [Twitch d'antony](https://www.twitch.tv/avdev4j)

[Homebrew 3.0.0 est sorti](https://brew.sh/2021/02/05/homebrew-3.0.0/)

* support officiel de Apple M1 avec des bottles native. Pas tous les binaires installable ne supportent M1

### Sécurité

[Dépassement de pile dans sudo](https://blog.qualys.com/vulnerabilities-research/2021/01/26/cve-2021-3156-heap-based-buffer-overflow-in-sudo-baron-samedit)

* introduit en juillet 2011

### Loi, société et organisation

[Jeff Bezos ne sera plus CEO d'Amazon (juste président du directoire)](https://www.journaldugeek.com/2021/02/03/amazon-jeff-bezos-quitte-son-poste-de-directeur-general/)  
[Sacha Labourey aussi quitte le poste de CEO de CloudBees pour devenir Chief Strategy Officer](https://finance.yahoo.com/news/cloudbees-names-stephen-dewitt-ceo-140000459.html)

* passer de 100 a 250 M
* IPO
* [Le blog de Sacha](https://www.cloudbees.com/blog/sacha-labourey-the-next-phase-cloudbees)

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

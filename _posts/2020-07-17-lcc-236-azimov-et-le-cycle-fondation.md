---
title: LCC 236 - Azimov et le cycle fondation
author: 'Emmanuel Bernard'
layout: blog-post
episode: 236
mp3_length: 56458038
tweet: Azimov et le cycle fondation #adoptopenjdk #micronaut #istio
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Vincent, Antonio et Guillaume discutent du décès de l'architecte de Java EE, d'AdoptOpenJDK, de Micronaut, de Istio qui bougent dans des fondations, du papa de Micronaut qui va chez Oracle et bien d'autres sujets encore.

Enregistré le 10 juillet 2020

Téléchargement de l'épisode [LesCastCodeurs-Episode-236.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-236.mp3)

## News

[Bill Shannon](https://twitter.com/sharat_chander/status/1276675743716540417?s=21) l’architecte de Java EE est mort. Il a été le gardien de Java EE aussi longtemps que j’ai connu l’api. Tu aimes ou pas mais tous les backends Java utilisent une ou plusieurs APIs de Java EE et la compatibilité et cohérence de la plateforme lui doit beaucoup. Triste.

### Langages

[Classes Sealed](https://www.infoq.com/articles/java-sealed-classes)

* Les classes sealed arrivent dans Java 15 en septembre, ce sont des classes ou interfaces qui restreignent qui peut les étendre ou implémenter.
* Un peu comme les enum les classes sealed représentent un nombre limité de valeurs possibles, ce qui permet de coder en terme d’exhaustivité (si c’est pas A ou B, alors c’est C, parce qu’il n’y a pas d’autres alternatives).
* Avec ça, on peut faire des types sommes et produits, des structures de données algébriques, comme dans les langages fonctionnels.
* Le développeur qui les utilise est donc en contrôle de la hiérarchie de ces interfaces, et contrôler les implémentations autorisées.
* Les classes sealed fonctionnent avec les records et le pattern matching.

[AdoptOpenJDK rejoint la fondation Eclipse](https://blog.adoptopenjdk.net/2020/06/adoptopenjdk-to-join-the-eclipse-foundation)

* Avec son adoption massive depuis 2017, le projet devient trop gros pour rester sous la gouvernance du LJC
* La migration sous la fondation eclipse permets de conserver la position de neutralité
* Le projet est renommé Eclipse Adoptium
* La structure de gouvernance est séparée en 2 : le Project Management Committee pour les décisions techniques et le Working Group pour les questions financières, légales, marketing etc…

[Histoire du langage Groovy](https://dl.acm.org/doi/pdf/10.1145/3386326)

* Les opérateurs que Groovy a amené aux languages modernes This includes Groovy’s dangling closure,Groovy builders, null-safe navigation, the Elvis operator, ranges, the spaceship operator, and flow typing. For most languages, we don’t know to what extent Groovy played a part in their choices
* Les choix fort dynamiques
* Le passage par la JSR

[Mandrel GraalVM](https://www.infoq.com/news/2020/07/mandrel-graalvm): une nouvelle distribution OpenJDK de RedHat spécifique pour GraalVM, ce qui montre l'implication de RedHat sur GraalVM et l'ouverture d'Oracle sur des collaborations sur ce projet.

On entend parler souvent du [livre Clean Code de Uncle Bob Martin](https://qntm.org/clean), c’est souvent une référence dans les livres d'informatique à lire. Cet article critique ce livre, pour son inconsistance, ses conseils que l’auteur n’applique même pas dans ses propres exemples de code.

Il parait que les [tests unitaires c'est surfait](https://tyrrrz.me/blog/unit-testing-is-overrated).

### Runtime

[Micronaut 2.0 est sorti](https://micronaut.io/blog/2020-06-26-announcing-micronaut-20.html)

* Micronaut Launch : permet de générer des apps Micronaut en configurant modules optionnels, langage, outil de build
* JDK 14 et Groovy 3 supportés
* Améliorations de performance de 20 %
* Support des plateformes serverless : Google Cloud Functions, Microsoft Azure Functions, Amazon Lambda
* Nouveau plugin Maven
* Possibilité de faire tourner ses applis Micronaut dans un conteneur de Servlet
* Meilleur support de GraalVM, avec automatisation de la configuration de ressources statiques, de la configuration de drivers JDBC, d’Hibernate, de Flyway
* Utilisation de Gradle 6.5 qui permet de faire de la compilation incrémentale, même avec les annotation processors
* Support HTTP/2

[Object Computing (OCI) crée une fondation pour héberger Micronaut](https://objectcomputing.com/news/2020/06/29/micronaut-foundation-established). La société garde une place majoritaire mais inclue des technical advisory boards dont des membres de ThoughtWorks, mais aussi... notre Guillaume Laforge.

[Graeme rocher rejoins Oracle](https://twitter.com/helidon_project/status/1278753593458331648?s=21)

[Quarkus 1.6](https://quarkus.io/blog/quarkus-1-6-0-final-released)

* Support des archives AppCDS pour améliorer le démarrage en mode JVM
* Support de Google Cloud Functions (en plus deLambda Azure)
* Client IBM DB2 réactif
* Client Apache Cassandra
* Support de WebJars Locator
* Support de l'annotation Spring @Scheduled
* Amélioration d'outils pour le débuggage des applications
* Upgrade à GraalVM 20.1.0

CrowdCast fast Jar Quarkus par Emmanuel

### Cloud

[AWS going after nexus/artifactory](https://aws.amazon.com/codeartifact). Nouveau concurrent / nouvel entrant

[Nouvelle entité open source annoncée par Google](https://opensource.googleblog.com/2020/07/announcing-new-kind-of-open-source.html) : Open Usage Commons, pour gérer les marques et logos open source

[Open Usage Commons](https://openusage.org/news/introducing-the-open-usage-commons/)  qui accueille les marques de Angular, Gerrit et Istio

[Le projet Istio annonce que les trademarks du projet sont transférées dans l’organisation Open Usage Commons](https://istio.io/latest/blog/2020/open-usage/)

[Mais IBM qui avait travaillé avec Google au lancement d’Istio et contribué depuis n’est pas très content](https://developer.ibm.com/blogs/istio-google-open-usage-commons/). IBM aurait préféré une gouvernance encore plus ouverte que cela

### Web

[Bootstrap 5 Alpha](https://blog.getbootstrap.com/2020/06/16/bootstrap-5-alpha)

* Bootstrap no longer depends on jQuery
* Dropped support for Internet Explorer
* CSS custom properties
* Alpha: breaking changes will continue to occur until our first beta
* Better documentation

### Data

[Oracle annonce une version Community Edition de Coherence](https://blogs.oracle.com/oraclecoherence/announcing-coherence-community-edition) (in-memory data grid) open source, sous licence Universal Permissive License (supporté par l’OSI). Une version Enterprise continuera d’être proposée également.

### Outillage

[Plugin Maven Asciidoc 2.0](https://twitter.com/abelsromero/status/1274421896445132802)

* Support de AsciidoctorJ 2.x
* Alignement avec le plugin Gradle plugin et Antora
* Première version introduisant des changements cassants (arrêt du support de Java 7, et le nouveau backend par défaut est HTML 5 au lieu de DocBook)

[Une proposition de spécification du langage AsciiDoc](https://projects.eclipse.org/proposals/asciidoc-language) a été soumise par l’équipe AsciiDoctor à la fondation Eclipse

## Conférences

[JNation virtual conf pour 2020](https://twitter.com/JNationConf/status/1273755895516839937)

JNation est une conférence communautaire qui a lieu annuellement au Portugal. Suite au Covid ils ont décidé de ne pas annuler... mais de faire du remote (virtual conf). Ils viennent de mettre en ligne les 45 vidéos.

BDX.io annulée

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

---
title: LCC 174 - Interview sur la build avec Cédric Champeau et Arnaud Héritier - partie 1
author: 'Emmanuel Bernard'
layout: blog-post
episode: 174
mgp3_length: 85017000
tweet: Build, Maven et Gradle - @cedricchampeau et @aheritier sur le ring
---
Guillaume, Cédric et Arnaud se retrouvent autour du micro pour parler pendant une session marathon de 3h30 du build, de Maven et de Gradle.
A première partie pose les bases: introduction, java 9, performance, gestion de dépendances, cycle de vie

Enregistré le 18 juillet 2017

Téléchargement de l'épisode [LesCastCodeurs-Episode-174.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-174.mp3)

## Interview

### Ta vie ton œuvre

[Cédric Champeau](https://twitter.com/cedricchampeau)  
[Gradle Inc.](https://gradle.com/enterprise)  
[Arnaud Héritier](https://twitter.com/aheritier)  
[Cloudbees](https://www.cloudbees.com)  

### Liens généraux

[Gradle](https://www.gradle.org)  
[Gradle Enterprise](https://gradle.com/enterprise)  
[Maven](http://maven.apache.org)  

Guide modules Java 9 :

* [Maven et Java 9](http://s.apache.org/maven-j9)  
* [Gradle et Java 9](https://guides.gradle.org/building-java-9-modules/)

#### Liens Gradle

[Maven vs Gradle (features)](https://gradle.org/maven-vs-gradle/)  
[Maven vs Gradle (performance)](https://gradle.org/gradle-vs-maven-performance/)  
[Migrer vers Gradle](https://guides.gradle.org/migrating-from-maven/)  
[Nebula plugins (Netflix)](https://nebula-plugins.github.io/)  
[Plugin Go (gogradle)](https://github.com/gogradle/gogradle)  
[Spring Dependency Management](https://plugins.gradle.org/plugin/io.spring.dependency-management)  
[Builds composites](https://docs.gradle.org/current/userguide/composite_builds.html)  
[Build Cache](https://blog.gradle.org/introducing-gradle-build-cache)  

### Définition et histoires

[Ant](http://ant.apache.org)  

Pour s’échauffer, bon alors, c’est qui le plus fort Gradle ou Maven ?  
Est-ce que Gradle et Maven ont de la couleur dans la console ?  
Gradle / Maven: un pitch de 30 secs max pour chacun pour me faire faire mon choix  

### Support de Java 9

Gradle / Maven: Quand est-ce qu'ils vont supporter Java 9? Et la compilation multi-modules:

* [Maven](https://cwiki.apache.org/confluence/display/MAVEN/Java+9+-+Jigsaw)  
* [Gradle](https://guides.gradle.org/building-java-9-modules/)  

Gradle / Maven: Avez-vous eu de l'aide d'Oracle pour faire marcher Java 9?  
Gradle / Maven: Qu'est-ce que n'est pas prêt pour Java 9?  

### La performance

C’est quoi le build cache de Gradle ? C’est gratuit ou c’est que dans la version payante ?  
Parle nous un peu plus de Gradle Enterprise, il y a quoi dedans ?  
[Gradle Entreprise](https://gradle.com/enterprise)  

### J’ai fumé la moquette

> Quid de l'intégration avec jshell : je veux écrire mon script de build en Java pas en Groovy (désolé) ou en Kotlin (désolé), et surtout que cela soit un fucking REPL (Rémi Forax)

## La totale depuis la ML

### Les projets

Maven, le projet  
Maven: Pour Maven, qui tient les rênes du projet ?  
Maven: La dernière version de Maven est récente, avec quelque bugfix (il semble...) La précédente version date de fin 2015 : Maven meurt il à petit feu ?  
Maven: Qu'est-ce qui fait que Maven n'évolue que très très très peu ? En particulier en terme de performance. Il est mort le projet ou quoi ?  
Maven: Qui paye le hosting de Maven Central ?  

Gradle, le projet, Gradle.inc, l’entreprise  
Gradle: Gradle Inc propose des guides, des outils pour entreprise : Gradle veut devenir l'outil de build de référence en entreprise ?  
Gradle: Groovy va rester le langage principale des scripts Gradle (et Kotlin une alternative) ? Va cohabiter avec Kotlin ? va se voir remplacer par Kotlin ?  
Gradle: Les dernières versions de Gradle se focalisent beaucoup sur les performances de build. Vers quoi l'outil va s'orienter par la suite ?  
Gradle: Gradle peut builder des projets en C, des projets Java, Android.... Il y aura un focus sur un écosystème en particulier ou Gradle va continuer à essayer de tout builder, quitte à se disperser ?  
Gradle: Quelle est la proportion de projet utilisant Gradle pour construire des projets autres que des projets Java/Android ?  
Gradle: Gradle est indirectement poussé par Google car utilisé pour construire les applications Android. Gradle est également utilisé par Linkedin. Comment ces acteurs influent sur Gradle en terme de fonctionnalité ?  

### Et les autres (outils de builds)

Gradle / Maven: Ou en sont les autres, les javascripteurs ? sont-ils toujours à réinventer x fois la roue ? Ou ont-ils des outils dont Gradle et Maven pourrait s'inspirer ?  
Gradle / Maven: Qu'est-ce qui a bien pu pousser les javascripteurs à se dire qu'ils pourraient faire un outil intelligent quand ils semblent dépourvus du moindre bon sens ?  
Gradle / Maven: Il serait aussi sympa de comparer ces outils a ce qui se fait dans d'autres silos techniques (genre JS avec npm ou autre, C# avec dotnet et NuGet...), voir ce qui est mieux ou moins bien ailleurs.  
Gradle / Maven: Comment faire du build polyglotte, par exemple avec un mixe de Scala, Kotlin, Groovy, Java, et des sous projets Web (angular cli, webpack, gulp, ...) ?  
Gradle / Maven: Pourquoi les outils de build apparaissent aussi facilement que les champignons en automne ?  
Gradle / Maven: Qu'est-ce qui a fait le succès de maven et gradle ? (aussi bien techniquement que d'un point de vue marketing)  

### La gestion des dépendances

Gradle / Maven: une question plus fondamentale sur gestion de deps vs build : à un moment, dans le monde JS, il y avait une séparation assez nette entre gestion de dépendance (avec Bower ou npm je crois) et un outil de build/packaging (genre Gulp il me semble) et des fichiers de conf distincts; maintenant il semble que la mode n'ait pas pris et que npm règne en maitre et mélange les 2 sujets dans une meme conf. Est-ce que les experts de build Java pourraient partager leur avis sur la question: pourquoi on mélange gestion de dépendances et gestion de build ? Est-ce que c'est vraiment un choix de design ou juste que c'est pragmatiquement suffisant et plus efficace?  
Gradle / Maven: comment les outils de build permettent de gérer les dépendances non-Java ? Tant qu'on reste dans du Java, c'est simple, mais dés que l'on sort un peu de là ça se complique (nous on a du natif Windows/Linux, j'imagine que pour les devs Android c'est encore plus compliqué).
Peut t'il y avoir des interactions avec des repository non Maven-compliant ? On entend beaucoup parler de Conan pour les artefacts C/C++ ces temps-ci... Que permet Gradle sur le sujet ?
Pouvez-vous nous briefer sur le monde Android qui doit avoir ces problématiques ?  

### Le cycle de vie de l’application

Gradle / Maven: Sujet qui pourrait être intéressant à débattre : comment est-ce que les deux outils abordent la livraison "en production" ? Où est-ce qu'ils s'arrêtent dans leur philosophie (on peut assez facilement imaginer un DSL gradle par exemple pour gérer les déploiements) ?  
En particulier, quid des environnements où les plateformes de production n'ont pas accès à internet (et donc pas accès aux dépôts officiels et pas de miroir disponible/accessible, j'ai vu ça chez les opérateurs télécom). La solution mise en place ici, c'est livraison sous forme d'iso/de cd sur lesquels il y a toutes les dépendances, et cette iso est montée comme un repo à partir duquel on installe la solution.  
Et à partir de là, viennent d'autres problèmes d'ordre juridiques : comment est pensée la gestion des licences, en particulier en ce qui concerne les dépendances transitives ?  
Gradle / Maven: Un peu lié : quelles différences dans les deux outils pour la construction d'applis orientées serveur vs. appli orientées client ?

## Nous contacter

[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <https://lescastcodeurs.com/>  
En savoir plus sur le sponsoring? sponsors@lescastcodeurs.com

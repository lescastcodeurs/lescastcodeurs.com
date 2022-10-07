---
title: LCC 191 - La quête du GraalVM
author: 'Emmanuel Bernard'
layout: blog-post
episode: 191
mp3_length: 67969692
tweet: La quête du #GraalVM #LTS #MSDOS #gVisor #GitHub #Microframework
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Guillaume et Emmanuel discutent GraalVM, Java LTS, MS-DOS, gVisor, GitHub et microframeworks.

Enregistré le 14 juin 2018

Téléchargement de l'épisode [LesCastCodeurs-Episode-191.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-191.mp3)

## News

### Correction

Article de performance SpringBoot classique vs réactif

> L'article "SpringBoot 2 performance — servlet stack vs WebFlux reactive stack" est à prendre avec de grosses pincettes.
> Le client HTTP utilisé pour la version servlet est celui par défaut Java à base d'URLConnection. Pas de reused de la connection....
> A 2500 users sur un benchmark IO bound avec un tel ratio wait/processing, il ne devrait pas avoir une telle différence de throughput.
>
> - Nicolas Labro

### Langages

[GraalVM](http://www.graalvm.org)  
[Les limitations de SubstrateVM](https://github.com/oracle/graal/blob/master/substratevm/LIMITATIONS.md)  
[Retour d’impression sur GraalVM](https://blog.frankel.ch/first-impressions-graalvm/)  
[GraalVM avec Play Framework](https://blog.playframework.com/play-on-graal/amp/?__twitter_impression=true)  

[Java 11 more than just features](https://blog.takipi.com/java-11-will-include-more-than-just-features/)  
[Replacing reflection with invokedynamic](https://cguntur.me/2018/06/10/java-method-handles-reflection-ng/)  

### Librairies

[The rise of Microframeworks](https://www.e4developer.com/2018/06/02/the-rise-of-java-microframeworks/)  
[The state of Java/Kotlin Microframeworks in 2018](https://medium.com/@iliasyahia/the-state-of-java-kotlin-microframeworks-in-2018-54768edb7908)  

[L'équipe de Grails a sorti un nouveau micro-framework, Micronaut](http://micronaut.io/), basé sur Netty et sans Spring, pour plus de légèreté  
[Un workshop sur Micronaut](https://alvarosanchez.github.io/micronaut-workshop/) pour démarrer avec Micronaut  

[Est-ce qu'on a toujours besoin de Spock avec l'arrivée de JUnit 5 ?](https://speakerdeck.com/szpak/is-spock-still-needed-in-the-time-of-junit-5?slide=31) TL;DR : oui :-)  

### Middleware

[JakartaEE is officially out](https://developers.redhat.com/blog/2018/04/24/jakarta-ee-is-officially-out/)  
[Barre de progression de la contribution Oracle à Jakarta EE](https://www.eclipse.org/ee4j/status.php)  
[The state of Spring Java in 2018](http://www.baeldung.com/java-in-2018)  
[Camel et Bean Validation](https://cleverbuilder.com/articles/camel-bean-validation/)

* débat Camel est l’option « no code »

### Infrastructure

[MS-DOS expliqué !](https://www.xtof.info/blog/?p=985)  

[gVisor](https://cloudplatform.googleblog.com/2018/05/Open-sourcing-gVisor-a-sandboxed-container-runtime.html)  
[Product Manager de Google expliquant que gVisor est utilisé par App Engine et Cloud Functions](https://twitter.com/teich/status/1006611801331544065)  

[Lancement de Skaffold pour automatiser le développement sur Kubernetes](http://cloudplatform.googleblog.com/2018/03/introducing-Skaffold-Easy-and-repeatable-Kubernetes-development.html)  
[Skaffold sur Github](https://github.com/GoogleCloudPlatform/skaffold)  
[Skaffold and Kaniko: Bringing Kubernetes to Developers](https://medium.com/google-cloud/skaffold-and-kaniko-bringing-kubernetes-to-developers-a43914777af9)  

### Cloud

[Node 8 sur App Engine](https://cloudplatform.googleblog.com/2018/06/Now-you-can-deploy-your-Node-js-app-to-App-Engine-standard-environment.html)  

### Web

[Angular 6](https://blog.angular.io/version-6-of-angular-now-available-cc56b0efa7a4)  

* [What's new in Angular6](https://blog.ninja-squad.com/2018/05/04/what-is-new-angular-6/)  
* [What's new in Angular CLI 6.0](https://blog.ninja-squad.com/2018/05/04/angular-cli-6.0/)  

[Les regrets de Ryan Dahl sur Node.JS](https://www.youtube.com/watch?v=M3BM9TB-8yA) (et lancement de son nouveau framework Deno)  
[Article sur ses regrets](https://medium.com/@imior/10-things-i-regret-about-node-js-ryan-dahl-2ba71ff6b4dc)  

[On peut faire mieux que console.log()](https://medium.freecodecamp.org/how-you-can-improve-your-workflow-using-the-javascript-console-bdd7823a9472)  

### Outillage

[GitHub se fait gober par Microsoft](https://www.linuxfoundation.org/blog/microsoft-buys-github-the-linux-foundations-reaction/)  
[L’équipe Java Mission Control virée par Oracle](https://www.infoq.com/news/2018/06/open-source-jmc)  
[Gradle 4.8](https://docs.gradle.org/4.8/release-notes.html)  

### Méthodologies

[Hiérarchie et documentation](http://web.archive.org/web/20070205200717/http://blogs.sun.com/MartinHardee/date/20040624)  
[Comment un agent public peut contribuer à l’Open Source](https://disic.github.io/politique-de-contribution-open-source/)  

### Sécurité

[Custom domains on GitHub Pages gain support for HTTPS](https://blog.github.com/2018-05-01-github-pages-custom-domains-https/)  
[Vulnérabilité dans Git amenant à une exécution à distance](https://blogs.msdn.microsoft.com/devops/2018/05/29/announcing-the-may-2018-git-security-vulnerability/)  

## Outils de l’épisode

Byteman et injection de faute  
[GitIgnore.io](https://www.gitignore.io/)  

[Outil de crowdcasting de Pierre Carion](https://usercast.listeningfrog.com/u/lescastcodeurs)  

## Rubrique débutant

Crowdcast de Pierre Carion  
Pour un débutant qu'est-ce :

* les forces de Java ou de la JVM
* qui rend Java encore attractif
* bon choix pour commencer un projet en 2018

## Conférences

[EclipseCon les 13 et 14 juin 2018](https://www.eclipsecon.org/france2018/)  
[JHipster Conf le 21 juin](https://jhipster-conf.github.io)  
[DevFest Lille le 21 juin 2018](https://devfest.gdglille.org/)  
[Voxxed Luxembourg le 22 juin 2018](https://voxxeddays.com/luxembourg/)  
[Sunny Tech les 28 et 29 juin 2018](https://sunny-tech.io/)  
[Jenkins User Conference le 28 juin 2018](https://juc-paris.jfrog.com/)  
[Jug Summer Camp le 14 septembre 2018](http://www.jugsummercamp.org/edition/9) - Le [CfP](http://www.jugsummercamp.org/edition/9/cfp/new) est ouvert.    
[Paris Web les 4, 5 et 6 octobre 2018](https://www.paris-web.fr/)  
[DevFest Nantes les 18 et 19 octobre 2018](https://devfest.gdgnantes.com/) - Le [CfP](https://cfp.gdgnantes.com/public/event/inzOQDR94h4bAaOVd7Db) est ouvert.  
[Jenkins World Europe du 22 au 25 octobre 2018 à Nice](https://www.cloudbees.com/jenkinsworld/home) - (utilisez le code JWAHERITIER pour obtenir 20 % de réduction).  
[VoxxedDays Microservices du 29 au 31 octobre 2018](https://voxxeddays.com/microservices/)  
[DevFest Toulouse le 8 novembre 2018](https://devfesttoulouse.fr/)  
[Codeurs en Seine le 22 novembre 2018](http://www.codeursenseine.com/2018/)  

## Nous contacter

[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  

---
title: LCC 212 - Echange gateaux contre jetons
author: 'Emmanuel Bernard'
layout: blog-post
episode: 212
mp3_length: 53861500
tweet: Echange gateaux contre jetons #java12 #jakartaee #spring #quarkus #jwt #http #microservices #datacenter
# tweet size: 91-93 -> 99-101 #######################################################################
---
Guillaume, Vincent et Emmanuel discutent des nouvelles autour de Java 12, Jakarta EE, Spring, Quarkus, la mairie de Paris et son data center.
Mais aussi de web, de Huawei, du design des fichiers Dockerfile et bien d'autres choses encore.

Enregistré le 4 juin 2019

Téléchargement de l'épisode [LesCastCodeurs-Episode-212.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-212.mp3)

## News

### Langages

[JVM Ecosystem Survey 2019](https://snyk.io/blog/jvm-ecosystem-survey-2019/)  
[Java 12 switch expressions](https://www.infoq.com/articles/java-12-switch-expression/)  
[Images officielles AdoptOpenJDK sur Docker Hub](https://twitter.com/dinogun/status/1132108090189312000)  
[Don't fear the Java](https://www.azul.com/dont-fear-the-java/)  

### Librairies

[Jakarta EE and the great naming debate](https://openliberty.io/blog/2019/05/08/jakarta-ee-naming.html)  
[Spring Boot 2.2 M3 available now](https://spring.io/blog/2019/05/15/spring-boot-2-2-m3-available-now)  
[Utiliser les co-routines Kotlin pour utiliser Spring Reactive](https://spring.io/blog/2019/04/12/going-reactive-with-spring-coroutines-and-kotlin-flow#webflux-with-coroutines-api-in-kotlin)  

* structured concurrency
* trade-off entre approche visuellement imperative et l'approche réactive

[GraalVM 19.0](https://medium.com/graalvm/announcing-graalvm-19-4590cf354df8)  
[Eclipse Vert.x 3.7.1](https://vertx.io/blog/eclipse-vert-x-3-7-1/)  
[The JHipster Quarkus demo app](https://www.linkedin.com/pulse/jhipster-quarkus-demo-app-stephan-janssen/)  

[Quarkus 0.16.0](https://github.com/quarkusio/quarkus/releases/tag/0.16.0)  

* emails blocking et non-blocking
* Configuration profiles
* CORS
* Camel AWS SQS
* Reactive PostgreSQL client

[Introduction à JSON Web Tokens](https://vuejsdevelopers.com/2019/04/15/api-security-jwt-json-web-tokens/)  
[Autre article sur JWT](https://robmclarty.com/blog/what-is-a-json-web-token)  
 
### Infrastructure

[Fusion OpenTracing / OpenCensus -> OpenTelemetry: quid de Jaeger](https://medium.com/jaegertracing/jaeger-and-opentelemetry-1846f701d9f2)  
[On devrait éviter les Dockerfiles d'exemple qu'on voit un peu partout](https://pythonspeed.com/articles/dockerizing-python-is-hard/)  
[DigitalOcean ferme l'infra d'une boite via un script de verification](https://twitter.com/w3Nicolas/status/1134529316904153089)  

* les risques évoluent de gérer sa stack physique à gérer un prestataire et ses consequences de l'automatisation
* pas de backup hors du prestataire...

### Cloud

[gVisor, un an après](https://opensource.googleblog.com/2019/05/gvisor-one-year-later.html)  

### Web

[Flutter 1.5](https://medium.com/flutter/announcing-flutter-1-5-d203c6072e5c)  
[Build your Angular application with Bazel](https://blog.ninja-squad.com/2019/05/14/build-your-angular-application-with-bazel/)  
[Build your own WebAssembly Compiler](https://blog.scottlogic.com/2019/05/17/webassembly-compiler.html)  
[W3C / WHATWG fusionnent](https://www.theregister.co.uk/2019/05/29/w3c_whatwg_working_on_one_html_dom_spec/)  
[HTTP HEADERS du développeur responsable](https://www.twilio.com/blog/a-http-headers-for-the-responsible-developer)  

* HSTS
* Content-Security-Policy (upgrade insecure requests etc)
* cache control, accept encoding (compression)
* Accept and Accept CH
    * ramener un webp quand in .jpg est demandé
    * CH : tailles etc


[Gluon réutilise GraalVM pour faire des applis mobiles native](https://gluonhq.com/a-boost-for-java-on-the-client/)  

* mentionne [jpackage](https://jdk.java.net/jpackage/)

### Data

[Elastic rend des fonctionnalités de sécurité gratuites mais pas open source](https://www.elastic.co/fr/blog/security-for-elasticsearch-is-now-free?blade=tw&hulk=social)  
Changer le schéma de base de données automatiquement [à SendGrid](https://sendgrid.com/blog/schema-management-with-skeema/) et à [Square](https://github.com/square/shift)  

### Outillage

[FreeCodeCamp quitte Medium](https://www.reddit.com/r/FreeCodeCamp/comments/bvaf9i/freecodecamp_is_leaving_medium/)  

* Medium pousse pour un paywall
* les gens redécouvrent que les blogs sont distribués par nature
* RSS FTW

### Architecture

[Pourquoi les microservices devraient vous faire plus peur](https://medium.com/@bghuston/why-microservices-should-scare-you-more-556ab8f3fdb2)  

### Méthodologies

[GitHub sort GitHub Sponsors](https://help.github.com/en/articles/about-github-sponsors)  

* sponsoriser un developer open source

[Product placement sur Wikipedia](https://wikimediafoundation.org/2019/05/29/lets-talk-about-the-north-face-defacing-wikipedia/)  

* [Les excuses de North Face](https://www.highsnobiety.com/p/north-face-wikipedia-marketing-stunt/)

### Loi, société et organisation

[Google révoque la licence Android de Huawei : 5 questions pour comprendre ce que cela implique](https://www.numerama.com/tech/514499-google-revoque-la-licence-android-de-huawei-5-questions-pour-comprendre-ce-que-cela-implique.html)  

* en suspension pour [3 mois](https://www.businessinsider.fr/us/google-puts-huawei-android-suspension-on-hold-2019-5)  

[Les développeurs chinois ont peur de perdre GitHub](https://siecledigital.fr/2019/05/29/les-developpeurs-chinois-craignent-de-perdre-lacces-a-github/
)  
[La mairie de Paris vs créer son propre data center](https://www.lebigdata.fr/paris-data-center)

* Beaucoup de gens outrés qu'ils ne prennent pas OVH (sécurité, c'est un métier, etc)
* [Pourquoi c'est pas si con](https://twitter.com/btreguier/status/1134576376101658624)  
    * durée de vie des données sur plus d'une vie humaine
    * marché public de ~ 5 ans max : bouger les données tous les 5 ans bonjour

## Conférences

[BestOfWeb les 6 et 7 juin 2019](http://bestofweb.paris/)  
[DevFest Lille le 14 juin 2019](https://devfest.gdglille.org/)  
[Hack Commit Push](https://hack-commit-pu.sh/) 15 juin pour contribuer à de l'open source  

* presentation des projets au ParisJUG le 13 juin

[Voxxed Days Luxembourg les 20 et 21 juin 2019 ](https://voxxeddays.com/luxembourg/)  
[Sunny Tech les 27 & 28 juin 2019](https://sunny-tech.io/)  
[JugSummerCamp le 13 septembre 2019](http://www.jugsummercamp.org/edition/10) - Le [CfP](https://conference-hall.io/public/event/iv4n41NXE01cFHgjyiIp) est ouvert.  
[DevFest Toulouse le 3 octobre 2019](https://devfesttoulouse.fr/) - Le [CfP](https://conference-hall.io/public/event/HJRThubF4uYPkb7jSUxi) est ouvert.   
[DevFest Nantes les 21 et 22 octobre 2019](https://devfest.gdgnantes.com/) - Le [CfP](https://conference-hall.io/public/event/o2j0dYZDa0W1Ils3kO0z) est ouvert.  
[Voxxed Microservices 21 au 23 octobre 2019](https://voxxeddays.com/microservices/) et le [CfP est ouvert](https://vxdms2019.cfp.dev/#/login).  
[ScalaIO](https://scala.io/) du 29 au 31 octobre a Lyon. CFP ouvert jusqu'à fin juin. Thème programmation fonctionnelle.  
[Devoxx Belgique du 4 au 8 novembre 2019](https://devoxx.be/)  
[Bdx.io le 15 novembre 2019](https://www.bdx.io/#/home) - Le [CfP](https://conference-hall.io/public/event/XGTzWawB3ZwLR7u462O8) est ouvert.    
[DevOps D-Day les 13 et 14 novembre 2019](http://2019.devops-dday.com/) - Le [CfP](http://2019.devops-dday.com/index.html) est ouvert.  
[Codeurs en Seine le 21 novembre 2019](https://www.codeursenseine.com/2019/)  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

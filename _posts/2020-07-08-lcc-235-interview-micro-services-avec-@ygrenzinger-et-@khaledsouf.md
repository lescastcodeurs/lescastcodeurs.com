---
title: LCC 235 - Interview Micro Services avec @ygrenzinger et @khaledsouf
author: 'Emmanuel Bernard'
layout: blog-post
episode: 235
mp3_length: 85017000
tweet: Interview Micro Services avec @ygrenzinger et @khaledsouf
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Audrey et Antonio ont invité Yannick Grenzinger et Kahled Souf pour parler microservices : pour quelle équipe, quel projet, avec quels outils ... ? Nos invités vous partagent leurs retours d'expérience et leurs conseils.

Enregistré le 3 juillet 2020  

Téléchargement de l'épisode [LesCastCodeurs-Episode-235.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-235.mp3)  

## Interview

### Ta vie, ton oeuvre

[Yannick Grenzinger](https://twitter.com/ygrenzinger): Jardinier logiciel depuis plus de 15 ans. Actuellement coach tech et flow, je suis passionné par l'artisanat logiciel, les langages, l'architecture de systèmes complexes et la livraison de valeur métier en continu. Je suis aussi co-organisateur de la conférence FlowCon et du meetup Paris Continuous Delivery, mais c'est plus dur avec des triplés :D  

[Khaled Souf](https://twitter.com/khaledsouf) est un Globe-trotter et développeur passionné. Il a vécu à Paris où il a travaillé pour des sociétés de conseil telles que Zenika et Arolla. il a participé à la communauté des software crafters à Paris et en Europe.Il a participe à des événements locaux, tels que les meetups Software Crafters Paris, Craft your skills, Coding Dojo. Il vit actuellement à Montréal au Canada et co-organise le Meetup Software Crafters Montréal et la conférence de SOCRATES Canada. Il aime parler de Domain Driven Design, d’architecture, d’artisanat du code, de Clean Code, des pratiques eXtreme Programming et DevOps. [ksouf.com](https://ksouf.com)  

### Les microservices qu’est-ce que c’est ? 

#### En théorie

Monolithe / Macroservices / Microservices / Fonction ? Microservices vs SOA ?

Microservices, dans quel cas ? Monolithe à découper ou nouvelle app from scratch ? Patterns de migration ?

Comment on découpe ses services ? Est-ce qu’il y a des méthodos qui aident ? (nombre de lignes de code, nombre de pizzas par équipe, DDD)

Une base de données unique pour tous les services ? Une par service ? Consistance des données ? Synchronisation des données entre bases ?

Pour quelles équipes ? (DevOps, DevSecOps ...) 

#### En pratique

C’est quoi les recos techniques ? (frameworks Java ou autres, plateformes de déploiement, ...) 

Et dans le monde Java ? Qu’en est-il de la suite Netflix OSS (Eureka, Hystrix, Zuul, Ribbon) ? 

Comment on déploie / scale / fait communiquer entre eux (bloquant, non bloquant, HTTP, broker, message) ?

On-premise, Cloud privé/public/hybride ?

Si tu ne fais pas du k8s tu as loupé ta vie ? Et si tu ne fais pas du Kafka tu as aussi loupé ta vie ?

Comment monitorer ?

#### Et côté front ? 

Micro frontend : comment et pourquoi ? 

#### Le mot de la fin

Phénomène de mode ou les MS sont-ils là pour rester ? Quelles sont les évolutions possibles des archis MS (vers les fonctions) ?

#### Les resources utiles

[Les livres de Sam Newman, surtout Building Microservices et ses talks](https://samnewman.io/talks/)  

[Le livre Microservices Patterns de Chris Richardson](https://www.manning.com/books/microservices-patterns)  

Pour mieux appréhender la complexité de l’aventure et ses prérequis :

* [La rubrique microservices du site de Martin Fowler](https://www.martinfowler.com/microservices/)  
* [11 raisons pour lesquelles vous allez échouer avec les microservices](https://medium.com/xebia-engineering/11-reasons-why-you-are-going-to-fail-with-microservices-29b93876268b)  
https://www.martinfowler.com/bliki/MicroservicePrerequisites.html
* [Recommandations sur les microservices](https://www.infoq.com/news/2019/03/microservices-recommendations/)    
* [Pourquoi les micro services devraient vous faire plus peur](https://medium.com/@bghuston/why-microservices-should-scare-you-more-556ab8f3fdb2)  
* [Vous devez être aussi grand que ça pour passer d'un monolithe à un micro services](https://medium.com/@ygrenzinger/you-need-to-be-this-tall-to-go-from-monolith-to-microservices-part-1-be0835ff380b) et [la conf associée](https://www.youtube.com/watch?v=dr757aMEBko)  

Pour les meilleures pratiques :

* [Le site de Chris Richardson](https://microservices.io/index.html)  
* [Le site de Microsoft](https://docs.microsoft.com/en-us/azure/architecture/patterns/)  
* [Le site d’IBM](https://www.ibm.com/cloud/learn/microservices)  

DDD et microservices : 

* [DDD and Microservices: At Last, Some Boundaries! (vidéo)](https://www.youtube.com/watch?v=sFCgXH7DwxM)  
* [Strategic Microservice Patterns - Nick Tune (vidéo)](https://www.youtube.com/watch?v=ZZXMMnV3EoU)  
* [Astuces pour faciliter le design de micro services avec l'event storming](https://medium.com/nick-tune-tech-strategy-blog/eventstorming-modelling-tips-to-facilitate-microservice-design-1b1b0b838efc)

Orchestration, chorégraphie et saga : 

* [Orchestration vs chorégraphie](https://stackoverflow.com/questions/4127241/orchestration-vs-choreography)  
* [Le pattern Saga pour implémenter les transactions business en microservices](https://blog.couchbase.com/saga-pattern-implement-business-transactions-using-microservices-part/)  
* [Using sagas to maintain data consistency in a microservice architecture - Chris Richardson(vidéo)](https://www.youtube.com/watch?v=YPbGW3Fnmbc)  

Tests :
[12 techniques pour tester les micro services](https://www.infoq.com/articles/twelve-testing-techniques-microservices-intro/)  

Microfrontend : 
[L'article de Martin Fowler](https://martinfowler.com/articles/micro-frontends.html)  
[6 patterns pour les micro frontend](https://blog.bitsrc.io/6-patterns-for-microfrontends-347ae0017ec0)  

Monitoring : 

* [Le pourquoi et le comment monitorer des micro services](https://thenewstack.io/the-hows-whys-and-whats-of-monitoring-microservices/)  
* [Les challenges du monitoring de microservices dans les applications cloud native](https://medium.com/@YuriShkuro/observability-challenges-in-microservices-and-cloud-native-applications-72857f9d03af)  

Les outils : 

* [Spring qui réutilise les outils de Netflix puis Netflix qui utilise Spring](https://netflixtechblog.com/netflix-oss-and-spring-boot-coming-full-circle-4855947713a0)  
* Circuit breaker : [Resilience4j remplace Hystrix (abandonné)](https://resilience4j.readme.io/docs)  
* Tracing :
    * [Open Tracing](https://opentracing.io/docs/overview/what-is-tracing/)  
    * [Zipkin](https://zipkin.io/) et [Sleuth](https://spring.io/projects/spring-cloud-sleuth)  
* [Spring Cloud](https://spring.io/projects/spring-cloud)  

## Nous contacter

[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <https://lescastcodeurs.com/>  
En savoir plus sur le sponsoring ? <sponsors@lescastcodeurs.com>

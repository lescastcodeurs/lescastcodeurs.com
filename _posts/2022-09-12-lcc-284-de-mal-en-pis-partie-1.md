---
title: LCC 284 - De mal en pis - partie 1
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 284
mp3_length: 36390726
tweet: De mal en pis partie 1 #java #groovy #webassembly #micronaut #akka
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, nous discutons bonnes pratiques Java, Groovy, WebAssembly, Micronaut.
Nous discutons également le changement de licence de Akka entre autre.
La suite de cet épisode parlera de changement d’étage gratuit chez Heroku et des vagues de licenciement dans le monde technologique.
Pour rester sous les 1 h d’écoute, nous avons découpé les deux derniers épisodes nouvelles en 2 parties chacun.
Qu’en pensez-vous ? Donnez-nous votre avis sur Twitter ou sur le Google Groups des cast codeurs.

Enregistré le 9 septembre 2022

Téléchargement de l’épisode [LesCastCodeurs-Episode-284.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-284.mp3)

## News

### Langages

Jonathan Giles, un principal architecte de Java chez Microsoft, a un site qui partage des bonnes pratiques Java
[http://java.jonathangiles.net/](http://java.jonathangiles.net/)

- il couvre des bonnes pratiques Java de manière générale, mais également plus spécifiquement pour les développeurs de librairies Java
- Des conseils sur la bonne utilisation des dépendances, des BOMs, des versions LTS de Java, des modules Java, de la surface des APIs publiées, de faire attention à null ou au boxing, et de comprendre les interfaces fonctionnelles
- il y a beaucoup de contenu donc faites par petites doses 
- Certains sujets sont plus controversés comme les modules Java 
- les recommendations sont assez succinctes
- Je suppose que ce sont les recommendations que les équipes du Azure SDK suivent et qu’il a ouvert. Donc merci à lui

Project Leyden [https://www.infoq.com/news/2022/06/project-leyden-delays-aot/](https://www.infoq.com/news/2022/06/project-leyden-delays-aot/)

- Leyden n’a pas progressé en deux ans
- Accepté que GraalVM a déjà achevé les objectifs initiaux
- Donc vont explorer un spectre plus faible de contraintes (et probablement d’optimisations)
- Prochaine LTS en Sept 2023 et Leyden ne sera pas mature, donc Leyden sera utilisé ~Sept 2027 (en terme d’adoption) au plus tôt.
- SpringBoot pensent que CRaC (snapshot de la memoire sur disque pour démarrage plus rapide) sera très utile
- module-info dans Spring pour jlink est dans la roadmap
- Lead de CRaC a fourni un prototype pour Quarkus : améliore temps de démarrage pour OpenJDK mais pas la consommation memoire
- jlink pour Quarkus, dans un context Kube, les gains d’espace disque ne sont pas si intéressants vs un layered image
- Micronaut a des issues ouvertes pour CRaC

José Paumard couvre Loom et Structured Concurrency dans sa vidéo de la série JEP Café
[https://inside.java/2022/08/02/jepcafe13/](https://inside.java/2022/08/02/jepcafe13/)

- Et cet article explique les problèmes classiques de concurrence comme les thread leaks et introduit la Structured Concurrency
- [https://howtodoinjava.com/java/multi-threading/structured-concurrency/](https://howtodoinjava.com/java/multi-threading/structured-concurrency/)

Paul King montre l’utilisation de différents frameworks de tests avec Groovy (Spock, JUnit5, Jacoco, Jqwik et Pitest)
[https://blogs.apache.org/groovy/entry/testing-your-java-with-groovy](https://blogs.apache.org/groovy/entry/testing-your-java-with-groovy)

- Paul couvre aussi dans un autre article les comparateurs et l’utilisation de l’API GINQ
- [https://blogs.apache.org/groovy/entry/comparators-and-sorting-in-groovy](https://blogs.apache.org/groovy/entry/comparators-and-sorting-in-groovy)
- La matrice spot est intéressante, mais pas avec des noms de variable a, b, c, d :)
- L’article est super didactique et explique via un example concret quand utiliser quoi
- Je trouve les property base testing pas si simple à utiliser et avec un coup de reflection >> au truc testé. Mais peut être le cas est super simpliste pour l’usage 

Paul King continue de publier régulièrement des articles sur Groovy
- [https://blogs.apache.org/groovy/entry/working-with-sql-databases-with](https://blogs.apache.org/groovy/entry/working-with-sql-databases-with) — accéder à des bases SQL avec Groovy et GraalVM
- [https://blogs.apache.org/groovy/entry/detecting-objects-with-groovy-the](https://blogs.apache.org/groovy/entry/detecting-objects-with-groovy-the) — détection d’objet avec le machine learning avec Deep Java Library et Apache MXNet


Sortie de Spock 2.2, première version GA avec le support officiel de Groovy 4
[https://twitter.com/spockframework/status/1564999285250326529](https://twitter.com/spockframework/status/1564999285250326529)

- Bah la seule info intéressante est déjà dans le titre, c.-à-d. c’est le support officiel de Groovy 4

Google lance un nouveau langage, appelé Carbon, comme un successeur de C++, mais en plus sympa !
[https://github.com/carbon-language/carbon-lang](https://github.com/carbon-language/carbon-lang)

- Intéressant, ils veut Ceyloniser ou Scalaizer Rust avec Carbon’s Kotlin-like strategy. Not a bad bet
- Rust n’est pas assez compatible avec C++, c’est problématique, surtout pour des boîtes comme Google avec d’énormes code bases en C++.
- Donc pour du green field, Rust c’est bien. Ou c’est bien aussi pour de l’intégration avec du C. Mais pas avec du C++.

State of WebAssembly [https://blog.scottlogic.com/2022/06/20/state-of-wasm-2022.html](https://blog.scottlogic.com/2022/06/20/state-of-wasm-2022.html)

- On peut peut-être aussi rajouter l’utilisation de WebAssembly chez Figma
- [https://neugierig.org/software/blog/2022/06/wasm-notes.html](https://neugierig.org/software/blog/2022/06/wasm-notes.html)
- Rust reste le langage de prédilection
- Python monte
- JavaScript est maintenant un langage viable
- Wasmtime est le runtime le plus populaire
- L’utilisation de WASM pour Serverless et la containérisation et en tant qu’hôte de plugin a beaucoup émergé 
- Les APIs non browser sont ce dont a besoin web assembly 
- En fait ne compile pas JavaScript, mais un moteur JavaScript et fait l’interprétation 
- Fonctionnalités très demandées : threads, exceptions, GC, type reflection etc 

Graal VM 22.2
[https://medium.com/graalvm/graalvm-22-2-smaller-jdk-size-improved-memory-usage-better-library-support-and-more-cb34b5b68ec0](https://medium.com/graalvm/graalvm-22-2-smaller-jdk-size-improved-memory-usage-better-library-support-and-more-cb34b5b68ec0)

- GraalVM JDK plus petit
- Plus petite conso mémoire lors de la création de native images
- Un travail de Quarkus, Micronaut et Spring Native pour oublier des métadonnées partagées
- [https://medium.com/graalvm/enhancing-3rd-party-library-support-in-graalvm-native-image-with-shared-metadata-9eeae1651da4](https://medium.com/graalvm/enhancing-3rd-party-library-support-in-graalvm-native-image-with-shared-metadata-9eeae1651da4)
- Possibilité de générer des heap dump dans des native images
- Différentes améliorations du compilateur
- Support de Apple Silicon
- Côté autres langages, GraalPython démarre plus vite et avec support étendu de librairie, et GraalJS avec une meilleure interopérabilité

Alex Blewitt un Java Champion est décédé prématurément [https://www.infoq.com/news/2022/07/alex-blewitt/](https://www.infoq.com/news/2022/07/alex-blewitt/)

- Notamment un contributeur à InfoQ


### Librairies

Sortie de Micronaut 3.6
[https://micronaut.io/2022/08/04/micronaut-framework-3-6-0-released/](https://micronaut.io/2022/08/04/micronaut-framework-3-6-0-released/)

- Nouveau module Micronaut Test Resources avec une intégration TestContainers qui permet d’avoir des ressources de test externes, par exemple pour un Redis, un Elasticsearch ou autre
- Cédric Champeau qui a travaillé sur cette fonctionnalité a écrit un blog post complet sur le sujet [https://melix.github.io/blog//2022/08/micronaut-test-resources.html](https://melix.github.io/blog//2022/08/micronaut-test-resources.html)
- Intégration avec OpenTelemetry (après Open Tracing et autre)
- Micronaut Data rajoute Hibernate Reactive comme intégration
- Et plein d’autres mises à jour des différents modules existants

Utiliser des sérialiseurs / désérialiseurs de messages Kafka dans votre application Quarkus [https://quarkus.io/blog/kafka-serde/](https://quarkus.io/blog/kafka-serde/)

- Explique quand on a besoin d’un sérialiseur custom (hors des types fondamentaux)
- Explique que le support JSON existe par défaut
- Explique comment utiliser Avro mais avec un schéma registry
- Et la version full custom

Akka change sa licence d’ASL vers BSL (Business Source License) [https://www.lightbend.com/blog/why-we-are-changing-the-license-for-akka](https://www.lightbend.com/blog/why-we-are-changing-the-license-for-akka)

- Comme MariaDB, Cockroach Labs, Sentry, Materialized
- BSL is source available et usage dev mais pas prod
- Après 3 ans, les commits en BSL se convertissent en ASL (donc pas les nouveaux commits)
- License commerciale disponible pour 2000$ par cœur
- Due au fait qu’avec la maturité de Akka les contributions ont diminué et le support est revenu à LightBend de plus en plus, même si de grosses sociétés utilisent Akka dans leur infra critique
- Gatling impacté
- Mécontentement de la communauté Akka et Scala, par exemple cet article d’Alexandru Nedelcu [https://alexn.org/blog/2022/09/07/akka-is-moving-away-from-open-source](https://alexn.org/blog/2022/09/07/akka-is-moving-away-from-open-source)

## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

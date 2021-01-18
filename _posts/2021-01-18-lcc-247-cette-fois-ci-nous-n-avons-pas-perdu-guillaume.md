---
title: LCC 247 - Cette fois-ci nous n'avons pas perdu Guillaume!
author: 'Emmanuel Bernard'
layout: blog-post
episode: 247
mp3_length: 56691663
tweet: Cette fois-ci nous n'avons pas perdu Guillaume! #java #css #spingboot #springcloud #jhispter
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans ce premier épisode news de l'année Guillaume est de retour et sans accrocs (enfin presque). Accompagné d'Arnaud ils parcourent les nouvelles techniques de fin 2020, début 2021. Ils nous parlent de Java (Hashcode, Loom, records), des news Spring (SpringBoot, SpringCloud, JHipster), du changement de license chez Elastic, de CSS (Bootstrap, Tailwind.CSS), de Gradle et d'autres sujets  Sécurité, Architecture et Méthodologie.

Enregistré le 15 Janvier 2021

Téléchargement de l'épisode [LesCastCodeurs-Episode-247.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-247.mp3)

## News

### Langages

* [Comment les hashcodes sont générés en Java](https://alidg.me/blog/2020/7/15/hash-code). Et non ce ne sont pas les adresses mémoires. Le code utilises un modèle sans contention et très rapide. Quasi comme celui qui ramène une valeur constante.
* [Utiliser les Java Records avec Jackson (et Spring Boot)](https://youribonnaffe.github.io/java/records/spring/2021/01/10/records-spring-boot.html) (Mais pas pour la persistence avec JPA/Hibernate)
* Project Loom & Jetty: [1000000 Virtual Thread oui mais pas avec une stack de taille décente.](https://webtide.com/do-looms-claims-stack-up-part-1/) Et ça fait de la poubelle à collecter. [loom ne remplace pas l’usage des thread pool pour la contention de resources autre que les threads (DB connection, mémoire, CPU).](https://webtide.com/do-looms-claims-stack-up-part-2/) Les VirtualThreads ne sont pas encore optimisées pour les ThreadLocals. Donc VirtualThread pas forcément l’unité de montée en charge naturelle. (Une partie 3 de se blog est prévue dans quelques semaines)

### Librairies

* [JHipster 7.0.0](https://www.jhipster.tech/2020/12/21/jhipster-release-7.0.0-beta.0.html) avec pas mal d'incompatibilités.
* [Spring Cloud Contract 3.0](https://toomuchcoding.com/articles/2020/12/23/spring-cloud-contract-3-0-0-released/): Incremental Test Generation for Maven, Resolves Credentials from settings.xml, Rewrite Groovy to Java, Allow to Extend Contract & Stubs, New [Custom] Mode of Test Generation, Experimental GRPC Support, GraphQL Support, Stub Runner Boot Thin JAR, Messaging Polyglot Support, Messaging with Existing Middleware, Gradle Plugin rewrite. 
* [Spring Cloud 2020.0.0, enfin la version compatible avec Spring Boot 2.4.x. Nouveau versioning comme annoncé il y a quelques mois.](https://spring.io/blog/2020/12/22/spring-cloud-2020-0-0-aka-ilford-is-available). Attention à la fonctionnalité de bootstrap qui est désactivée par défaut. Attention si vous utilisez [Spring Cloud GCP](https://github.com/GoogleCloudPlatform/spring-cloud-gcp) le projet a déménagé et et n'est plus dans le release train
* [TOML 1.0 est dispo](https://github.com/toml-lang/toml/releases/tag/1.0.0) et [TOML Schema en route](https://github.com/brunoborges/toml-schema). 

### Infrastructure

* [Elastic suit MongoDB et remplace la license ASF 2.0 pour Elasticsearch et Kibana](https://www.elastic.co/blog/licensing-change) au profit d’un dual licensing Elastic License + SSPL. Tout comme mongo le but est de se protéger des AWS et consorts en empêchant le hosting sans recontribution vers la « communauté »

### Web

* [Bootstrap 5.0.0 passe en beta 1](https://getbootstrap.com/docs/5.0/migration/).  
* [Le CSS version Bootstrap (approche composants) vs le CSS version Tailwind.CSS (approche boite à outils)](https://www.touilleur-express.fr/2021/01/04/comprendre-css-de-boostrap-a-tailwind-css/).  

### Outillage

* [Gradle 6.8](https://docs.gradle.org/6.8/release-notes.html) est la dernière release avant la version 7. La version 6.8 apporte d'importantes améliorations des performances dans la version Kotlin, des améliorations sur les caches (notamment les plugins checkstyle, pmd, codenarc, jacoco ). Améliorations sur la feature toolchain, les composites builds et la gestion des dépendances ...
* [Le problème avec Gradle](https://melix.github.io/blog/2021/01/the-problem-with-gradle.html) article de Cédric Champeau, dev Gradle en réponse à [Le problème avec Gradle](https://www.bruceeckel.com/2021/01/02/the-problem-with-gradle/) de Bruce Eckel. On y parle des principes de bases (taches et dépendances), configuration vs programmation du build, Groovy, DSL, de faire la même chose de 36 manières, de magie et de cycle de vie

### Architecture

* [un retour intéressant sur Amazon qui est passé de Sun à Linux / x86 pendant la bulle de 2000 au lieu de rester dans son modèle existant.](https://threadreaderapp.com/thread/1347677573900242944.html) Ça explique un choix intéressant : en cas de crise, soit tu pousses à te réinventer avec le risque d’échouer et de couler rapidement, soit tu optimises ce que tu as avec le risque d’être balayé « a petit feu ». Amazon n’avait plus que quelques trimestres devant eux et ont arrêté les features pendant la transition.

### Méthodologies

* [It's pull from production, not push to production](https://labnotes.org/pull-requests-continuous-integration/) avec CDN sur le front et serverless sur le back, la prod est juste un changement de DNS. Toutes les branches peuvent être en prod. `main` n’est pas la prod mais l’accord des fonctionnalités partagées.  
* [Comment prendre des notes ...](http://fego.github.io/2020/11/01/J'ai-enfin-appris-%C3%A0-prendre-des-notes.html) pour ne pas faire un cimetière de notes mais réellement un référentiel personnel de connaissances. 

### Sécurité

* [Attaque SolarWinds. Une attaque etatique hack plusieurs agences americaines, microsoft et 18000 autres entités](https://www.clubic.com/cybercriminality/actualite-25253-sunburst-solarwinds-que-faut[…]e-la-cyberattaque-d-ampleur-qui-a-touche-les-etats-unis-.html). Des articles commencent à cibler Jetbrains Teamcity comme vecteur d'attaque utilisé pour infester SolarWinds mais JetBrains s'en défend ([article 1](https://blog.jetbrains.com/blog/2021/01/06/statement-on-the-story-from-the-new-york-times-regarding-jetbrains-and-solarwinds/), [article 2](https://blog.jetbrains.com/blog/2021/01/07/an-update-on-solarwinds/))

## Conférences

* Web Stories le 5/2 en ligne <https://webstoriesconf.com/>  
* Le Devfest Lille le 11/6 en présentiel <https://devfest.gdglille.org/> 
* Devoxx France du 31 juin au 2 Juillet en présentiel <https://www.devoxx.fr>

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

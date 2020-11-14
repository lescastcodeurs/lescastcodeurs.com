---
title: LCC 214 - L'édition Barbecue
author: 'Emmanuel Bernard'
layout: blog-post
episode: 214
mp3_length: 71936401
tweet: L'édition Barbecue #openjdk #jit #serialisation #quarkus #cloudevent #awslambda #react #daltonisme #eventsourcing #uml #loi
# tweet size: 91-93 -> 99-101 #######################################################################
---
Les Cast Codeurs se réunissent pour leur déjeuner annuel de tous les 18 mois à deux ans pour enregistrer cet épisode news.
On y discute contribution OpenJDK, JIT, sérialisation, Quarkus, CloudEvent, AWS lambda, React, daltonisme, event sourcing, uml, loi extra territoriale et bien d'autres choses encore.
Le mot Barbecue vient de l'embrochement du gibier "de la barbe au cul" avant de le faire chauffer dans les cheminées de cuisine.

Enregistré le 5 juillet 2019

Téléchargement de l'épisode [LesCastCodeurs-Episode-214.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-214.mp3)

## News

### Langages

[JDK 13 is now in Rampdown Phase One](https://mail.openjdk.java.net/pipermail/jdk-dev/2019-June/003060.html)  
[Le flow des commits OpenJDK vers leurs distributions](https://shipilev.net/jdk-updates/map/)  
[Warm up d'applications sur la JVM avec Azuul](https://www.javacodegeeks.com/2019/06/faster-jvm-application-warm-zing.html)  

* prend des metriques au premier run et les redonne en info aux seconds runs
* cache la compilation et ses paramètres d'entrée pour garantir la sémantique de la spécification Java

[Améliorer l'intégration entre JavaFX et les toolkits natifs](https://twitter.com/johanvos/status/1143508638235054081)  
[Une nouvelle sérialisation en Java en chantier](http://cr.openjdk.java.net/~briangoetz/amber/serialization.html)  

[Scala 2.13.0](https://blog.univalence.io/scala-2-13-0/)  

### Librairies

[Quarkus 0.18.0](https://quarkus.io/blog/quarkus-0-18-released/)  

* GraalVM 19
* Support for writting Kubernetes operator
* Meilleur support Gradle
* Kafka Streams
* (0.17.0) plus d'extensions Camel
* (0.17.0) Support Drools et jBPM

[Configurer une application Quarkus](https://antoniogoncalves.org/2019/06/07/configuring-a-quarkus-application/)  

### Middleware

[CloudEvent s'approche de la 1.0](https://github.com/cloudevents/spec/blob/master/spec.md)  
[javax -> jakartaee renommage: le big bang préféré](https://twitter.com/arungupta/status/1139160064810291200)  

### Infrastructure

[RPMs expliqués](https://fedoramagazine.org/rpm-packages-explained/)  
[Raspberry Pi 4 pour $35](https://www.raspberrypi.org/blog/raspberry-pi-4-on-sale-now-from-35/)  

* vous l'utilisez pour quoi?

[Running Custom Containers Under Chrome OS](https://chromium.googlesource.com/chromiumos/docs/+/master/containers_and_vms.md)  

[HAProxy 2.0 and Beyond](https://www.haproxy.com/blog/haproxy-2-0-and-beyond/)  

### Cloud

[Retour d'expérience sur AWS lambda](https://medium.com/@emaildelivery/serverless-pitfalls-issues-you-may-encounter-running-a-start-up-on-aws-lambda-f242b404f41c)  

* contrôle de la stack (cf discussion avec Quentin)
* long running connections genre web socket pas forcément adaptées
* corrélation directe entre le CPU et la RAM
    * donc peu de RAM, veut dire CPU lent et donc tourner beaucoup plus longtemps
    * la lambda se facture par incrément de 100ms donc n'optimisez pas en dessous
* latence: cloudfront - API Gateway - lamba est au moins 50ms
* trace et cloudwatch: c'est cher et verbeux et la UI est merdique
* les fonctions lambda doivent être idempotentes car peuvent être rejouées sur la même requête de temps en temps
* chainer les lambda est lent (latence cumulée) 100ms par sous appel
* debuger une lambda qui time out c'est la merde
* cold starts de 3s
* quand est-ce que les lambda sont utilses (pas user facing)

[Clever Cloud lance Clever Grid](https://www.clevergrid.io/)  

### Web

[Améliorer le temps de chargement de React](https://www.infoq.com/articles/reduce-react-load-time/?utm_source=twitter&utm_medium=link&utm_campaign=calendar)  

* résumé au début

[What's new in Angular 8.0?](https://blog.ninja-squad.com/2019/05/29/what-is-new-angular-8.0/)  

[Au delà des couleurs, des interfaces adaptées au daltonisme](https://mixitconf.org/2019/au-dela-des-couleurs-des-interfaces-adaptees-au-daltonisme)  
[Building the most inaccessible site possible with a perfect Lighthouse score](https://www.matuzo.at/blog/building-the-most-inaccessible-site-possible-with-a-perfect-lighthouse-score/)    
[HTML can do that?](https://dev.to/ananyaneogi/html-can-do-that-c0n)  

[Firefox Now Available with Enhanced Tracking Protection by Default Plus Updates to Facebook Container, Firefox Monitor and Lockwise](https://blog.mozilla.org/blog/2019/06/04/firefox-now-available-with-enhanced-tracking-protection-by-default/)  
[Google Just Gave 2 Billion Chrome Users A Reason To Switch To Firefox](https://www.forbes.com/sites/kateoflahertyuk/2019/05/30/google-just-gave-2-billion-chrome-users-a-reason-to-switch-to-firefox/#2aca947b751f)  
[Google’s new reCAPTCHA has a dark side](https://www.fastcompany.com/90369697/googles-new-recaptcha-has-a-dark-side)  

### Data

[Retour sur les erreurs en embrassant l'event sourcing](http://natpryce.com/articles/000819.html)  

* dans la meme base les projections et les changements
* Event driven != event source
* Utiliser l'event store en tant que bus d'évènement (entrainer melange des event business et techniques)
* Séduit par la consistance au bout du compte
* options
    * passés du modèle relationel à des blobs JSON pour les vues
    * ils utilisaient l'archi hexagonal donc les changements ont été doux

### Outillage

[Mark files as viewed](https://github.blog/2019-07-01-mark-files-as-viewed/)  

### Architecture

Les diagrammes UML sous controle de source via PlantUML [article 1](https://tech.olx.com/plantuml-diagrams-as-code-93773b394cd9) [article 2](https://medium.com/@yfuruyama/real-world-plantuml-7365ffc1b6e6) et [real world plantuml](https://real-world-plantuml.com/)  
  

### Méthodologies

[Pourquoi les anciennes sociétés ont un IT pas aussi glamour que la silicon valley](http://www.smashcompany.com/business/why-are-large-companies-so-difficult-to-rescue-regarding-bad-internal-technology)  

* longue histoire de centralisation, décentralisation et rachat
* changements de cap et donc céder du pouvoir / du contrôle de la donnée est un risque pour le future moyen
* externalisation des non "coeur de compétence" vers des fournisseurs non interessé à la modernisation
* problème de confiance, les autres acteurs internes et externes de mauvaise foi
    * moins de problème de confiance dans une start up de 50 personnes vu que tu connais tout le monde
    * être agile veut-il dire se faire confiance?

### Sécurité

[Et voici Elastic SIEM](https://www.elastic.co/fr/blog/introducing-elastic-siem?ultron=fr-local&blade=tw&hulk=social)  

### Loi, société et organisation

[Rapport sur les loi extra-territoriales Américaines](https://www.gazette-du-palais.fr/wp-content/uploads/2019/06/Rapport-Gauvain-190626-vdef.pdf)  

* parle des amandes (beaucoup de banques)
* grande portée même en dehors de la sphère américaine
* sanctions disproportionnées
* procureurs américains demandant la discovery
* poursuite engagées semblent etre motivées à but économique et cibles choisies
* les lois extra territoriales ont permis des réduction de contrats avec corruption

[Boeing’s 737 Max Software Outsourced to $9-an-Hour Engineers](https://www.bloomberg.com/news/articles/2019-06-28/boeing-s-737-max-software-outsourced-to-9-an-hour-engineers?utm_medium=social&cmpid=socialflow-twitter-business&utm_content=business&utm_source=twitter&utm_campaign=socialflow-organic)  

[Libra : tout ce qu’il faut savoir sur la future cryptomonnaie propulsée par Facebook, Iliad, PayPal, Uber…](https://www.numerama.com/business/523272-la-cryptomonnaie-de-facebook-ce-que-lon-sait.html)  

[Délai trop court, absence du juge, définition floue : la loi contre la haine sur Internet alarme](https://www.numerama.com/politique/530799-delai-trop-court-absence-du-juge-definition-floue-la-loi-contre-la-haine-sur-internet-alarme.html)  

* [Résumé de la loi « haine »](https://www.laquadrature.net/2019/07/02/resume-de-la-loi-haine-avant-le-vote-de-demain/)  
* [Loi «contre la haine» sur internet: objectif louable mais danger pour la liberté d’expression!](http://www.lefigaro.fr/vox/politique/loi-contre-la-haine-sur-internet-objectif-louable-mais-danger-pour-la-liberte-d-expression-20190618)  
* [L’Allemagne a déjà fait une loi pour lutter contre la haine en ligne, son efficacité est incertaine](https://www.lemonde.fr/pixels/article/2019/07/04/lutte-contre-la-haine-en-ligne-l-impossible-bilan-de-la-loi-allemande_5485218_4408996.html)  

[La CNIL prête à céder au lobby des médias sur le RGPD](https://www.laquadrature.net/2019/06/28/la-cnil-veut-autoriser-les-sites-internet-a-nous-tracer-sans-notre-consentement/)  

## Outils de l'épisode

[Durgod Taurus k320 clavier mécanique cherry bleu](https://fr.aliexpress.com/item/32845509908.html)  
[The Definitive Guide to SonarQube 7.9 LTS](https://www.sonarqube.org/sonarqube-7-9-lts/)  

## Conférences

[JugSummerCamp le 13 septembre 2019](http://www.jugsummercamp.org/edition/10).  
[DevFest Toulouse le 3 octobre 2019](https://devfesttoulouse.fr/).  
[DevFest Nantes les 21 et 22 octobre 2019](https://devfest.gdgnantes.com/).  
[Voxxed Microservices 21 au 23 octobre 2019](https://voxxeddays.com/microservices/).  
[ScalaIO](https://scala.io/) du 29 au 31 octobre a Lyon. Thème programmation fonctionelle.  
[Devoxx Belgique du 4 au 8 novembre 2019](https://devoxx.be/)  
[Bdx.io le 15 novembre 2019](https://www.bdx.io/#/home).  
[DevOps D-Day les 13 et 14 novembre 2019](http://2019.devops-dday.com/) - Le [CfP](http://2019.devops-dday.com/index.html) est ouvert.  
[Codeurs en Seine le 21 novembre 2019](https://www.codeursenseine.com/2019/)  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

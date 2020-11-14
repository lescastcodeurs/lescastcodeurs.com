---
title: LCC 196 - CORS Lille debout T
author: 'Emmanuel Bernard'
layout: blog-post
episode: 196
mp3_length: 54066926
tweet: CORS Lille debout t #JDK #GraalVM #Kotlin #JakartaEE #serverless
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Emmanuel et Guillaume vous parlent de JDK 11, 12, 9, de GraalVM, de Kotlin, de Java et Jakarta EE, de serverless, de multi cloud, de consistance de données, de Linux, de l'Europe, de Bercy. Mais pas que !

Enregistré le 25 septembre 2018

Téléchargement de l'épisode [LesCastCodeurs-Episode-196.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-196.mp3)  

## News

### Langages

Comprendre Java 9 et plus, on recommence:

* [l'agenda proposé pour Java 12](http://mail.openjdk.java.net/pipermail/jdk-dev/2018-September/001923.html)  
* [Le train de release, fonctionalités vs securité](https://blog.joda.org/2018/09/java-release-chains-features-and-security.html)
* [Vive le Java libre! Des Java Champions](https://docs.google.com/document/d/1nFGazvrCvHMZJgFstlbzoHjpAVwv5DEdnaBr_5pKuHo/edit)  

[Java 11 sort aujourd'hui](http://openjdk.java.net/projects/jdk/11/)  
[Exemple d'utilisation de HttpClient de Java 11](https://kousenit.org/2018/09/22/java-11-httpclient-gson-gradle-and-modularization/) (avec GSON pour marshalling JSON)  
[JShell en profondeur](https://www.infoq.com/articles/jshell-java-repl) sur InfoQ  
[Concise method bodies](http://openjdk.java.net/jeps/8209434)  

[Le podcast sur la circoncision](https://www.stuffyoushouldknow.com/podcasts/sysk-selects-how-circumcision-works.htm)  

[Java reflection, but much faster](https://www.optaplanner.org/blog/2018/01/09/JavaReflectionButMuchFaster.html), from OptaPlanner  
[The Graal Frenzy](https://medium.com/@jponge/the-graalvm-frenzy-f54257f5932c) par Julien Ponge  
[Les co-routines en Kotlin et structured concurrency](https://medium.com/@elizarov/structured-concurrency-722d765aa952)  
Voir aussi [Java project Loom](http://cr.openjdk.java.net/~rpressler/loom/Loom-Proposal.html)  

### Runtimes

[Mettez à jour vos Jackson](https://github.com/FasterXML/jackson-databind/issues/2097) à la version [2.9.7](https://github.com/FasterXML/jackson/wiki/Jackson-Release-2.9.7)  

[La suite de test de Java EE est open source](https://github.com/eclipse-ee4j/jakartaee-tck)  
[La roadmap d’Eclipse Glassfish](https://www.agilejava.eu/2018/09/13/eclipse-glassfish-release-plan/)  

[Oracle annonce Helidon](https://medium.com/@dkornilov/helidon-takes-flight-fb7e9e390e9c)  

### Infrastructure

[LogDevice de Facebook, un homologue de Apache Kafka](https://logdevice.io/blog/2018/09/12/open-sourcing-announcement.html)  
[LogDevice vs Kafka](https://news.ycombinator.com/item?id=17975060)  

### Cloud

[Séries sur Spring Cloud sur GCP](http://glaforge.appspot.com/article/nice-series-on-spring-cloud-integration-for-google-cloud-platform) par Josh Long  
[Serverless best practices](https://medium.com/@PaulDJohnston/serverless-best-practices-b3c97d551535)  
[Multi cloud is a trap](https://bravenewgeek.com/multi-cloud-is-a-trap/)  

[NewSQL échouent dans leurs garanties et j'accuse Spanner](http://dbmsmusings.blogspot.com/2018/09/newsql-database-systems-are-failing-to.html)  

### Web

[Axa supprime son appli mobile: voilà pourquoi ?](https://www.journaldunet.com/economie/finance/1211319-pourquoi-axa-france-a-supprime-son-application-mobile/)  
[CORS un article explicatif](https://frontendian.co/fr_FR/cors)  

### Outillage

[Qui a la plus grande sur GitHub en Open Source](https://www.techrepublic.com/article/who-contributes-most-to-open-source-the-answers-will-definitely-surprise-you/)  

### Méthodologies

[Le désenchantement dans le développement logiciel](http://tonsky.me/blog/disenchantment/)  

### Sécurité

[Protéger l'identité contre silhouette](https://blog.twitter.com/engineering/en_us/topics/insights/2018/twitter_silhouette.html)  
[Faille de sécurité dans la distribution alpine utilisée dans les images docker](https://justi.cz/security/2018/09/13/alpine-apk-rce.html)  

### Loi, société et organisation

[Linux se dote d'un code de conduite](https://lkml.org/lkml/2018/9/16/167)

L'union Européenne adopte la directive sur le droit d'auteur:

* [La directive de l’UE sur le droit d’auteur à l’heure du numérique est adoptée](https://www.lemonde.fr/pixels/article/2018/09/12/le-parlement-europeen-adopte-la-directive-sur-le-droit-d-auteur-a-l-heure-du-numerique_5354024_4408996.html?utm_campaign=Lehuit&utm_medium=Social&utm_source=Twitter)  
* [Droit d’auteur : préparer la défaite en célébrant la victoire du court-termisme](https://www.champeau.info/blog/2018/09/12/droit-dauteur-preparer-la-defaite-en-celebrant-la-victoire-du-court-termisme/)  
* [Contre analyse de l'impact des articles 11 et 13 sur l'internet libre](https://www.laquadrature.net/fr/directive_auteur_calimaq)  

[Ouverture des « sources » du simulateur économique de Bercy](https://www.nextinpact.com/news/107001-sous-pression-bercy-ouvre-codes-sources-modeles-mesange-opale-et-saphir.htm)

## Outils de l'épisode

Pouvoir faire un checkout de la pull request GitHub

    git config --global --add remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"
    git fetch origin
    
    # And then
    git checkout pr/123

## Rubrique débutant

[Les changements d’états dans Git](https://ndpsoftware.com/git-cheatsheet.html#loc=workspace)  

## Conférences

[Paris Web les 4, 5 et 6 octobre 2018](https://www.paris-web.fr/).  
[DevFest Nantes les 18 et 19 octobre 2018](https://devfest.gdgnantes.com/) - sold out.  
[Jenkins World Europe du 22 au 25 octobre 2018 à Nice](https://www.cloudbees.com/jenkinsworld/home) - (utilisez le code JWAHERITIER pour obtenir 20% de réduction).  
[VoxxedDays Microservices du 29 au 31 octobre 2018](https://voxxeddays.com/microservices/).  
[DevFest Toulouse le 8 novembre 2018](https://devfesttoulouse.fr/).  
[Devoxx Belgique du 12 au 16 novembre 2018](https://devoxx.be/) - sold out.  
[Bdx.io le 9 novembre 2018](https://www.bdx.io/#/home) - sold out.  
[Codeurs en Seine le 22 novembre 2018](http://www.codeursenseine.com/2018/).
[Snowcamp du 23 au 26 janvier 2019](https://snowcamp.io/fr/).  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

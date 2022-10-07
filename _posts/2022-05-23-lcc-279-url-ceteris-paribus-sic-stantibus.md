---
title: LCC 279 - URL ceteris paribus sic stantibus
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 279
mp3_length: 47845433
tweet: URL ceteris paribus sic stantibus #secu #java #debutantURL #jduchesse
# tweet size: 91-93 -> 99-101 #######################################################################
---
Guillaume et Emmanuel discutent de l'état des versions de Java utilisées, de Java String template, et de beaucoup de failles de sécurité.
On pourra presque se renommer Les Cast Sécu ;P
On y ressuscite aussi la rubrique débutant et discutons du piège de la classe `URL`.

Enregistré le 20 mai 2022

Téléchargement de l'épisode [LesCastCodeurs-Episode-279.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-279.mp3)

## News

### Langages

L’état de Java [selon newrelic](https://newrelic.com/resources/report/2022-state-of-java-ecosystem)

- Java 11 commence enfin à être utilisé plus que Java 8 en prod (48% vs 46%)
- Dans les versions non LTS, c’est Java 14 qui a l’air d’avoir le plus de succès
- non LTS en prod est 2,7%
- Après Oracle, c’est la distrib de AWS qui est pas mal utilisée suivi par adoptium 
- Beaucoup d’utilisation de Java dans des containeurs (70%) avec 1 seul core, donc aussi moins de bénéfices dans l’utilisation de G1 pour le GC
- Toujours dans les containeurs, les applis Java tournent souvent avec moins de 512MB de RAM (45%)

[String templates en Java](https://openjdk.java.net/jeps/8273943)

* les string template c’est ce qui a fournit log4shell donc attention
* Replace certains usages de  stringbuilder , stringfromat et messageformat
* Beaucoup de langages offrent ça (bash ahah)
* Exemple d’usage html, json, yaml etc
* Ils veulent permettre des règles de transformations et de validation (escape caractère)
* Peut même éviter le,passage par l’étape du passeur
* Objet template a le template et la policy
* Embedded expressions: chaînes de caractères, arithmétique, invoque méthodes ou champs, pas besoin d’échapper les double guillemets.
* Lignes multiples
* Quid capture des variables locales sans l’avis du développeur. Pas d’exemple meta où le template est importé ou construit.

[Un article détaillé sur ce qui est nouveau niveau GC dans Java 18](https://tschatzl.github.io/2022/03/14/jdk18-g1-parallel-gc-changes.html)

### Librairies

[Quarkus 2.8](https://quarkus.io/blog/quarkus-2-8-0-final-released/) et [2.9](https://quarkus.io/blog/quarkus-2-9-0-final-released/)  

* WebAuthN
* Confluent Schema Registry
* Kotlin Scala
* RESTEasy Reactive est la couche par défaut
* GraalVM 22
* Elasticsearch Dev Services

### Outillage

[Un nouveau décompilateur avec du code plus lisible](https://www.reddit.com/r/java/comments/ue8u59/new_open_source_java_decompiler/)

* Tous plus ou moins un fork de celui d’intellij maintenu par JetBrains, le fork d’avant est de Minecraft
* Reconstruit des constructions de plus haut niveau et plus moderne.
* [Exemples](https://gist.github.com/SuperCoder7979/c7171b0e34b6eccf0b9f1c37030867dc)  

### Sécurité

[Une vulnérabilité dans struts 2](https://www.securezoo.com/2022/04/apache-patches-struts-2-rce-vulnerability-cve-2021-31805/)

* Un problème qui n’avait été que partiellement corrigé. Lié à OGNL’et une double évaluation via `%{…}` sur du contenu venant de l’utilisateur.

[Le gros trou de sécu sur les signatures Java 15-18](https://security.berkeley.edu/news/psychic-signatures-vulnerability-java-cve-2022-21449)  

* attaque sur les approches ECDSA (elliptic curve digital signature algorithm), typiquement plus modernes
cibles Java web start, Java applets, web services qui utilisent ECDSA (JWT, SAML, OIDC Id tokens, WebAuthN
* version Oracle Java 7, 8, 11, 15, 16, 17, 18, OpenJDK 15, 17, 18 (backport Oracle)
* Comme un psychic paper de dr who: peut signer numériquement un papier sans infos (paramètres de la courbe peuvent être à 0 ce qui permet de valider tous les messages (0)
* L’interprétation pour [un framework comme Quarkus](https://github.com/quarkusio/quarkus/discussions/25252)

[Spring4Shell](https://www.theregister.com/2022/03/31/spring_vuln/) avec risque de remote code execution (unfolding)

* Mitigations: mettre a jour 5.x, mettre a jour tomcat (tactique), setDisallowedField pour excludes les accès aux getter/setter class, passer a Java 8
* La RCE est basée sur la navigation non restreinte de class.module.classLoader
*  [Spring MVC Early Announcement](https://spring.io/blog/2022/03/31/spring-framework-rce-early-announcement) 
*  [Spring Cloud exploit announcement](https://www.cyberkendra.com/2022/03/rce-0-day-exploit-found-in-spring-cloud.html) 
*  [Spring MVC Exploit Announcement](https://www.praetorian.com/blog/spring-core-jdk9-rce/) 
*  [Spring4Shell HelpNetSecurity assessment](https://www.helpnetsecurity.com/2022/03/31/spring4shell/) 
*  [Spring4Shell Sonatype Assessment](https://blog.sonatype.com/new-0-day-spring-framework-vulnerability-confirmed) 
*  [Qualys assessment](https://blog.qualys.com/vulnerabilities-threat-research/2022/03/31/spring-framework-zero-day-remote-code-execution-spring4shell-vulnerability) 


[Personal Security Checklist](https://github.com/Lissy93/personal-security-checklist)

* Recense les bonnes pratiques en terme de sécurité numérique
* Selon différents thèmes
* [Authentication](https://github.com/Lissy93/personal-security-checklist#authentication) 
* [Browsing the Web](https://github.com/Lissy93/personal-security-checklist#web-browsing) 
* [Email](https://github.com/Lissy93/personal-security-checklist#emails) 
* [Secure Messaging](https://github.com/Lissy93/personal-security-checklist#secure-messaging) 
* [Social Media](https://github.com/Lissy93/personal-security-checklist#social-media) 
* [Networks](https://github.com/Lissy93/personal-security-checklist#networking) 
* [Mobile Phones](https://github.com/Lissy93/personal-security-checklist#mobile-devices) 
* [Personal Computers](https://github.com/Lissy93/personal-security-checklist#personal-computers) 
* [Smart Home](https://github.com/Lissy93/personal-security-checklist#smart-home) 
* [Personal Finance](https://github.com/Lissy93/personal-security-checklist#personal-finance) 
* [Human Aspect](https://github.com/Lissy93/personal-security-checklist#sensible-computing) 
* [Physical Security](https://github.com/Lissy93/personal-security-checklist#physical-security) 

[Google offre aux clients Google Cloud des libairies validées en sécurité](https://www.theverge.com/2022/5/17/23097529/google-assured-open-source-software-security-vetted-libraries)  
[Une équipe de maintenance Open Source chez Google](https://blog.google/technology/safety-security/shared-success-in-building-a-safer-open-source-community/)  


### Loi, société et organisation

[Apple va supprimer au téléchargements les applis non mises a jour depuis 3 ans et peu téléchargées](https://www.macrumors.com/2022/04/29/apple-outdated-apps-extension/)

* ça a fait réagir et râler
* Des applis finies
* Mais surtout une résumassions c’est du taf (nouvelles règles, peut être mise à jour de framework)
* Du cote de Apple c’est nettoyer un peu la longue queue d’applis
* Et encourager les gens à rester au top (eg privacy infos)

[Les duchesses ferment leur slack aux hommes](https://www.duchess-france.org/au-revoir-slack-public-bonjour-non-mixite/)

* pas fait de gaité de cœur mais réaction aux événements
* temps des Modérations plus passe sur les posts d’hommes que de femmes
* Sensation de pas laisser la place aux femmes
* Maladresses et manques de respect
* Coupé dynamisme et la sécurité de parole
* Et beaucoup d’hommes et du coup sentiment d’épier
* Les duchess feront toujours des événements mixtes mais cet espace avait perdu son utilité première

[Comment la guerre en Ukraine ébranle la tech russe](https://www.usine-digitale.fr/article/comment-la-guerre-en-ukraine-ebranle-la-tech-russe.N1796857)

* fragilisation
* fuite des cerveaux (depuis 2014 et la crimée (cerveaux emprunts de plus de liberté) manque .5 à 1 millions de developpeurs
* Karspersky et les doutes de ses clients (80% du chiffre d’affaire à l’étranger)
* Yandex moteur de recherche protégé car marcher local mais démission du CEO
* Default de paiement (endettement) e.g. VK 400 millions de dollars
* Envisager de raid de disque dur pour consommation locale


## Outils de l’épisode

[Faire le la configuration conditionnelle dans git]( https://dev.to/tastefulelk/conditional-git-profile-configuration-212b)

* includeIf permet de faire la condition
* Utile pour changer l’email entre bureau et perso par exemple.
* [aheritier] je le fais souvent avec des repertoires différents pour boulot vs oss/perso


## Rubrique débutant

[La comparaison des URL](https://twitter.com/tnurkiewicz/status/1519643900423688192?s=21&t=_-OASXtDGwPJXnNpesXk8g)  

* Les URLs sont égales si les IP sont égales
* donc DNS lookup
* donc pas constant pour la vie de l’instance de JVM
* vive les hash des Set et Map :) 

## Conférences

[JavaDay au Paris JUG: Le futur de Java - le 22 juin 2022](https://javaday.parisjug.org/)  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

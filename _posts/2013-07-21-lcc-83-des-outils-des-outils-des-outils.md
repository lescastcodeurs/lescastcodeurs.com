---
title: LCC 83 - des outils des outils des outils
author: 'Emmanuel Bernard'
layout: blog-post
episode: 83
mp3_length: 51330027
---
Enregistré le 12 juillet 2013

Téléchargement de l'épisode [LesCastCodeurs-Episode-83.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-83.mp3)

## News

### Langages et JVM

Scala et la bourde de Rod Johnson <http://code.technically.us/post/54293186930/scala-in-2007-2013>  
L'alignement des structures en mémoire <http://www.infoq.com/news/2013/06/Native-Performance>  
Article sur le GC G1 <http://www.insightfullogic.com/blog/2013/jun/24/garbage-collection-java-4/>  

Intégration avec IntelliJ IDEA d'une VM qui permet du full HotSwap en développement  
<http://blogs.jetbrains.com/idea/2013/07/get-true-hot-swap-in-java-with-dcevm-and-intellij-idea/>  

DCEVM <http://ssw.jku.at/dcevm/>  
Java 8 feature complète <http://j.mp/11OqItQ>  

Article expliquant que les utilisateurs de Groovy seront prêts à passer facilement à Java 8  
<http://www.infoq.com/articles/groovy-to-Java-8>  

Oracle moins soucieux de la backward compatibilité ?

- Shay Banon qui note qu'une update change la sérialisation de `InetAddress`  
<https://twitter.com/kimchy/status/354881694282690560>
- Projet Groovy affecté par la suppression d'une méthode dans un package `sun.*` mais aucun workaround proposé  
<http://www.infoq.com/news/2013/07/Oracle-Removes-getCallerClass>  
<http://bugs.sun.com/bugdatabase/view_bug.do?bug_id=8014925>

Vulnérabilité des JavaDocs <http://www.kb.cert.org/vuls/id/225657>  
Un fix releasé dans la foulée par Cédric Champeau pour Gradle avec un plugin <https://github.com/melix/gradle-javadoc-hotfix-plugin>  
Un fix releasé dans la foulée par Olivier Lamy pour Maven avec la MAJ du plugin javadoc (2.9.1) <http://maven.apache.org/plugins/maven-javadoc-plugin>  

### Web

GWT.create, une conférence 100 % sur GWT <http://gwtcreate.com>  
Encodage d'URL, vous avez tort <http://blog.lunatech.com/2009/02/03/what-every-web-developer-must-know-about-url-encoding>  
Retour d'expérience sur le tout JavaScript <http://fr.slideshare.net/nzakas/enough-withthejavascriptalready>  

### Mobile et Bureau

Les jeux iOS vs Android <http://games.greggman.com/game/android-vs-ios-game-myths/>  
Liens sur Java Desktop <http://jonathangiles.net/blog/?p=1483>  

### Java EE et serveurs d'application

Les présentations des différentes specs  
<http://www.youtube.com/playlist?list=PL74xrT3oGQfCCLFJ2HCTR_iN5hV4penDz>

JSR 107 en public draft review  
Pivotal tcserver vs Apache Tomcat <http://blog.gopivotal.com/products/part-one-comparing-tomcat-and-pivotal-tc-server>  
Introduction à Inject et Default <http://java.dzone.com/articles/cdi-default-and-inject>  

La roadmap de Play 2.x  
<https://docs.google.com/document/d/11sVi1-REAIDFVHvwBrfRt1uXkBzROHQYgmcZNGJtDnA/pub>

WildFly 8 alpha 2 est sorti <http://jboss-as7-development.1055759.n5.nabble.com/wildfly-dev-8-0-0-Alpha2-Released-td5712259.html>  
Feature Flipping For Java <http://ff4j.org/>

### NoSQL, Big Data et cloud

Les mythes de Cassandra <http://www.infoq.com/articles/cassandra-mythology>  
HortonWorks reçoit 50 M <http://www.crunchbase.com/company/hortonworks>  
Le tck de Google App Engine et CapeDwarf <http://www.infoworld.com/d/cloud-computing/google-and-red-hat-collaborate-app-engine-in-private-clouds-221214>  

### Outils

GitHub introduit la capacité de releaser une librairie <https://github.com/blog/1547-release-your-software>  

- limité à 100 MB de stockage
- pas de statistiques de téléchargement

Bintray <https://bintray.com>  
Eclipse Kepler est sorti <http://eclipse.org/kepler/>  
m2eclipse <http://www.eclipse.org/m2e/>  
Arquillian pour Spring et Guice <http://bit.ly/19U3f2t>  
Packer, un créateur de VMs concurrent de Veewee créé par l'auteur de Vagrant <http://www.packer.io/>  
Bon tuto Git en Francais : <http://www.miximum.fr/tutos/1546-enfin-comprendre-git>  
Réutiliser des plugins Maven pour construire son propre plugin Maven : <https://github.com/TimMoore/mojo-executor>  

### Divers

Oracle relicence BerkleyDB de Sleepycat vers AGPL 3.0 <http://article.gmane.org/gmane.linux.debian.devel.legal/35034>  
Douglas Engelbart, l'inventeur de la souris est mort <http://www.nytimes.com/2013/07/04/technology/douglas-c-engelbart-inventor-of-the-computer-mouse-dies-at-88.html?ref=obituaries&_r=0>  
Encrypter ses données Dropbox <http://goo.gl/EUT1E>  
Se faire son Dropbox sécurisé chez soi avec son disque dur externe <http://www.kickstarter.com/projects/cloud-guys/plug-the-brain-of-your-devices>  
Sécuriser ses clefs SSH <http://martin.kleppmann.com/2013/05/24/improving-security-of-ssh-private-keys.html>  
InfoQ en français <http://www.infoq.com/fr>  

## Outils de l'épisode

Ncdu (disk usage in command line) <http://dev.yorhel.nl/ncdu>  
Encfs <http://www.arg0.net/encfs>  

## JUGs et conférences

- JUG Summer Camp - 20 septembre <https://sites.google.com/site/jugsummercamp/>
- Codeurs en Seine - 17 octobre 2013 - <http://www.codeursenseine.com/>
- Scala IO - 24-25 Octobre 2013 - the Scala and functionnal programming conference in Paris <http://scala.io/>  
- [Soft Shake](http://soft-shake.ch) 24, 25 octobre à Genève
- Devoxx Belgique - 11 - 15 Nov - <http://www.devoxx.be/#/>  

## Nous contacter

Contactez-nous via Twitter <http://twitter.com/lescastcodeurs>  
sur le groupe Google <http://groups.google.com/group/lescastcodeurs>  
ou sur le site Web <http://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <http://lescastcodeurs.com/>  
En savoir plus sur le sponsoring ? [sponsors@lescastcodeurs.com](mailto:sponsors@lescastcodeurs.com)

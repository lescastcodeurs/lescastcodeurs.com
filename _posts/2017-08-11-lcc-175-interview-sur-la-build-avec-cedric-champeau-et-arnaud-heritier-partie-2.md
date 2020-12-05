---
title: LCC 175 - Interview sur la build avec Cédric Champeau et Arnaud Héritier - partie 2
author: 'Emmanuel Bernard'
layout: blog-post
episode: 175
mp3_length: 85017000
tweet: Build, Maven et Gradle - @cedricchampeau et @aheritier round 2 #test #migration
---
Guillaume, Cédric et Arnaud se retrouvent autour du micro pour parler pendant une session marathon de 3h30 du build, de Maven et de Gradle.
Dans cette deuxième partie, on y discute tests puis on aborde des questions spécifiques à chaque outil. On aborde enfin le dilemme : migrer ou ne pas migrer, telle est la question. Le tout basé sur les questions posées sur la mailing list des cast codeurs : merci à vous !

Enregistré le 19 juillet 2017

Téléchargement de l'épisode [LesCastCodeurs-Episode-175.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-175.mp3)

## Interview

### Ta vie ton œuvre

[Cédric Champeau](https://twitter.com/cedricchampeau)  
[Gradle Inc.](https://gradle.com/enterprise)  
[Arnaud Héritier](https://twitter.com/aheritier)  
[Cloudbees](https://www.cloudbees.com)  

[Gradle](https://www.gradle.org)  
[Maven](http://maven.apache.org)  

### Les tests

Gradle / Maven : Quelle est la philosophie officielle des deux outils pour la gestion des tests au-delà des tests unitaires (une fois les différents modules assemblés et déployés) ?  
Dans des projets maven par exemple, je vois des fois des modules dédiés, en scope test ou scope runtime et lancés à la main, d'autres fois des projets indépendants. Chaque équipe a plus ou moins sa propre façon de gérer la chose mais rien n'a l'air vraiment normalisé (ou du moins partagé par la communauté).  

Gradle / Maven : Quels sont les 'best practices' pour faire du 'test and watch' (genre infinitest) avec maven et gradle ?  

### Les intégrations

Gradle : Pourquoi je ne peux pas faire de Run Tests sur un projet en Gradle dans IntelliJ alors qu'avec Maven je peux ?  
Gradle / Maven : Pour les deux, qu'en est-il de l'intégration dans les différents IDE ? J'ai été agréablement surpris par l'intégration de Gradle dans Netbeans, mais je n'ai pas beaucoup joué avec.  
Gradle / Maven : "Quid de l'intégration dans mon IDE préféré ?"  
Gradle / Maven : "Quid de l'intégration dans mon continuous build préféré ?"  

### Gradle en profondeur

Gradle : Y'a moyen de voir en Gradle à quel test je suis rendu ?

#### Gradlew/mvnw

* Gradle : Pourquoi mvnw et gradlew ne downloadent par leurs jars au lieu de nous forcer à les mettre dans .mvn et gradle ?
* Gradle : Pour Gradle, vous ne trouvez pas affreux ces fichiers "gradlew" et "gradlew.bat" à la racine de chaque projet dans github ?

#### Scripting vs XML

* Gradle : Est-il prévu de pouvoir avoir un fichier build.gradle a chaque niveau de la hiérarchie de tes modules au lieu d’avoir besoin de décrire manuellement tous les paths dans un fichier settings.gradle ? C’est un point que j’ai trouvé pénible (par ex <https://github.com/xwiki/xwiki-commons/blob/master/settings.gradle> et là je ne liste que qq modules - en pratique il y en a des centaines ds le build xwiki).
* Gradle : Est-ce que Gradle travaille à essayer d’homogénéiser encore plus les builds Gradle ? Qd j’ai essayé de convertir le build Maven de XWiki en Gradle, j’ai lu la doc puis j’ai regardé 4-5 builds différents en gradle pour voir les bonnes practices. Et la j’ai été embêté car chacun avait des pratiques un peu différentes. Au debut j’étais même paumé et puis apres qq heures de recherches j’ai commencé à identifier des patterns communs mais qd meme avec pas mal de variations. Du coup je n’ai pas su trouver facilement les best practices et j’ai dû me les faire et en consequence le build Gradle XWiki est lui aussi encore un peu different des autres probablement. Qu’est-il prévu sur le sujet ? En gros comme simplifier encore plus l’onboarding Gradle ?

#### BOM

Gradle : Le BOM de maven est-il une invention du malin ? Et quel est son équivalent pour Gradle ?

#### Android

Gradle : Pourquoi l'intégration de ces outils dans Android Studio est-elle aussi pathétiquement mauvaise ? (je suis obligé d'utiliser ce sous-outil, et j'ai mal à mon gradle : je ne peux pas voir mes dépendances facilement, et l'intégration se résume à une lecture de la liste des tâches et à leur lancement).

### Maven en profondeur

Maven : Quand est-ce que le bogue Maven du shade plugin qui ne remplace pas le jar d'origine pas le jar shadé sera corrigé ? (et que donc l'équipe Maven reviendra à la raison) ?  
Maven : Pour revenir au cycle de vie de Maven, serait-il possible de configurer des cycles de vies (notion de descripteurs de cycles de vie). En gros, pouvoir dire que mon projet suit un cycle de vie à 3 phases qui sont "resource, compile, install" et qu'un autre avec X phases comme compile, "prepare, ..., install, deploy-maven-repository, deploy-env")  
Maven : Pour Maven encore, il y avait-il me semble un projet polyglot pour les descripteurs, qu'en est-il ? Pourrait-on imaginer des descripteurs en yaml et/ou json ?  
Maven : y a-t-il beaucoup de boites qui dev leurs petits plugins Maven perso pour adapter à leurs problématiques ?  

#### Granularité / découpage de modules avec Maven

Maven : comment gérer les builds où l'appli finale est la résultante de nombreux multi-module Maven project, chacun dans un repo git perso avec leur version. Nous avons des problèmes pour gérer les évolutions de versions de chacun de ces multi-modules et faire en sorte que les modules qui en dépendent se MAJ vers la nouvelle version. Les BOM Maven sont une piste mais c'est pas clair...  
Maven : est-ce une bonne pratique de considérer comme absolue la règle selon laquelle tous les modules d'un multi-module Maven project doivent avoir le même numéro de version ?  
Maven : est-ce bien une mauvaise pratique que de mettre dans le même repo Git 2 multi-module Maven projects qui ne partagent pas le même parent ?  
Maven : les devs familiers avec Maven n'ont-ils pas trop tendance à découper leurs appli en modules Maven alors qu'ils pourraient se contenter des packages Java ? Je me rends compte que c'est mon cas perso...  
Maven : Pour des grosses applis, faites-vous plusieurs petits builds et un meta-build d'assemblage final agrégeant les petits morceaux ? Ou alors faites-vous un bon gros build qui dure longtemps mais recompile/repackage tout ? Ou alors vous laissez-vous le choix en faisant en sorte de pouvoir faire les 2 (sur Jenkins)  

Maven : "classpath too long" : c'est la résultante du point précédant. Nous commençons à nous heurter à des problèmes de "classpath too long" sous Windows pour des Proof of Concepts mixant de nombreux projets. Le point de non-retour est-il proche ? (Pour info, nous contournons temporairement le problème en ayant utilisé la commande mklink pour simlinker le repo Maven sur c:\repo et gagner quelques caractères sur chaque dépendance... oui, c'est tres moche)  
Maven : quid du paramétrage du build ? Par exemple actuellement nous avons une phase de packaging assez générique qui prend en entrée un numéro de version de l'application à packager. Merci Jenkins.  

### Migration

Migrer vers Gradle, mais pourquoi (pas) ? Et la valeur du build dans tout ça ...  
Gradle : Pourquoi est-ce que depuis 3 ans, je vais voir une prez de Cédric sur Gradle, et j'en ressors en me disant "Gradle, ça a l'air quand même vachement bien", et que l'année qui suit, je retourne voir une prez de Cédric l'année suivante sans avoir rien changé sur mes projets Java ?  
Gradle : Suis-je tellement fainéant dans mon petit confort de build Maven pour reposer sur mes acquis et ne pas switcher ? Je veux dire ... à chaque fois j'ai de bons arguments apportés par Cédric pour migrer, et pourtant, le switch ne se fait finalement pas.  
Gradle / Maven : Considère-t-on aujourd'hui le build comme accessoire sur un projet Java pour ne pas vouloir engager un investissement de migration ? (je parle beaucoup de mon cas perso ici, mais j'ai l'impression qu'il n'est pas si isolé que ça) Ou au contraire, est-ce tellement critique et relativement assez peu agile qu'on a trop peur d'en changer ? Si on reprend le cas de Ant vs Maven, pas mal de gens ont trainé à migrer, c'était trop risqué, les bonnes pratiques étaient encore peu connues, tout le monde avait peur de crasher son projet à cause de ca... Personne ne veut essuyer les plâtres d'une "nouvelle" techno de build avec son projet.  
Gradle : Peut-être Gradle en est-il encore là et a du mal à passer le cap des Early-Adopters (ceci dit, avec Android et son armée de développeurs d'apps ca devrait changer vite si c'est le cas ; tant qu'Android l'infidèle decide de rester sur Gradle :P  
Gradle : Et enfin, LE point-clé : est-ce que la migration de Maven a Gradle amène une valeur ajoutée suffisante pour justifier l'effort et le risque ? Je n'ai pas l'impression de lire beaucoup de retour d'expérience de projets qui disent avoir gagne radicalement en productivité en en qualité grace à une migration Maven->Gradle.  
Gradle / Maven : "je démarre un projet, Gradle ou Maven ?"  

### Conclusion

Gradle / Maven : les devs et le build : généralement, la grande majorité des devs ne s'y intéressent pas. À titre perso, je trouve ça fondamental, si le build est mal fait ça handicape tout le projet sans que les gens ne s'en aperçoivent malgré les effets négatifs, ils ne voient pas comment faire autrement => est-ce un ressenti que vous avez ?  

## Nous contacter

[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <https://lescastcodeurs.com/>  
En savoir plus sur le sponsoring ? [sponsors@lescastcodeurs.com](mailto:sponsors@lescastcodeurs.com)

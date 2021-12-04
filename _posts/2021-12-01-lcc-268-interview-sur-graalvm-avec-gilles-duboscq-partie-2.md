---
title: LCC 268 - Interview sur GraalVM avec Gilles Duboscq - partie 2
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 268
mp3_length: 53921110
tweet: Interview sur @graalvm avec @WoodenGil - partie 2
# tweet size: 91-93 -> 99-101 #######################################################################
---
Gilles Duboscq de OracleLabs discute des multiples facettes du projet GraalVM avec Emmanuel.
La partie 2 nous emmène vers GraalVM Native image, comment utiliser GraalVM en pratique en fonction des différents usages discutés, les versions, la communauté, comment c’est fait sous le capot et plein d’autres choses encore.
Si vous n’avez pas écouté la partie 1, je vous encourage à le faire.

Enregistré le 16 septembre 2021

Téléchargement de l’épisode [LesCastCodeurs-Episode-268.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-268.mp3)

## Interview

### Ta vie, ton œuvre

[Twitter de Gilles](https://twitter.com/WoodenGil)  

### Les concepts clés

La plupart des concepts sont couverts dans la partie 1.
La partie 2 fini sur la compilation native avant de passer à la suite.

Native:

* comment ça fonctionne
* Un JIT?
* quel GC
* Quels avantages
* Quels inconvénients?

Donc GraalVM c’est une JVM, quelles parties sont reprises de OpenJDK ?

### Comment on l’utilise en pratique

Je veux utiliser GraalVM pour mon code nodeJS, je fais comment ?  
Je veux utiliser GraalVM comme ma JVM de mon appli Java, je fais comment ?  

Je veux faire du native, comment je fais ?  
* concrètement, je dois faire gaffe à quoi ?

GraalVM Community vs Enterprise, quelles sont les différences ?

### Sous le capot

Comment on implémente un nouveau langage sur GraalVM ?

Comment on implémente Java sur Java  
C’est dur de supporter des nouveaux langages avec leur sémantique et leurs types != de la JVM

Comment l’interprétation de langages s’optimise

Comment les optimisations sont construites ?  
Des trucs cools à raconter sur les optimisations ?

C’est un chemin de combien d’années ?

WASM vs GraalVM, comment vous voyez la “standardisation de la VM” derrière WASM ?

### La communauté et le futur

Quelle license ?  
C’est juste Oracle ?  
Pourquoi c’est pas dans OpenJDK ?  
Comment la communauté code ensemble ?  

Des idées sur là où vous voulez aller ?  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

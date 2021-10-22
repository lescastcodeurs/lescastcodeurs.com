---
title: LCC 266 - Interview sur GraalVM avec Gilles Duboscq - partie 1
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 266
mp3_length: 42615398
tweet: Interview sur GraalVM avec @WoodenGil - partie 1
# tweet size: 91-93 -> 99-101 #######################################################################
---
Gilles Duboscq de OracleLabs discute des multiples facettes du projet GraalVM avec Emmanuel.
Dans cette première partie, nous discutons de l’histoire de GraalVM, de ses concepts fondamentaux et nous zoomons sur Truffle, Polyglot et Espresso, le support de JavaScript, Ruby, R, Python, LLVM, WASM... et Java dans GraalVM.
La partie 2 nous emmènera vers GraalVM Native image, comment utiliser GraalVM en pratique en fonction des différents usages discutés, les versions, la communauté, comment c’est fait sous le capot et plein d’autres choses encore.

Enregistré le 16 septembre 2021

Téléchargement de l’épisode [LesCastCodeurs-Episode-266.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-266.mp3)

## Interview

### Ta vie, ton œuvre

[Twitter de Gilles](https://twitter.com/WoodenGil)  

### GraalVM pour comprendre l’enjeu

[GraalVM](https://www.graalvm.org/)  

GraalVM en 3 phrases  
Les cas d’utilisation typique

[Maxine VM](https://maxine-vm.readthedocs.io/en/stable/index.html)  

### Les concepts clés

Graal le compilateur et le JIT  

* c’est quoi un JIT
* Pourquoi pas basé sur HotSpot  
* Pourquoi en Java ?
* des cas d’utilisations préférés par GraalVM JIT vs HotSpot (et vice versa)

Truffle et polyglot

* Java qui tourne d’autres langages, lesquels ?
* comment ça marche, génère du byte code ? Interprète ?
* Comment les codes de différents langages interagissent ?

JavaScript, Ruby, R, Python, [LLVM](https://llvm.org/), [WASM](https://webassembly.org/)... et Java  
[Arbre syntaxique](https://fr.wikipedia.org/wiki/Arbre_de_la_syntaxe_abstraite)  

Espresso:

* Java sur Java (what??!), ca veut dire quoi exactement?
* Quels usages?
* niveau de stabilité, maturité ?

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

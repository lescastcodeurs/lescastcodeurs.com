---
title: LCC 257 - Interview Java 16 avec José Paumard et Henri Tremblay - partie 2
author: 'Emmanuel Bernard'
layout: blog-post
episode: 257
mgp3_length: 85017000
tweet: Interview Java 16 avec @JosePaumard et @henri_tremblay - partie 2
# tweet size: 91-93 -> 99-101 #######################################################################
---
José (maintenant Java Advocate chez Oracle - le cachotier) et Henri échangent avec Emmanuel sur la sortie de Java 16. 
Cette deuxième partie voit l'équipe discuter de la propriété illegal access (JEP 396), de l'API vectorielle, de la foreign linker API et d'autres choses.

Enregistré le 8 avril 2021

Téléchargement de l'épisode [LesCastCodeurs-Episode-257.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-257.mp3)  

## Interview

### Ta vie, ton oeuvre

[José Paumard](https://twitter.com/JosePaumard)  
[Henri Tremblay](https://twitter.com/henri_tremblay)  

### Illegal access pass en deny par défaut (Henri)

JEP 396 (encapsulation force des parties internes du JDK).  
[FEATURE Make Lombok compatible with JDK 16 · Issue #2681 · rzwitserloot/lombok · GitHub](https://github.com/rzwitserloot/lombok/issues/2681)

### API vecteur

Les `Vector` sont de retour ?!
Discussion autour du parallélisme au niveau CPU — [Simple Instruction Multiple Data](https://fr.wikipedia.org/wiki/Single_instruction_multiple_data)  

### Foreign Linker API

Pour projet Panama  
Lier une méthode native avec du code Java  
Du coup on a aussi un foreign memory access API ?  

[Project panama and jextract – Inside.java](https://inside.java/2020/10/06/jextract/) Jextract genera le code Java à partir du fichier de declaration C. 

### JVM sur d’autres plateformes

Alpine Linux et Musl  
AArch64 (ARM) sous Windows  

### ZGC

Move ZGC thread-stack processing from safepoints to a concurrent phase.

### Autres

* Mercurial -> git  
* Return unused HotSpot class-metadata (i.e., *metaspace*) memory to the operating system more promptly, reduce metaspace footprint, and simplify the metaspace code in order to reduce maintenance costs.

### Bonus Java 15

Shenandoah  
Text blocks  
Plus de Nashorn  
Une discussion autour de GraalVM  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr: -->

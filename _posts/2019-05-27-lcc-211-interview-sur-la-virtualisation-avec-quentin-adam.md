---
title: LCC 211 - Interview sur la virtualisation avec Quentin Adam
author: 'Emmanuel Bernard'
layout: blog-post
episode: 211
mp3_length: 65924901
tweet: Interview sur la virtualisation avec @waxzce
# tweet size: 91-93 -> 99-101 #######################################################################
---
Quentin Adam (CEO de Clever Cloud) et Emmanuel discutent la stack de bas en haut, du physique au software sous l'angle de la virtualisation.
Et bien sûr, une petite dérive de la conversation de temps en temps, parce qu'on le vaut bien.

Enregistré le 27 mars 2019

Téléchargement de l'épisode [LesCastCodeurs-Episode-211.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-211.mp3)

## Interview

### Ta vie, ton oeuvre

[@waxzce](https://twitter.com/waxzce)  
[Clever Cloud](https://www.clever-cloud.com/)  

### Pourquoi virtualise-t-on ?

[Para-virtualisation](https://en.wikipedia.org/wiki/Paravirtualization)  
[Xen](https://en.wikipedia.org/wiki/Xen)  

### Le processeur physique

CPU, registres, caches, bus mémoire  
GPU

[ASIC](https://en.wikipedia.org/wiki/Application-specific_integrated_circuit)  
[CPU](https://en.wikipedia.org/wiki/Central_processing_unit)  
[FPGA](https://en.wikipedia.org/wiki/Field-programmable_gate_array)  

[Protection ring](https://en.wikipedia.org/wiki/Protection_ring)  

### Le microcode

Un petit détour sur spectre et meltdown

### Un OS et la virtualisation

Abstraction au hardware  
Separation du temps CPU, memoire  
Address virtuelle  

[QEMU](https://www.qemu.org/)  
[VirtIO](https://www.linux-kvm.org/page/Virtio)  
[Spectre and Metldown](https://meltdownattack.com/)  

### Container (“Isolateur”)

[Container vs zones vs jails vs VMs](https://blog.jessfraz.com/post/containers-zones-jails-vms/)  

### Noyau en espace utilisateur

[gVisor](https://gvisor.dev/)  
[ReiserFS](https://en.wikipedia.org/wiki/ReiserFS)  
[Kata Containers](https://katacontainers.io/)  
[WebAssembly](https://en.wikipedia.org/wiki/WebAssembly)  

Et par rapport à Kata Containers par exemple ? ou KVM ?  
Quels sont les avantages / inconvénients ?  
(mémoire, sécurité/sandboxing, rapidité de démarrage...)  

### Modèle économique, recompilation pour le matériel physique et conclusion

[Exherbo](https://exherbo.org/)  

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>

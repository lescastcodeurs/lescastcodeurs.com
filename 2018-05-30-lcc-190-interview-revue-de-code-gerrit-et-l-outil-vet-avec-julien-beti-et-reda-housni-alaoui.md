---
title: LCC 190 - Interview revue de code Gerrit et l'outil Vet avec Julien Béti et Réda Housni-Alaoui
author: 'Emmanuel Bernard'
layout: blog-post
episode: 190
mp3_length:
tweet: Conférences et tests par mutation
# tweet size: 91-93 -> 99-101 #######################################################################
---
Julien et Reda viennet nous parler de Gerrit et de son système de revue de code ; puis de l'outil Vet qu'ils ont open sourcé.
Et José Paumard nous fait

    try ( José josé = new José(2018) ) {
        Audio crowdcast = Stream.of( josé.interview(), josé.interview(), josé.interview(), josé.interview() )
           .map( Audio::normalize )
           .filter( a -> ! a.tooNoisy() )
           .collect( AudioCollectors.joining( " fade out <-> fade in " ) );
        return crowdcast;
    }

Enregistré le 15 mai 2018

Téléchargement de l'épisode [LesCastCodeurs-Episode-190.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-190.mp3)

## Interview

### Ta vie, ton œuvre

[Cosium](https://www.cosium.com)  
[Julien Béti, CTO](julien.beti@cosium.com)  
[Réda Housni-Alaoui, Architecte](reda.housnialaoui@cosium.com)  

### Gerrit

Le sujet: notre passage à Gerrit et le client associé que nous avons mis en place: Vet. Un article sur le sujet que Réda avait écrit sur le sujet: <https://medium.com/@rdahousnialaoui/abandoning-bitbucket-server-in-favor-of-gerrit-ee6b60e01795>  

[BitBucket](https://www.atlassian.com/software/bitbucket/server)  

[La page GitHub de Vet, en full Java 9, avec utilisation de JLink \o/](https://github.com/Cosium/vet)  
[Un plugin IntelliJ est en cours de développement](https://github.com/Cosium/vet-intellij-plugin)  

Dans l'interview, nous n'avons pas eu le temps de parler:
De Vet et des workflows associés (via les commandes documentées sur la page GitHub) qui permettent de verrouiller les push sur le git remote.
De l'aspect extensible de Gerrit qui permet, par exemple, d'appliquer automatiquement une PR lorsque l'ensemble des conditions sont réunies (+2 d'un reviewer, pas de -1 d'un reviewer, +1 de Jenkins) et ce quelque soit l'ordre d'arrivée.

Concernant la problématique que tu as évoqué de "commit annexe", il est en fait possible dans Gerrit de créer une dépendance entre PR. Nous n'utilisons pas cette fonction, il est donc possible que quelques modifications sur Vet soient nécessaire pour en tirer profit. Plus d'infos ici: <https://gerrit-review.googlesource.com/Documentation/concept-changes.html#related-changes>

## Le crowdcast de José Paumard

[@JosePaumard](https://twitter.com/josepaumard/)  

## Nous contacter

[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <https://lescastcodeurs.com/>  
En savoir plus sur le sponsoring? <sponsors@lescastcodeurs.com>

---
title: LCC 241 - Interview Cloud IDE avec Sun Tan et Marc Dumais
author: 'Emmanuel Bernard'
layout: blog-post
episode: 241
mp3_length: 85017000
tweet: Interview Cloud IDE avec Sun Tan et Marc Dumais
# tweet size: 91-93 -> 99-101 #######################################################################
---
Marc Dumais et Sun Tan discutent des Cloud IDEs autour du micro. En particulier de Eclipse Che et de Eclipse Theia.

Enregistré le 30 octobre 2020  

Téléchargement de l'épisode [LesCastCodeurs-Episode-241.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-241.mp3)  

## Interview

### Ta vie ton oeuvre

[Marc Dumais](https://projects.eclipse.org/user/2334)  

Twitter de Sun [@\_\_sunix\_](https://twitter.com/__sunix_)  
Le [CFP young blood VIII du ParisJUG](https://docs.google.com/forms/d/e/1FAIpQLSfLfo2R96VH-gnUdc2moIrOmG-fqCN2l0X0896GK_JvpsmC8Q/viewform)  

### Eclipse Theia en 2 minutes

[Eclipse Theia](https://theia-ide.org/)  
[VSCode](https://code.visualstudio.com/)  

### Eclipse Che en 2 minutes

[Eclipse Che](https://www.eclipse.org/che/)  

### l'écosystème et la concurrence

Beaucoup de rachats d’IDEs dans le cloud :

- [GitHub Codespaces](https://github.com/features/codespaces)  
- [Cloud9](https://aws.amazon.com/cloud9/)

[Broadwayd](https://developer.gnome.org/gtk3/stable/broadwayd.html)  


### Le cloud IDE au quotidien

J’ai pris mon café, maintenant je fais quoi?  
Chrome ou Firefox?  
Comment je sync avec mon repo Git  
Signer avec la clé GPG (sur le serveur?)  
Je veux installer une extension je fais comment  

Je partage du code avec quelqu’un, il se passe quoi  
Je peux partager le même workspace?  

Vous utilisez des workspaces différents comment?  

Parler de devfile  

Comment j’installe Che ?  
docker local?  
kube  

Experience  
Theia plugin  

La doc pour [installer Che dans GCP](https://www.eclipse.org/che/docs/che-7/installation-guide/installing-che-on-google-cloud-platform/)  

### Les types de flots de développement que cela ouvre

Vs un IDE local

Je peux avoir un IDE local et les avantages de l’IDE du cloud?

### Sous le capot

Comment ça s’écrit la partie interface IDE  
Reactivité  
Latence  
Desktop vs cloud Thea  

Eclipse Theia  
Vient de quel besoin  
separé d’éclipse classique?  
Qui utilise Theia ?  

### Architecture

Il y a quoi derrière mon navigateur:

* Che server  
* Che workspace  
* Theia  
* VS code extensions
* Debug server
* Kube
* “Tooling services”
* <https://www.eclipse.org/che/technology/>

Il reste quelque chose de [l’eXo Cloud IDE](https://www.exoplatform.com/blog/2011/07/20/exo-cloud-ide-first-to-support-java-direct-paas-deployments-for-developers/) ?

### VSCode extensions

Comment ça fonctionne  
Protocole interaction

### Communauté

Quel est l'écosystème  

Essayez Gitpod en ouvrant le project Eclipse Theia. Requiert un compte GitHub et un browser web moderne <https://gitpod.io/#https://github.com/eclipse-theia/theia>

Exemple d’utilisation de Gitpod pour générer une version à jour des statistiques de contribution au projet: 
<https://gitpod.io/#https://github.com/marcdumais-work/gitstats>

Twitter: [@eclipse_che](https://twitter.com/eclipse_che) et [\#Chejoy](https://twitter.com/search?q=%40eclipse_che%20%23chejoy&src=typed_query&f=live)  
Pour tester Che: <https://che.openshift.io/> 

## Nous contacter

[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <https://lescastcodeurs.com/>  
En savoir plus sur le sponsoring? <sponsors@lescastcodeurs.com>


---
title: LCC 135 - Interview Docker avec Patrick Chanezon - partie 2
author: 'Emmanuel Bernard'
layout: blog-post
episode: 135
mp3_length: 66418694
---
Dans cette second partie, Patrick nous explique l'écosystème Docker au sens large.
On discute aussi de la mission de l'informatique.

Enregistré le 25 août 2015

Téléchargement de l'épisode [LesCastCodeurs-Episode-135.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-135.mp3)

## Sponsor - Criteo 

<p class="sponsor">
<img src="/images/promo/sponsors/criteo-198x54px.png" alt="Criteo" />
Les 270+ ingénieurs de Criteo construisent les prochains outils pour la publicité en ligne qui gèrent des milliards d’impressions, chacune personnalisée automatiquement par internaute.
Au-delà des buzzwords, nous faisons vraiment du big data et du machine learning à l’échelle.
Nous sommes l’une des meilleures équipes d’ingénieurs en Europe et nous travaillons efficacement dans une ambiance décontractée.
<a href="http://labs.criteo.com">Le blog Criteo</a>.
</p>


## Interview

### Ta vie, ton oeuvre

[@chanezon](https://twitter.com/chanezon)  
[Blog de Patrick Chanezon (pas trop à jour)](http://wordpress.chanezon.com)  

### Les outils autour et l'écosystème

Docker sur une machine c'est bien, mais c'est mieux à plusieurs  

Scheduling, cluster management, provisioning de nouveaux hosts  
Gérer une ferme de docker containers  
Distribuer entre différents hosts physiques  
Trop de dockers sur un host, il se passe quoi ?  
On peut se faire héberger ses images docker ?  
Comment se gère la scalabilite (i.e. Lancer un deuxième containers de cette image)  

[Flocker plugin](https://github.com/ClusterHQ/flocker-docker-plugin)  
[ZFS](https://en.wikipedia.org/wiki/ZFS)  

Les différents projets par catégorie

#### Orchestration

[Kubernetes](http://kubernetes.io)  
[Apache Mesos](https://mesos.apache.org)  
[Docker Swarm](https://docs.docker.com/swarm/)  
[CoreOS Fleet](https://coreos.com/fleet/docs/latest/launching-containers-fleet.html)  
[Docker Compose](https://docs.docker.com/compose/)  

#### Distributions

[CoreOS](https://coreos.com)  
[Project Atomic par Red Hat](http://www.projectatomic.io)  
[Ubuntu Core](https://wiki.ubuntu.com/Core)  
[Photon OS par VMWare](https://vmware.github.io/photon/)  
[RancherOS](http://rancher.com/rancher-os/)  
[Windows nano server](http://blogs.technet.com/b/windowsserver/archive/2015/04/08/microsoft-announces-nano-server-for-modern-apps-and-cloud.aspx)  

#### Couche réseau

[Flannel](https://coreos.com/flannel/docs/latest/)  
[Weave](http://docs.weave.works/weave/latest_release/index.html)  

#### Integration Jenkins Docker  

[Jenkins](http://jenkins-ci.org)  

### Fork me baby

Le "combat de communauté" avec CoreOS  
Les formats d'images  
Une fondation  

[Open Container Initiative (OCI)](https://www.opencontainers.org)  
[Open Container Format (OCF)](http://blog.docker.com/2015/07/open-container-format-progress-report/)  
[RunC](http://runc.io)  
[Cloud Native Container Foundation](https://cncf.io)  

### La productisation

Certaines voix se lèvent sur l'état de docker en prod  
[L'expérience en production](http://sirupsen.com/production-docker/)  
Confiance dans les images et les images de base  
[Docker Notary](http://blog.docker.com/tag/docker-notary/)  

[Ansible](http://www.ansible.com)  
[Vault](https://github.com/dontrebootme/docker-vault)  

Si on a une orchestration docker, quid du clustering et autre des applis ou middleware hébergés  

### La boite Docker

[dotCloud](http://dotcloud.com)  
Quoi ? Des Français ?  
Le business model ?  
Cool de bosser pour eux ?  

### Futur

Ou aller pour commencer  
[Docker Toolbox](https://www.docker.com/toolbox)  

[Slideshare de Patrick](http://www.slideshare.net/chanezon)  
[Exemple d'application Java avec un dockerfile et compose](https://github.com/joshlong/spring-doge)  
[Version avec le plugin Maven Spotify](https://github.com/joshlong/spring-doge/pull/11/commits)  

[Unikernel](http://queue.acm.org/detail.cfm?id=2566628)  
[Mirage OS](https://mirage.io)  

[JGroups](http://jgroups.org)  

## Nous contacter

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>
ou sur le site web <https://lescastcodeurs.com/>
Flattr-ez nous (dons) sur <https://lescastcodeurs.com/>
En savoir plus sur le sponsoring? sponsors@lescastcodeurs.com

---
title: LCC 133 - Interview Docker avec Patrick Chanezon - partie 1
author: 'Emmanuel Bernard'
layout: blog-post
episode: 133
mp3_length: 56249169
---
Dans cet épisode, Patrick nous explique Docker: la technologie, les cas d'utilisation, comment l'utiliser.
On parlera dans la seconde partie de l'écosystème Docker au sens large.  
Un grand merci à Google pour sa participation, aller découvrir leur conférence [GCP Next à Paris le 13 octobre](https://goo.gl/7wWQGv).

Enregistré le 25 août 2015

Téléchargement de l'épisode [LesCastCodeurs-Episode-133.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-133.mp3)

## Sponsor - Google

<p class="sponsor">
<img src="/images/promo/sponsors/google-200px.png" alt="Google" />
L'événement gratuit GCP Next à Paris le 13 octobre, c'est l'occasion pour les développeurs de mieux comprendre le Cloud de Google
et de ses technologies de conteneur, sa solutions de backend pour mobile et web, son BigData au delà de map-reduce
et sans oublier ses offres d'infrastructure et de plateforme.
La journée comprend une keynote, des sessions techniques, des démos, des codelabs et bien entendu une opportunité de networking.
<a href="https://goo.gl/7wWQGv">Inscrivez-vous</a>.
</p>

## Interview

### Ta vie, ton oeuvre

[@chanezon](https://twitter.com/chanezon)  
[Blog de Patrick Chanezon (pas trop à jour)](http://wordpress.chanezon.com)  

### Introduction

Qu’est-ce que Docker en quelques mots?
Pour quels cas d’utilisation?

[Docker](https://www.docker.com)  
[Les containers dans les systèmes d'exploitation](https://en.wikipedia.org/wiki/Operating-system-level_virtualization)  
[cgroups](https://en.wikipedia.org/wiki/Cgroups)  
[namespaces Linux](http://man7.org/linux/man-pages/man7/namespaces.7.html)  
[Linux Containers (LXC)](https://linuxcontainers.org)  
[Système de fichier copy-on-write](https://en.wikipedia.org/wiki/Copy-on-write#Copy-on-write_in_storage_media)  

[Docker Hub](https://hub.docker.com)  
[Docker trusted registry](https://www.docker.com/docker-trusted-registry)  
[DockerCon](http://europe-2015.dockercon.com)  
[Shaving the Yak](http://www.hanselman.com/blog/YakShavingDefinedIllGetThatDoneAsSoonAsIShaveThisYak.aspx)  

### Docker côté technique

La différence avec une VM ?  
Quelles technos en dessous ?  

dockerfile et les images  
Quid de la maintenance de ces images (sécurité etc)  
Docker et/vs ansible chef ou puppet  

Y a-t-il des distributions spécial docker ?

Je peux faire tourner une distribution entière dedans ? Y compris le graphique ?  
Docker natif Linux, natif Windows ? Et les Mac ? Et les téléphones mobiles ?  

[Ansible](http://www.ansible.com)  
[Chef](https://www.chef.io/chef/)  
[Puppet](https://puppetlabs.com)  

[Docker Toolbox (Mac OS X ou Windows](https://www.docker.com/toolbox)  
[Docker Machine](https://www.docker.com/docker-machine)  
[Docker pour FreeBSD](https://wiki.freebsd.org/Docker)  

Tout en ligne de commande, un peu Git des débuts.

[Les blogs sur la sécurité chez Docker](http://blog.docker.com/category/engineering/security-2/)  
[Phusion passenger](https://github.com/phusion/passenger-docker)  

### Le processus étape par étape

Faire tourner un web server une base de données

- installer docker
- construire les images
- comment passer des variables à l'image
- comment ouvrir les ports
- comment je connais l'ip de l'autre image?
- comment partager des fichiers entre docker et le monde extérieur
- quand je redémarre, je perds les données "transitantes"
- le backup des images
- le backup des données
- donner une image a mon collègue

[Exemple d'application Java avec un dockerfile et compose](https://github.com/joshlong/spring-doge)  
[Version avec le plugin Maven Spotify](https://github.com/joshlong/spring-doge/pull/11/commits)  

[Quay.io](https://quay.io)  

Docker impose une architecture SOA ou micro services ?  
Les images à .5GB et le mouvement vers les micro images.

## Nous contacter

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>
ou sur le site web <https://lescastcodeurs.com/>
Flattr-ez nous (dons) sur <https://lescastcodeurs.com/>
En savoir plus sur le sponsoring? sponsors@lescastcodeurs.com

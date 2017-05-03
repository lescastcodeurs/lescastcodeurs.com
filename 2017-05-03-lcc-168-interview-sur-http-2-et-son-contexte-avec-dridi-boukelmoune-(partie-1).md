---
title: LCC 168 - Interview sur HTTP 2 et son contexte avec Dridi Boukelmoune (partie 1)
author: 'Emmanuel Bernard'
layout: blog-post
episode: 168
mgp3_length: 85017000
tweet: "Interview sur HTTP 2, l'histoire d'HTTP et les couches sous HTTP avec @dboukelmoune (partie 1)"
---
Dans cette épisode on discute d'HTTP/2 avec Dridi Boukelmoune.
Pour bien tout comprendre, on discute des couches en dessous et associées: TLS, UDP, TCP, QUIC.
Et on parle d'HTTP/0.9 et après pour comprendre pourquoi on est à HTTP/2.
Cette première partie aborde OSI, HTTP jusqu'à 1.1, la couche de transport (TCP, UDP, QUIC) et TLS.

Enregistré le 17 mars 2017

Téléchargement de l'épisode [LesCastCodeurs-Episode-168.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-168.mp3)

## Interview

### Ta vie ton œuvre

[GitHub](https://github.com/dridi/)  
[@dboukelmoune](https://twitter.com/dboukelmoune)  
[Varnish Cache](https://www.varnish-cache.org/)  
[Content Delivery Network](https://en.wikipedia.org/wiki/Content_delivery_network)  

### OSI

[Modèle OSI (Open System Interconnection)](https://fr.wikipedia.org/wiki/Mod%C3%A8le_OSI)  

### HTTP

[HTTP/0.9](https://www.w3.org/DesignIssues/HTTP0.9Summary.html)  
[HTTP/1.0](https://tools.ietf.org/html/rfc1945)  
[HTTP/1.1](https://tools.ietf.org/html/rfc2616)  

#### Principes

Pour info la RFC 2616 a été écrite en comité, du coup ce n'est pas
toujours cohérent, et parfois contradictoire. En parallèle du
développement de HTTP/2 une nouvelle version de la spec est parue pour
clarifier et rectifier certains points. Aussi pour rendre la lecture
plus digeste en ayant une rédaction un peu plus "algorithmique" (une
tendance générale dans les RFC récentes).

* <https://tools.ietf.org/html/rfc7230>
* <https://tools.ietf.org/html/rfc7231>
* <https://tools.ietf.org/html/rfc7232>
* <https://tools.ietf.org/html/rfc7233>
* <https://tools.ietf.org/html/rfc7234>
* <https://tools.ietf.org/html/rfc7235>

En bonus la spec des URI:

* <https://tools.ietf.org/html/rfc3986>
* <https://tools.ietf.org/html/rfc6874>
* <https://tools.ietf.org/html/rfc7320>

#### Protocole des cookies

<https://tools.ietf.org/html/rfc6265>

### Le transport

[HTTP](https://tools.ietf.org/html/rfc7230#section-2.1)  
[CGI](https://tools.ietf.org/html/rfc3875)  

#### TCP

<https://tools.ietf.org/html/rfc793>

#### UDP

<https://tools.ietf.org/html/rfc768>

#### QUIC

Parce qu'avec UDP il faut se charger de tout, c'est plus difficile.
Une vulnérabilité face à une attaque de rejeu a été identifiée lors de
la première présentation du protocole à l'IETF.

<https://www.ietfjournal.org/quic-performance-and-security-at-the-transport-layer/>

Errata:

J'aurais dû vérifier au lieu de dire des bêtises, QUIC n'utilise pas
TLS à proprement parler. Je pense que le seul point commun est
d'utiliser la même chaîne de certificats. Pour ma défense c'est hors
scope dans mon boulot :)

Du coup QUIC serait plutôt aux niveaux 5 et 6 du modèle OSI.

#### TLS

[TLS](https://tools.ietf.org/html/rfc5246)  
[Extensions](https://tools.ietf.org/html/rfc6066)  
[Server Name Indication (SNI)](https://en.wikipedia.org/wiki/Server_Name_Indication)  

### La suite

HTTPS, HTTP/2, REST dans la partie 2.

## Nous contacter

[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <https://lescastcodeurs.com/>  
En savoir plus sur le sponsoring? sponsors@lescastcodeurs.com

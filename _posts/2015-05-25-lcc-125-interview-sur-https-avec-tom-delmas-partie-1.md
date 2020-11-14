---
title: LCC 125 - Interview sur HTTPS avec Tom Delmas - partie 1
author: 'Emmanuel Bernard'
layout: blog-post
episode: 125
mp3_length: 57623662
---
Emmanuel et Arnaud discutent avec Tom Delmas d'HTTPS.
Comment ça marche, quelles sont les faiblesses et les diverses protections.
Mais aussi comment mettre en place concrètement un certificat sur un site web.

Enregistré le 23 mai 2015

Téléchargement de l'épisode [LesCastCodeurs-Episode-125.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-125.mp3)  

## Interview

### Ta vie ton œuvre

[@kermiite](https://twitter.com/kermiite)  
[Blog de Tom Delmas](https://blog.tdelmas.ovh)  
[ENSIIE](http://www.ensiie.fr)  
[GroupCamp](http://www.groupcamp.fr)  

### Pourquoi HTTPS

Protection de la vie privée  

* [FireSheep](http://www.pcworld.com/article/209333/how_to_hijack_facebook_using_firesheep.html)  

Protection contre les méthodes de certains FAI:

* [Ajout de publicités](http://arstechnica.com/tech-policy/2014/09/why-comcasts-javascript-ad-injections-threaten-security-net-neutrality/)
* [Ajout de cookies](https://www.eff.org/fr/deeplinks/2014/11/verizon-x-uidh)

[Obligation légale de protection des données personnelles](http://vosdroits.service-public.fr/professionnels-entreprises/F24270.xhtml#N1014E)

> Des détails sur le fait que Chrome et FF vont déprécier des trucs en HTTP. - Hubert SABLONNIÈRE
> Le HTTPS avec HTTP2 ? - Hubert SABLONNIÈRE

[Des infos sur HTTPS et HTTP/2](http://daniel.haxx.se/blog/2015/03/06/tls-in-http2/)  

> Mise en place d interception SSL chez un client est ce légal ? Pour surveiller les comme et interdire les posts sur facebook. - Rémy Menétrieux

[Les recommandations de la CNIL sur l'analyse de flux HTTPS](http://www.cnil.fr/linstitution/actualite/article/article/analyse-de-flux-https-bonnes-pratiques-et-questions/)  

### Comment marche HTTPS

Ca veut dire quoi être sous [HTTPS](https://en.wikipedia.org/wiki/HTTPS)  
SSL v2 v3 [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security) 1.0, 1.2 c’est quoi tout ce bazar.  
Les différents niveaux de certificats SSL (classes)  

* [Certificat extended validation](https://en.wikipedia.org/wiki/Extended_Validation_Certificate)  

[Chrome vs SHA1](https://blog.filippo.io/the-unofficial-chrome-sha1-faq/)  
[Attaque des suites d'export](http://thehackernews.com/2015/03/freak-openssl-vulnerability.html)  

Les différences entre les certificats SSL:  

- simple
- [wildcard](https://en.wikipedia.org/wiki/Wildcard_certificate)  
- [Multiple domaines](http://info.ssl.com/article.aspx?id=12157)  

Un certificat == 1 IP ou pas avec le SNI  
[Server Name Indication](https://en.wikipedia.org/wiki/Server_Name_Indication)  

### Les autorités de certification

Pourquoi mon navigateur a confiance dans le serveur SSL des cast codeurs?

Nos navigateurs autorisent des centaines de CA
Une seule suffit à tout bousiller

[CNNIC banni par Google](http://www.fierceitsecurity.com/story/google-drop-chinas-cnnic-root-certificate-chrome-browser/2015-04-02)  
[CNNIC dénonce l'attitude de Google](http://www.reuters.com/article/2015/04/02/us-china-google-iduskbn0mt09v20150402)  
[ANSSI chopée par Google](http://googleonlinesecurity.blogspot.fr/2013/12/further-improving-digital-certificate.html)  

Discussion sur les proxy et les proxy SSL

[Google Chrome HTTPS pinning](https://www.imperialviolet.org/2011/05/04/pinning.html)   
[Mozilla se base sur la liste de chrome](https://wiki.mozilla.org/SecurityEngineering/Public_Key_Pinning)  
[HPKP](https://timtaubert.de/blog/2014/10/http-public-key-pinning-explained/)  
[DANE](http://www.bortzmeyer.org/6698.html)  
[DNSSEC](https://wiki.mozilla.org/Security/DNSSEC-TLS-details)  
[Key pinning et interceptions](https://www.chromium.org/Home/chromium-security/security-faq#TOC-How-does-key-pinning-interact-with-local-proxies-and-filters-)  
[Pas de DANE dans les navigateurs](https://www.imperialviolet.org/2015/01/17/notdane.html)  

Les autorités de certification gratuites:

* <https://www.startssl.com/> (mais révoquation payante)
* <https://www.wosign.com/english/freeSSL.htm>
* <https://fr.godaddy.com/ssl/ssl-open-source.aspx> (pour les projets open source)
* <https://letsencrypt.org> (futur proche)

> Comment les vendeurs de browsers choisissent les CA qu'ils supportent nativement? Procédure standard ou jungle? - Jean-Baptiste Nizet

[Mozilla a des critères](https://www.mozilla.org/en-US/about/governance/policies/security-group/certs/policy/)  
Pas que les navigateurs mais aussi les systèmes d'exploitation  
Forum des CA  
[CACert](http://www.cacert.org)  

> Pourquoi n'existe-t-il pas de CA public. L'Etat n'est-il pas plus habilité pour ce service que des boîtes privées?  - Jean-Baptiste Nizet

Il y en a plein en fait France, US, Chine et autre: Departement de la defense américain, Hong-Kong post office etc

### La suite

Comment obtenir un certificat.  
Comment serrer les boulons.  

## Nous contacter

Contactez-nous via twitter <http://twitter.com/lescastcodeurs>  
sur le groupe Google <http://groups.google.com/group/lescastcodeurs>  
ou sur le site web <http://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <http://lescastcodeurs.com/>  
En savoir plus sur le sponsoring? sponsors@lescastcodeurs.com


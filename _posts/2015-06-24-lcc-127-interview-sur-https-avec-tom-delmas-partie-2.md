---
title: LCC 127 - Interview sur HTTPS avec Tom Delmas - partie 2
author: 'Emmanuel Bernard'
layout: blog-post
episode: 127
mp3_length: 45362634
---
Emmanuel et Arnaud continuent la discussion avec Tom Delmas sur HTTPS.
Comment ça marche, quelles sont les faiblesses et les diverses protections.
Mais aussi comment mettre en place concrètement un certificat sur un site web.

Cette partie rentre dans le concret et explique quelques astuces pour serrer les boulons.

Enregistré le 23 mai 2015

Téléchargement de l'épisode [LesCastCodeurs-Episode-127.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-127.mp3)  

## Interview

### Ta vie ton œuvre

[@kermiite](https://twitter.com/kermiite)  
[Blog de Tom Delmas](https://blog.tdelmas.ovh)  
[ENSIIE](http://www.ensiie.fr)  
[GroupCamp](http://www.groupcamp.fr)  

### Comment obtenir un certificat SSL

[Certificate signing request](https://en.wikipedia.org/wiki/Certificate_signing_request)  
Quelle taille de clef (2048, 4096) ?  
Quel temps de validité (1 an, 10 ans) ?

Comment j’installe mon certificat sur ma machine ?  
[Les configurations recommandées par Mozilla](https://wiki.mozilla.org/Security/Server_Side_TLS)  
[Le générateur de configuration de Mozilla](https://mozilla.github.io/server-side-tls/ssl-config-generator/)  

### Les boulons à serrer

La révocation de certificat

* [CRL](https://en.wikipedia.org/wiki/Revocation_list)
* [OCSP](https://en.wikipedia.org/wiki/Online_Certificate_Status_Protocol)
* [OCSP Stapling](https://en.wikipedia.org/wiki/OCSP_stapling)  

[HPKP (HTTPS Public Key Pinning)](https://developer.mozilla.org/en-US/docs/Web/Security/Public_Key_Pinning)  
[HSTS (HTTPS Strict Transport Security)](https://developer.mozilla.org/fr/docs/S%C3%A9curit%C3%A9/HTTP_Strict_Transport_Security)  
[SSLStrip](http://security.stackexchange.com/questions/41988/how-does-sslstrip-work)  

> Techniques/Tools pour gérer plusieurs certificats dans un boite ? Où stocker les 'choses' sensibles ? Centraliser ? - Maxence Warzecha

> Comment passer un site en https sans perdre son Google ranking ? - Maxence Warzecha

[Transition HTTP -> HTTPS pour SEO](http://webmasters.stackexchange.com/questions/47636/how-do-i-transition-to-ssl-without-affecting-pagerank)  
[HTTPS Everywhere](https://en.wikipedia.org/wiki/HTTPS_Everywhere)  

[SSLLabs](https://www.ssllabs.com/ssltest/)

### Développement

> L'obligation d'avoir HTTPS pour l'utilisation des services workers / le SSL dans les réseaux locaux perso (cas perso) - Davin kevin
> Des spécificités ou gotcha pour les websockets (wss://) ? (Pas à ma connaissance) - Maxence Warzecha

La spécification [Service Workers sur la sécurité](http://www.w3.org/TR/service-workers/#security-considerations)  

### Les liens les plus utiles

[Les configurations recommandées par Mozilla](https://wiki.mozilla.org/Security/Server_Side_TLS)  
[Le générateur de configuration de Mozilla](https://mozilla.github.io/server-side-tls/ssl-config-generator/)  
[SSLLabs](https://www.ssllabs.com/ssltest/)  

[L'attaque Logjam](https://weakdh.org)  

## Nous contacter

Contactez-nous via twitter <http://twitter.com/lescastcodeurs>  
sur le groupe Google <http://groups.google.com/group/lescastcodeurs>  
ou sur le site web <http://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <http://lescastcodeurs.com/>  
En savoir plus sur le sponsoring ? [sponsors@lescastcodeurs.com](mailto:sponsors@lescastcodeurs.com)

---
title: LCC 179 - Interview sur Keycloak avec Sébastien Blanc
author: 'Emmanuel Bernard'
layout: blog-post
episode: 179
mp3_length: 85017000
tweet: Interview sur Keycloak avec @sebi2706
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Sébastien Blanc nous fait découvrir l'univers de l'authentification et de l'autorisation et en particulier Keycloak.

Enregistré le 12 juillet 2017

Téléchargement de l'épisode [LesCastCodeurs-Episode-179.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-179.mp3)

##  Interview

### Ta vie, ton œuvre

[Twitter de Sébastien](https://twitter.com/sebi2706)  

### Qu'est-ce que Keycloak ?

[Le site de Keycloak](http://www.keycloak.org/)  
[Le code de Keycloak](https://github.com/keycloak/keycloak)  
[Des quickstarts](https://github.com/keycloak/keycloak-quickstarts)  
[Le Jira](https://issues.jboss.org/browse/KEYCLOAK)  
[La mailing list](https://lists.jboss.org/mailman/listinfo/keycloak-user)  

[Tools-in-action de Sébastien à DevoxxFR](https://www.youtube.com/watch?v=bVidgluUcg0)  
[Live coding à SpringIO](https://www.youtube.com/watch?v=sB-eN5h6brQ)  

[LDAP](https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol)  
Authentification  
Autorisation ?  
Gestion d'identité  
Quid de ma connection Google Account ou Facebook Connect  
FranceConnect  

Bannir des utilisateurs  
Remember me  
Authentification par certificat client ?  
Détection de patterns suspects ? [fail2ban](https://en.wikipedia.org/wiki/Fail2ban)  
les attaques classiques  

* [Clickjacking](https://en.wikipedia.org/wiki/Clickjacking)  
* [SQL injection](https://en.wikipedia.org/wiki/SQL_injection)  

[One time password](https://en.wikipedia.org/wiki/One-time_password)  
[PBKDF2](https://en.wikipedia.org/wiki/PBKDF2)  

### Un survol des normes de sécurité

Realm

Comment ça marche et dans quel contexte cela s'utilise ?

- [OpenID Connect]( http://openid.net/connect/)
- [OAuth 2](https://oauth.net/2/)
- [JWT](https://jwt.io)
- [SAML 2](https://en.wikipedia.org/wiki/SAML_2.0)
- Google, Facebook, GitHub, StackOverflow
- [FranceConnect](https://franceconnect.gouv.fr)
- [Kerberos](https://en.wikipedia.org/wiki/Kerberos_\(protocol\))  
- Active Directory / LDAP
- two factor (sms, [FreeOTP](https://freeotp.github.io) )

[Le talk de Hubert sur les JWT](https://www.youtube.com/watch?v=A2-YImhNVMU)  

### Le développement

Moi développeur d'application web Spring Boot, quelles sont les étapes concrètes pour rajouter la sécurité ?  
Quel est l'identifiant partagé entre l'application et Keycloak pour définir l'utilisateur  
Et mon application voit quoi de l'utilisateur (nom, email, mot de passe ?)  
Et mon application Angular 2 avec un backend node.js ?  
Et mon application iOS ?  
[AeroGear](https://aerogear.org)  
TLS, agnostique ou pas ?  
Comment je définis le TTL de mon authentification  

Avec quoi vous vous intégrez ?  
Security proxy ?  

### Sous le capot

C'est fait comment en pratique ?  
Je change de domaine ?  
Comment le clustering est fait  
TLS, reverse proxy, etc  
Tout est en mémoire ?  
Et la partie client, qu'est-ce qui est fait en intégration particulière  
Les extensions sont pour faire quoi ?  

Vous garder comment les mots de passe (hash, salt, evolution, etc )  

### Écosystème et communauté

C'est quoi la concurrence ?  
Spring Security, cryptomator, Google Keyczar, Bouncy Castle, Apache Shiro ?  
Active Directory ?  

[Auth0](https://auth0.com) (SaaS)
[ForgeRock](https://www.forgerock.com)  

Le futur  
[Istio](https://istio.io)  
[Vert.x](http://vertx.io)  
[Keycloak](https://keycloak.org)  

## Nous contacter

[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <https://lescastcodeurs.com/>  
En savoir plus sur le sponsoring? <sponsors@lescastcodeurs.com>

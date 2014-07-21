---
title: LCC 84 - Java EE 7 chez les Luxembourgeois - partie 1
author: 'Emmanuel Bernard'
layout: blog-post
episode: 84
mp3_length: 38347330
---
Enregistré le 26 juin 2013

Téléchargement de l'épisode [LesCastCodeurs-Episode-84.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-84.mp3)

## Présentation de Java EE 7

[YaJUG](http://www.yajug.org)

### De quoi on va causer ?

- Présentation de Java EE 7
    - Java EE 7 c’est sorti
    - Nouvelles spécifications
    - Spécifications mises à jour
    - Implémentations
    - Ce qu’il manque
    - Vous auriez voulu quoi ?
    - Les livres sur Java EE 7
- Débat
    - Tweetez @lescastcodeurs #debat

### Java EE 7 c'est sorti

- 1ere spécification full Oracle
- 12 juin 2013
- Lancement de 3h avec C. Purdy L. DeMichel, A. Gupta...

### Nouvelles spécifications

- JSON-P
    - C’est le JAXP du JSON
    - Manque encore la partie binding (JSON-B)
    - [Jackson](http://wiki.fasterxml.com/JacksonHome)
- Batch
    - Inspirée de [Spring Batch](http://www.springsource.org/spring-batch)
    - Job / Step / Flow / Split / Decision
    - Parallélisations
- Web Socket
- Concurrency Utilities for EE
    - Etend Concurrency Utilities API (JSR-166)
    - java.util.concurrent pour Java EE

### Specs mises à jour

- Java EE 7
    - Namespaces unifiés xmlns.jcp.org
- JAX-RS 2.0
    - API Cliente
    - Asynchrone
    - Bean Validation
    - JMX exposé en REST [Jolokia](http://jolokia.org)
- Bean Validation 1.1
    - Validation des méthodes (paramètre et type de retour)
    - Injection dans les composants
    - Intégration CDI plus avancé
    - Messages d’erreurs avec EL
- Interceptor 1.2
- EL 3.0
- CDI 1.1
    - Priorité d’Intercepteurs Binding
    - Véto
    - API pour accéder au container
    - CDI par défaut (bean-discovery-mode="all/annotated/none" )
- JPA 2.1
    - Type converter
    - Unsynchronized persistence context
    - Entity graph
    - Procédure stockée / fonctions dans BD
    - @Inject dans EntityListener
- EJB 3.2 & JTA 1.2
    - @Transactional
    - Entity Bean Pruned
    - S’aligne avec JMS 2.0
- JSF 2.2
    - HTML 5 friendly
    - Scope et Bean de CDI (deprecated ceux de JSF)
    - @Inject dans converter, validator, component
    - FacesFlow
    - Stateless JSF Page
- JMS 2.0
    - Simplified API
    - Autoclosable
    - JMSRuntimeException
- Servlet 3.1

## Nous contacter

Contactez-nous via Twitter <http://twitter.com/lescastcodeurs>  
sur le groupe Google <http://groups.google.com/group/lescastcodeurs>  
ou sur le site Web <http://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <http://lescastcodeurs.com/>  
En savoir plus sur le sponsoring ? sponsors@lescastcodeurs.com

---
title: LCC 261 - Interview Doctolib avec David Gageot
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Heritier, Audrey Neveu'
layout: blog-post
episode: 261
mp3_length: 49369652
tweet: Interview Doctolib (@doctolib) avec David Gageot (@dgageot)
# tweet size: 91-93 -> 99-101 #######################################################################
---
Guillaume et Antonio interviewent David Gageot à propos de [Doctolib](https://www.doctolib.fr/), l'entreprise, mais surtout ses différents produits, l'architecture et comment elle a géré la prise des rendez-vous pour les vaccins anti-covid.

Enregistré le 30 Juin 2021

Téléchargement de l'épisode [LesCastCodeurs-Episode-261.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-261.mp3)

## Interview

### Ta vie, ton œuvre

Docker, Google, son arrivée chez Doctolib en octobre 2020.

### Doctolib, l'entreprise

Les produits, les équipes, la distribution de l'entreprise, son organisation, le modèle business (licence vendue aux professionnels de la santé).

### La sécurisation des données

End-2-End-Encryption pour les documents entre patients et médecins : ça veut dire que Doctolib techniquement ne peut pas lire les documents hébergés sur ses serveurs? Mais comment ça marche, qui génère les clés de chiffrement, et où sont-elles stockées?

Pourquoi AWS vs un OVH ou autre acteur français? Ou un Google ...

### La stack technique

Le machine learning. Pourquoi? Comment?

Ruby on rails, React, Postgres, S3, ...

Le sizing de l'infrastructure, 800 pods K8s qui font tourner le front Rails au dessus d'une grosse base postgresql

La méthode agile et l'organisation des développements pour cibler 3 déploiements par jour en moyenne.

CI sur 700 nœuds sur K8s avec de nombreux tests end-to-end. Feature-Flags sur les fonctionnalités.

### La vaccination 

Seulement 2% de prises de rendez-vous pour les vaccins mais un public super exigeant. 

Comment améliorer l'UX pour ce use case spécifique?

Quels ont été les défis de montée en charge pour les inscriptions? Des flux anticipés, attendus, inattendus?

### L'impact de vite ma dose et tout l'ecosystème qui s'est mis en place

Quelle est la relation avec vite ma dose? Humaine, systèmes etc. Impact des médias? Impact de CovidTracker?

Comment gérer la cohérence des données, la gestion des caches, ...?

### L'implantation de Doctolib

Quels secteurs (médecins généraux, kiné, hôpitaux) utilisent le plus Doctolib?

### Doctolib et l'administration française, la presse, ...

Comment s'est passé la relation avec l'administration?

Comment gérer la tension sur des sujets importants comme la vie privée, la sécurité, la souveraineté ...

### Les questions des auditeurs

Que se passerait-il en cas de rachat? Que deviendrait les données?

### Doctolib, la concurrence et le futur

En France, leader sur la prise de rendez-vous, mais en compétition sur de très nombreux autres produits (gestion de la patientèle ...). 

Tout reste à faire à l'étranger.

## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr: -->

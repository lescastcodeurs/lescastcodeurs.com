---
title: LCC 285 - De mal en pis - partie 2
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu'
layout: blog-post
episode: 285
mp3_length: 36604127
tweet: De mal en pis - partie 2 #heroku #licensiement #cloudsouverain #nonmanager
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cette partie 2, nous discutons le changement d’étage gratuit chez Heroku, les vagues de licenciement dans le monde technologique,
la carrière de contributeur individuel et le cloud souverain.
Et on vous parle de division de nombres entiers dans la rubrique débutant.

Enregistré le 9 septembre 2022

Téléchargement de l’épisode [LesCastCodeurs-Episode-285.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-285.mp3)

## News

### Infrastructure

NVidia interdit de vendre ses processeurs d’intelligence artificiels les plus puissants en Chine [https://www.reuters.com/technology/nvidia-says-us-has-imposed-new-license-requirement-future-exports-china-2022-08-31/](https://www.reuters.com/technology/nvidia-says-us-has-imposed-new-license-requirement-future-exports-china-2022-08-31/)

- Le gouvernement Américain a mis en place la restriction (export control)
- 10% des ventes en Chine pour NVidia

Après 23 ans un internaute arrête d’utiliser son propre serveur email et il explique pourquoi cela est devenu impossible 
[https://t.co/TQ61y45MXT?ssr=true](https://t.co/TQ61y45MXT?ssr=true)

- Sa raison : l’impossibilité d’avoir un service fiable. 
- Les services de gestion d’emails sont désormais dans les mains de quelques gros acteurs (Google, Microsoft,..) qui déploient à coup d’algorithmes des filtres pour mettre en spam les emails indésirables 
- Ces derniers sont obscurs et peuvent être stupides en blacklistant des blocs entiers d’IPs
- L’internaute demande aux acteurs de se réveiller avant que les politiciens s’en mêlent (pour le pire …)
- Cela demande aussi la mise en place de protocoles plus avancés comme DMARC
- Pour des adresses "casual" comme celles des cast codeurs, c’est maintenant passage à la caisse et 3 à 5 euros par mois et pas adresse email, c’est plus que la valeur de ces emails "casual"


### Cloud

Heroku annonce la fin de son étage gratuit [https://techcrunch.com/2022/08/25/heroku-announces-plans-to-eliminate-free-plans-blaming-fraud-and-abuse/](https://techcrunch.com/2022/08/25/heroku-announces-plans-to-eliminate-free-plans-blaming-fraud-and-abuse/)

- Heroku a éliminé son plan gratuit dénonçant des abus
- Après 10 ans
- Pousser vers du paid plan, qui va aussi faire partir des gens
- Et questionner ceux qui avaient un modèle économique basé sur ce plan gratuit
- 28 novembre et aussi efface les comptes inactifs depuis 1 an
- Beaucoup de fraude et d’abus
- Vont garder des plans low-cost et des plans étudiants
- Au-delà des abuseurs, les plans gratuits étaient utilisés pour tester les apps avant leur déploiement 




### Outillage

Polices de caractères pour la programmation
[https://www.programmingfonts.org/#firacode](https://www.programmingfonts.org/#firacode)

- J’aime bien Fira Code moi 🙂
- Ce site permet de choisir parmi 111 polices différentes, pour pouvoir les comparer et choisir celle qu’on préfère

Mickael Istria pointe sur une video expliquant les nouveautés autour d’Eclipse [https://www.youtube.com/watch?v=zDJtVYAJwyY](https://www.youtube.com/watch?v=zDJtVYAJwyY)

- C’est très visuel, â regarder
- Code snippet
- Content assis plus rapide
- Support des concepts récents de Java comme sealed classes dans les quick fix
- Etc

Utiliser `git blame`  malgré les reformatages [https://michaelheap.com/git-ignore-rev/](https://michaelheap.com/git-ignore-rev/)

- Fichier listant les revisions pour ignorer certains sha1 et le changement d’avant est pris

Une page concise des quelques façons de sortir d’un problème avec Git (langage coloré) [https://ohshitgit.com/](https://ohshitgit.com/)

- On a toujours quelque chose à apprendre ; celle qui nettoie la branche principale, je ne connaissais pas.


### Architecture

Les tendances vu pas les éditeurs de InfoQ dans le devops et le cloud [https://www.infoq.com/articles/devops-and-cloud-trends-2022/](https://www.infoq.com/articles/devops-and-cloud-trends-2022/)

- Commenter les 4 vagues et ce qu’il y a dedans
- Data observability : live qualité de data etc
- Serverless everything : scale to 0 ; même les bases de données (soit parce que infra partagée, soit via un scale down réveille par access à une gateway
- FinOps : contrôle des cours comme on optimisait pour les œufs
- eBPF pour injection de code et WASM pour le service mesh ingress (attention WASM dans envoy ne remplace pas ton bon vieux Netty)
- Protection de la supply chain (encore faible en solutions)
- Low-code / no-code mature pour moins besoin d’ingénieurs ou approche plus légère
- Developer experience qui influence les décisions 


### Méthodologies

Discussion sur la carrière de contributeur individuel [https://touilleur-express.fr/2022/07/17/devenir-staff-engineer/](https://touilleur-express.fr/2022/07/17/devenir-staff-engineer/)

- Exemple de ce que fait Doctolib
- Senior, c’est le premier niveau d’autonomie et d’aisance
- Ensuite, soit vous voulez coacher vo pairs (manager), soit contributeur individuel
- Ce qui est demandé, c’est le leadership (donc l’impact sur la societe et l’organisation)
- Et ça demande une taille de société minimale
- Technique, communication, marketing d’idée
- Occuper le role avant d’être reconnu (c’est assez classique ; ce qui change, c’est le formalisme de la liste des competences attendues entre les boites)
- Et on code moins, car coder seul donne moins de levier
- Équivalence track technique/leadership et track managériales avec des ponts. Souvent s’arrête avant les VP et autre executive leadership (matrice de Radford)
- Promotion case avec promotion committee (2 fois pas an)
- Assez classique de paires un leadership avec un manager pour qu’ils s’épaulent mutuellement
- Staff vs principal peut aussi être dû à l’impact cumulé de la personne et des principals peuvent aider sur une partie plus « bas niveau » / concrete de l’orga ou des projects grace a son experience et ses connexions au dela de son équipe actuelle
- Des exemples de situations de travail du staff engineer [https://touilleur-express.fr/2022/07/20/vis-ma-vie-de-staff-principal-engineer/](https://touilleur-express.fr/2022/07/20/vis-ma-vie-de-staff-principal-engineer/)



### Loi, société et organisation

[https://twitter.com/smlpth/status/1551943751714603013?s=21&amp;t=JhmioeiqlY8wFbzjry6b8Q](https://twitter.com/smlpth/status/1551943751714603013?s=21&amp;t=JhmioeiqlY8wFbzjry6b8Q) encore un licenciement de masse. 10% chez Shopify. Pas mal d’aides pour faire passer la pilule (congés payés, aide à trouver un nouveau job…)

- Ils ont fait le pari que post covid les gens resteraient à acheter en ligne, mais c’est revenu aux volumes d’avant
- Crise et inflation n’aident pas 
- Annonce à l’américaine avec e-mail direct et arrêt du travail le lendemain
- Paye pendant quelque temps et support 

Un article sur les licenciements dans la tech des GAFAM et des startups [https://www.lefigaro.fr/secteur/high-tech/la-grande-inquietude-des-salaries-de-la-tech-face-a-la-vague-de-licenciements-20220819](https://www.lefigaro.fr/secteur/high-tech/la-grande-inquietude-des-salaries-de-la-tech-face-a-la-vague-de-licenciements-20220819)

- Récession, résultats décevants, krach boursier (perte 1/4 de leur valeur)
- Resserrement des politiques budgétaires, donc les projets semi-viables ne le sont plus
- 88k licenciement en trois mois vs 5000 en 1 an en 2021: gros mois juin ->août 
- Apple, Microsoft, Amazon, TikTok, Shopify, Snapchat, Netflix (-40% bourse), SoundCloud (-20% d’effectif)
- L’argent facile arrête le cycle d’hyper acquisition et facilite l’hyper inflation des sociétés tech, car impossibilité de lever des fonds
- Startups ont du mal à garder les clients acquis en 2020-2021
- Donc recentrage et chute des activités non rentables
- Fidélisation de l’employé vs aller chercher la meilleure offre comme un mercenaire

Le Cloud de Confiance sous le coup du CLOUD Act américain ? [https://www.nextinpact.com/lebrief/69865/les-clouds-confiance-bleu-et-s3ns-seront-bien-soumis-au-cloud-act-americain](https://www.nextinpact.com/lebrief/69865/les-clouds-confiance-bleu-et-s3ns-seront-bien-soumis-au-cloud-act-americain)

- Alors attention, parce que Next Impact fait un peu dans le sensationnalisme
- [https://twitter.com/pchapuis/status/1565775842675933188?t=y5S63FbOSbtH4FK_1meECQ&amp;s=19](https://twitter.com/pchapuis/status/1565775842675933188?t=y5S63FbOSbtH4FK_1meECQ&amp;s=19)
- Avec cette interprétation, même Clever Cloud, utilisant du matériel américain, serait soumis au CLOUD Act
- Étude demandée par le ministère de la Justice des Pays-Bas
- Le CLOUD Act s’applique quand le fournisseur de cloud européen utilise du hardware ou logiciel américain (c.-à-d. cloud de confiance Bleu et S3ns)
- Muraille de Chine en refusant tout client américain et en employant zero américain.
- Mais c’est si le logiciel américain a accès aux données (routeur Cisco en déchiffré, Stockage sans la clef côté client, etc)
- Le contrat MS serait « ring fencé » contre le CLOUD Act mais peu d’infos



## Rubrique débutant

Comment faire une division de deux entiers dans un flottant ? [https://www.baeldung.com/java-integer-division-float-result](https://www.baeldung.com/java-integer-division-float-result)

- Une division d’entier ne ramène que le quotient
- Et un entier
- Retourne un Double si au moins un des opérandes est un Double, puis Float, puis Long
- Il faut donc caster un des opérandes en float et pouf !


## Conférences


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

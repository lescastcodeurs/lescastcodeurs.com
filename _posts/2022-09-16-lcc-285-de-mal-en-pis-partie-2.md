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
Dans cette partie 2, nous discutons le changement d'étage gratuit chez Heroku, les vagues de licenciement dans le monde technologique,
le carrière de contributeur individuel et le cloud souverain.
Et on vous parle de division de nombres entier dans la rubrique débutant.

Enregistré le 9 septembre 2022

Téléchargement de l’épisode [LesCastCodeurs-Episode-285.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-285.mp3)

## News

### Infrastructure

NVidia interdit de vendre ses processeurs d’intelligence artificiels les plus puissants en Chine [https://www.reuters.com/technology/nvidia-says-us-has-imposed-new-license-requirement-future-exports-china-2022-08-31/](https://www.reuters.com/technology/nvidia-says-us-has-imposed-new-license-requirement-future-exports-china-2022-08-31/)

- Le gouvernement Américain a mis en place la restriction (export control)
- 10% des ventes en Chine pour NVidia

Après 23ans un internaute arrête d’utiliser son propre serveur e-mail et il explique pourquoi cela est devenu impossible 
[https://t.co/TQ61y45MXT?ssr=true](https://t.co/TQ61y45MXT?ssr=true)

- Sa raison: l'impossibilité d’avoir un service fiable. 
- Les services de gestion d'e-mails sont désormais dans les mains de quelques gros acteurs (Google, Microsoft,..) qui déploient à coup d'algorithmes des filtres pour mettre en spam les e-mails indésirables 
- Ces derniers sont obscures et peuvent être stupides en blacklistant des blocs entiers d’IPs
- L'internaute demande aux acteurs de se réveiller avant que les politiciens s’en mêlent (pour le pire …)
- Cela demande aussi la mise en place de protocoles plus avancés comme DMARC
- Pour des adresses "casual" comme celles des cast codeurs, c'est maintenant passage à la caisse et 3 à 5 euros par mois et pas adresse email c'est plus que la valeur de ces emails "casual"


### Cloud

Heroku annonce la fin de son étage gratuit [https://techcrunch.com/2022/08/25/heroku-announces-plans-to-eliminate-free-plans-blaming-fraud-and-abuse/?guccounter=2&amp;guce_referrer=aHR0cHM6Ly90LmNvLw&amp;guce_referrer_sig=AQAAACIpHvzb3Pb2gtgt8Dm99CWGUhbEkdTgLVDgKwMNNmDI9UITQyNX64GA2LB6rQGNX2EreLoiRvxTqSUls5V_F8x6Cv_xGrfXtaIROP_Jiv45UUO1ODBIno3j7vHC4gokKVLqsZ948CmCfzG2bF03DL-uhbZqYuGXvxTfdsioTbjg](https://techcrunch.com/2022/08/25/heroku-announces-plans-to-eliminate-free-plans-blaming-fraud-and-abuse/?guccounter=2&amp;guce_referrer=aHR0cHM6Ly90LmNvLw&amp;guce_referrer_sig=AQAAACIpHvzb3Pb2gtgt8Dm99CWGUhbEkdTgLVDgKwMNNmDI9UITQyNX64GA2LB6rQGNX2EreLoiRvxTqSUls5V_F8x6Cv_xGrfXtaIROP_Jiv45UUO1ODBIno3j7vHC4gokKVLqsZ948CmCfzG2bF03DL-uhbZqYuGXvxTfdsioTbjg)

- heroic éliminé sont plan gratuit dénonçant des abus
- apres 10 ans
- pousser vers du paid plan, qui va aussi faire partir des gens
- et questionner ceux qui avaient un modèle économique base sur ce plan gratuit
- 28 novembre et aussi efface les comptes inactifs depuis 1 an
- beaucoup de fraude et d’abus
- vont garder des plans low cost et des plans étudiants
- au delà des abuseurs, les plans gratuits étaient utilises pour tester les apps avant leur déploiement 




### Outillage

Polices de caractères pour la programmation
[https://www.programmingfonts.org/#firacode](https://www.programmingfonts.org/#firacode)

- J’aime bien Fira Code moi :slightly_smiling_face:
- Ce site permet de choisir parmi 111 polices différentes, pour pouvoir les comparer et choisir celle qu’on préfère

Mickael Istria pointe sur une video expliquant les nouveautés autour d'Eclipse [https://www.youtube.com/watch?v=zDJtVYAJwyY](https://www.youtube.com/watch?v=zDJtVYAJwyY)

- c'est très visuel, â regarder
- Code snippet
- Content assis plus rapide
- Support des concepts récents de Java comme sealed classes dans les quick fix
- Etc

Utiliser `git blame`  malgré les reformattages [https://michaelheap.com/git-ignore-rev/](https://michaelheap.com/git-ignore-rev/)

- fichier listant les revisions pour ignorer certains sha1 et le  changement d’avant est pris

Une page concise des quelques façons de sortir d'un problème avec Git (langage coloré) [https://ohshitgit.com/](https://ohshitgit.com/)

- On a toujours quelquye chose a apprendre ; celle qui nettoie la branche principale, je ne connaissais pas.


### Architecture

Les tendances vu pas les éditeurs de InfoQ dans le devops et le cloud [https://www.infoq.com/articles/devops-and-cloud-trends-2022/?utm_source=twitter&amp;utm_medium=link&amp;utm_campaign=calendar](https://www.infoq.com/articles/devops-and-cloud-trends-2022/?utm_source=twitter&amp;utm_medium=link&amp;utm_campaign=calendar)

- commenter les 4 vagues et ce qu'il y a dedans
- Data observability : live qualité de data etc
- Serverless everything: scale to 0 ; même les bases de données (soit parce que infra partagée soit via un scale down réveille par access à une gateway
- FinOps: contrôle des cours comme on optimisait pour les œufs
- eBPF pour injection de code et WASM pour le service mesh ingress (attention WASM dans envoy ne pas pas ton bon vieux Netty)
- Protection de la supply chain (encore faible en solutions)
- Low code no code mature pour moins besoin d'ingénieurs ou approche plus légère
- Developer experience qui influence les decisions 


### Méthodologies

Discussion sur la carrière contributeur individuel [https://touilleur-express.fr/2022/07/17/devenir-staff-engineer/](https://touilleur-express.fr/2022/07/17/devenir-staff-engineer/)

- exemple de ce que fait doctolib
- senior c’est le premier niveau d’autonomie et d’aisance
- ensuite, soit vous voulez coacher vo pairs (manager), soit contributeur individuel
- ce qui est demandé c’est le leadership (donc l’impact sur la societe et l'organisation)
- et ca demande une taille de societe minimale
- technique, communication, marketing d’idée
- occuper le role avant d'être reconnu (c’est assez classique ; ce qui change c’est le formalisme de la liste des competences attendues entre les boites)
- et on code moins car coder seul a moins de levier
- equivalence track technique/leadership et track managériales avec des ponts. Souvent d’arrète avant les VP et autre executive leadership (matrice de Radford)
- Premotion case avec promotion committee (2 fois pas an)
- Assez classique de paires un leadership avec un manager pour qu’ils s'épaulent mutuellement
- staff vs principal peut aussi etre du a l’impact cumulé de la personne et des principals peuvent aider sur une partie plus « bas niveau » / concrete de l’orga ou des projects grace a son experience et ses connexions au dela de son équipe actuelle
- des exemples de situations de travail du staff engineer [https://touilleur-express.fr/2022/07/20/vis-ma-vie-de-staff-principal-engineer/](https://touilleur-express.fr/2022/07/20/vis-ma-vie-de-staff-principal-engineer/)



### Loi, société et organisation

[https://twitter.com/smlpth/status/1551943751714603013?s=21&amp;t=JhmioeiqlY8wFbzjry6b8Q](https://twitter.com/smlpth/status/1551943751714603013?s=21&amp;t=JhmioeiqlY8wFbzjry6b8Q) encore un licenciement de masse. 10% chez Shopify. Pas mal d’aides pour faire passer la pilule (congés payés, aide à trouver un nouveau job…)

- ils ont fait le pari que post covid les gens resteraient à acheter en ligne mais c'est revenu aux volumes d’avant
- crise et inflation n’aident pas 
- Annonce à l'américaine avec e-mail direct et arrêt du travail le lendemain
- Paye pendant quelques temps et support 

Un article sur les licenciements dans la tech des GAFAM et des startups [https://www.lefigaro.fr/secteur/high-tech/la-grande-inquietude-des-salaries-de-la-tech-face-a-la-vague-de-licenciements-20220819](https://www.lefigaro.fr/secteur/high-tech/la-grande-inquietude-des-salaries-de-la-tech-face-a-la-vague-de-licenciements-20220819)

- recession, résultats décevants, krach boursier (perte 1/4 de leur valeur)
- recerrement des politiques budgétaires, donc les projets semi viables ne le sont plus
- 88k licenciement en trois mois vs 5000 en 1 an en 2021: gros mois juin ->août 
- Apple, Microsoft, Amazon, TikTok, Shopify, Snapchat, Netflix (-40% bourse), SoudnCloud (-20% d’effectif)
- L’argent facile arrête le cycle d’hyper acquisition et de facilite a l’hyper inflation des sociétés tech car impossibilité de lever des fonds
- startup ont du mal a garder les clients acquis en <tel:2020-202|2020-202>1
- donc recentrage et chute des activités non rentables
- fidélisation de l'employé vs aller chercher la meilleur offre comme un mercenaire

Le Cloud de Confiance sous le coup du Cloud act américain ? [https://www.nextinpact.com/lebrief/69865/les-clouds-confiance-bleu-et-s3ns-seront-bien-soumis-au-cloud-act-americain](https://www.nextinpact.com/lebrief/69865/les-clouds-confiance-bleu-et-s3ns-seront-bien-soumis-au-cloud-act-americain)

- Alors attention, parce que Next Impact fait un peu dans le sensationnalisme
- [https://twitter.com/pchapuis/status/1565775842675933188?t=y5S63FbOSbtH4FK_1meECQ&amp;s=19](https://twitter.com/pchapuis/status/1565775842675933188?t=y5S63FbOSbtH4FK_1meECQ&amp;s=19)
- Avec cette interprétation, même Clever Cloud, utilisant du matériel américain, serait soumis au Cloud Act
- étude demandée par le ministère de la justice des pays bas
- le cloud act s’applique quand le fournisseur de cloud européen utilise du hardware ou logiciel américain (e.g. cloud de confiance Bleu et S3ns)
- muraille de chine en refusant tout client américain et en employant zero américain.
- mais c’est si le logiciel américain a accès aux données (routeur Cisco en decrypté etc), Stockage sans la clef cote client, etc
- le contrat MS serait « ring fencé » contre le cloud act mais peu d’infos



## Rubrique débutant

Comment faire une division de deux entiers dans un flottant ? [https://www.baeldung.com/java-integer-division-float-result](https://www.baeldung.com/java-integer-division-float-result)

- Une division d’entier ramène que le quotient
- Et un entier
- Retourne un double au un des opérandes est un double, puis float, puis long.
- Donc il faut d’aster une des opérandes en 
- float et pouf


## Conférences


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

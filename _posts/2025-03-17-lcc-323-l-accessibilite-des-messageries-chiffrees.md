---
title: LCC 323 - L'accessibilité des messageries chiffrées
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 323
youtube: https://youtu.be/QBTKB4QUGiQ
mp3_length: 50968880
tweet: L'accessibilité des messageries chiffrées #java24 #quarkus #ia #vibe #mcp #quantum #win32 #accessibite
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Emmanuel et Arnaud discutent des dernières nouvelles du dev, en mettant l'accent sur Java, l'intelligence artificielle, et les nouvelles fonctionnalités des versions JDK 24 et 25.
Ils abordent également des sujets comme Quarkus, l'accessibilité des sites web, et l'impact de l'IA sur le trafic web.
Cette conversation aborde les approches pour les devs en matière d'intelligence artificielle et de développement logiciel.
On y discute notamment des défis et des bénéfices de l'utilisation de l'IA.
Enfin, ils partagent leurs réflexions sur l'importance des conférences pour le développement professionnel.



Enregistré le 14 mars 2025

Téléchargement de l’épisode [LesCastCodeurs-Episode-323.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-323.mp3)
ou en vidéo [sur YouTube](https://youtu.be/QBTKB4QUGiQ).

## News


### Langages

Java Metal [https://www.youtube.com/watch?v=yup8gIXxWDU](https://www.youtube.com/watch?v=yup8gIXxWDU)

- Peut-être qu'on la déjà partagé ?

Article d'opinion Java coming for AI [https://thenewstack.io/2025-is-the-last-year-of-python-dominance-in-ai-java-comin/](https://thenewstack.io/2025-is-the-last-year-of-python-dominance-in-ai-java-comin/)

- **2025** pourrait être la dernière année où **Python domine l'IA**.
- **Java** devient un concurrent sérieux dans le domaine.
- En **2024**, Python était toujours en tête, Java restait fort en entreprise, et **Rust** gagnait en popularité.
- Java est de plus en plus utilisé pour l'AI remettant en cause la suprématie de Python.
- article vient de javaistes
- la domination de python est cluturelle et plus technique (enfin pour les ML lib c'est encore technique)
- projets paname et babylon changent la donne
- JavaML est populaire

L’almanach java sur les versions [https://javaalmanac.io/](https://javaalmanac.io/)

- montre kes APIs et les diff entre versions
- puis les notes ou la spec java

Les nouvelles de JDK 24 et du futur 25 [https://www.infoq.com/news/2025/02/java-24-so-far/?utm_campaign=infoq_content&amp;utm_source=infoq&amp;utm_medium=feed&amp;utm_term=global](https://www.infoq.com/news/2025/02/java-24-so-far/?utm_campaign=infoq_content&amp;utm_source=infoq&amp;utm_medium=feed&amp;utm_term=global)

- JDK 24 a atteint sa première phase de release candidate et sera officiellement publié le 18 mars 2025.
- 24 nouvelles fonctionnalités (JEPs) réparties en 5 catégories : Core Java Library (7), Java Language Specification (4), Security Library (4), HotSpot (8) et Java Tools (1).
- Project Amber : JEP 495 "Simple Source Files and Instance Main Methods" en quatrième preview, visant à simplifier l'écriture des premiers programmes Java pour les débutants.
- Project Loom : JEP 487 "Scoped Values" en quatrième preview, permettant le partage de données immuables entre threads, particulièrement utile avec les virtual threads.
- Project Panama : JEP 489 "Vector API" en neuvième incubation, continuera d'incuber jusqu'à ce que les fonctionnalités nécessaires de Project Valhalla soient disponibles.
- Project Leyden : JEP 483 "Ahead-of-Time Class Loading & Linking" pour améliorer le temps de démarrage en rendant les classes d'une application instantanément disponibles au démarrage de la JVM.
- Sécurité quantique : Deux JEPs (496 et 497) introduisant des algorithmes résistants aux ordinateurs quantiques pour la cryptographie, basés sur les réseaux modulaires.
- Sécurité renforcée : JEP 486 propose de désactiver définitivement le Security Manager, tandis que JEP 478 introduit une API de dérivation de clés.
- Optimisations HotSpot : JEP 450 "Compact Object Headers" (expérimental) pour réduire la taille des en-têtes d'objets de 96-128 bits à 64 bits sur les architectures 64 bits. (a ne aps utiliser en prod!)
- Améliorations GC : JEP 404 "Generational Shenandoah" (expérimental) introduit un mode générationnel pour le Garbage Collector Shenandoah, tout en gardant le non generationel.
- Évolution des ports : Windows 32-bit x86 ca sent le sapin
- JEP 502 dans JDK 25 : Introduction des "Stable Values" (preview), anciennement "Computed Constants", offrant les avantages des champs final avec plus de flexibilité pour l'initialisation.
- Points Supplémentaires sur JDK 25
- Date de sortie : JDK 25 est prévu pour septembre 2025 et représentera la prochaine version LTS (Long-Term Support) après JDK 21.
- Finalisation de l'on-ramp : Gavin Bierman a annoncé son intention de finaliser la fonction "Simple Source Files" dans JDK 25, après quatre previews successives.
- CDS Object Streaming : Le JEP Draft 8326035 propose d'ajouter un mécanisme d'archivage d'objets pour Class-Data Sharing (CDS) dans ZGC, avec un format d'archivage et un chargeur unifiés.
- HTTP/3 supporté dans HttpClient

Un article sur l’approche de Go pour éviter les attaques par chemin de fichier [https://go.dev/blog/osroot](https://go.dev/blog/osroot)



### Librairies

Quarkus 3.19 es sorti [https://quarkus.io/blog/quarkus-3-19-1-released/](https://quarkus.io/blog/quarkus-3-19-1-released/)

- UBI 9 par defaut pour les containers
- En plus de AppCDS, support tu cache AOT (JEP 483) pour demarrer encore plus rapidement
- Preuve de possession dans OAuth tokers 2

Mario Fusco sur les patterns d'agents en Quarkus [https://quarkus.io/blog/agentic-ai-with-quarkus/](https://quarkus.io/blog/agentic-ai-with-quarkus/) et [https://quarkus.io/blog/agentic-ai-with-quarkus-p2/](https://quarkus.io/blog/agentic-ai-with-quarkus-p2/)

- premier article sur les patterns de workflow
- chainer, paralleliser ou router
- avec des exemples de code qui tournent
- les agents a proprement parler (le LLM  qui decide du workflow)
- les agents ont des toolbox que le LLM peut decided d'invoquer
- Le code va dans les details et permet de mettre les interactions en lumiere
- tracing rend les choses visuelles




### Web

Le European Accessibility Act (EAA) [https://martijnhols.nl/blog/the-european-accessibility-act-for-websites-and-apps](https://martijnhols.nl/blog/the-european-accessibility-act-for-websites-and-apps)

- **Loi européenne sur l'accessibilité (EAA)** adoptée en 2019
- Vise à rendre **sites web et apps accessibles** aux personnes handicapées
- Suivre les **normes WCAG 2.1 AA** (clarté, utilisabilité, compatibilité)
- **Entreprises concernées** : banques, e-commerce, transports, etc.
- **Date limite de mise en conformité** : **28 juin 2025**
- 2025 c'est pour les nouveaux developpements
- 2027 c'est pour les applications existantes.
- bon et je fais comment pour savoir si le site web des cast codeurs est conforme ?

API Popover [https://web.dev/blog/popover-baseline?hl=en](https://web.dev/blog/popover-baseline?hl=en)

- **L'API Popover** est maintenant disponible dans tous les navigateurs majeurs
- **Ajoutée à Baseline** le **27 janvier 2025**
- Permet de créer des **popovers natifs** en HTML, sans JavaScript complexe
- Exemple : `<button popovertarget="mon-popover">Ouvrir</button>`
- `<div id="mon-popover" popover>Contenu du popover</div>`
- **Problème initial (2024)** : Bug sur iOS empêchant la fermeture des popovers

Intégrer un front-end React dans une app Spring-Boot [https://bootify.io/frontend/react-spring-boot-integration.html](https://bootify.io/frontend/react-spring-boot-integration.html)

- Etape par etape, comment configurer son build ([https://bootify.io/frontend/webpack-spring-boot.html](https://bootify.io/frontend/webpack-spring-boot.html))  et son app (controllers...)  pour y intégrer un front en rect.


### Data et Intelligence Artificielle

Traffic des sites web venant de IA [https://ahrefs.com/blog/ai-traffic-study/](https://ahrefs.com/blog/ai-traffic-study/)

- le AIEO apres le SEO va devenir un gros business vu que les modèles ont tendance a avoir leurs chouchous techniques ou de reference.
- 63% des sites ont au moins un referal viennent d'une IA
- 50% ChatGPT, puis plrplexity et enfin Gemini, bah et LeChat alors?
- 0,17% du traffic des sites vient de l'IA. Et en meme temps l'AI resume plutot que pointe donc c'est logique

Granite 3.2 est sorti [https://www.infoq.com/news/2025/03/ibm-granite-3-2/](https://www.infoq.com/news/2025/03/ibm-granite-3-2/)

- **IBM sort Granite 3.2**, un modèle IA avancé.
- **Meilleur raisonnement** et nouvelles capacités multimodales.
- **Granite Vision 3.2** excelle en compréhension d’images et de documents.
- **Granite Guardian 3.2** détecte les risques dans les réponses IA.
- **Modèles plus petits et efficaces** pour divers usages.
- **Améliorations en raisonnement mathématique** et prévisions temporelles.
- les trucs interessants de Granite c'est sa petite taille et son cote "vraiment" open source

Prompt Engineering - article détaillé [https://www.infoq.com/articles/prompt-engineering/](https://www.infoq.com/articles/prompt-engineering/)

- **Le prompt engineering**, c'est l'art de bien formuler les instructions pour guider l’IA.
- **Accessible à tous**, il ne remplace pas la programmation mais la complète.
- **Techniques clés** : few-shot learning, chain-of-thought, tree-of-thought.
- **Avantages** : flexibilité, rapidité, meilleure interaction avec l’IA.
- **Limites** : manque de précision et dépendance aux modèles existants.
- **Futur** : un outil clé pour améliorer l’IA et le développement logiciel.

QCon San Francisco - Les agents AI - Conference [https://www.infoq.com/presentations/ai-agents-infrastructure/](https://www.infoq.com/presentations/ai-agents-infrastructure/)

- **Sujet** : Infrastructure pour agents d'IA.
- **Technologies** : RAG et bases de données vectorielles.
- **Rôle des agents d'IA** : Automatiser des tâches, prévoir des besoins, superviser.
- **Expérience** : Shruti Bhat de Oracle à Rockset (acquis par OpenAI).
- **Objectif** : Passer des applis classiques aux agents IA intelligents.
- **Défis** : Améliorer la recherche en temps réel, l'indexation et la récupération.
- Nous concernant:
- **Évolution des rôles** : Les développeurs passent à des rôles plus stratégiques.
- **Adaptation nécessaire** : Les développeurs doivent s'adapter aux nouvelles technologies.

Official Java SDK for MCP & Spring AI [https://spring.io/blog/2025/02/14/mcp-java-sdk-released-2](https://spring.io/blog/2025/02/14/mcp-java-sdk-released-2)

- Désormais une implémentation officielle aux côtés des SDK Python, TypeScript et Kotlin. ( [https://modelcontextprotocol.io/](https://modelcontextprotocol.io/) )
- Prise en charge de Stdio-based transport, SSE (via HTTP) et intégration avec Spring WebFlux et WebMVC.
- Intégration avec Spring AI, configuration simplifiée pour les applications Spring Boot (different starters disponibles)

Codez avec Claude [https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/overview](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/overview)

- Claude Code est en beta, plus de liste d'attente
- Un outil de codage agentique intégré au terminal, capable de comprendre votre base de code et d'accélérer le développement grâce à des commandes en langage naturel.
- Les fonctionnalités permettent de comprendre le code, le refactorer, tester, debugger, ...

Gemini Code Assist est gratuit  [https://blog.google/technology/developers/gemini-code-assist-free/](https://blog.google/technology/developers/gemini-code-assist-free/)

- Pour un usage personnel. 
- Pas besoin de compte. 
- Pas de limite. 
- 128k token input.

Guillaume démarre une série d'articles sur le RAG (niveau avancé). Le premier sur Sentence Window Retrieval[https://glaforge.dev/posts/2025/02/25/advanced-rag-sentence-window-retrieval/](https://glaforge.dev/posts/2025/02/25/advanced-rag-sentence-window-retrieval/)

- Guillaume propose une technique qui améliore les résultats de rechercher de Retrieval Augmented Generation
- L’idée est de calculer des vecteurs embeddings sur des phrases, par exemple, mais de retourner un contexte plus large
- L’intérêt, c’est d’avoir des calculs de similarité de vector embedding qui ont de bons scores (sans dilution de sens) de similarité, mais de ne pas perdre des informations sur le contexte dans lequel cette phrase se situe

GitHub Copilot edits en GA, GitHub Copilot en mode agent dans VSCode Insiders [https://github.blog/news-insights/product-news/github-copilot-the-agent-awakens/](https://github.blog/news-insights/product-news/github-copilot-the-agent-awakens/)

- Copilot Edits permet via le chat de modifier plusieurs fichiers en même temps, ce qui simplifie les refactoring
- Copilot en mode agent ajoute un mode autonome (Agentic AI) qui va tout seul chercher les modifications à faire dans votre code base.
- "what could possibly go wrong?"




### Méthodologies

Article d'opinion interessant sur AI et le code assistant de **Addy Osmani** [https://addyo.substack.com/p/the-70-problem-hard-truths-about](https://addyo.substack.com/p/the-70-problem-hard-truths-about)

- Un article de l'année dernière de **Addy Osmani** [https://addyo.substack.com/p/10-lessons-from-12-years-at-google](https://addyo.substack.com/p/10-lessons-from-12-years-at-google)
- plusieurs types d'aide IA
- Ceux pour boostrapper, dun figma ou d'une image et avoir un proto non fonctionnel en quelques jours
- Ceux pour iterer sur du code donc plus long terme
- on va faire une interview sur les assistants de code IA
- Le cout de la vitesse de l'ia
- les dev senior refactur et modifie le code proposé pour se l'approprier, chnger l'architecture etc
- donc basé sur leur connaissance
- appliquer ce qu'on connait deja amis plus vite est un pattern different d'apprendre avec l'IA
- explore des patterns d'approche
- et la prospective sur le futur



### Loi, société et organisation

Elon Musk essaie d'acheter Open AI [https://www.bbc.com/news/articles/cpdx75zgg88o](https://www.bbc.com/news/articles/cpdx75zgg88o)

- La réponse:
- "non merci mais on peut racheter twiter pour 9,74 milliars si tu veux"

Avec la loi narcotrafic votée au sénat, Signal ne serait plus disponible en France [https://www.clubic.com/actualite-555135-avec-la-loi-narcotrafic-signal-quittera-la-france.html](https://www.clubic.com/actualite-555135-avec-la-loi-narcotrafic-signal-quittera-la-france.html)

- en plus de légaliser les logiciels espions s’appuyant sur les failles logiciel 
- La loi demande aux messageries de laisser l’état accéder aux conversations 
- Donc une backdoor avec une clé etatique par exemple 
- Une backdoor comme celle des téléphones filaires américains mis en place il y a des années et maintenant exploitée par l’espionnage chinois 
- Signal à une position ferme, soit c’est sécurisé soit on sort d’un pays
- Olvid WhatsApp et iMessage sont aussi visée par exemple
- La loi défini la cible comme la criminalité organisée : les classiques mais aussi les gilets jaunes, les opposants au projet de Bure, les militants aidant les personnes exilées à Briançon, ou encore les actions contre le cimentier Lafarge à Bouc-Bel-Air et à Évreux
- Donc plus large que ce que les gens pensent. 





## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 14 mars 2025 : [Rust In Paris 2025](https://www.rustinparis.com/) - Paris (France) 
- 19-21 mars 2025 : [React Paris](https://react.paris/) - Paris (France) <a href="https://forms.gle/KfsWGQH2Xn2N2Nua8"><img alt="CFP React Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2027-December-2024&color=red"></a>
- 20 mars 2025 : [PGDay Paris](https://2025.pgday.paris) - Paris (France) 
- 20-21 mars 2025 : [Agile Niort](https://agileniort.fr/) - Niort (France) <a href="https://sessionize.com/agile-niort-2025"><img alt="CFP Agile Niort 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-January-2025&color=red"></a>
- 25 mars 2025 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-6/"><img alt="CFP ParisTestConf 6" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2024&color=red"></a>
- 26-29 mars 2025 : [JChateau Unconference 2025](https://jchateau.org/) - Cour-Cheverny (France) 
- 27-28 mars 2025 : [SymfonyLive Paris 2025](https://live.symfony.com/2025-paris/) - Paris (France) 
- 28 mars 2025 : [DataDays](https://days.data-lille.fr/2025/) - Lille (France) <a href="https://conference-hall.io/data-days-lille-2025"><img alt="CFP DataDays 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2009-February-2025&color=red"></a>
- 28-29 mars 2025 : [Agile Games France 2025](https://agilegamesfrance.fr/) - Lille (France) 
- 28-30 mars 2025 : [Shift](https://shift-hackathon.com/) - Nantes (France) 
- 3 avril 2025 : [DotJS](http://www.dotjs.io) - Paris (France) <a href="https://www.dotjs.io/speak"><img alt="CFP dotJS 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-November-2024&color=red"></a>
- 3 avril 2025 : [SoCraTes Rennes 2025](https://socrates-rennes.github.io/) - Rennes (France) 
- 4 avril 2025 : [Flutter Connection 2025](https://flutterconnection.io) - Paris (France) <a href="https://sessionize.com/flutter-connection-2025"><img alt="CFP Flutter Connection 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-January-2025&color=red"></a>
- 4 avril 2025 : [aMP Orléans 04-04-2025](https://bit.ly/aMPOrleans2025Reg) - Orléans (France) <a href="https://sessionize.com/amp-orleans-04-04-2025/"><img alt="CFP aMP Orléans 04-04-2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=red"></a>
- 10-11 avril 2025 : [Android Makers](https://androidmakers.droidcon.com/) - Montrouge (France) <a href="https://sessionize.com/android-makers-by-droidcon-2025/"><img alt="CFP Android Makers by droidcon 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-February-2025&color=red"></a>
- 10-12 avril 2025 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr25.cfp.dev/"><img alt="CFP Devoxx Greece 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-November-2024&color=red"></a>
- 11-12 avril 2025 : [Faiseuses du Web 4](https://faiseusesduweb.eu.org) - Dinan (France) 
- 14 avril 2025 : [Lyon Craft](https://lyon-craft.fr) - Lyon (France) 
- 16-18 avril 2025 : [Devoxx France](https://www.devoxx.fr) - Paris (France) <a href="https://devoxxfr2025.cfp.dev/#/login"><img alt="CFP Devoxx France 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-January-2025&color=red"></a>
- 23-25 avril 2025 : [MODERN ENDPOINT MANAGEMENT EMEA SUMMIT 2025](http://endpointsummit.com) - Paris (France) <a href="https://sessionize.com/MEMSummit2025"><img alt="CFP MODERN ENDPOINT MANAGEMENT EMEA SUMMIT 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-January-2025&color=red"></a>
- 24 avril 2025 : [IA Data Day - Strasbourg 2025](https://iadataday.capitale.dev/) - Strasbourg (France) <a href="https://conference-hall.io/ia-data-day-strasbourg-2025"><img alt="CFP IA Data Day 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-March-2025&color=red"></a>
- 29-30 avril 2025 : [MixIT](https://mixitconf.org/) - Lyon (France) <a href="https://sessionize.com/mixit-2025/"><img alt="CFP MixIT 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-January-2025&color=red"></a>
- 6-7 mai 2025 : [GOSIM AI Paris](https://paris2025.gosim.org/) - Paris (France) <a href="https://cfp.gosim.org/"><img alt="CFP GOSIM AI Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-April-2025&color=green"></a>
- 7-9 mai 2025 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk25.cfp.dev/#/"><img alt="CFP Devoxx UK 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2025&color=red"></a>
- 15 mai 2025 : [Cloud Toulouse](https://cloudtoulouse.com/) - Toulouse (France) <a href="https://conference-hall.io/cloud-toulouse-2025"><img alt="CFP Cloud Toulouse 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Lille](https://event.afup.org/afup-day-2025/) - Lille (France) <a href="https://afup.org/event/afupday2025lille"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Lyon](https://event.afup.org/afup-day-2025/) - Lyon (France) <a href="https://afup.org/event/afupday2025lyon"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 16 mai 2025 : [AFUP Day 2025 Poitiers](https://event.afup.org/afup-day-2025/) - Poitiers (France) <a href="https://afup.org/event/afupday2025poitiers"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=red"></a>
- 22-23 mai 2025 : [Flupa UX Days 2025](https://www.uxdays.eu) - Paris (France) <a href="https://sessionize.com/ux-days-2025"><img alt="CFP Flupa UX Days 2025 – Appel à orateur·rices pour la 13ᵉ édition" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-March-2025&color=red"></a>
- 24 mai 2025 : [Polycloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/polycloud-2025"><img alt="Polycloud 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-February-2025&color=red"></a>
- 24 mai 2025 : [NG Baguette Conf 2025](https://ngbaguette.angulardevs.fr/) - Nantes (France) <a href="https://conference-hall.io/ng-baguette-conf-2025"><img alt="NG baguette Conf 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-March-2025&color=green"></a>
- 3 juin 2025 : [TechReady](https://www.linkedin.com/company/techreadylive/) - Nantes (France) <a href="https://conference-hall.io/techready"><img alt="CFP TechReady" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-April-2025&color=green"></a>
- 5-6 juin 2025 : [AlpesCraft](https://www.alpescraft.fr/) - Grenoble (France) 
- 5-6 juin 2025 : [Devquest 2025](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/devquest-2025"><img alt="CFP Devquest 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2016-March-2025&color=green"></a>
- 10-11 juin 2025 : [Modern Workplace Conference Paris 2025](https://modern-workplace.pro) - Paris (France) <a href="https://sessionize.com/mwcp25"><img alt="CFP Modern Workplace Conference Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=red"></a>
- 11-13 juin 2025 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) <a href="https://devoxxpl25.cfp.dev/#/login"><img alt="CFP Devoxx Poland 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2028-February-2025&color=red"></a>
- 12-13 juin 2025 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 12-13 juin 2025 : [DevLille](https://devlille.fr/) - Lille (France) <a href="https://conference-hall.io/devlille-2025"><img alt="CFP DevLille" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-March-2025&color=green"></a>
- 13 juin 2025 : [Tech F'Est 2025](https://tech-fest.dev) - Nancy (France) <a href="https://sessionize.com/bsides-boulder-2025/"><img alt="CFP Tech F'Est 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2017-February-2025&color=red"></a>
- 17 juin 2025 : [Mobilis In Mobile](https://mobilis-in-mobile.io/) - Nantes (France) <a href="https://conference-hall.io/mobilis-in-mobile-2025"><img alt="CFP Mobilis In Mobile 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2006-April-2025&color=green"></a>
- 19-21 juin 2025 : [Drupal Barcamp Perpignan 2025](https://www.drupal.fr/evenements/drupal-barcamp-perpignan-2025) - Perpignan (France) 
- 24 juin 2025 : [WAX 2025](https://www.waxconf.fr/) - Aix-en-Provence (France) <a href="https://conference-hall.io/wax2025"><img alt="CFP WAX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=green"></a>
- 25-26 juin 2025 : [Agi'Lille 2025](https://agilille.fr) - Lille (France) <a href="https://sessionize.com/agilille-2025/"><img alt="CFP Agi'Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-February-2025&color=red"></a>
- 25-27 juin 2025 : [BreizhCamp 2025](https://www.breizhcamp.org) - Rennes (France) <a href="https://sessionize.com/breizhcamp-2025/"><img alt="CFP BreizhCamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-March-2025&color=red"></a>
- 26-27 juin 2025 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/sunny-tech-2025"><img alt="CFP SunnyTech 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-Feb-2025&color=red"></a>
- 1-4 juillet 2025 : [Open edX Conference - 2025](https://con.openedx.org) - Palaiseau (France) <a href="https://sessionize.com/open-edx-conference-2025"><img alt="CFP Open edX Conference - 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-December-2024&color=red"></a>
- 7-9 juillet 2025 : [Riviera DEV 2025](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/riviera-dev-2025/"><img alt="CFP Riviera DEV 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-March-2025&color=red"></a>
- 18-19 septembre 2025 : [API Platform Conference](https://api-platform.com/con/2025/) - Lille (France) & Online <a href="https://conference-hall.io/api-platform-conference-2025-lille-and-online"><img alt="CFP API Platform Conference 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2023-March-2025&color=green"></a>
- 23 septembre 2025 : [OWASP AppSec France 2025](https://www.owaspappsecdays.fr/2025/) - Paris (France) <a href="https://sessionize.com/owasp-appsec-days-france-2025/"><img alt="CFP OWASP AppSec France" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=green"></a>
- 25-26 septembre 2025 : [Paris Web 2025](https://www.paris-web.fr) - Paris (France) <a href="https://appel.paris-web.fr/"><img alt="CFP Paris Web 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-March-2025&color=green"></a>
- 2-3 octobre 2025 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) 
- 6-10 octobre 2025 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 9-10 octobre 2025 : [Forum PHP 2025](https://event.afup.org/) - Marne-la-Vallée (France) 
- 9-10 octobre 2025 : [EuroRust 2025](https://eurorust.eu) - Paris (France) <a href="https://www.papercall.io/eurorust-2025"><img alt="CFP EuroRust 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-May-2025&color=green"></a>
- 16-17 octobre 2025 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) 
- 4-7 novembre 2025 : [NewCrafts 2025](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/ncrafts/"><img alt="CFP NewCrafts 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-April-2025&color=green"></a>
- 6 novembre 2025 : [dotAI 2025](https://www.dotai.io/) - Paris (France) <a href="https://www.dotai.io/speak"><img alt="CFP dotAI 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-March-2025&color=green"></a>
- 7 novembre 2025 : [BDX I/O](https://bdxio.fr) - Bordeaux (France) 
- 12-14 novembre 2025 : [Devoxx Morocco](https://devoxx.ma/) - Marrakech (Morocco) 
- 21 novembre 2025 : [DevFest Paris 2025](https://devfest.gdgparis.fr/) - Paris (France) <a href="https://conference-hall.io/devfest-paris-2025"><img alt="CFP Devest Paris 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-May-2025&color=green"></a>
- 28 novembre 2025 : [DevFest Lyon](https://devfest.gdglyon.com/) - Lyon (France) 
- 28-31 janvier 2026 : [SnowCamp 2026](https://snowcamp.io/) - Grenoble (France) 
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 17 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via X/twitter <https://twitter.com/lescastcodeurs> ou Bluesky <https://bsky.app/profile/lescastcodeurs.com>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->

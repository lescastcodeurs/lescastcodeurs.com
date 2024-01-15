---
title: LCC 305 - Dia critique
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 305
mp3_length: 63329142
tweet: Dia critique
# tweet size: 91-93 -> 99-101 #######################################################################
---
Cet épisode news discute de langages, de bibliothèques, d'intelligence artificielle bien sûr et même de Web.
Et puis de challenge Java et même de Père Noël !

Enregistré le 12 janvier 2024

Téléchargement de l’épisode [LesCastCodeurs-Episode-305.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-305.mp3)

## News

RIP Niklaus Wirth [https://en.wikipedia.org/wiki/Niklaus_Wirth](https://en.wikipedia.org/wiki/Niklaus_Wirth)

- Informaticien Suisse
- Conception des langages ALGOL, Modula-2 et... Pascal 
- Plusieurs distinctions: Turing 1984, John Von Neumann 1994. Depuis 1987 un prix créé à son honneur
- Plusieurs livres dont Algorithms + Data Structures = Programs 1976
- La Loi de Wirth: La beauté d'un programme réside dans la clarté de sa structure. Niklaus Wirth a toujours prôné la simplicité, la lisibilité et la compréhensibilité. Approche pragmatique 

[https://recording.zencastr.com/lescastcodeurs/news-305](https://recording.zencastr.com/lescastcodeurs/news-305)



### Langages

L'enfer sur terre: equals and hashCode pour les entitées JPA. Tout le monde a un avis, faire le sien est compliqué
- [https://vladmihalcea.com/hibernate-facts-equals-and-hashcode/](https://vladmihalcea.com/hibernate-facts-equals-and-hashcode/)
- [https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/](https://vladmihalcea.com/how-to-implement-equals-and-hashcode-using-the-jpa-entity-identifier/)
- [https://vladmihalcea.com/the-best-way-to-implement-equals-hashcode-and-tostring-with-jpa-and-hibernate/](https://vladmihalcea.com/the-best-way-to-implement-equals-hashcode-and-tostring-with-jpa-and-hibernate/)
- [https://jpa-buddy.com/blog/hopefully-the-final-article-about-equals-and-hashcode-for-jpa-entities-with-db-generated-ids/](https://jpa-buddy.com/blog/hopefully-the-final-article-about-equals-and-hashcode-for-jpa-entities-with-db-generated-ids/)


Kotlin va t’il décliné en 2025, faute d’innovation et avec les nouvelles features de Java ?
[https://shiftmag.dev/kotlin-vs-java-2392/](https://shiftmag.dev/kotlin-vs-java-2392/)

- Selon l’auteur, d’autres langages alternatifs pour la JVM ont décliné, comme Groovy et Scala
- L’auteur pense qu’il y aura de moins en moins de différenciants par rapport à Java, et Kotlin n’a pas rajouté de fonctionnalités significatives depuis un an ou deux

Comment enlever des accents et autres marques diacritiques dans des chaines de caractères en Java
[https://glaforge.dev/posts/2024/01/url-slug-or-how-to-remove-accents-in-java/](https://glaforge.dev/posts/2024/01/url-slug-or-how-to-remove-accents-in-java/)

- Pour les URLs d’un blog post, par exemple, on souhaite avoir le titre dans l’URL, mais de manière URL-friendly, donc sans accents, en remplaçant les espaces par des tirets, etc
- Guillaume propose une approche basée sur la normalisation de chaine unicode et les expressions régulières
- Mais il évoque également la librairie Slugify qui est en plus capable de faire de la translitération (pour transformer aussi des idéogrammes et autre caractères non-ASCII)

Les “gatherers” de JDK 22
[https://blog.soebes.io/posts/2024/01/2024-01-07-jdk-gatherer/](https://blog.soebes.io/posts/2024/01/2024-01-07-jdk-gatherer/)

- Nous avons mentionné récemment le JEP 461 pour Java 22 : Stream Gatherers, qui sera en preview
- Permet de faire des choses qui étaient un peu compliquées à faire avec l’API stream avant, comme par exemple implémenter des fenêtres glissantes sur les données du stream
- L’article parle des différentes capacités des gatherers, avec un Integrator, un Initializer et un Finisher, et enfin un Combiner, avec différents exemples de code pour les illustrer


### Librairies

Le fonds tech souverain d’origine allemande sponsorise le développement de Log4J
[https://www.sovereigntechfund.de/news/log4j-investment](https://www.sovereigntechfund.de/news/log4j-investment)

- 3 contributeurs pourront bosser dessus à temps plein
- permet de sécuriser le développement du projet
- réaction à l’impact de la CVE Log4shell qui avait bien marqué les esprits et fait bosser plein de gens le weekend pour tout patcher !



### Cloud

Le glossaire de la Cloud Native Foundation a été traduit en Français
[https://glossary.cncf.io/fr/](https://glossary.cncf.io/fr/)



### Web

Sortie de Vue.JS 3.4
[https://blog.vuejs.org/posts/vue-3-4](https://blog.vuejs.org/posts/vue-3-4)

- le parseur de composants (SFC) est 2x plus rapide
- amélioration du système de réactivité en particulier pour les propriétés “computed” (recalculées)
- le namespace JSX deprecated a été supprimé
- Cédric Exbrayat de NinjaSquad couvre également les nouveautés dans cet article [https://blog.ninja-squad.com/2023/12/29/what-is-new-vue-3.4/](https://blog.ninja-squad.com/2023/12/29/what-is-new-vue-3.4/)

Astro JS 4.1 [https://astro.build/blog/astro-410/](https://astro.build/blog/astro-410/)

- Découverte de ce FW grâce à Petipois [https://medium.com/front-end-weekly/create-a-website-using-astro-in-2024-f5963003c19c](https://medium.com/front-end-weekly/create-a-website-using-astro-in-2024-f5963003c19c)
- Astro est le framework web pour la construction de sites web axés sur le contenu tels que les blogs, le marketing et le commerce électronique. Astro est surtout connu pour être le pionnier d'une nouvelle architecture frontend afin de réduire la surcharge et la complexité de JavaScript par rapport aux autres frameworks
- Architecture en "Astrot Islands" (interface en composants isolés)
- SSG et SSR (Static Site Generator ey Server Side Rendering)
- 0 Javascript si tu veux
- Tu utilises React, Angular ou Vue pour tes composants
- Lis plus ici : [https://kinsta.com/fr/blog/astro-js/](https://kinsta.com/fr/blog/astro-js/)

React à 10 ans... et là ma découverte de React Server Components [https://www.joshwcomeau.com/react/server-components/#introduction-to-react-server-components-3](https://www.joshwcomeau.com/react/server-components/#introduction-to-react-server-components-3)

- "At a high level, _React Server Components_ is the name for a brand-new paradigm. In **this new world**, we can create components that run _exclusively on the server_."
- L'idée est de n'est pas faire des composants entiers en react dans le backend, et de n'est pas déléguer aux rendering client pour ces composants

Prédictions 2024 [https://thenewstack.io/2024-predictions-by-javascript-frontend-framework-maintainers/](https://thenewstack.io/2024-predictions-by-javascript-frontend-framework-maintainers/)

- Angular: Optional Zone.JS
- Next.js (nouveau compilateur, + backend ?)
- React: adoption de React Server Components, SPA ne suffit pas. React auto-memorizing (useCallback/useMemo deprecate)
- Solid 2.0 viendra après SolidStart (framework web)


### Data et Intelligence Artificielle

Retour d'experience sur faire du RAG avec des LLMs [https://x.com/taranjeetio/status/1742587923189596531?s=20](https://x.com/taranjeetio/status/1742587923189596531?s=20)


Gunnar Morling a lancé le 1 billion row challenge :
[https://www.morling.dev/blog/one-billion-row-challenge/](https://www.morling.dev/blog/one-billion-row-challenge/)

- L’idée est de calculer le min / max, la moyenne, de températures, indiquées ligne par ligne dans un énorme fichier
- Il y a énormément de contributions. Les plus rapides ont utilisé des memory mapped files, ou bien des instructions SIMD
- Le challenge était en pur Java, mais d’autres personnes ont tenté l’expérience avec diverses bases de données ou autres langages de programmation

Didier Girard parle de Shadow AI
[https://www.linkedin.com/posts/didiergirard_shadowai-genai-gouvernance-activity-7150031627006464000-IF1G/](https://www.linkedin.com/posts/didiergirard_shadowai-genai-gouvernance-activity-7150031627006464000-IF1G/)

- Comme on a parlé de “shadow IT” à une époque, la nouvelle ombre du jour, c’est l’intelligence artificielle
- Pour être plus productifs, les employés utilisent l’IA, sans forcément le dire à leur employeur
- Le problème étant qu’avec certains système d’IA, les données que vous envoyées peuvent être sauvegardées et utilisées pour ré-entrainer l’IA... et potentiellement, l’IA pourrait recracher verbatim du texte provenant de ces données à d’autres utilisateurs. D’où une brèche dans la sécurité des données de l’entreprise

Appel de fonction avec le LLM Gemini de Google
[https://glaforge.dev/posts/2023/12/22/gemini-function-calling/](https://glaforge.dev/posts/2023/12/22/gemini-function-calling/)

- Les Large Language Model sont limités par les connaissances qu’ils ont acquises lors de leur entrainement
- Une approche possible pour se baser sur une base documentaire est d’utiliser l’approche Retrieval Augmented Generation (RAG) où l’on utilise une base de données vectorielle pour récupérer des passages de texte qui correspondent à la requête demandée
- Mais il existe aussi une approche intéressante qui permet d’appeler des systèmes externes (APIs, service local, etc) en permettant au LLM de savoir qu’il peut répondre à une demande donnée en se basant sur l’appel d’une fonction. Dans cette approche, le LLM répond qu’il faudrait appeler une fonction (par exemple pour connaitre la météo à Paris) et il indique quels paramètres passer (“Paris”). Le développeur ensuite appel cette fonction et retourne le résultat de l’invocation au LLM, qui va ensuite pouvoir générer du texte avec ces données.
- C’est l’approche “function calling” qui permet d’étendre à un LLM pour lui donner accès à des données live, derrière une API, etc




### Méthodologies

Une video sur le père Noël et la pensé critique de la Tronce en Biais [https://youtu.be/tqlYKO_asFw?si=g1Fq5OfCvQONNb2i](https://youtu.be/tqlYKO_asFw?si=g1Fq5OfCvQONNb2i)

- Vidéo interessante pour comprendre comment nous, dans la tech, on peut tomber facilement sur des croyances qui sont doutantes si on développe pas l'esprit critique. 
- Le père Noël,  véritable complot planétaire des adultes, magasins, médias ... d'un mensonge
- Un enfant qui essaie d'appliquer le procédé épistémologique, il n'a pas d'autre source pour vérifier que le père noël n'existe pas, tous ses sources fiables duquel il apprend le monde (parents, profs, medias, histoires, medias) valident que le père noël existe. 
- Expliquer les incoherences par la magie, c'est quelque chose de complément banal dans l'univers d'un enfant à qui on parle en permanence de magie 
- La découverte de la mensonge aux alentours de 7 ans, l'age de la raison, est une bonne opportunité pour aborder l'esprit critique avec les enfants



### Loi, société et organisation

EU AI Act cheat sheet 
[https://www.linkedin.com/posts/yann-lecun_eu-ai-act-cheat-sheet-understand-activity-7139980837013331971-TDqI?utm_source=share&utm_medium=member_ios](https://www.linkedin.com/posts/yann-lecun_eu-ai-act-cheat-sheet-understand-activity-7139980837013331971-TDqI?utm_source=share&amp;utm_medium=member_ios)

- Les entreprises vont avoir 1 ou 2 ans pour s'y conformer
- Basics: Definition de l'AI, extraterritorialité, exceptions (oss, r&amp;D, mais aussi défense ...), classification par niveaux de risks (Prohibited > High Risk > Limited Risk > Minimal Risk)
- Prohibited: Biometrique, social credit scoring, detection d'emotions, renforcement des lois  basées sur l'identification biometrique en public
- High (des régles sont définies pour controler ces usages: transparence, qualité, risque ...): Le matériel médical, les véhicules, l'éducation, les élections, ...
- General: Transparence et information

ChatGPT n’est pas un super médecin [https://x.com/drhughharvey/status/1736308984288563550?s=46&amp;t=C18cckWlfukmsB_Fx0FfxQ](https://x.com/drhughharvey/status/1736308984288563550?s=46&amp;t=C18cckWlfukmsB_Fx0FfxQ)

- ces d’utilisation ChatGPT en copilote 
- Trop de non déterminisme dans les réponses à la même question
- 41% des réponses dans le consensus médical
- 7% dangereuse
- Faire du rag n’a monté que de quelques pourcents 5

Transcription de la conférence donnée PGConf EU par Laetitia Avrot et Karen Jex (expertes Postgresql): Trying to be Barbie in Ken's Mojo Dojo Casa House [https://karenjex.blogspot.com/2023/12/trying-to-be-barbie-in-kens-mojo-dojo.html](https://karenjex.blogspot.com/2023/12/trying-to-be-barbie-in-kens-mojo-dojo.html)

- Il s'agit d'une conférence en sociologie. En sociologie, il suffit que quelque chose soit vrai pour la majorité des cas pour être considéré comme une vérité, car cela repose sur des statistiques.
- Sujet donné pour susciter de l'attention sur un problème qui existe bien dans la tech. Elles ont réalisé que la grande majorité de la population n'en était pas consciente (barbie)! Le film Barbie les a fait comprendre qu'elles doivent expliquer ce à quoi les femmes sont confrontées au quotidien, afin que les autres puissent comprendre à quel point cela peut être épuisant.
- Très bien documenté avec bcp de liens et références au delà de l'expérience personnelle
- Transcription et slides dans l'article
- Lien entre film Barbie et la place des femmes dans la tech. Idées non neuves mais cela a été un impact
- Les biais en général ne sont pas particuliers à un genre, sont globales. Test sur les biais implicites 
- Il existe un déficit de talents technologiques (estimé atteindre de 1,4 million à 3,9 millions de personnes d'ici 2027 dans les pays de l'UE-27), qui pourrait potentiellement être comblé en doublant la proportion de femmes dans le secteur technologique. Cependant, la part des femmes dans les rôles technologiques connaît sa plus basse représentation dans les domaines en pleine croissance tels que DevOps et le cloud.
- plus de la moitié des femmes quittent l'industrie technologique 10 à 20 ans après le début de leur carrière, soit le double du taux des hommes. (manque d'opportunités, difficultés face aux biais, se sentir comme une outsider etc...)
- La part des femmes dans les rôles technologiques en Europe risque de diminuer pour atteindre 21% d'ici 2027.
- Solutions: roles modèles, combattre nos biais (si on ne les reconnait pas, on ne peut pas le combattre), mentoring, faire attention à donner de la voix etc...

New York Times porte plainte à open ai  [https://www.bbc.com/news/technology-67826601](https://www.bbc.com/news/technology-67826601)

- réclame des billions en copy right, suit aussi Microsoft et Bing qui utilise open ai
- on peut trouver des extraits des articles avec suscription disponibles 
- Si on demande à chat gpt sur des news actuelles, reprend des explications tirés du NYT sans le mentionner 
- Sur bing on peut trouver aussi des extraits sans citer ni linker la source 
- Conséquences pour NYT: moins d’accès à leur site, moins de consultations, moins des clicks, chute des suscriptions, pertes monétaires importantes 
- Réponse de OpenAI au NYT [https://openai.com/blog/openai-and-journalism](https://openai.com/blog/openai-and-journalism)
  - We collaborate with news organizations and are creating new opportunities
  - Training is fair use, but we provide an opt-out because it’s the right thing to do
  - “Regurgitation” is a rare bug that we are working to drive to zero
  - The New York Times is not telling the full story


## Outils de l’épisode

Userscripts [https://github.com/quoid/userscripts](https://github.com/quoid/userscripts): extension pour changer le CSS et JS des sites dans votre navigateur



## Rubrique débutant

Guillaume a publié 2 “codelabs” pour démarrer sur LangChain4J, en utilisant le LLM PaLM de Google
[https://glaforge.dev/posts/2023/12/18/get-hands-on-codelabs-to-dabble-with-llms/](https://glaforge.dev/posts/2023/12/18/get-hands-on-codelabs-to-dabble-with-llms/)

- Ces 2 tutoriels pratiques permettent de découvrir les deux modèles text et chat de PaLM
- Différentes tâches sont illustrées pour faire de simples questions/réponses, de simples chat, mais aussi comment extraire des données structurées d’un texte, comment faire de la classification (avec un exemple d’analyse de sentiment)

Google Summer of Code - appel aux projets [https://summerofcode.withgoogle.com/](https://summerofcode.withgoogle.com/)



## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 31 janvier 2024-3 février 2024 : [SnowCamp](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/organizer/event/Bq5k5rbMXGynAls6PjRB"><img alt="CFP SnowCamp" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2023&color=red"></a>
- 1 février 2024 : [AgiLeMans](https://agilemans.org/) - Le Mans (France) <a href="https://sessionize.com/8ieme-journee-agile-au-mans-france/"><img alt="CfP AgiLeMans" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-December-2023&color=red"></a>
- 6 février 2024 : [DevFest Paris](https://devfest.gdgparis.com/) - Paris (France) <a href="https://conference-hall.io/public/event/pJRc2OqdUx5iAXkJgTEW"><img alt="CFP DevFest Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2023&color=red"></a>
- 8-9 février 2024 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/speaker/event/J2VpXPXWngD69u0nrA3R"><img alt="CFP Touraine Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-November-2023&color=red"></a>
- 15-16 février 2024 : [Scala.IO](https://scala.io/) - Nantes (France) <a href="https://www.papercall.io/scalaio-2024-nte"><img alt="CFP Scala.IO" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-January-2024&color=green"></a>
- 6-7 mars 2024 : [FlowCon 2024](https://my.weezevent.com/flowcon-2024) - Paris (France) 
- 14-15 mars 2024 : [pgDayParis](https://2024.pgday.paris/) - Paris (France) 
- 19 mars 2024 : [AppDeveloperCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/appdevelopercon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [ArgoCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/argocon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [BackstageCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/backstagecon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Cilium + eBPF Day](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cilium-ebpf-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Cloud Native AI Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cloud-native-ai-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Cloud Native Wasm Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cloud-native-wasm-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Data on Kubernetes Day](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/data-on-kubernetes-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Istio Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/istio-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Kubeflow Summit Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/kubeflow-summit/#about) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Kubernetes on Edge Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/kubernetes-on-edge-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Multi-Tenancy Con](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/multi-tenancycon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Observabiity Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/observability-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [OpenTofu Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/opentofu-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Platform Engineering Day](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/platform-engineering-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [ThanosCon Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/thanoscon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19-21 mars 2024 : [IT & Cybersecurity Meetings](https://www.it-and-cybersecurity-meetings.com/) - Paris (France) 
- 19-22 mars 2024 : [KubeCon + CloudNativeCon Europe 2024](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe-2024/) - Paris (France) <a href="https://sessionize.com/kubecon-cloudnativecon-europe-2024/"><img alt="CFP Kubecon EU" src="https://img.shields.io/static/v1?label=CFP&message=18-Sep-2023%20to%2026-Nov-2023&color=red"> </a>
- 21 mars 2024 : [IA & Data Day Strasbourg](https://iadataday.capitale.dev) - Strasbourg (France) <a href="https://conference-hall.io/public/event/zmQmuXOT5r6xcLvcH59j"><img alt="CFP IA & Data Day Strasbourg" src="https://img.shields.io/static/v1?label=CFP&message=until%205-February-2024&color=green"></a>
- 22-23 mars 2024 : [Agile Games France](https://agilegamesfrance.fr/doku.php?id=evenement_2024) - Valence (France) 
- 26-28 mars 2024 : [Forum INCYBER Europe](https://europe.forum-incyber.com/) - Lille (France) 
- 28-29 mars 2024 : [SymfonyLive Paris 2024](https://live.symfony.com/2024-paris/) - Paris (France) <a href="https://live.symfony.com/2024-paris/cfp"><img alt="CFP SymfonyLive Paris 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-December-2023&color=green"></a>
- 28-30 mars 2024 : [DrupalCamp Roazhon](https://rennes2024.drupalcamp.fr/) - Rennes (France) 
- 4-6 avril 2024 : [Toulouse Hacking Convention](https://thcon.party/) - Toulouse (France) <a href="https://thcon.party/cfp/#intra"><img alt="CFP THC 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-January-2024&color=green"></a>
- 17-19 avril 2024 : [Devoxx France](https://www.devoxx.fr/) - Paris (France) <a href="https://devoxxfr2024.cfp.dev/"><img alt="CFP Devoxx France" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-January-2024&color=green"></a>
- 18-20 avril 2024 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr24.cfp.dev/"><img alt="CFP Devoxx Greece 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-December-2023&color=green"></a>
- 22 avril 2024 : [React Connection 2024](https://reactconnection.io/) - Paris (France) <a href="https://conference-hall.io/public/event/J4B6tn2Vas37pLaU0pIo"><img alt="CFP React Connection 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%203-February-2024&color=green"></a>
- 23 avril 2024 : [React Native Connection 2024](https://reactnativeconnection.io/) - Paris (France) <a href="https://conference-hall.io/public/event/pdyGi2RB4aYQnp7gdGhc"><img alt="CFP React Native Connection 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%203-February-2024&color=green"></a>
- 25-26 avril 2024 : [MiXiT](https://mixitconf.org/fr/) - Lyon (France) <a href="https://mixitconf.org/fr/"><img alt="CFP MiXiT" src="https://img.shields.io/static/v1?label=CFP&message=from%2016-Dec-2023-until%2019-Jan-2024&color=green"></a>
- 25-26 avril 2024 : [Android Makers](https://androidmakers.droidcon.com/) - Paris (France) <a href="https://sessionize.com/androidmakers-by-droidcon-2024"><img alt="CFP Android Makers by droidcon 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2024&color=green"></a>
- 8-10 mai 2024 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk24.cfp.dev/#/"><img alt="CFP Devoxx UK 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-January-2024&color=green"></a>
- 16-17 mai 2024 : [Newcrafts Paris](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/newcrafts-paris-2024"><img alt="CFP Newcrafts Paris 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-Jan-2024&color=green"></a>
- 22-25 mai 2024 : [Viva Tech](https://vivatechnology.com/) - Paris (France) 
- 24 mai 2024 : [AFUP Day Nancy](https://event.afup.org/afup-day-2024/afup-day-2024-nancy/) - Nancy (France) <a href="https://afup.org/event/afupday2024nancy"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Poitiers](https://event.afup.org/afup-day-2024/afup-day-2024-poitiers/) - Poitiers (France) <a href="https://afup.org/event/afupday2024poitiers"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Lille](https://event.afup.org/afup-day-2024/afup-day-2024-lille/) - Lille (France) <a href="https://afup.org/event/afupday2024lille"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Lyon](https://event.afup.org/afup-day-2024/afup-day-2024-lyon/) - Lyon (France) <a href="https://afup.org/event/afupday2024lyon"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 2 juin 2024 : [PolyCloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/public/event/0NC2WdB8KknRtX8aBgyO"><img alt="CFP PolyCloud" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-March-2024&color=green"></a>
- 6-7 juin 2024 : [DevFest Lille](https://devfest.gdglille.org/) - Lille (France) 
- 6-7 juin 2024 : [Alpes Craft](https://www.alpescraft.fr/) - Grenoble (France) 
- 11-12 juin 2024 : [OW2con](https://www.ow2con.org/view/2024/) - Paris (France) <a href="https://pretalx.com/ow2con-2024/cfp"><img alt="CFP OW2con'24 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=green"></a>
- 12-14 juin 2024 : [Rencontres R](https://rr2024.sciencesconf.org/) - Vannes (France) 
- 14 juin 2024 : [DevQuest](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/public/event/geINICiIQFU0WdORU423"><img alt="DevQuest" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=green"></a>
- 27-28 juin 2024 : [Agi Lille](http://agilille.fr/) - Lille (France) <a href="https://sessionize.com/agilille-2024"><img alt="CFP Agi Lille 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2024&color=green"></a>
- 4-5 juillet 2024 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/public/event/32IQQ5wYijdJdXrqtYsx/"><img alt="CFP Sunny Tech 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=green"></a>
- 19-20 septembre 2024 : [API Platform Conference](https://api-platform.com/con/) - Lille (France) & Online <a href="https://conference-hall.io/public/event/GMijW4ZrZDo6hzKeF1gk"><img alt="CFP API Platform Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-March-2024&color=green"></a>
- 7-11 octobre 2024 : [Devoxx Belgium](https://devoxx.be) - Antwerp (Belgium) 
- 10-11 octobre 2024 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) 
- 10-11 octobre 2024 : [Forum PHP](https://event.afup.org/) - Marne-la-Vallée (France) 
- 17-18 octobre 2024 : [DevFest Nantes](https://devfest.gdgnantes.com/en/) - Nantes (France) 
- 6 novembre 2024 : [Master Dev De France](https://www.masterdevfrance.com/) - Paris (France) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>

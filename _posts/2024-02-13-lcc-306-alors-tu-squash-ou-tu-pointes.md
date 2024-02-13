---
title: LCC 306 - Alors tu squash ou tu pointes?
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 306
mp3_length: 66414631
tweet: Episode 306 Alors tu squash ou tu pointes? #java #pytorch #dependabot #renovate #conventionalcommits #okta #google #facebook #stackoverflow #devoxxfr
# tweet size: 91-93 -> 99-101 #######################################################################
---

Dans cet épisode, Katia, Emmanuel et Arnaud explorent de nouvelles approches du Builder pattern en Java, l'introduction du Pattern Matching Primitives dans Java, et les déboires de l’intelligence artificielle avec des attaques de la chaîne d'approvisionnement sur Pytorch.
Ils abordent aussi les licenciements dans diverses entreprises technologiques, l'évolution du trafic de Stackoverflow et donnent de conseils pratiques pour les développeurs, notamment sur les commits conventionnels, la mise à jour de dépendances avec Dependabot, Renovate et le déboggage des programmes Java.
Ils terminent avec leur retour d’expérience sur la relecture des sujets de Devoxx France 2024.

Enregistré le 9 février 2024

Téléchargement de l’épisode [LesCastCodeurs-Episode-306.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-306.mp3)

Votre avis compte énormément pour nous ! 🎧 Nous voulons rendre Les Cast Codeurs encore plus genial, et c'est là que vous intervenez. 🌟
Aidez-nous en partageant vos idées, suggestions et souhaits pour 2024, [dans notre tout nouveau formulaire de retour](https://docs.google.com/forms/d/e/1FAIpQLSc2xIWqWNi3ipx7Byth_TE6x9bQAvkCSuyeSkyEURbJNIga7g/viewform). C'est rapide, facile et ça ne prend que 2 minutes.

## News

### Langages

Une approche différente du Builder pattern en Java, inspirée par ce qui se fait dans la communauté Golang
[https://glaforge.dev/posts/2024/01/16/java-functional-builder-approach/](https://glaforge.dev/posts/2024/01/16/java-functional-builder-approach/)

- Les builders, surtout quand ils sont imbriqués les uns dans les autres, peuvent devenir un peu verbeux à lire
- Est-ce qu’on peut prendre une nouvelle approche ? Oui, en tirant parti des lambdas, avec des méthodes de mutation qui retournent des lambda qui effectuent la mutation
- On retrouve le plaisir de pouvoir construire une instance à l’aide d’un constructeur, plutôt qu’un builder
- En recherchant le sujet, Guillaume est aussi tombé sur une approche type safe du builder classique [https://www.endoflineblog.com/type-safe-builder-pattern-in-java-and-the-jilt-library](https://www.endoflineblog.com/type-safe-builder-pattern-in-java-and-the-jilt-library) (qui est implémentée sous forme d’annotation processor dans le petit projet open source Jilt)

Pattern Matching Primitives (JEP 455) [https://openjdk.org/jeps/455](https://openjdk.org/jeps/455)

- Uniformité autorisant le pattern de type pour tous les types, qu'ils soient primitifs ou de référence et sécurité dans la conversion de types et éviter les erreurs runtime pour les conversions de type. Plus de robustesse 
- Ca l'explique bien ici. Les deux [https://www.infoq.com/news/2024/02/java-enhances-pattern-matching/](https://www.infoq.com/news/2024/02/java-enhances-pattern-matching/)
- Exemple:

  - Avant

    ``` java
    if (i >= -128 && i <= 127) {
        byte b = (byte)i;
        ... b ...
    }
    ```

  - Maintenant

    ``` java
    if (i instanceof byte b) {
        ... b ...
    }
    byte b = 42;
    b instanceof int;         // true (unconditionally exact)
    int i = 42;
    i instanceof byte;        // true (exact)
    int i = 1000;
    i instanceof byte;        // false (not exact)
    ```

News Java, le tour [https://www.infoq.com/news/2024/02/java-news-roundup-jan29-2024/](https://www.infoq.com/news/2024/02/java-news-roundup-jan29-2024/)

- Open JDK avec preview de Classe File API
- JDK 22 et 23
- Glassfish, GraalVM, Spring, Quarkus, Infinispan, Hibernate, Grails, Vert.x... plein d'outils
- Keycloak
- Langchain
- Lire les détails dans l'article d'InfoQ
- etc.

### Data et Intelligence Artificielle

Une attaque de supply chain sur Pytorch et l'IA [https://johnstawinski.com/2024/01/11/playing-with-fire-how-we-executed-a-critical-supply-chain-attack-on-pytorch/](https://johnstawinski.com/2024/01/11/playing-with-fire-how-we-executed-a-critical-supply-chain-attack-on-pytorch/)

- Soumettre une PR avec une correction de typo
- ca leur a approuvé de faire tourner la CI automatiquement quand ils poussent la PR
- soumis une PR qui curl fetch un gist qui tournait sur un runner self-hosté
- et ils ont choppé les tokens pour plus tard publier les binaires dans les repos officiels
- et personne n’a rien vu

Support du modèle de génération d’image Imagen dans LangChain4j rajouté dans la dernière version du project
[https://glaforge.dev/posts/2024/02/01/image-generation-with-imagen-and-langchain4j/](https://glaforge.dev/posts/2024/02/01/image-generation-with-imagen-and-langchain4j/)

- contribué par Guillaume
- on peut générer des images, mais aussi les éditer

Collab entre Google et Hugging Face [https://www.infoq.com/news/2024/01/hugging-face-gcp-ai/](https://www.infoq.com/news/2024/01/hugging-face-gcp-ai/)

- intégration avec [Vertex.ai](http://Vertex.ai) et d'autres services Google
- Facilite deploy dans le cloud google et l'intégration avec Kubernetes

Guillaume a écrit un article et développé une application pour visualiser les tokens générés par les large language models dérivés du modèle PaLM
[https://glaforge.dev/posts/2024/02/05/visualize-palm-based-llm-tokens/](https://glaforge.dev/posts/2024/02/05/visualize-palm-based-llm-tokens/)

### Outillage

Stackoverflow voit son traffic diminuer doucement depuis quelques années, mais depuis l’avènement de ChatGPT et consort, la chute s’accélère
[https://twitter.com/swyx/status/1753122780709871834](https://twitter.com/swyx/status/1753122780709871834)

- mais apparemment, ce graphique ne serait pas correct selon StackOverflow, qui n’aurait perdu que 5% par rapport à l’année dernière
- [https://stackoverflow.blog/2023/08/08/insights-into-stack-overflows-traffic/](https://stackoverflow.blog/2023/08/08/insights-into-stack-overflows-traffic/)
- StackOverflow ont changé l’utilisation de Google Analytics, ce qui expliquerait en grande partie la tendance de ce graphe qui porte à confusoin

Amélie Benoit - Dependant Bot Visual way [https://twitter.com/AmelieBenoit33/status/1754397434812203455](https://twitter.com/AmelieBenoit33/status/1754397434812203455)

- Un outil visuel pour dependant bot! tout est dans l'image!

- Différences entre les bots Renovate et Dependabot [https://docs.renovatebot.com/bot-comparison/](https://docs.renovatebot.com/bot-comparison/)

- Tableau comparatif intéressant

### Méthodologies

Le pouvoir des “conventional commits” par Julien Ponce
[https://julien.ponge.org/blog/the-power-of-conventional-commits/](https://julien.ponge.org/blog/the-power-of-conventional-commits/)

- Convention poussée par l’équipe Angular, à la base
- Pour standardiser et clarifier les messages de commits
- Mais aussi pratique pour les outils comme JReleaser pour automatiser les release notes d’un projet

### Loi, société et organisation

Google vire encore des ingénieurs dans la division matérielle pixel, et dans les ingénieurs cœur [https://www.nytimes.com/2024/01/11/technology/google-layoffs.html](https://www.nytimes.com/2024/01/11/technology/google-layoffs.html)

- Kevin Bourrillon connu pour Guava entre  autre fait partie des virés [https://x.com/kevinb9n/status/1745890746350321818?s=46&amp;t=C18cckWlfukmsB_Fx0FfxQ](https://x.com/kevinb9n/status/1745890746350321818?s=46&amp;t=C18cckWlfukmsB_Fx0FfxQ)

Okta vire 400 personnes dont Matt Raible [https://techcrunch.com/2024/02/01/okta-layoffs-400-employees/?guccounter=1&guce_referrer=aHR0cHM6Ly9kdWNrZHVja2dvLmNvbS8&guce_referrer_sig=AQAAANLn7NCOa2yn44ysU3fSCDK5s1hgzVrIQzmKFzBjufCMzQhGfyc8mah4EhiPv1I0eoVrzVWbdKn0q6yOYR6-ctpZ42jc6ic-mz-Cdz8lWGVEDLIzEeqsCCE4PfxnhrsnChPT26DJxixmykS1YfPigsyf4vmqqpbMd5tme_GrMBjA](https://techcrunch.com/2024/02/01/okta-layoffs-400-employees/?guccounter=1&guce_referrer=aHR0cHM6Ly9kdWNrZHVja2dvLmNvbS8&guce_referrer_sig=AQAAANLn7NCOa2yn44ysU3fSCDK5s1hgzVrIQzmKFzBjufCMzQhGfyc8mah4EhiPv1I0eoVrzVWbdKn0q6yOYR6-ctpZ42jc6ic-mz-Cdz8lWGVEDLIzEeqsCCE4PfxnhrsnChPT26DJxixmykS1YfPigsyf4vmqqpbMd5tme_GrMBjA)

- cela suit Microsoft (gaming), eBay, SAP, RIOT Games (League of Legend), Google, Amazon (prime, audible), Unity etc pleins d’autres. Tout ça juste en janvier. 

Facebook fête ses 20 ans
[https://www.francetvinfo.fr/internet/reseaux-sociaux/facebook/facebook-a-20-ans-de-sit[…]la-lente-mutation-du-doyen-des-reseaux-sociaux_6323610.html](https://www.francetvinfo.fr/internet/reseaux-sociaux/facebook/facebook-a-20-ans-de-site-incontournable-pour-etudiants-a-truc-de-vieux-on-vous-raconte-la-lente-mutation-du-doyen-des-reseaux-sociaux_6323610.html)
[https://www.bbc.com/news/technology-68109208](https://www.bbc.com/news/technology-68109208)

- Quoi à dire de plus que le temps passe vite ... #old

## Rubrique débutant

Manuel de survie de la femme dans la tech [https://www.duchess-france.fr/dossier/women%20in%20tech/alli%C3%A9s/2023/01/15/manuel-survie-femme-tech.html](https://www.duchess-france.fr/dossier/women%20in%20tech/alli%C3%A9s/2023/01/15/manuel-survie-femme-tech.html)

Parfois vos programmes Java ont l’air bloqués. Vous pouvez effectuer un thread dump dans un autre terminal en récupérant le PID du process Java et en faisant un kill -3 PID
[https://www.digitalocean.com/community/tutorials/java-thread-dump-visualvm-jstack-kill-3-jcmd](https://www.digitalocean.com/community/tutorials/java-thread-dump-visualvm-jstack-kill-3-jcmd)

## Conférences

Dans les coulisses du Call for Paper de [Devoxx France 2024](https://www.devoxx.fr/)

La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 8-9 février 2024 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/speaker/event/J2VpXPXWngD69u0nrA3R"><img alt="CFP Touraine Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-November-2023&color=red"></a>
- 15-16 février 2024 : [Scala.IO](https://scala.io/) - Nantes (France) <a href="https://www.papercall.io/scalaio-2024-nte"><img alt="CFP Scala.IO" src="https://img.shields.io/static/v1?label=CFP&message=until%2008-January-2024&color=red"></a>
- 6-7 mars 2024 : [FlowCon 2024](https://my.weezevent.com/flowcon-2024) - Paris (France) 
- 14-15 mars 2024 : [pgDayParis](https://2024.pgday.paris/) - Paris (France) 
- 17-18 mars 2024 : [Cloud Native Rejekts EU 2024](https://cloud-native.rejekts.io/) - Paris (France) 
- 19 mars 2024 : [AppDeveloperCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/appdevelopercon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [ArgoCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/argocon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [BackstageCon](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/backstagecon/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Cilium + eBPF Day](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cilium-ebpf-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Cloud Native AI Day Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cloud-native-ai-day/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP KubeCon Colocated events" src="https://img.shields.io/static/v1?label=CFP&message=until%203-December-2023&color=red"></a>
- 19 mars 2024 : [Cloud Native StartupFest Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cloud-native-startupfest/) - Paris (France) 
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
- 19 mars 2024 : [Cloud Native Startup Fest Europe](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/co-located-events/cloud-native-startupfest/) - Paris (France) <a href="https://sessionize.com/kccnc-eu-co-located-24"><img alt="CFP Cloud Native Startup Fest Europe" src="https://img.shields.io/static/v1?label=CFP&message=until%207-February-2024&color=green"></a>
- 19 mars 2024 : [PaaS Forward by OVHcloud | Rancher by SUSE](https://kccnceu2024.sched.com/event/1Z1yp) - Paris (France) 
- 19-21 mars 2024 : [CloudNativeHacks](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/program/cloudnativehacks/) - Paris (France) 
- 19-21 mars 2024 : [IT & Cybersecurity Meetings](https://www.it-and-cybersecurity-meetings.com/) - Paris (France) 
- 19-22 mars 2024 : [KubeCon + CloudNativeCon Europe 2024](https://events.linuxfoundation.org/kubecon-cloudnativecon-europe-2024/) - Paris (France) <a href="https://events.linuxfoundation.org/kubecon-cloudnativecon-europe/attend/scholarships/"><img alt="Scholarship" src="https://img.shields.io/static/v1?label=Scholarship&message=until%2007-January-2024&color=yellow" /></a>
- 21 mars 2024 : [IA & Data Day Strasbourg](https://iadataday.capitale.dev) - Strasbourg (France) <a href="https://conference-hall.io/public/event/zmQmuXOT5r6xcLvcH59j"><img alt="CFP IA & Data Day Strasbourg" src="https://img.shields.io/static/v1?label=CFP&message=until%205-February-2024&color=green"></a>
- 22-23 mars 2024 : [Agile Games France](https://agilegamesfrance.fr/doku.php?id=evenement_2024) - Valence (France) 
- 26-28 mars 2024 : [Forum INCYBER Europe](https://europe.forum-incyber.com/) - Lille (France) 
- 28-29 mars 2024 : [SymfonyLive Paris 2024](https://live.symfony.com/2024-paris/) - Paris (France) <a href="https://live.symfony.com/2024-paris/cfp"><img alt="CFP SymfonyLive Paris 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2018-December-2023&color=red"></a>
- 28-30 mars 2024 : [DrupalCamp Roazhon](https://rennes2024.drupalcamp.fr/) - Rennes (France) 
- 4 avril 2024 : [SoCraTes Rennes 2024](https://socrates-rennes.github.io/) - Rennes (France) 
- 4-6 avril 2024 : [Toulouse Hacking Convention](https://thcon.party/) - Toulouse (France) <a href="https://thcon.party/cfp/#intra"><img alt="CFP THC 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-January-2024&color=red"></a>
- 17-19 avril 2024 : [Devoxx France](https://www.devoxx.fr/) - Paris (France) <a href="https://devoxxfr2024.cfp.dev/"><img alt="CFP Devoxx France" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-January-2024&color=red"></a>
- 18-20 avril 2024 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr24.cfp.dev/"><img alt="CFP Devoxx Greece 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-December-2023&color=red"></a>
- 22 avril 2024 : [React Connection 2024](https://reactconnection.io/) - Paris (France) <a href="https://conference-hall.io/public/event/J4B6tn2Vas37pLaU0pIo"><img alt="CFP React Connection 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%203-February-2024&color=green"></a>
- 23 avril 2024 : [React Native Connection 2024](https://reactnativeconnection.io/) - Paris (France) <a href="https://conference-hall.io/public/event/pdyGi2RB4aYQnp7gdGhc"><img alt="CFP React Native Connection 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%203-February-2024&color=green"></a>
- 25-26 avril 2024 : [MiXiT](https://mixitconf.org/fr/) - Lyon (France) <a href="https://mixitconf.org/fr/"><img alt="CFP MiXiT" src="https://img.shields.io/static/v1?label=CFP&message=from%2016-Dec-2023-until%2019-Jan-2024&color=red"></a>
- 25-26 avril 2024 : [Android Makers](https://androidmakers.droidcon.com/) - Paris (France) <a href="https://sessionize.com/androidmakers-by-droidcon-2024"><img alt="CFP Android Makers by droidcon 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-March-2024&color=green"></a>
- 3-4 mai 2024 : [Faiseuses Du Web 3](https://buttondown.email/faiseusesduweb/archive/) - Dinan (France) 
- 8-10 mai 2024 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk24.cfp.dev/#/"><img alt="CFP Devoxx UK 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2012-January-2024&color=red"></a>
- 16-17 mai 2024 : [Newcrafts Paris](https://ncrafts.io/) - Paris (France) <a href="https://sessionize.com/newcrafts-paris-2024"><img alt="CFP Newcrafts Paris 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2014-Jan-2024&color=green"></a>
- 22-25 mai 2024 : [Viva Tech](https://vivatechnology.com/) - Paris (France) 
- 24 mai 2024 : [AFUP Day Nancy](https://event.afup.org/afup-day-2024/afup-day-2024-nancy/) - Nancy (France) <a href="https://afup.org/event/afupday2024nancy"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Poitiers](https://event.afup.org/afup-day-2024/afup-day-2024-poitiers/) - Poitiers (France) <a href="https://afup.org/event/afupday2024poitiers"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Lille](https://event.afup.org/afup-day-2024/afup-day-2024-lille/) - Lille (France) <a href="https://afup.org/event/afupday2024lille"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 24 mai 2024 : [AFUP Day Lyon](https://event.afup.org/afup-day-2024/afup-day-2024-lyon/) - Lyon (France) <a href="https://afup.org/event/afupday2024lyon"><img alt="CFP AFUP Day Nancy 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2013-November-2023&color=red"></a>
- 28-29 mai 2024 : [Symfony Live Paris](https://live.symfony.com/2024-paris/) - Paris (France) 
- 2 juin 2024 : [PolyCloud](https://polycloud.fr/) - Montpellier (France) <a href="https://conference-hall.io/public/event/0NC2WdB8KknRtX8aBgyO"><img alt="CFP PolyCloud" src="https://img.shields.io/static/v1?label=CFP&message=until%2020-March-2024&color=green"></a>
- 6-7 juin 2024 : [DevFest Lille](https://devfest.gdglille.org/) - Lille (France) <a href="https://conference-hall.io/public/event/lfYn4Qk5xCAfLHrnNANa"><img alt="CFP DevFest Lille" src="https://img.shields.io/static/v1?label=CFP&message=until%2001-April-2024&color=green"></a>
- 6-7 juin 2024 : [Alpes Craft](https://www.alpescraft.fr/) - Grenoble (France) 
- 7 juin 2024 : [Fork it! Community](https://www.forkit.community/) - Rouen (France) <a href="https://conference-hall.io/public/event/1GyOS8KvW02suD6jQmjz"><img alt="CFP Fork it community" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-April-2024&color=green"></a>
- 11-12 juin 2024 : [OW2con](https://www.ow2con.org/view/2024/) - Paris (France) <a href="https://pretalx.com/ow2con-2024/cfp"><img alt="CFP OW2con'24 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=green"></a>
- 12-14 juin 2024 : [Rencontres R](https://rr2024.sciencesconf.org/) - Vannes (France) 
- 13-14 juin 2024 : [Agile Tour Toulouse](https://tour.agiletoulouse.fr/) - Toulouse (France) 
- 14 juin 2024 : [DevQuest](https://www.devquest.fr/) - Niort (France) <a href="https://conference-hall.io/public/event/geINICiIQFU0WdORU423"><img alt="DevQuest" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=green"></a>
- 19-20 juin 2024 : [AI_dev: Open Source GenAI & ML Summit Europe](https://events.linuxfoundation.org/ai-dev-europe/) - Paris (France) 
- 27-28 juin 2024 : [Agi Lille](http://agilille.fr/) - Lille (France) <a href="https://sessionize.com/agilille-2024"><img alt="CFP Agi Lille 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-January-2024&color=green"></a>
- 4-5 juillet 2024 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) <a href="https://conference-hall.io/public/event/32IQQ5wYijdJdXrqtYsx/"><img alt="CFP Sunny Tech 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2025-February-2024&color=green"></a>
- 8-10 juillet 2024 : [Riviera DEV](https://rivieradev.fr/) - Sophia Antipolis (France) <a href="https://conference-hall.io/public/event/ieJBZ8FhXHMinZmeTCJp"><img alt="CFP Riviera Dev 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-March-2024&color=green"></a>
- 6 septembre 2024 : [JUG Summer Camp](https://www.jugsummercamp.org) - La Rochelle (France) 
- 19-20 septembre 2024 : [API Platform Conference](https://api-platform.com/con/) - Lille (France) & Online <a href="https://conference-hall.io/public/event/GMijW4ZrZDo6hzKeF1gk"><img alt="CFP API Platform Conference" src="https://img.shields.io/static/v1?label=CFP&message=until%2029-March-2024&color=green"></a>
- 7-11 octobre 2024 : [Devoxx Belgium](https://devoxx.be) - Antwerp (Belgium) 
- 10 octobre 2024 : [Cloud Nord](https://www.cloudnord.fr/) - Lille (France) 
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
<!-- vim: set spelllang=fr : -->

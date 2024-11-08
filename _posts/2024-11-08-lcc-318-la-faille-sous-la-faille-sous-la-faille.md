---
title: LCC 318 - La faille sous la faille sous la faille
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Vincent Massol, Antonio Goncalves, Arnaud Héritier, Audrey Neveu, Katia Aresti'
layout: blog-post
episode: 318
mp3_length: 60562931
tweet: La faille sous la faille sous la faille #spring #nonIA #failles #OpenTelemetry #semver #git
# tweet size: 91-93 -> 99-101 #######################################################################
---
Cet épisode est relativement pauvre en IA, ouaissssssss !
Mais il nous reste plein de Spring, plein de failles, plein d'OpenTelemetry, un peu de versionnage sémantique, une astuce Git et bien d'autres choses encore.

Enregistré le 8 novembre 2024

Téléchargement de l’épisode [LesCastCodeurs-Episode-318.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-318.mp3)

## News


### Langages

Le createur de Fernflower in decompilateur qui a relancé l'outillage autour de Java 8 est mort, un hommage d'IntelliJ IDEA [https://blog.jetbrains.com/idea/2024/11/in-memory-of-stiver/](https://blog.jetbrains.com/idea/2024/11/in-memory-of-stiver/)

- les decompilateurs s'appuyaient sur des patterns reconnus et étaient fragiles et incomplets
- surtout quand Java 8 a changé le pattern try catch et ajouté des concepts comme les annotations
- le champ était moribond quand Stiver s'est lancé
- dommage l'article n'explique pas comment le control-flow graph est genere a partir du bytecode pour ameliorer la decompilation


### Librairies

On peut maintenant utiliser Jakarta Data Repository dans Quarkus [https://in.relation.to/2024/11/04/data-in-quarkus/](https://in.relation.to/2024/11/04/data-in-quarkus/)

- petit article avec un projet example 
- aussi un lien sur la presentation de Jakarta Data par Gavin à Devoxx Belgique

Quarkus 3.16 [https://quarkus.io/guides/opentelemetry-logging](https://quarkus.io/guides/opentelemetry-logging)

- logs distribués avec OpenTelemetry (preview)
- deserialiseurs Jackson sans reflection
- des améliorations dans la stack de sécurité
- TLS registry a ratjouté graphql client et keycloak admin client
- LEs logs des container devservice et des access http sont visible dans la DevUI
- Les extensions peuvent maintenant ecrire leur doc en markdown (c'etait juste asciidoc avant)

Un artcile sur comment débuter en Spring Batch [https://www.sfeir.dev/back/planifier-des-taches-avec-spring-batch/](https://www.sfeir.dev/back/planifier-des-taches-avec-spring-batch/)


Le support OAuth2 pour RestClient arrive dans Security 6.4 / Boot 3.4. Plus de hack de WebClient dans vos applications Spring-Web ! [https://spring.io/blog/2024/10/28/restclient-support-for-oauth2-in-spring-security-6-4](https://spring.io/blog/2024/10/28/restclient-support-for-oauth2-in-spring-security-6-4)

- `RestClient` a été ajouté dans Spring Framework 6.1
- API Fluide
- Spring Security 6.4 simplifie la configuration OAuth2 avec le nouveau client HTTP synchrone `RestClient`.
- `RestClient` permet des requêtes de ressources sans dépendances réactives, alignant la configuration entre applications servlet et réactives.
- La mise à jour facilite la migration depuis `RestTemplate` et ouvre la voie à des scénarios avancés.

Marre des microservices ? Revenez au monoliths avec Spring Modulith 1.3RC1, 1.2.5 et 1.1.10 [https://spring.io/blog/2024/10/28/spring-modulith-1-3-rc1-1-2-5-and-1-1-10-released](https://spring.io/blog/2024/10/28/spring-modulith-1-3-rc1-1-2-5-and-1-1-10-released)

- Spring Modulith 1.3 RC1, 1.2.5, and 1.1.10 sont disponibles.
- La version 1.3 RC1 inclut des nouvelles fonctionnalités :
  - archiving event publication completion mode
  - compatibilité avec MariaDB et Oracle avec JDBC-based event publication registry
  - Possibilité d’externaliser des événements dans des _MessageChannels_ de Spring.
  - Expressions SpEL dans `@Externalized` 
  - validation d'architecture technique jMolecules.
- Les versions 1.2.5 et 1.1.10 apportent des correctifs et mises à jour de dépendances.

Spring gRPC 0.1 est sorti [https://github.com/spring-projects-experimental/spring-grpc](https://github.com/spring-projects-experimental/spring-grpc)

- c'est tout nouveau et explorationel
- si c'est un probleme qui vous gratte, ca vaut le coup de jeter un coup d'oeil et participer.
- Spring Boot 3.3

Integrer Spring avec Open Telemetry (OTLP  protocole) [https://spring.io/blog/2024/10/28/lets-use-opentelemetry-with-spring](https://spring.io/blog/2024/10/28/lets-use-opentelemetry-with-spring)

- rappel de la valeur de ce standard Open Telemetry
- comment l'utiliser dans vos projets Spring

Comment utiliser ollama avec Spring AI [https://spring.io/blog/2024/10/22/leverage-the-power-of-45k-free-hugging-face-models-with-spring-ai-and-ollama](https://spring.io/blog/2024/10/22/leverage-the-power-of-45k-free-hugging-face-models-with-spring-ai-and-ollama)

- permet d'acceter aux 45k modeles de Hugging faces qui supportent le deploiement sur ollama
- il y a un spring boot starter
- c'est vraiment pour **debuter**



### Cloud

Google Cloud Frankfort a subit 12h d’interruption [https://t.co/VueiQjhCA3](https://t.co/VueiQjhCA3)

- Google Cloud a subi une panne de 12 heures dans la région europe-west3 (Francfort) le 24 octobre 2024.
- La panne, causée par une défaillance d'alimentation et de refroidissement, a affecté plusieurs services, y compris Compute Engine et Kubernetes Engine.
- Les utilisateurs ont rencontré des problèmes de création de VM, des échecs d'opérations et des retards de traitement.
- Google a conseillé de migrer les charges de travail vers d'autres zones.
- il y a eu une autre zone Europeenne pas mal affectée l'année dernière
- et des clients ont perdu des données :sweat: 


### Web

La fin de la World Wild Web Foundation [https://www.theregister.com/2024/09/30/world_wide_web_foundation_closes/](https://www.theregister.com/2024/09/30/world_wide_web_foundation_closes/)

- la Fondation World Wide Web ferme ses portes. 
- Les cofondateurs estiment que les problèmes auxquels est confronté le Web ont changé et que d'autres groupes de défense peuvent désormais prendre le relais. 
- Ils estiment également que la priorité absolue doit être donnée à la passion de Tim Berners-Lee pour redonner aux individus le pouvoir et le contrôle de leurs données et pour construire activement des systèmes de collaboration puissants (Solid Protocol - [https://solidproject.org/](https://solidproject.org/)).

Release du [https://www.patternfly.org/](https://www.patternfly.org/) 6

- Fw opensource pour faire de UI, sponsor RH
- Interessant à regarder


### Data et Intelligence Artificielle

TSMC arrête des ventes à un client chinois qui aurait revenu un processeur à Huawei et utilise dans sa puce IA [https://www.reuters.com/technology/tsmc-suspended-shipments-china-firm-after-chip-found-huawei-processor-sources-2024-10-26/](https://www.reuters.com/technology/tsmc-suspended-shipments-china-firm-after-chip-found-huawei-processor-sources-2024-10-26/)

- Taiwan Semiconductor Manufacturing Company (TSMC) a suspendu ses livraisons à Sophgo, un concepteur de puces chinois, après la découverte d'une puce fabriquée par TSMC dans un processeur AI de Huawei (Ascend 910B). Cette découverte soulève des préoccupations concernant des violations potentielles des contrôles d'exportation des États-Unis, qui restreignent Huawei depuis 2020.
- Sophgo, lié à Bitmain, a nié toute connexion avec Huawei et affirme se conformer aux lois applicables. Toutefois, l'incident a conduit à une enquête approfondie de TSMC et des autorités américaines et taïwanaises

Open AI et Microsoft, de l'amour à la guerre [https://www.computerworld.com/article/3593206/microsoft-and-openai-good-by-bromance-hel[…]m_source=Adestra&amp;huid=4349eeff-5b8b-493d-9e61-9abf8be5293b](https://www.computerworld.com/article/3593206/microsoft-and-openai-good-by-bromance-hello-open-warfare.html?utm_date=20241031152153&amp;utm_campaign=Top%20Enterprise%20Stories&amp;utm_content=slotno-3-title-Microsoft%20and%20OpenAI%3A%20Goodbye%20bromance%2C%20hello%20open%20warfare&amp;utm_term=Editorial%20-%20IDG%27s%20Top%20Enterprise%20Stories&amp;utm_medium=email&amp;utm_source=Adestra&amp;huid=4349eeff-5b8b-493d-9e61-9abf8be5293b)

- on a bien suivi les chants d'amour entre Sam Altman et Satia Nadella
- ca c'est tendu ces derniers temps
- deja avec le coup chez openAI où MS avait sifflé la fin de la récré
- "on a le code, les données, l'IP et la capacité, on peut tout recrée"
- OpenAi a un competiteur de Copilot et essaie de courtises ses clients
- les apétits d'investissements d'OpenAI et une dispute sur la valeur de la aprt de MS qui a donné des crédits cloud semble etre aui coeur de la dispute du moment

Debezium 3 est sorti [https://debezium.io/blog/2024/10/02/debezium-3-0-final-released/](https://debezium.io/blog/2024/10/02/debezium-3-0-final-released/)

- Java 17 minimum pour les connecteurs et 21 pour le serveur, l'extension quarkus outbox et pour l'operateur
- nettoyage des depreciations
- metriques par table maintenant
- support for mysql 9 y compris vector data type
- oracle, default mining strategie changée
- ehcache off-heap ajouté
- amelioarations diverses Oracle (offline RAC node flush, max string size for Extended
- PostgreSQL PGVector 
- etc (Spanner, vitess, ...)

NotebookLlama: une version Open Source de NotebookLM [https://github.com/meta-llama/llama-recipes/tree/main/recipes/quickstart/NotebookLlama](https://github.com/meta-llama/llama-recipes/tree/main/recipes/quickstart/NotebookLlama)

- Si vous avez été impressionné par les démo de Gemini Notebook, en créant des podcasts à partir de différentes resources, testez la version llama
- Tutoriel étape par étape pour transformer un PDF en podcast.


### Outillage

Vous aimez Maven? Bien évidemment! Vous aimez asciidoctor? Absolument! Alors la version 3.1.0 du plugin asciidoctor pour maven est pour vous !! [https://github.com/asciidoctor/asciidoctor-maven-plugin](https://github.com/asciidoctor/asciidoctor-maven-plugin)

- Le plugin permet soit de convertir des documents asciidoc de manière autonome, soit de les gérer via le site maven

GitHub Universe: de l’IA, de l’IA et encore de l’IA [https://github.blog/news-insights/product-news/universe-2024-previews-releases/](https://github.blog/news-insights/product-news/universe-2024-previews-releases/)

- GitHub Universe 2024 présente les nouveautés de l'année, notamment la possibilité de choisir parmi plusieurs modèles d'IA pour GitHub Copilot (Claude 3.5, Gemini 1.5 Pro, OpenAI o1).
- Nouvelles fonctionnalités : GitHub Spark pour créer des micro-applications, révisions de code assistées par Copilot, sécurité renforcée avec Copilot Autofix.
- Simplification des workflows avec les extensions GitHub Copilot
- Facilitation de la création d'applications IA génératives avec GitHub Models



### Méthodologies

Les blogs de developpeurs experts Java recommandés par IntelliJ [https://blog.jetbrains.com/idea/2024/11/top-java-blogs-for-experienced-programmers/](https://blog.jetbrains.com/idea/2024/11/top-java-blogs-for-experienced-programmers/)

- pas forcement d'accord avec toute la liste
- mais elle donne de bonnes options si vous voulez lire plus de blogs Java

Keycloak revient au semantic versioning après avoir suivi le versionage à la Google Chrome [https://www.keycloak.org/2024/10/release-updates](https://www.keycloak.org/2024/10/release-updates)

- ne pas savoir si une mise a jour était retrocompatible était problématique pour les utilisateurs
- aussi les librairies clientes seront délivrées séparément et supporteront toutes les versions serveur de keycloak supportés


### Sécurité

Un exemple d'attaque de secure supply chain théorique identifiée dans le quarkiverse et les détails de la résolution [https://quarkus.io/blog/quarkiverse-and-smallrye-new-release-process/](https://quarkus.io/blog/quarkiverse-and-smallrye-new-release-process/)

- dans le quarkiverse, les choses sont automatisées pour simplifier la vie des contributeurs d'extension occasionels
- mais il y avait un défaut, les secrets de signature et d'accès à maven central étaient des secrets d'organisation
- ce qui veut dire qu'un editeur d'extension malicieux pouvait ecrire un pluging ou un test qiu lisait ses secrets et pouvait livrer de faux artifacts
- la solution est de séparer la construction des artifacts de l'etape de signature et de release sur maven central
- comme cela les cles ne sont plus accessible

Avec Okta pus besoin de mot de passe quand tu as un identifiant long :face_with_hand_over_mouth: [https://trust.okta.com/security-advisories/okta-ad-ldap-delegated-authentication-username/](https://trust.okta.com/security-advisories/okta-ad-ldap-delegated-authentication-username/)

- LOL
- Une vulnérabilité a été découverte dans la génération de la clé de cache pour l'authentification déléguée AD/LDAP.
- Les conditions:
  - **MFA non utilisé**
  - **Nom d'utilisateur de 52 caractères ou plus**
  - **Utilisateur authentifié précédemment, créant un cache d'authentification**
  - **Le cache a été utilisé en premier, ce qui peut se produire si l'agent AD/LDAP était hors service ou inaccessible, par exemple en raison d'un trafic réseau élevé**
  - **L'authentification s'est produite entre le 23 juillet 2024 et le 30 octobre 2024**
- Fixé le 30 octobre, 2024

La revanche des imprimantes !! Linux ne les aime pas, et elles lui rendent bien. [https://www.theregister.com/2024/09/26/cups_linux_rce_disclosed/](https://www.theregister.com/2024/09/26/cups_linux_rce_disclosed/)

- Après quelques heures / jours de rumeurs sur une faille 9.9/10 CVSS il s'avère que cela concerne que les système avec le système d'impression CUPS et cups-browsed
- Désactivez et/ou supprimez le service _cups-browsed_. 
- Mettez à jour votre installation CUPS pour appliquer les mises à jour de sécurité lorsqu'elles sont disponibles. 
- Envisagez de bloquer l'accès au port UDP 631 et également de désactiver le DNS-SD. 
- Cela concerne la plupart des distributions Linux, certaines BSD, possiblement Google ChromeOS, Solaris d’Oracle et potentiellement d’autres systèmes, car CUPS est intégré à diverses distributions pour fournir la fonctionnalité d'impression.
- Pour exploiter cette vulnérabilité via internet ou le réseau local (LAN), un attaquant doit pouvoir accéder à votre service CUPS sur le port UDP 631. Idéalement, aucun de vous ne devrait exposer ce port sur l'internet public. L'attaquant doit également attendre que vous lanciez une tâche d'impression.
- Si le port 631 n'est pas directement accessible, un attaquant pourrait être en mesure de falsifier des annonces _zeroconf_, _mDNS_ ou _DNS-SD_ pour exploiter cette vulnérabilité sur un LAN. 


### Loi, société et organisation

La version 1.0 de la  definition de l'IA l'Open Source est sortie [https://siliconangle.com/2024/10/28/osi-clarifies-makes-ai-systems-open-source-open-models-fall-short/](https://siliconangle.com/2024/10/28/osi-clarifies-makes-ai-systems-open-source-open-models-fall-short/)

- L'Open Source Initiative (OSI) a clarifié les critères pour qu'un modèle d'IA soit considéré comme open-source : accès complet aux données de formation, au code source et aux paramètres d'entraînement.
- La plupart des modèles dits "open" comme ceux de Meta (Llama) et Stability AI (Stable Diffusion) ne respectent pas ces critères, car ils imposent des restrictions sur l'utilisation commerciale et ne rendent pas publiques les données de formation
- c'est au details de données de formation (donc pas forcement les données elle meme. "In particular, this must include: (1) the complete description of all data used for training, including (if used) of unshareable data, disclosing the provenance of the data, its scope and characteristics, how the data was obtained and selected, the labeling procedures, and data processing and filtering methodologies; (2) a listing of all publicly available training data and where to obtain it; and (3) a listing of all training data obtainable from third parties and where to obtain it, including for fee."
- C'est en echo a la version d'open source AI de la linux fondation

En parlant de cela un article sur l’open source washing dans les modèles [https://www.theregister.com/2024/10/25/opinion_open_washing/](https://www.theregister.com/2024/10/25/opinion_open_washing/)

- L'open washing désigne la pratique où des entreprises prétendent que leurs produits ou modèles sont open-source, bien qu'ils ne respectent pas les critères réels d'ouverture (transparence, accessibilité, partage des connaissances).
- De grandes entreprises comme Meta, Google et Microsoft sont souvent accusées d'utiliser cette stratégie, ce qui soulève des préoccupations concernant la clarté des définitions légales et commerciales de l'open source, surtout avec l'essor de l'IA.



## Rubrique débutant

Un petit article fondamental sur REST [https://www.sfeir.dev/rest-definition/](https://www.sfeir.dev/rest-definition/)

- there de Roy Fielding
- en reaction aux protocoles lourds comme SOAP
- 5 verbes (GET PUT, POST. DELETE, PATCH)
- JSON mais pas que (XML et autre
- pas d'etat inter requete

## Ask Me Anything

Morgan de Montréal
Comment faire cohabiter plusieurs dépôts Git ?

> Je m'explique : dans mon entreprise, nous utilisons notre dépôt Git (Bitbucket) configuré pour notre dépôt d'entreprise. Lorsque je souhaite contribuer à un projet open source, je suis obligé de modifier ma configuration globale Git (nom d'utilisateur, email) pour correspondre à mon compte GitHub.  Il arrive souvent que, lorsque je reviens pour effectuer un commit sur le dépôt d'entreprise, j'oublie que je suis en mode "open source", ce qui entraîne l'enregistrement de mes configurations "open source" dans l'historique de Bitbucket...  Comment gérez-vous ce genre de situation ?

Comment gérer différents profiles git https://medium.com/@mrjink/using-includeif-to-manage-your-git-identities-bcc99447b04b

## Conférences


La liste des conférences provenant de [Developers Conferences Agenda/List](https://github.com/scraly/developers-conferences-agenda)
par [Aurélie Vache](https://github.com/scraly) et contributeurs :

- 8 novembre 2024 : [BDX I/O](https://bdxio.fr/) - Bordeaux (France) <a href="https://conference-hall.io/public/event/9udDKH96m45FLJmqz2Uu"><img alt="CFP BDX IO 24" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-July-2024&color=red"></a>
- 13-14 novembre 2024 : [Agile Tour Rennes 2024](https://agiletour.agilerennes.org/) - Rennes (France) <a href="https://sessionize.com/agile-tour-rennes-2024/"><img alt="CFP Agile Tour Rennes 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-May-2024&color=red"></a>
- 16-17 novembre 2024 : [Capitole Du Libre](https://capitoledulibre.org/) - Toulouse (France) <a href="https://cfp.capitoledulibre.org/cdl-2024/cfp"><img alt="CFP Capitole du Libre" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-September-2024&color=red"></a>
- 20-22 novembre 2024 : [Agile Grenoble 2024](https://agile-grenoble.org/) - Grenoble (France) <a href="https://sessionize.com/agile-grenoble-2024/"><img alt="CFP Agile Grenoble 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-June-2024&color=red"></a>
- 21 novembre 2024 : [DevFest Strasbourg](https://devfest.gdgstrasbourg.fr/) - Strasbourg (France) <a href="https://conference-hall.io/public/event/ZZv81ZNIzVzCMBxjX1xe"><img alt="CFP DevFest Strasbourg" src="https://img.shields.io/static/v1?label=CFP&message=until%2002-July-2024&color=red"></a>
- 21 novembre 2024 : [Codeurs en Seine](https://www.codeursenseine.com) - Rouen (France) <a href="https://conference-hall.io/public/event/Su6sfM6SAhoHmg3GWKHS"><img alt="CFP Codeurs en Seine" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-September-2024&color=red"></a>
- 21 novembre 2024 : [Agile Game Toulouse](https://www.billetweb.fr/agile-game-toulouse-2024) - Toulouse (France) 
- 27-28 novembre 2024 : [Cloud Expo Europe](https://www.cloudexpoeurope.fr/) - Paris (France) 
- 28 novembre 2024 : [OVHcloud Summit](https://summit.ovhcloud.com/) - Paris (France) 
- 28 novembre 2024 : [Who Run The Tech ?](https://whorunthetech.com) - Rennes (France) <a href="https://conference-hall.io/public/event/bJDribf9r5Lf2VzBgbYQ"><img alt="CFP Who Run The Tech ? 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%204-June-2024&color=red"></a>
- 2-3 décembre 2024 : [Tech Rocks Summit](https://events.tech.rocks/summit-2024) - Paris (France) 
- 3 décembre 2024 : [Generation AI](https://www.apidays.global/generationai-paris/) - Paris (France) <a href="https://apidays.typeform.com/to/BUasJhAb"><img alt="CFP Generation AI" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-November-2024&color=red"></a>
- 3-5 décembre 2024 : [APIdays Paris](https://www.apidays.global/paris/) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP API Days Paris" src="https://img.shields.io/static/v1?label=CFP&message=until%2003-November-2024&color=red"></a>
- 4-5 décembre 2024 : [DevOpsRex](https://www.devopsrex.fr/fr) - Paris (France) <a href="https://talks.devopsdays.org/devopsdays-paris-2024/cfp"><img alt="CFP DevOps Rex" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-July-2024&color=red"></a>
- 4-5 décembre 2024 : [Open Source Experience](https://www.opensource-experience.com/) - Paris (France) <a href="https://pretalx.com/opensource-experience-2024/cfp"><img alt="CFP Open Source Experience" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-July-2024&color=red"></a>
- 5 décembre 2024 : [GraphQL Day Europe](https://www.apidays.global/graphqldayeurope/) - Paris (France) <a href="https://apidays.typeform.com/to/ILJeAaV8"><img alt="CFP GraphQL Days Europe" src="https://img.shields.io/static/v1?label=CFP&message=until%2005-November-2024&color=red"></a>
- 6 décembre 2024 : [DevFest Dijon](https://devfest.developers-group-dijon.fr/) - Dijon (France) <a href="https://conference-hall.io/public/event/LvvYRcF5AIhpojdn2lkQ"><img alt="CFP DevFest Dijon 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-July-2024&color=red"></a>
- 19 décembre 2024 : [Normandie.ai 2024](https://normandie.ai) - Rouen (France) <a href="https://conference-hall.io/normandie-ai"><img alt="Normandie.ai 2024" src="https://img.shields.io/static/v1?label=CFP&message=until%2019-November-2024&color=green"></a>
- 22-25 janvier 2025 : [SnowCamp 2025](https://snowcamp.io/) - Grenoble (France) <a href="https://conference-hall.io/snow-camp-2025"><img alt="CFP SnowCamp 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-October-2024&color=red"></a>
- 30 janvier 2025 : [DevOps D-Day #9](https://www.devopsdday.com/) - Marseille (France) <a href="https://conference-hall.io/devops-dday-2025"><img alt="CFP DevOps D-Day #9" src="https://img.shields.io/static/v1?label=CFP&message=until%2021-October-2024&color=red"></a>
- 6-7 février 2025 : [Touraine Tech](https://touraine.tech/) - Tours (France) <a href="https://conference-hall.io/touraine-tech-2025"><img alt="CFP Touraine Tech" src="https://img.shields.io/static/v1?label=CFP&message=until%2031-October-2024&color=red"></a>
- 28 février 2025 : [Paris TS La Conf](http://typescript.paris/) - Paris (France) 
- 20 mars 2025 : [PGDay Paris](https://2025.pgday.paris) - Paris (France) 
- 25 mars 2025 : [ParisTestConf](https://paristestconf.com/) - Paris (France) <a href="https://sessionize.com/paristestconf-6/"><img alt="CFP ParisTestConf 6" src="https://img.shields.io/static/v1?label=CFP&message=until%2030-November-2024&color=green"></a>
- 3 avril 2025 : [DotJS](http://www.dotjs.io) - Paris (France) 
- 10-12 avril 2025 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) <a href="https://dvgr24.cfp.dev/"><img alt="CFP Devoxx Greece 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2015-December-2024&color=green"></a>
- 16-18 avril 2025 : [Devoxx France](https://www.devoxx.fr) - Paris (France) 
- 7-9 mai 2025 : [Devoxx UK](https://www.devoxx.co.uk/) - London (UK) <a href="https://devoxxuk25.cfp.dev/#/"><img alt="CFP devoxx uk 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2010-January-2025&color=green"></a>
- 16 mai 2025 : [AFUP Day 2025 Lille](https://event.afup.org/afup-day-2025/) - Lille (France) <a href="https://afup.org/event/afupday2025lille"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=green"></a>
- 16 mai 2025 : [AFUP Day 2025 Lyon](https://event.afup.org/afup-day-2025/) - Lyon (France) <a href="https://afup.org/event/afupday2025lyon"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=green"></a>
- 16 mai 2025 : [AFUP Day 2025 Poitiers](https://event.afup.org/afup-day-2025/) - Poitiers (France) <a href="https://afup.org/event/afupday2025poitiers"><img alt="CFP AFUP Day Lille 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2011-November-2024&color=green"></a>
- 11-13 juin 2025 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 
- 12-13 juin 2025 : [DevLille](https://devlille.fr/) - Lille (France) 
- 24 juin 2025 : [WAX 2025](https://www.waxconf.fr/) - Aix-en-Provence (France) <a href="https://conference-hall.io/wax2025"><img alt="CFP WAX 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2024-May-2025&color=green"></a>
- 26-27 juin 2025 : [Sunny Tech](https://sunny-tech.io/) - Montpellier (France) 
- 1-4 juillet 2025 : [Open edX Conference - 2025](https://con.openedx.org) - Palaiseau (France) <a href="https://sessionize.com/open-edx-conference-2025"><img alt="CFP Open edX Conference - 2025" src="https://img.shields.io/static/v1?label=CFP&message=until%2004-December-2024&color=green"></a>
- 18-19 septembre 2025 : [API Platform Conference](https://api-platform.com/con/2025/) - Lille (France) & Online 
- 6-10 octobre 2025 : [Devoxx Belgium](https://devoxx.be/) - Antwerp (Belgium) 
- 9-10 octobre 2025 : [Volcamp](https://www.volcamp.io) - Clermont-Ferrand (France) 
- 16-17 octobre 2025 : [DevFest Nantes](https://devfest.gdgnantes.com/) - Nantes (France) 
- 23-25 avril 2026 : [Devoxx Greece](https://devoxx.gr/) - Athens (Greece) 
- 17 juin 2026 : [Devoxx Poland](https://devoxx.pl/) - Krakow (Poland) 


## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>

Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>
<!-- vim: set spelllang=fr : -->


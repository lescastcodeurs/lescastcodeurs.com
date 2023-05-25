---
title: LCC 296 - Interview Google IA IA I/O 2023
author: 'Emmanuel Bernard'
team: 'Emmanuel Bernard, Guillaume Laforge, Antonio Goncalves'
layout: blog-post
episode: 296
mp3_length: 75582361
tweet: Interview Google I/O 2023 #IA #IA #IA #IA #IA #IA
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Antonio, Emmanuel et Guillaume reviennent sur les nouveautés et annonces faites à Google I/O 2023 : de nouveaux téléphones Pixel qui se plient ou pas, et surtout de l'intelligence artificielle du sol au plafond !
Que ce soit dans Android, dans Google Workspace, dans Google Cloud, une tonne de produits passe en mode survitaminé à l'IA.
Guillaume, Antonio et Emmanuel discutent aussi de l'impact qu'ils voient sur l'AI, et de comment les Large Language Models sont raffinés et pourquoi on les fait halluciner, de subtilités du langage des signes.

Enregistré le 23 mai 2023

Téléchargement de l'épisode [LesCastCodeurs-Episode-296.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-296.mp3)

## Google I/O 2023

Site web : [https://io.google/2023/](https://io.google/2023/)

Keynote principale : [https://io.google/2023/program/396cd2d5-9fe1-4725-a3dc-c01bb2e2f38a/](https://io.google/2023/program/396cd2d5-9fe1-4725-a3dc-c01bb2e2f38a/)

Keynote développeur : [https://io.google/2023/program/9fe491dd-cadc-4e03-b084-f75e695993ea/](https://io.google/2023/program/9fe491dd-cadc-4e03-b084-f75e695993ea/)

Vidéo résumée en 10 minutes de toutes les annonces : [https://www.youtube.com/watch?v=QpBTM0GO6xI&list=TLGGCy91ScdjTPYxNjA1MjAyMw](https://www.youtube.com/watch?v=QpBTM0GO6xI&list=TLGGCy91ScdjTPYxNjA1MjAyMw)

Vidéo de toutes les sessions techniques : [https://io.google/2023/program/?q=technical-session](https://io.google/2023/program/?q=technical-session)

Google I/O s’est tenu il y a 10 jours en Californie, dans l’amphithéâtre de Shoreline, près du campus de Google.

Seulement 2000 personnes sur place, un chat et un jeu en ligne pour assister à distance.

Jeu en ligne I/O Flip créé avec Flutter, Dart, Firebase, et Cloud Run, et tous les assets graphiques générés par Generative AI [https://blog.google/technology/ai/google-card-game-io-flip-ai/](https://blog.google/technology/ai/google-card-game-io-flip-ai/)


### Des Pixels plein les yeux !

Des détails sur le design des nouveaux appareils : [https://blog.google/products/pixel/google-pixel-fold-tablet-7a-design/](https://blog.google/products/pixel/google-pixel-fold-tablet-7a-design/)


#### Pixel Fold

Article : [https://blog.google/products/pixel/google-pixel-fold/](https://blog.google/products/pixel/google-pixel-fold/)

* Premier téléphone foldable de Google (après Samsung et Oppo)
* Un écran sur le dessus, et un grand écran pliable à l’intérieur
    * Pratique pour la traduction où peut voir une discussion traduire en deux langues d’un côté sur un écran et dans l’autre langue sur l’autre
* Utilisation créative de la pliure : mode “laptop”, pour les selfies, pour poser l’appareil pour des photos de nuit
* Par contre… pas disponible en France, et tout de même presque 1900€ !


#### Pixel Tablet

Article : [https://blog.google/products/pixel/google-pixel-tablet/](https://blog.google/products/pixel/google-pixel-tablet/)

* Une belle tablette de 11 pouces, avec un dock de recharge avec enceinte intégrée
* Processeur Tensor G2, Chromecast intégré
* C’est un peu comme le Google Nest Hub Max mais avec un écran détachable
* Une coque pratique avec un trépied intégré et qui n’empêche pas de recharger la tablette sur le dock
* En mode dock, c’est comme l’écran du Google Home App, et dès qu’on la décroche, on est en mode multi-utilisateur, chacun avec son profil


#### Pixel 7a

Article : [https://blog.google/products/pixel/pixel-7a-io-2023/](https://blog.google/products/pixel/pixel-7a-io-2023/)

* Écran de 6 pouces
* Triple appareil photo (grand angle, principal, et photo avant pour les selfies)
* 509 euros
* Magic Eraser pour effacer les trucs qu’on veut pas dans la photo, Magic Unblur pour rendre une photo floue plus nette, Real Tone pour rendre les peaux foncées plus naturelles


### Android

Article quoi de neuf dans Android : [https://blog.google/products/android/android-updates-io-2023/](https://blog.google/products/android/android-updates-io-2023/)

* Dans Messages, Magic Compose dans les conversations, l’IA nous aide à concevoir nos messages, dans différents styles (plus pro, plus fun, dans le style de Shakespeare)
* Android 14 devrait arriver un peu plus tard dans l’année, avec plus de possibilités de customisation (fond d’écran généré par Gen AI, fond d’écran Emojis, couleurs associées, fond d’écran 3D issus de ses photos) [https://blog.google/products/android/new-android-features-generative-ai/](https://blog.google/products/android/new-android-features-generative-ai/)
* StudioBot : un chatbot intégré à Android Studio pour aider au développement d’applis Android [https://io.google/2023/program/d94e89c5-1efa-4ab2-a13a-d61c5eb4e49c/](https://io.google/2023/program/d94e89c5-1efa-4ab2-a13a-d61c5eb4e49c/)
* 800 millions d’utilisateurs sont passés à RCS pour le messaging
* Adaptation de 50 applications Android pour s’adapter aux foldables [https://blog.google/products/android/android-app-redesign-tablet-foldable/](https://blog.google/products/android/android-app-redesign-tablet-foldable/)
* Wear OS 4 va rajouter le backup restore quand on change de montre et autres nouveautés [https://blog.google/products/wear-os/wear-os-update-google-io-2023/](https://blog.google/products/wear-os/wear-os-update-google-io-2023/)
* 800 chaînes TV gratuites dans Google TV sur Android et dans la voiture
* Android Auto va être disponible de 200 millions de voitures \
[https://blog.google/products/android/android-auto-new-features-google-io-2023/](https://blog.google/products/android/android-auto-new-features-google-io-2023/)
* Waze disponible globalement sur le playstore dans toutes les voitures avec Android Auto


### Google Maps

Article : [https://blog.google/products/maps/google-maps-updates-io-2023/](https://blog.google/products/maps/google-maps-updates-io-2023/)


* Maps propose 20 milliards de km de direction tous les jours
* Immersive View for Routes
* 15 villes : Amsterdam, Berlin, Dublin, Florence, Las Vegas, London, Los Angeles, Miami, New York, Paris, San Francisco, San Jose, Seattle, Tokyo et Venice
* Possibilité pour les développeurs de s’intégrer et rajouter des augmentations 3D, des marqueurs


### Google Photos

Article Magic Editor : [https://blog.google/products/photos/google-photos-magic-editor-pixel-io-2023/](https://blog.google/products/photos/google-photos-magic-editor-pixel-io-2023/)


* Magic Editor survitaminé à l’IA pour améliorer les photos, en déplaçant des gens, en rajoutant des parties coupées, ou bien rendre le ciel plus beau
* Possible que ce soit limité aux téléphones Pixel au début


### Projets expérimentaux


* Project Starline (écran avec caméra 3D qui donne un rendu 3D de son interlocuteur comme s’il était en face de soi) a été amélioré pour prendre moins de place [https://blog.google/technology/research/project-starline-prototype/](https://blog.google/technology/research/project-starline-prototype/)
* Universal Translator : une nouvelle expérimentation pour faire du doublage et traduction automatique avec synchronisation des mouvements des lèvres
* Project Tailwind, une sorte de notebook dans lequel on peut rajouter tous ses documents à partir de drive, et poser des questions sur leur contenu, proposer des résumés, de faire du brainstorming sur ces thèmes [https://thoughtful.sandbox.google.com/about](https://thoughtful.sandbox.google.com/about)
* MusicLM : un large language model pour générer de la musique à partir d’un texte de prompt (waitlist pour s’inscrire)  [https://blog.google/technology/ai/musiclm-google-ai-test-kitchen/](https://blog.google/technology/ai/musiclm-google-ai-test-kitchen/)
* Project Gameface : utilisation des expressions du visage pour commander une souris et un ordinateur, pour les personnes qui ont perdu leur mobilité [https://blog.google/technology/ai/google-project-gameface/](https://blog.google/technology/ai/google-project-gameface/)
* VisualBlocks : pour expérimenter dans une interface drag’n drop avec le développement de modèles pour Tensorflow lite et js [https://visualblocks.withgoogle.com/](https://visualblocks.withgoogle.com/)
* MakerStudio : pour les bidouilleurs et développeurs [https://makersuite.google.com/](https://makersuite.google.com/) \
[https://developers.googleblog.com/2023/05/palm-api-and-makersuite-moving-into-public-preview.html](https://developers.googleblog.com/2023/05/palm-api-and-makersuite-moving-into-public-preview.html)


### Search Labs

Article : [https://blog.google/products/search/generative-ai-search/](https://blog.google/products/search/generative-ai-search/)

* Expérimentations pour rajouter l’IA générative dans Google Search
* Faire des recherches avec des requêtes avec des phrases plus complexes, en intégrant des réponses comme Bard, avec des liens, des suggestions d’autres recherches associées
* Mais aussi proposer des publicités mieux ciblées
* On peut s’inscrire à Search Labs pour tester cette nouvelle expérience, mais au début juste en Anglais et juste pour les US
* Des intégrations avec Google Shopping pour proposer et filtrer des produits qui correspondent à la requête
* Recherche à l’aide d’image, avec Google Lens : 12 milliards de recherches visuelles par mois


### Palm et Bard

* Annonce du modèle LLM Palm 2 utilisé dans Bard et dans Google Cloud [https://blog.google/technology/ai/google-palm-2-ai-large-language-model/](https://blog.google/technology/ai/google-palm-2-ai-large-language-model/)
* PaLM 2 est en cours d’intégration dans 25 produits de Google
* Supportera 100 langues différentes (pour l’instant seulement l’anglais, japonais et coréen), avec déjà les 40 langues les plus parlées d’ici la fin de l’année
* Maintenant disponible dans 180 pays… sauf l’Europe !!!
* Capacité de raisonnement accrue
* Peut coder dans une vingtaine de langages de programmation différents dont Groovy
* Différentes tailles de modèles : Gecko, Otter, Bison et Unicorn, mais le nombre de paramètres n’est pas communiquée, comme pour GPT-4 d’OpenAI
* Utilisable pour des requêtes et pour du chat
* Des modèles dérivées fine-tunés Med-PaLM 2 sur du savoir médical, sur l’analyse visuelle des radios et Sec-PaLM, entrainé sur des cas d’utilisation sur le thème de la cybersécurité, pour aider à déceler des scripts malicieux, des vecteurs d’attaque
* Sundar Pichai a aussi annoncé que Google travaillait déjà sur la prochaine évolution de ses LLM avec un modèle appelé Gemini. Peu de détails à part qu’il sera multimodal (en particulier recherche combinée image et texte par ex.)
* Partenariat et intégration de Adobe Firefly dans Bard pour générer des images [https://blog.adobe.com/en/publish/2023/05/10/adobe-firefly-adobe-express-google-bard](https://blog.adobe.com/en/publish/2023/05/10/adobe-firefly-adobe-express-google-bard)


### Duet AI pour Google Workspace

Article : [https://workspace.google.com/blog/product-announcements/duet-ai](https://workspace.google.com/blog/product-announcements/duet-ai)

* Dans Gmails et Docs, propose d’aider à la rédaction de vos emails et documents
    * une extension de “smart compose” qui va permettre de générer des emails entiers, d’améliorer le style, de corriger la grammaire, éviter les répétitions de texte
* Dans Docs, des nouveaux “smart chips” pour rajouter des variables, des templates
* Dans Slides, rajouter des images générées par IA
* Des prompts dans Sheets pour générer un draft de table
* Dans Google Meet, possibilité de créer une image de fond customisée avec Generative AI
* Ces améliorations font parties de Workspace Labs auquel on peut s’inscrire dans la liste d’attente [https://workspace.google.com/labs-sign-up/](https://workspace.google.com/labs-sign-up/)


### Google Cloud

Intégration de Generative AI partout [https://cloud.google.com/blog/products/ai-machine-learning/google-cloud-launches-new-ai-models-opens-generative-ai-studio](https://cloud.google.com/blog/products/ai-machine-learning/google-cloud-launches-new-ai-models-opens-generative-ai-studio)


* Nouvelles VM A3 avec les GPUs H100 de Nvidia, idéal pour l’entrainement de modèles de machine learning, avec 26 exaFlops de performance [https://cloud.google.com/blog/products/compute/introducing-a3-supercomputers-with-nvidia-h100-gpus](https://cloud.google.com/blog/products/compute/introducing-a3-supercomputers-with-nvidia-h100-gpus)
* Trois nouveaux modèles LLM dans Vertex AI : Imagen (private preview) pour générer des images, Codey pour la génération de code, et Chirp pour la génération de la parole supportant 100 langues différentes avec 2 milliards de paramètres vocaux
* Model Garden : avec les modèles de machine learning y compris externes et open sources
* Ajout des embeddings pour le texte et l’image
* RLHF, Reinforcement Learning from Human Feedback bientôt intégrer pour étendre Vertex AI tuning et prompt design avec une boucle de feedback humaine
* Generative AI Studio pour tester ses prompts zero-shot, one-shot, multi-shots
* Duet AI pour Google Cloud [https://cloud.google.com/blog/products/application-modernization/introducing-duet-ai-for-google-cloud](https://cloud.google.com/blog/products/application-modernization/introducing-duet-ai-for-google-cloud)
* Assistance de code dans VSCode et bientôt les IDEs JetBrains grâce au plugin Cloud Code, et dans Cloud Workstations.
* Intégration dans les IDEs d’un chat pour comme un compagnon pour discuter d’architecture, trouver les commandes à lancer pour son projet
* Le modèle de code de Codey fonctionne sur une vingtaine de languages de programmation, mais un modèle fine-tuné a été entrainé sur toute la doc de Google Cloud, donc pourra aider en particulier sur l’utilisation des APIs de Google Cloud, ou l’utilisation de la ligne de commande gcloud
* Duet AI est aussi dans App Sheet, la plateforme low/no-code, et permettra de chatter avec un chatbot pour générer une application App Sheet
* Quoi de neuf dans Firebase [https://firebase.blog/posts/2023/05/whats-new-at-google-io](https://firebase.blog/posts/2023/05/whats-new-at-google-io)


### Web

Article : [https://developers.googleblog.com/2023/05/io23-developer-keynote-recap.html](https://developers.googleblog.com/2023/05/io23-developer-keynote-recap.html)

* Flutter 3 et Dart 3.10 [https://io.google/2023/program/7a253260-3941-470b-8a4d-4253af000119/](https://io.google/2023/program/7a253260-3941-470b-8a4d-4253af000119/)
* WebAssembly \
[https://io.google/2023/program/1d176349-7cf8-4b51-b816-a90fc9d7d479/](https://io.google/2023/program/1d176349-7cf8-4b51-b816-a90fc9d7d479/)
* WebGPU \
[https://io.google/2023/program/0da196f5-5169-43ff-91db-8762e2c424a2/](https://io.google/2023/program/0da196f5-5169-43ff-91db-8762e2c424a2/)
* Baseline \
[https://io.google/2023/program/528a223c-a3d6-46c5-84e4-88af2cf62670/](https://io.google/2023/program/528a223c-a3d6-46c5-84e4-88af2cf62670/) \
[https://web.dev/baseline/](https://web.dev/baseline/)

## Nous contacter

Pour réagir à cet épisode, venez discuter sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
Tous les épisodes et toutes les infos sur <https://lescastcodeurs.com/>  
<!-- vim: set spelllang=fr : -->

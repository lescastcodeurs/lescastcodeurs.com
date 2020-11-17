---
title: LCC 239 - Interview Rust avec François Teychene, Sylvain Wallez et Geoffroy Couprie
author: 'Emmanuel Bernard'
layout: blog-post
episode: 239
mp3_length: 85017000
tweet: Interview Rust avec @fteychene @bluxte et @gcouprie
# tweet size: 91-93 -> 99-101 #######################################################################
---
Dans cet épisode, Audrey a fait appel à l'aide d'un ami, François Teychéné pour interview Sylvain Wallez et Geoffroy Couprie sur le langage le plus populaire de ces dernières années : Rust.  

Enregistré le 2 octobre 2020  

Téléchargement de l'épisode [LesCastCodeurs-Episode-239.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-239.mp3)  

## Interview

### Ta vie, ton oeuvre

Sylvain Wallez - [Twitter](https://twitter.com/bluxte/) - [LinkedIn](https://www.linkedin.com/in/swallez/) : Développeur passionné pratiquant Java depuis la fin du 20ème siècle, les langages m'intéressent, surtout quand ils sont fortement typés ! Je suis tombé dans Rust lors de l'écriture d'un [blog post sur Go](https://bluxte.net/musings/2018/04/10/go-good-bad-ugly/). Cofondateur du JUG et du Rust meetup toulousains, membre de la Fondation Apache depuis plus de 15 ans, j'ai été cofondateur d'une boîte d'expertise Java, CTO de startup, freelance et j'ai monté le bureau toulousain d'OVH. Je travaille actuellement chez Elastic où après 4 ans dans l'équipe Cloud je viens de bouger vers l'équipe "Clients" qui développe les SDK où j'ai en charge les SDK Java et Rust.  

[Geoffroy Couprie](https://twitter.com/gcouprie/) : Geoffroy Couprie travaille chez [Clever Cloud](https://www.clever-cloud.com/) en développement logiciel. Basé à Nantes, il se passionne pour l'open source, les problématiques de performance et la sécurité.  

### Rust en 2 phrases

### Le langage

Quelles sont les fonctionnalités clés du langage ?  
Quelles sont les inspirations de ce langage ?  
Quel différenciateur vs reste ?  
Quels sont les utilisateurs type ?  
Pour quel use cases ?  

### Evolution du language

Async/await  

Maturité du langage / des librairies  

### Sous le capot

Comment Rust gère la mémoire sans garbage collection ?  
LLVM binding  
Support des hardwares ? (rasp, etc etc …)  

* [Plateformes supportées](https://doc.rust-lang.org/nightly/rustc/platform-support.html)  

### Apprentissage

Apprendre Rust :  

* [Programming Rust](https://www.oreilly.com/library/view/programming-rust/9781491927274/)  
* [The Rust Book](https://nostarch.com/Rust2018) (aussi [en ligne](https://doc.rust-lang.org/book/))  
* [Rust by Example](https://doc.rust-lang.org/rust-by-example/)  

### En prod chez qui

Qui utilise Rust en prod ? 

* La page ["users"](https://www.rust-lang.org/production/users) sur le site de Rust  
* Les [offres d'emploi](https://www.phoronix.com/scan.php?page=news_item&px=Apple-From-C-To-Rust) chez Apple  
* [AWS Firecracker](https://firecracker-microvm.github.io/)  
* [Google Fuchsia](https://fuchsia.dev/)  
* [Microsoft](https://www.zdnet.com/article/microsoft-why-we-used-programming-language-rust-over-go-for-webassembly-on-kubernetes-app/)  
* [Sentry](https://blog.sentry.io/2016/10/19/fixing-python-performance-with-rust)  

### L’écosystème

Gestion des dépendances, outil de build, test etc (aka cargo c’est la vie)  

Tools utils:  

* le linter [clippy](https://github.com/rust-lang/rust-clippy)  
* [cargo-license](https://github.com/onur/cargo-license)  
* [cargo-deny](https://embarkstudios.github.io/cargo-deny/)  

Librairies de référence :  

* *le "maven central" [crates.io](https://crates.io/)  
* [Serde](https://serde.rs/) (le Jackson de Rust)  
* [Tokio](https://tokio.rs/) (runtime asynchrone)  
* [StructOpt](https://github.com/TeXitoi/structopt) (lignes de commande)  

Frameworks pour écrire des webapps en Rust :  

* [Actix](https://actix.rs/) pour le server  
* [Yew](https://yew.rs/) pour le front-end  
* [AreWeWebYet?](https://www.arewewebyet.org/)  

### Communauté et futur

## Nous contacter

[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <https://lescastcodeurs.com/>  
En savoir plus sur le sponsoring? <sponsors@lescastcodeurs.com>


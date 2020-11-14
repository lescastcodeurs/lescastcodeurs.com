---
title: LCC 231 - Interview sur Vim avec Romain Lafourcade
author: 'Emmanuel Bernard'
layout: blog-post
episode: 231
mp3_length: 76420215
tweet: Interview sur la sobriété numérique avec Richard Hanna, contributeur @theShiftPR0JECT
# tweet size: 91-93 -> 99-101 #######################################################################
---
Romain Lafourcade échange avec Guillaume et Emmanuel sur Vim: comment il y est venu, ce qu'il a d'unique, comment l'appréhender, et bien d'autres choses encore.

Enregistré le 16 avril 2020

Téléchargement de l'épisode [LesCastCodeurs-Episode-231.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-231.mp3)

## Interview

### Ta vie, ton œuvre

[GitHub de Romain](https://github.com/romainl)  
Je m’appelle Romain Lafourcade. Je suis Graphiste de formation et j’ai chopé le virus du développement en montant mon premier site en 1999. Je suis Développeur pour de vrai depuis 2007. J’ai beaucoup fait de JS, bien sûr, ainsi que du Flash et du Silverlight. Ça fait quelques années que je me concentre sur React et Vue.js.

Aujourd’hui je suis chez [Publicis Sapient France](https://www.publicissapient.com/), une "agence digitale" de premier plan où je m’amusais déjà très bien jusqu’à l’arrivée des ex-Xebians. Et maintenant c’est encore mieux. Je participe actuellement à la préparation d’une conférence "front" pointue pour la fin de l’année : [FrontSide](https://frontsideconf.fr/).

Mes intérêts personnels gravitent autour de la programmation fonctionnelle : Haskell, Elixir.

Et Vim, bien sûr.


### Vim intro

[Page wikipedia de Vim](https://en.wikipedia.org/wiki/Vim_\(text_editor\))  

#### Qu’est-ce que Vim en 2 phrases ?

Vim est un éditeur de texte orienté programmation, puissant et non-conformiste.

#### Que peut on dire de la différence entre un IDE et un éditeur ?

Dans son expression la plus simple, un éditeur de texte est un outil permettant l’édition de fichiers de texte brut. Certains sont "standalone", comme Vim, Nano ou Gedit, se concentrant pour la majeure partie sur des questions liées à l’édition de texte et déléguant les autres tâches liée au développement logiciel à d’autres outils "standalone". C’est la vision UNIX traditionnelle :

> "Écrivez des programmes qui effectuent une seule chose et qui le font bien."

D’autres sont "intégrés" avec d’autres outils pour offrir une expérience plus "clé en main", les IDEs.

### L’histoire de Vim

Vim est né au début des années 90 sur [Amiga](https://en.wikipedia.org/wiki/Amiga), pour la même raison que tous les autres clones de vi : l’impossibilité légale d’utiliser vi sur tel ou tel système.
De tous les clones, c’est celui qui s’est le plus démarqué de l’original et c’est le seul qui est encore développé activement en 2020.

Les archéologues en herbe trouveront quelques liens sur le sujet en bas de page.

#### Disponibilité de Vim sur les distros de base

Un des arguments les plus souvent mis en avant pour convaincre les mécréants de l'utilité d'apprendre Vim est "Vim est partout".

Mais l’ubiquité légendaire de Vim est un mythe. Ce qui est disponible dans tous les dérivés d’UNIX, c’est la commande `vi`. Le programme qui assure le boulot peut être Vim comme il peut être [Elvis](http://elvis.the-little-red-haired-girl.org/), [Nvi](https://sites.google.com/a/bostic.com/keithbostic/vi/), [Busybox vi](https://git.busybox.net/busybox/tree/editors/vi.c) ou même [le vi original](http://ex-vi.sourceforge.net/). Et même quand c’est Vim, c’est souvent un build limité. Du coup, connaître Vim n’est peut-être pas aussi utile que connaître vi.

Et c’est sans compter sur le fait que le système d’exploitation le plus largement utilisé, n’a pas de commande `vi` ou `vim` *du tout*.

#### Vim vs emacs: la guerre ancestrale

et aussi débile que toutes les guerres ancestrales.

#### Les variantes de Vim

Neovim est un fork récent promettant une modernisation des processus de développement et du code.

### Vim au quotidien

#### Pas de curseur?????

On a bien un curseur, mais les dispositifs de pointage sont rarement activés par défaut. Même si c’est tout à fait possible d’utiliser la souris ou le trackpad (`:help 'mouse'`), on est clairement dans un monde centré autour du clavier.

#### Les modes (normal, insert, visual, etc.)

L’édition modale, un concept initié par vi, ne fait pas l’unanimité. L’idée, c’est qu’on est toujours dans un mode réservé à une certaine catégorie d’activités. Un des effets positifs, et aussi un des repoussoirs de ce mécanisme est que ça permet d’avoir un vocabulaire plus varié et expressif que dans un éditeur classique. Le déplacement du curseur, par exemple, se fait traditionnellement avec une combinaison de 4 touches de directions et 1 modificateurs, donc 8 déplacements possibles : 1 caractère vers la droite ou la gauche, 1 mot vers la droite ou la gauche, 1 ligne vers le haut ou le bas, 1 paragraphe vers le haut ou le bas. C’est très pauvre, même en ajoutant Home, End, Page Up et Page Down. Dans vim, on a tout ça, bien sûr, plus "début du mot", "fin du mot", "prochaine/précédente occurrence de <caractère imprimable>", "prochaine/précédente occurrence de <pattern>", "ligne numéro X", "n lignes vers le haut ou le bas", "haut/bas/milieu de la fenêtre", "marqueur X", etc. Rien jjque ça c’est dingue. Et comme on est dans un éditeur modal, tous ces mouvement peuvent être utilisés avec des opérateurs et là c’est la folie.

Les modes les plus couramment utilisés sont :

* le mode normal, le mode par défaut quand on fait `$ vim foo.txt`, qui est utilisé pour naviguer, chercher, copier, coller, etc.
* le mode d'insertion, qui permet… d'insérer du texte dans le document,
* les modes visuels, qui permettent de sélectionner une portion de texte,
* le mode ligne de commande, qui permet d’utiliser les commandes héritées d'Ex : `:write`, `:s`, `:g`, etc.

##### Le concept de verbe / opérateur + movement + destination

C’est pour moi LA killer feature de Vim, surtout visible dans les modes normal et visuels. En gros, le modèle d’interaction est basé sur la notion de langage. Il y a :

* des "opérateurs", des verbes conjugués à l’impératif comme "efface", "copie", "remplace",
* des compléments d’objet directs comme "la ligne 78", "ce texte entre parenthèses", "d’ici à la fin du paragraphe",
* des compléments d’objet indirects comme "en dessous de la ligne 27" ou "au début du buffer",
* et des compléments circonstanciels comme "10 fois".

Avec tout ça, on donne des commandes à la machine selon une syntaxe proche de celle d’un langage parlé et elle obéit : "colle le texte contenu dans le presse papier 50 fois", "copie (d’ici) jusqu’à la prochaine parenthèse ouvrante", etc. Dans un éditeur de texte classique, la première se dit "ctrl+v ctrl+v ... ctrl+v", ce qui n’a presque rien à voir avec la tâche telle qu’imaginée : "colle truc 50 fois" est devenu "colle colle ... colle", ce qui est très peu expressif. Notre pensée abstraite de haut niveau doit être transformée en une série d’action concrètes de bas niveau qui n’ont que très peu de sens et souvent rien à voir avec la pensée haut niveau. Dans Vim, la première commande se dit "50p", ce qui est très proche de la tâche telle qu’imaginée.

La syntaxe est peut-être un peu sèche et les éléments sont peut-être ordonnés différemment qu’en français, mais ça reste tout à fait abordable et très proche de ce qu’on a dans la tête. L’étape suivante est exactement la même que lorsqu’on apprend une langue étrangère : penser dans la langue.

Apprendre Vim, c’est apprendre une grammaire simple et un vocabulaire expressif qui s’enrichit au fur et à mesure où on avance.

#### La notion de range

Vim hérite plein de trucs de vi, qui hérite lui-même plein de trucs de ex. Dans vim, toutes les commandes qui commencent par un "deux points" sont des "commandes Ex", qui agissent sur des lignes car ex était un éditeur de ligne. Comme dans ex, ces commandes prennent des adresses (une seule ligne) et des ranges (de telle ligne à telle autre). Une ligne peut être indiquée par son numéro, par un offset, par une recherche, par un marqueur, etc. C’est un outil extrêmement puissant.

Par exemple, la commande suivante copie les lignes 10 à 24 en fin de document :

    :10,24t$

Celle-ci rassemble toutes les lignes contenant `const` dans la fonction courante vers le haut du corps de la fonction :

    :?func?,/^}/g/const/m?func?

C'est d’une élégance insoutenable.

#### D'autres concepts de base (window, tab, buffer, split, etc.)

On a toujours au moins un "buffer", une "fenêtre" et une "tab page". Un buffer peut être affiché dans une ou plusieurs "fenêtres", une "tab page" est un rassemblement de "fenêtres". Contrairement à la plupart des éditeurs de texte il ne peut pas y avoir de relation 1-à-1 entre un buffer et une fenêtre ou entre un buffer et une tab page. C’est un piège dans lequel tous les nouveaux tombent.

#### Tu l’utilises pour quels genre d’édition

J’utilise Vim de deux façons différentes : de longues sessions de programmation et des éditions rapides (config, git commit, etc.), pratiquement tout le temps dans un terminal.

#### Les colorschemes

La dernière fois que j’ai checké il y en avait littéralement des milliers, du simple qui marche partout, utilisé par quelques barbus ronchons, à l’usine à gaz buggée à mort, utilisée par la dernière génération de boutonneux. J’en ai réalisé quelques uns, même, comme [Apprentice](https://github.com/romainl/Apprentice), ainsi qu’[un modèle simple à utiliser](https://github.com/romainl/vim-rnb). Maintenant qu’on peut utiliser toutes les valeurs hexadécimales, même dans le terminal, c’est la fête.

Pour trouver des colorschemes, je recommande [VimColors](http://vimcolors.com/).

#### Les binding Vim dans les IDEs

Peut-être utile pour accompagner l’apprentissage de Vim mais passé un certain niveau c’est l’uncanny valley. C’est un des problèmes causés par des années de Vim, d’ailleurs : ça rend exigeant.

#### Le terminal

Le nerf de la guerre d’un Vim qui fonctionne
tmux?

### Vim écosystème

#### La gestion des plugins

Si on a beaucoup de plugins ça peut devenir compliqué sans plugin manager. Le plus populaire est [vim-plug](https://github.com/junegunn/vim-plug).

Les plugins les plus utilisés

* [fugitive](https://github.com/tpope/vim-fugitive), un client Git bien intégré à Vim
* [surround](https://github.com/tpope/vim-surround), permet de jouer avec les paires de caractères : (), {}, etc. Souvent considéré comme un indispensable.
* [ALE](https://github.com/dense-analysis/ale), beaucoup plus qu’un linter,
* [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe), beaucoup plus que de l’autocompletion.

Vim et les plugins VSCode (via LSP)

Les spécifications de pas mal de fonctionnalités de Visual Studio Code sont actuellement publiées, ce qui permet à d’autres outils de développement de bénéficier de l’étendue de son ecosystème. Il y a [LSP](https://langserver.org/), par exemple, qui permet d’implémenter des serveurs pour n’importe quel langage et des clients pour n’importe quel éditeur. Les clients à suivre pour Vim son [lsc](https://github.com/natebosch/vim-lsc) et [CoC](https://github.com/neoclide/coc.nvim). Peut-être aurons-nous une intégration native un jour ? Il y a aussi [DAP](https://microsoft.github.io/debug-adapter-protocol/) qui est utilisé par [Vimspector](https://github.com/puremourning/vimspector) pour fournir une interface de débogage avancée.

#### La navigation entre fichiers

Un faux problème, souvent résolu en mode "brute force" par manque de volonté d’apprendre à se servir des fonctionnalités de base. Du coup on a des dizaines de plugins fantaisistes et des générations de vimmers superficiels. C’est triste. En vrai, `:edit`, `:find` et `:buffer` sont rapides et versatiles. Il suffit de prendre le temps d’apprendre à s’en servir.

Il existe un nombre hallucinant de plugins pour naviguer les fichiers alors que c’est si simple et rapide avec les outils natifs.

#### La vérification orthographique

La fonctionnalité est incluse de base. Il faut néanmoins l’activer avec `:help ’spell’` et, si on veut de l’aide pour autre chose que de l’anglais, installer des dictionnaires. Ça sonne plus compliqué que ça ne l’est vraiment.

### Des tips

#### Indentation

* [Tout savoir sur l'indentation dans Vim](https://tedlogan.com/techblog3.html)
* `gg=G` pour réparer l’indentation d’un buffer en entier
* `:help ’equalprg’` pour indiquer à Vim quel programme externe utiliser

#### Paramètres custom par fichier via modeline

Voir `:help modeline` pour des exemples. Je ne suis pas hyper fan en général que je trouve ça un peu sale de mélanger data et metada mais ça peut être bien en bas d’un fichier Markdown dont on sait qu’il va être édité dans Vim :

    [//]: # ( Vim: set spell spelllang=en: )

En pratique, je suggère plutôt [editorconfig](https://editorconfig.org/) pour les réglages d’indentation et compagnie.

#### Vim et git

Fugitive, mentionné plus haut, est très populaire. Pour ma part, je préfère garder mon éditeur de texte pour éditer du texte et utiliser d’autres outils spécialisés pour d’autres tâches spécialisées. J’aime beaucoup [tig](https://jonas.github.io/tig/), que j’utilise au jour le jour depuis des années, et j’ai découvert [git-jump](https://github.com/git/git/tree/master/contrib/git-jump) récemment, qui a fait une entrée fracassante dans mon workflow.

Sinon, pour les commandes basiques, un simple `:!git <subcommand>` fait largement le taf.

#### Les macros

Une macro est une séquence de commande. On peut enregistrer une macro dans le registre `q` :

    qq
    02wciwfoo<Esc>
    q

et la rejouer sur plusieurs lignes, par exemple :

    :23,45normal! @q

Mais avec un peu de pratique on peut complètement zapper la phase « enregistrement » :

    :23,45normal! 02wciwfoo

Les macros sont un outil d’automatisation extraordinaire qui épate facilement le spectateur. Voir `:help complex-repeat`.

#### Copier dans le buffer de l’OS (ctrl+c ctrl+v)

Pour ça, l’idéal est d’avoir un Vim compilé avec la fonctionnalité "clipboard". Si c’est pas possible on peut bricoler des trucs avec `xclip`/`pbcopy`/etc. ou utiliser les fonctionnalités de copier/coller du terminal.

Le clipboard système est représenté par le registre `+` dans vim. Donc copier dans le clipboard: `"+y`, et ensuite coller, `"+p`. Note que `"` est la sélection de registre.

#### Remplacer via des expressions régulières

La substitution, basée sur les expressions régulières ou pas, est une pratique courante dans Vim. Par exemple, pour remplacer toutes les occurrences de `java` par `kotlin` dans le buffer courant :

    :%s/java/kotlin/g

Voir `:help :s` et le site [Vim Regular Expressions 101](http://vimregex.com/) car Vim utilise un dialecte spécial.

#### Mode vi dans le shell

Readline, la bibliothèque utilisée par bash pour gérer l’invite de commande, utilise des raccourcis inspirés par Emacs par défaut. On peut changer ça en ajoutant la ligne suivante dans `~/.inputrc`:

    set editing-mode vi

Personnellement, je préfère garder les raccourcis par défaut et éditer mes commandes directement dans Vim, avec `Ctrl-x Ctrl-e`.
Si vous ave mis le mode vi, alors pour éditer la commande dans vim, tapez `ESC` `v`.

#### Vimdiff

On peut utiliser Vim pour afficher des diffs côte à côte et même pour gérer les merge conflicts dans Git.

Voir `:help diff` pour les détails sanglants.

### Aller plus loin

#### Livres

* [Practical Vim](https://pragprog.com/book/dnvim2/practical-vim-second-edition)
* [Modern Vim](https://pragprog.com/book/modvim/modern-vim)
* [Learn Vimscript The Hard Way](https://learnvimscriptthehardway.stevelosh.com/)
* [The Viml Primer](https://pragprog.com/book/bkviml/the-viml-primer)

#### Histoire de vim

* [The History Of Vim](https://medium.com/@jovica/the-history-of-vim-b707758fb54f#.u3o96g3ib)
* [Where Vim Came From](https://twobithistory.org/2018/08/05/where-vim-came-from.html)
* [Bram Moolenaar Discusses Developing the Popular Text Editor, How He Uses It, and Version 8](http://www.hostingadvice.com/blog/vim-creator-champions-charityware/)
* [10 Questions with Vim’s creator, Bram Moolenaar](http://www.binpress.com/blog/2014/11/19/vim-creator-bram-moolenaar-interview/)

#### Ressources

* [Vim Galore](https://github.com/mhinz/vim-galore)
* [Idiomatic Vimrc](https://github.com/romainl/idiomatic-vimrc)
* [Seven habits of effective text editing](https://www.moolenaar.net/habits.html)
* `:help user-manual`
* [Vimways](https://vimways.org)

#### Meetups

* [Tuppervim](https://tuppervim.org/)

#### Communauté

* [\#vim sur Freenode](https://www.vi-improved.org/)
* \#vim-fr sur freenode
* [r/vim](https://www.reddit.com/r/vim/) sur reddit
* [le tag Vim](https://stackoverflow.com/questions/tagged/vim/) sur Stack Overflow
* [le site Stack Exchange dédié à Vim](https://vi.stackexchange.com/)

#### En vrac

* [Vim 9 ?](https://groups.google.com/forum/#!topic/vim_dev/__gARXMigYE)
* [Comment quitter Vim de manière... créative](https://github.com/hakluke/how-to-exit-vim/blob/master/README.md)
* [Vim cheatsheet](http://michael.peopleofhonoronly.com/vim/)
* [Bonne explication d’un beau vimrc en détails](https://dougblack.io/words/a-good-vimrc.html)
* [Tmux et Vim ensemble avec les bons plugins](https://blog.bugsnag.com/tmux-and-vim/)
* [Been using Vim for two years because I didn’t figure how to quit it!](https://twitter.com/iamdevloper/status/435555976687923200)
* [Vim primer and tutorial](http://danielmiessler.com/study/vim/)
* [Resources Vim](https://vim.zeef.com/patrick.schanen)
* [Des stickers pour clavier Mac pour se rappeler des raccourcis](https://www.editorskeys.com/products/silicone-editing-covers/vim-keyboard-cover-retina/)


## Nous contacter

Soutenez Les Cast Codeurs sur Patreon <https://www.patreon.com/LesCastCodeurs>  
[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>


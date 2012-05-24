---
layout: default
title: Readme
---
# Read me

## Todo

- write an Atom feed that supports MP3 enclosure (see <http://www.ibm.com/developerworks/xml/library/x-atom10/index.html>)

## Acknowledgments

This site is written using:

- [Awestruct][Awestruct]: a framework for creating static HTML sites
- [Twitter bootstrap][Twitter bootstrap]: a web UI toolkit (HTML, CSS Javascript)
- Icons from [Komodo Media, Rogie King][Komodo]

## Comment construire le site

### Infrastructure

* get Git
* get Ruby 1.8
* if on Mac OS, get XCode (needed for native gems)

Install Git to your system. [GitHub's help page](http://help.github.com/) is a good starting
point. [Emmanuel's blog](http://in.relation.to/Bloggers/HibernateMovesToGitGitTipsAndTricks)
on Git tips and tricks is useful too.

Install Awestruct, a Ruby based site generator.

    gem install awestruct 
    #or
    sudo gem install awestruct

The Awestruct version known to work is 0.2.18

    sudo gem install awestruct --version 0.2.18

Get the website source from GitHub.

    git clone git@github.com:lescastcodeurs/lescastcodeurs.com.git

### Serve the site locally

* Go in your `~/lescastcodeurs.com` directory.  
* Run  `awestruct -d`
* Open your browser to <http://localhost:4242>

Any change will be automatically picked up except for new blog entries.

#### If your changes are not visible...

If for whatever reason you make some changes which don't show up, you can
completely regenerate the site:

    rm -fR _site
    awestruct -d

#### If serving the site is slow...

On Linux, serving the file may be atrociously slow 
(something to do with WEBRick).

Use the following alternative:

* Go in your `~/lescastcodeurs.com` directory.  
* Run  `awestruct --auto -P development`
* In parallel, go to the `~/lescastcodeurs.com/_site` directory
* Run `python -m SimpleHTTPServer 4242`

You should be back to millisecond serving :) 

## Licence et droits

Le contenu de ce repository est distribué sous licence 
[Creative Commons Attribution Share-Alike 3.0 Unported (CC BY-SA 3.0)][cc].

En soumettant une "pull request" ou contribuant de manière général à ce repository, vous acceptez
de fournir votre contribution sous la licence mentionnée au dessus.

Le texte et le logo sont la propriété d'[Emmanuel Bernard][emmanuel-site].

[Wattie]: http://www.flickr.com/photos/wattie/2113068944/in/photostream
[Awestruct]: http://awestruct.org/
[Twitter bootstrap]: http://twitter.github.com/bootstrap/
[Komodo]: http://www.komodomedia.com
[cc]: http://creativecommons.org/licenses/by-sa/3.0/
[emmanuel-site]: http://emmanuelbernard.com
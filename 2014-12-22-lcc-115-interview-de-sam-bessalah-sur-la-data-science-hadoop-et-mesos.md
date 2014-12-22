---
title: LCC 115 - Interview de Sam Bessalah sur la data science, Hadoop et Mesos
author: 'Emmanuel Bernard'
layout: blog-post
episode: 115
mp3_length: 52227147
---
Dans cet épisose, on discute avec Sam Bessalah de ce “nouveau” métier qu’est le data scientist.
On explore aussi l’univers Apache Hadoop et l’univers Apache Mesos. Ces endroits sont pleins de projets aux noms bizarres, cette interview permet de s’y retrouver un peu dans cette mythologie.

Enregistré le 16 decembre 2014

Téléchargement de l'épisode [LesCastCodeurs-Episode-115.mp3](http://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-115.mp3)  

## Interview

### Ta vie, ton oeuvre

[@samklr](https://twitter.com/samklr)  
[Ses présentations](https://speakerdeck.com/samklri), [encore ici](http://www.slideshare.net/samkiller) et [là](https://parleys.com/search/bessalah/PRESENTATIONS)  

### Data scientist

Kesako ?!   
C'est nouveau ? On a toujours eu des données pourtant dans nos S.I. ?!  
[Le job le plus sexy du 21eme siecle ?](https://hbr.org/2012/10/data-scientist-the-sexiest-job-of-the-21st-century/)  
[Drew conway’s Data Science Venn diagram](http://drewconway.com/zia/2013/3/26/the-data-science-venn-diagram)  

### Traiter les données, les plateformes

MapR, Hadoop, … C'est Quoi ? C’est nouveau ? Ca vient d’où ?  Comment ça marche ? A quoi ça sert ?

Ca s’intègre à tout ? Et nos sources de données legacy (Mon bon vieux mainframe et son EBCDIC) ?

Où sont passés mes EAI, ETL, et autres outils d'intégration B2C/B2B ?

[EAI](https://en.wikipedia.org/wiki/Enterprise_application_integration)  
[ETL](https://en.wikipedia.org/wiki/Extract,_transform,_load)  
[EBCDIC](https://en.wikipedia.org/wiki/EBCDIC)  
[BI (Business Intelligence)](https://en.wikipedia.org/wiki/Business_intelligence)  

#### Hadoop

[MapReduce](https://en.wikipedia.org/wiki/MapReduce)  
[Doug Cutting](https://en.wikipedia.org/wiki/Doug_Cutting)  
[Apache Lucene](http://lucene.apache.org) - moteur de recherche full-text  

[Apache Hadoop](http://hadoop.apache.org) - platforme de process distribués et scalables  
[HDFS](https://en.wikipedia.org/wiki/Apache_Hadoop#HDFS) - système de fichier distribué  
[Apache Hive](https://hive.apache.org) - datawarehouse au dessus d’Hadoop offrant du SQL-like  
[Terradata](https://fr.wikipedia.org/wiki/Teradata)  
[Impala](http://impala.io) - database analytique (“real time”) SQL queries etc  
[Apache Tez](http://tez.apache.org) - directed-acyclic-graph of tasks  
Apache Shark remplacé par [Spark SQL](https://spark.apache.org/sql/)  
[Apache Spark](https://spark.apache.org) - Spark has an advanced DAG execution engine that supports cyclic data flow and in-memory computing  
[Apache Storm](https://storm.apache.org) - process de flux de données de manière scalable et distribuée  

[Data Flow](https://en.wikipedia.org/wiki/Dataflow)  
[Machine Learning](https://en.wikipedia.org/wiki/Machine_learning) - apprendre de la donnée  

[Graph Lab](https://en.wikipedia.org/wiki/GraphLab)  

### Et l'infrastructure dans tout ça ?

De nos bons vieux serveurs qui remplissent les salles machines au cloud (IAAS, PAAS), en passant par la virtualisation (), les conteneurs (XLC, Docker, …) ....
Des ressources à gogo c'est bien mais comment les gérer ?

[YARN](http://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/YARN.html)  

#### Apache Mesos

[Apache Mesos](http://mesos.apache.org)  
[Comment démarrer Mesos](http://mesosphere.com/docs/getting-started/)  
[Tutoriaux](http://mesosphere.com/docs/tutorials/)   
[Data Center OS de Mesosphere](https://mesosphere.com/product/)  
[Presentation de Same à Devoxx sur Mesos](http://www.slideshare.net/samkiller/mesosdevoxx14)  
[Mesos et les container docker](http://mesosphere.com/docs/tutorials/launch-docker-container-on-mesosphere/)   
[Cluster Management and Containerization by Benjamin Hindman](https://www.youtube.com/watch?v=F1-UEIG7u5g)  
[Integration continue avec Mesos par EBays](http://www.ebaytechblog.com/2014/04/04/delivering-ebays-ci-solution-with-apache-mesos-part-i/#.VJbrA7CeLs)  

#### Docker

[Docker](http://docker.com)  
[Démarrer un cluster Spark avec Docker](https://amplab.cs.berkeley.edu/2013/10/23/got-a-minute-spin-up-a-spark-cluster-on-your-laptop-with-docker/)  
[Shell Spark dans Docker](http://ogirardot.wordpress.com/2014/12/18/try-apache-sparks-shell-using-docker/)  
[Docker et Kubernetes dans Apache Hadoop YARN](http://hortonworks.com/blog/docker-kubernetes-apache-hadoop-yarn/)  
[Cluster Hadoop sur Docker](http://blog.sequenceiq.com/blog/2014/06/19/multinode-hadoop-cluster-on-docker/)  
[Docker, Kubernetes and Mesos](https://www.youtube.com/watch?v=00oWWFQ64Vc)  

[cgroups](http://en.wikipedia.org/wiki/Cgroups)  
[LXC](https://linuxcontainers.org)  
[Docker vs LXC](http://www.scriptrock.com/articles/docker-vs-lxc)  
[Marathon]( https://mesosphere.github.io/marathon/)  
[Chronos](http://nerds.airbnb.com/introducing-chronos/)  
[Code de Chronos](https://github.com/airbnb/chronos)  
[Aurora](http://aurora.incubator.apache.org/)  

[Kubernetes](http://kubernetes.io/)  
[Kubernetes workshop](https://github.com/kelseyhightower/intro-to-kubernetes-workshop)  

[Oscar Boykin](twitter.com/posco)  
[Scalding](github.com/twitter/scalding)  
[Présentation Scala + BigData](http://www.slideshare.net/samkiller/scaladata) et [une autre](http://www.slideshare.net/samkiller/scala-io-big-analyticssambessalah-27614559)  
[Apache Ambari](ambari.apache.org)  

### Comment je m’y mets ?

Comment devient-on data scientist ? (se former, ouvrages de références, sources d'infos, ...)
[Mesosphere](https://mesosphere.com)  

[Cours de Andrew Ng sur le Machine Learning](https://www.coursera.org/course/ml)  
[Introduction to data science sur Coursera](https://www.coursera.org/course/datasci)  
[Kaggle](http://kaggle.com)  
[MLlib](https://spark.apache.org/mllib/)  
[Mahoot](http://mahout.apache.com)  
[R](http://www.r-project.org/)  
[Scikit-learn (Python)](http://www.scikit-learn.org/)  
[Machine Learning pour Hackers (livre)]( http://shop.oreilly.com/product/0636920018483.do)  
[Scala](www.scala-lang.org)
[TypeSafe Activator](https://typesafe.com/activator/docs)  

[iPython NoteBooks](http://ipython.org/notebook.html)  
[Autres référence iPython NoteBooks](http://opentechschool.github.io/python-data-intro/core/notebook.html)  
[Notebooks temporaires en line](https://tmpnb.org/) - démarre un container docker sur rackspace gratuitement (pour vous)  
[Des notebooks](https://github.com/ogrisel/notebooks)  
[Parallel Machine Learning with scikit-learn and IPython](https://github.com/ogrisel/parallel_ml_tutorial)  
[Visualiser les notebooks en ligne sans les télécharger](http://nbviewer.ipython.org/)  
[Spark / Scala notebooks for web based spark development](https://github.com/andypetrella/spark-notebook)  
<http://zeppelin-project.org/>  
[Spark et Scala avec un notebook ipython](https://github.com/tribbloid/ISpark)  

## Nous contacter

Contactez-nous via twitter <http://twitter.com/lescastcodeurs>  
sur le groupe Google <http://groups.google.com/group/lescastcodeurs>  
ou sur le site web <http://lescastcodeurs.com/>  
Flattr-ez nous (dons) sur <http://lescastcodeurs.com/>  
En savoir plus sur le sponsoring? sponsors@lescastcodeurs.com

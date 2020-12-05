---
title: LCC 193 - Interview Apache Kafka avec Florent Ramière
author: 'Emmanuel Bernard'
layout: blog-post
episode: 193
mp3_length: 67630571
tweet: Interview Kafka avec @framiere #roulemapoule #pistenoire
# tweet size: 91-93 -> 99-101 #######################################################################
---
Florent Ramière vient discuter avec Emmanuel d'Apache Kafka, de ses usages, son fonctionnement, son écosystème. Et roule ma poule sur piste noire.

Enregistré le 19 juillet 2018

Téléchargement de l'épisode [LesCastCodeurs-Episode-193.mp3](https://traffic.libsyn.com/lescastcodeurs/LesCastCodeurs-Episode-193.mp3)

## Interview

### Ta vie, ton œuvre

Florent Ramière  
[@framiere](https://twitter.com/framiere)  
[LinkedIn](https://www.linkedin.com/in/framiere)  
[Confluent](https://www.confluent.io)  

### Kafka

Kafka en deux phrases  
[Apache Kafka](https://kafka.apache.org)  
[AMQP](https://www.amqp.org)  

Quels sont ses caractéristiques spécifiques 
Pourquoi pas A-MQ
Discussion only-once delivery, at-least-once, exactly once

Les cas d’utilisations

- captation des logs
- event sourcing et le [podcast sur l'event sourcing](https://lescastcodeurs.com/2014/03/22/lcc-98-interview-sur-cqrs-et-event-sourcing-avec-jeremie-chassaing/)
- stream processing
- bus message
- microservices

[Apache Spark Streaming](https://spark.apache.org/streaming/)  
[Apache flink](https://flink.apache.org)  

Partition

Discussion sur la dualité change event / table

[Les blogs de Ben Stopford](https://www.confluent.io/blog/author/ben/)  
[Debezium - Change Data Capture](http://debezium.io)  

La compétition

- MQ
- [Apache Pulsar](https://pulsar.incubator.apache.org)
- [AWS Kinesis](https://aws.amazon.com/kinesis/)

### L’utilisation

Comment Kafka s’utilise  
Comment on l’installe  

* [Déployer la stack via ansible](https://github.com/confluentinc/cp-ansible)

Definition des partitions

- A quoi ça sert fonctionnellement le sharding
- Comment choisir sa clé de sharding

[Apache Zookeeper](https://zookeeper.apache.org)  

Comment je publie un message ?  
Je dois stocker l’index ?  

[Protocol Kafka](https://kafka.apache.org/protocol)  

Processing avec [Kafka Streams](https://kafka.apache.org/documentation/streams/)  
vs Spark Stream et Flink  

Supervision  
[Démo de monitoring](https://github.com/framiere/monitoring-demo)  

Golden ratio

* lag
* partitions non répliquées
* plusieurs leaders

Devoxx France
[Comment monitorer Kafka like a pro](https://www.youtube.com/watch?v=tL6DtN0zhrQ)  
[Un tour de l'environnement Kafka](https://www.youtube.com/watch?v=BBo-rqmhpDM)  

### Sous le capot

[Apache Zookeeper](https://zookeeper.apache.org)  

Pourquoi ça scale ?  
Réplication  
Batching  
Latence  

Le top 5/10 problèmes que tu vois chez les clients

* pas de monitoring
* pas compris le système de partition : sous provisionner
* gestion de l’ordre : lié à la production
* codec: snappy

Producteurs  
[Présentation sur le producteur Kafka](https://www.slideshare.net/JiangjieQin/producer-performance-tuning-for-apache-kafka-63147600)  
Format des messages  
Schema registry

Retention:

* en temps
* en byte

Compaction : avantages / inconvénients fonctionnels  
[Crypto-shredding](https://en.wikipedia.org/wiki/Crypto-shredding)

### L’écosystème et la communauté

Kafka Connect  
[A Kafka Story](https://github.com/framiere/a-kafka-story)  

Kafka Stream  
[KSQL](https://github.com/confluentinc/ksql) et son [GitHub](https://github.com/confluentinc/ksql)  

Confluent Inc vs Apache Kafka

[Apache Pulsar](https://pulsar.incubator.apache.org)  

[Kafka Improvement Process](https://cwiki.apache.org/confluence/display/KAFKA/Kafka+Improvement+Proposals)  

### Ressources

[Monitoring demo](https://github.com/framiere/monitoring-demo)  
[A Kafka Story](https://github.com/framiere/a-kafka-story)  
[Une démo complete kafka, broker, ksql, connect etc](https://github.com/confluentinc/cp-demo)  
[Déployer la stack via ansible](https://github.com/confluentinc/cp-ansible)  
[KSQL](https://github.com/confluentinc/ksql)  
[Microservices](https://www.confluent.io/blog/tag/microservices/)  
[Resources Kafka](https://www.confluent.io/resources/)  
[Bouquin Kafka the definitive guide gratuit](https://www.confluent.io/resources/kafka-the-definitive-guide/)  
[Kafka Improvment process](https://cwiki.apache.org/confluence/display/KAFKA/Kafka+Improvement+Proposals)  
[Kafka protocol](https://kafka.apache.org/protocol)  
[Le blog de confluent](https://blog.confluent.io)  
[Apache Pulsar](https://pulsar.incubator.apache.org/)  
[Debezium](http://debezium.io/)  

## Nous contacter

[Faire un crowdcast ou une crowdquestion](https://lescastcodeurs.com/crowdcasting/)  
Contactez-nous via twitter <https://twitter.com/lescastcodeurs>  
sur le groupe Google <https://groups.google.com/group/lescastcodeurs>  
ou sur le site web <https://lescastcodeurs.com/>  

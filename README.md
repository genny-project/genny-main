# Main Genny Project
Genny (short for Generic) is an open source project that serves to create an intelligent "Question and Answer" system.

The technologies used:
Docker Swarm
Java Wildfly Swarm
Vertx
React
Keycloak
Drools Rules/Workflow
MySQL

Intended technologies:
Esper (CEP)
Tensorflow (for scoring, Deep Learning)
GraphQL
Apache Spark (scoring)
iOS, Android (React Native)
Neo4J,Cassandra




The main components of the Genny project are

Qwanda Engine - This section of the arcitecture manages the storage, querying, scoring of the Questions and Answers.

Bridge - This Vertx service acts as a message bridge between the Vertx Event Bus and the frontend Websocket channels.

Alyson - This is a React based generic frontend that processes cmds and data sent from the backend and displays the requested display and data. It has integrated Keycloak security and Vertx integration for messaging. 

Social - This Vertx service manages external social media data querying.

Wildfly-RulesService - This Wildfly Rules engine service performs fast Esper/Drools Complex Event Processing (CEP)
RulesService - This Vertx service performs fast Esper/Drools Complex Event Processing (CEP)

to install:

(*) Assume you have java 1.8 jdk and mvn 3.5+ installed along with git and docker and docker-compose 

(1) create a project folder called 'genny'

mkdir genny

(2) enter the genny folder and pull the genny-main project from git

cd genny
git clone -b v3.1.0 https://github.com/genny-project/genny-main

(3) Now fetch all the other projects

cd genny-main
./cyrusClone.sh

(4) Now build them all
./cyrusBuild.sh



To run: (simple)

run the docker versions on your local machine -> ./run.sh <project> up


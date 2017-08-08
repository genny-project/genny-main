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

Kie-client - This Vertx service bridges the Vertx bus with the api driven kie-services.

Social - This Vertx service manages external social media data querying.

RulesService - This Vertx service performs fast Esper/Drools Complex Event Processing (CEP)

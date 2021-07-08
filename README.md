# Main Genny Project
Genny (short for Generic) is an open source project that serves to create an intelligent "Question and Answer" system.

## Table of Contents
1. [Technologies](#technologies)
2. [Components](#components)
3. [Install](#install)
4. [Genny Documentation](#genny-documentation)
    - [Buckets](#buckets)
    - [Add Items](#add-items)

## Technologies

***The technologies used:***
- Docker Swarm
- Java Wildfly Swarm
- Vertx
- React
- Keycloak
- Drools Rules/Workflow
- MySQL
- Quarkus

***Intended technologies:***
- Esper (CEP)
- Tensorflow (for scoring, Deep Learning)
- GraphQL
- Apache Spark (scoring)
- iOS, Android (React Native, Flutter)
- Neo4J,Cassandra



## Components

The main components of the Genny project are:

**Qwanda Engine** - This section of the arcitecture manages the storage, querying, scoring of the Questions and Answers.

**Bridge** - This Vertx service acts as a message bridge between the Vertx Event Bus and the frontend Websocket channels.

**Alyson** - This is a React based generic frontend that processes cmds and data sent from the backend and displays the requested display and data. It has integrated Keycloak security and Vertx integration for messaging. 

**Social** - This Vertx service manages external social media data querying.

**Wildfly-RulesService** - This Wildfly Rules engine service performs fast Esper/Drools Complex Event Processing (CEP)
**RulesService** - This Vertx service performs fast Esper/Drools Complex Event Processing (CEP)

## Install

***Assume you have java 11 jdk and mvn 3.5+ installed along with git and docker and docker-compose***

1. create a project folder called 'genny'
```sh
mkdir genny
```

2. enter the genny folder and pull the genny-main project from git
```sh
cd genny
git clone -b v3.1.0 https://github.com/genny-project/genny-main
```

3. Now fetch all the other projects
```sh
cd genny-main
./cyrusClone.sh
```
4. Now build them all
```sh
./cyrusBuild.sh
```


To run: (simple)

run the docker versions on your local machine -> `./run.sh <project> up`


# Genny Documentation
  
## Buckets
  
To establish a bucket page in Genny, the following must be set up:
  
1. A set of SearchEntitys must be built and placed in the `GenerateResources/GenerateSearches/Buckets` rulegroup directory.
  
2. Inside the file `GenerateResources/GenerateAsks/GENERATE_BUCKET_CODES.drl`, you must provide a list for caching of these search codes in the order of buckets from left to right.
  
3. In `INIT_GENERATE_CAPABILITIES.drl` you must create a seperate capability code for each of these search codes and assign viewing capabilities to the required roles for each of these capability codes
  
Example Role:
```java
capabilityUtils.addCapabilityToRole(role, "SBE_AVAILABLE_INTERNS", CapabilityMode.VIEW);
```
  
## Add Items
  
2. Inside the file `GenerateResources/GenerateAsks/GENERATE_ADD_ITEMS.drl`, you must provide a LinkedHashmap for caching that contains the role (Prefixed with "QA" if quck add) and the corresponding text to display.
  
3. In `INIT_GENERATE_CAPABILITIES.drl` there must exist a capability code for each type in the system (E.g `TYPE_INTERN`), and ADD capability must be provided for  the required roles.
  
Example Role:
```java
capabilityUtils.addCapabilityToRole(role, "TYPE_INTERN", CapabilityMode.ADD);
```

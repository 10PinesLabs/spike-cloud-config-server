POC: Sprint Cloud Config + Docker + Openshift
=============================================

Requirements:
* Java 8 SDK
* Maven 3

To build: mvn clean package

To run: mvn spring-boot:run (then browse http://localhost:8081)

IMPORTANT: the application loads the configuration from a git repository, check application.properties

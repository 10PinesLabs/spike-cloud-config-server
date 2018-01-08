POC: Sprint Cloud Config + Docker + Openshift
=============================================

Requirements:
* Java 8 SDK
* Maven 3

To build: mvn clean package

To run: java -jar configserver.jar (then browse http://localhost:8081)

IMPORTANT: the application loads the configuration from a git repository, check application.properties


## Start app -options
The default profile ir repo, you can check application-repo.yaml for default values

### Start custom profile
If you want a custom profile you can start the with vm argument *-Dspring.profiles.active=<YOUR PROFILE>*
Then a file named: application-<YOUR PROFILE>.yaml will be loaded

### Override configuration
You can override all the properties with custom values, you can specify as program arguments or system variables

### Examples
To launch the app with a custom profile (application-gise.yaml) and also override the property git-uir property you start the app with: 
>java -Dspring.profiles.active=gise -jar configserver.jar --spring.cloud.config.server.git.uri="OVERRIDE"

To launch the app with a custom git-uri:
>java -jar configserver.jar --spring.cloud.config.server.git.uri="OVERRIDE"

All the properties can be also system properties, check: https://docs.spring.io/spring-boot/docs/current/reference/html/boot-features-external-config.html 
form more information

## Check your configuration
You have actuators available (https://docs.spring.io/spring-boot/docs/current/reference/html/production-ready-endpoints.html)
If you just want to check the values then you can do a get to: http://localhost:8081/env
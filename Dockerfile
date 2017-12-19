FROM openjdk:8-jre-alpine

RUN mkdir -p /var/www/configserver

ADD ./target/configserver.jar /var/www/configserver

WORKDIR /var/www/configserver

EXPOSE 8081

CMD ["java","-Djava.security.egd=file:/dev/./urandom", "-Dserver.port=8081", "-jar", "configserver.jar"]